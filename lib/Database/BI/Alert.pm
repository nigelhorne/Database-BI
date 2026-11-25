package Database::BI::Alert;

use strict;
use warnings;

our $VERSION = '0.024.0';

use Carp qw(croak);
use Exporter qw(import);
use File::Path qw(make_path);
use File::Spec;
use File::Temp qw(tempfile);
use List::Util qw(sum);
use Mojo::File;
use Mojo::JSON qw(decode_json encode_json);
use POSIX ();
use Readonly;
use Scalar::Util qw(looks_like_number);
use Time::HiRes ();

our @EXPORT_OK = qw(
	measures_of measure_results evaluate parse_duration iso
	load_state save_state load_log append_log deliver check_for
);

=encoding utf8

=head1 NAME

Database::BI::Alert - the checks behind script/bi-alert and the canvas Alerts panel

=head1 SYNOPSIS

    use Database::BI::Alert qw(measure_results evaluate);
    my $results = measure_results(\@measures, \@rows);
    my $outcome = evaluate(
        id => 'abc123', results => $results,
        checks => [ { alias => 'count', op => 'gt', value => 1000 } ],
        state => $state, now => time, suppress => 3600, recovery => 1,
    );
    print "$_\n" for @{ $outcome->{lines} };

=head1 DESCRIPTION

The rules of an alert, in one place so that the command line and the web
application agree: how a measure is worked out, when a crossed threshold is
announced, throttled and recovered, how the throttle's memory is kept and how an
announcement is delivered.  Nothing here reads a data file or touches a canvas;
the caller supplies the rows and the saved state.

=cut

Readonly my %OPS => (
	gt => sub { $_[0] >  $_[1] },
	ge => sub { $_[0] >= $_[1] },
	lt => sub { $_[0] <  $_[1] },
	le => sub { $_[0] <= $_[1] },
	eq => sub { $_[0] == $_[1] },
	ne => sub { $_[0] != $_[1] },
);
Readonly my @FUNCTIONS => qw(count count_distinct sum avg min max);
Readonly my $LOG_MAX   => 200;

=head1 FUNCTIONS

=head2 operators, functions

    my @ops = Database::BI::Alert::operators;    # gt ge lt le eq ne
    my @fns = Database::BI::Alert::functions;    # count count_distinct sum avg min max

The words a threshold's comparison and a measure's function may use.

=cut

sub operators { return sort keys %OPS }
sub functions { return @FUNCTIONS }

=head2 measures_of

    my @measures = measures_of($canvas);

The measures a saved canvas defines: its own C<measures>, else those of its
visuals, and those its Alerts panel thresholds define themselves.  Each is a hash with C<col>, C<fn> and C<as> (or the longer names
C<column>, C<func>, C<alias>).

=head3 API SPECIFICATION

=head4 INPUT

    $canvas : hashref (a saved canvas)

=head4 OUTPUT

A list of hashrefs, or an arrayref of them in scalar context.

=cut

sub measures_of {
	my ($canvas) = @_;
	$canvas = {} unless ref $canvas eq 'HASH';
	my @measures = @{ ref $canvas->{measures} eq 'ARRAY' ? $canvas->{measures} : [] };
	unless (@measures) {
		for my $vis (@{ $canvas->{visuals} // [] }) {
			push @measures, @{ $vis->{measures} // [] };
		}
	}
	# A threshold set in the canvas's Alerts panel may define its own measure (a
	# column and a function); it is worked out too, unless the canvas has one
	# of that name.
	my %have = map { ($_->{as} // $_->{alias} // '') => 1 } grep { ref $_ eq 'HASH' } @measures;
	my $alerts = ref $canvas->{alerts} eq 'HASH' ? $canvas->{alerts} : {};
	for my $t (grep { ref $_ eq 'HASH' } @{ ref $alerts->{thresholds} eq 'ARRAY' ? $alerts->{thresholds} : [] }) {
		next unless defined $t->{fn} && defined $t->{measure} && !$have{ $t->{measure} }++;
		push @measures, { col => $t->{col} // '', fn => $t->{fn}, as => $t->{measure} };
	}
	return wantarray ? @measures : \@measures;
}

=head2 measure_results

    my $results = measure_results(\@measures, \@rows);

Works out each measure over the rows: the C<count> of rows is always there.
C<sum avg min max> read only the numeric cells; C<count_distinct> counts the
different values.

=head3 API SPECIFICATION

=head4 INPUT

    $measures : arrayref of { col, fn, as }
    $rows     : arrayref of hashrefs

=head4 OUTPUT

A hashref of alias to number.  A C<min> or C<max> of a column with no numbers is
left out.

=cut

sub measure_results {
	my ($measures, $records) = @_;
	$measures = [] unless ref $measures eq 'ARRAY';
	$records  = [] unless ref $records  eq 'ARRAY';
	my %results;
	for my $m (grep { ref $_ eq 'HASH' } @$measures) {
		my $col   = $m->{col}  // $m->{column} // '';
		my $fn    = $m->{fn}   // $m->{func}   // 'count';
		my $alias = $m->{as}   // $m->{alias}  // "${col}_${fn}";
		next unless length $alias;

		my @vals = map { ref $_ eq 'HASH' ? $_->{$col} : undef } @$records;

		if ($fn eq 'count') {
			$results{$alias} = scalar @$records;
		} elsif ($fn eq 'count_distinct') {
			my %seen;
			$results{$alias} = scalar grep { !$seen{$_ // ''}++ } @vals;
		} else {
			my @nums = grep { defined $_ && looks_like_number($_) } @vals;
			if ($fn eq 'sum') {
				$results{$alias} = @nums ? sum(@nums) : 0;
			} elsif ($fn eq 'avg') {
				$results{$alias} = @nums ? sum(@nums) / scalar(@nums) : 0;
			} elsif ($fn eq 'min') {
				if (@nums) {
					my $v = $nums[0]; $v = $_ < $v ? $_ : $v for @nums;
					$results{$alias} = $v;
				}
			} elsif ($fn eq 'max') {
				if (@nums) {
					my $v = $nums[0]; $v = $_ > $v ? $_ : $v for @nums;
					$results{$alias} = $v;
				}
			}
		}
	}
	$results{count} //= scalar @$records;
	return \%results;
}

=head2 evaluate

    my $outcome = evaluate(id => ..., results => {...}, checks => [...], state => {...},
                           now => $epoch, suppress => $seconds, suppress_text => '1h',
                           recovery => 1, multi => 0);

Checks each threshold of one analysis against its measures, deciding what is
news.  One alert is one (analysis, threshold) pair: it has an entry of its own in
C<< $state->{alerts} >>, is throttled by C<suppress> (seconds; 0 = never), and is
recovered once, when it clears after an announced crossing.  C<state> is changed
in place; the caller decides whether to keep it.

=head3 API SPECIFICATION

=head4 INPUT

    id, results, checks ([ { alias, op, value } ]), state, now : required
    suppress, suppress_text, recovery, multi, keep : optional
    keep : true when the state is to be recorded (the entry that makes a
           recovery possible is written only then)

=head4 OUTPUT

    { lines => [ text ... ], crossings => [ text ... ], recoveries => [ text ... ],
      changed => 0|1 }

C<lines> are what the command line prints for the checks, in order.

=cut

sub evaluate {
	my %a = @_;
	my ($id, $results, $state, $now) = @a{qw(id results state now)};
	my $suppress = $a{suppress} // 0;
	my $who = $a{multi} ? "[$id] " : '';
	my (@lines, @crossings, @recoveries);
	my $changed = 0;
	$state->{alerts} //= {};

	for my $check (@{ $a{checks} // [] }) {
		my ($alias, $op, $tval) = @{$check}{qw(alias op value)};
		croak "unsupported operator '$op'" unless exists $OPS{$op};
		my $actual = $results->{$alias};

		# One alert is one (analysis, threshold) pair, so a second threshold on
		# the same analysis -- and the same threshold on another one -- is
		# throttled, recovered and delivered on a schedule of its own.
		my $key   = join('|', $id, "$alias:$op:$tval");
		my $entry = $state->{alerts}{$key};

		if ($OPS{$op}->($actual, $tval)) {
			my $last_alert = $entry ? ($entry->{last_alert} // 0) : 0;

			# Announced unless this crossing was already announced inside the
			# period.  The comparison is on elapsed seconds, so a run a minute
			# early is still a repeat and a run after the period is news again.
			if (!$suppress || !$last_alert || $now - $last_alert >= $suppress) {
				my $verdict = "THRESHOLD CROSSED: $who$alias ($actual) $op $tval";
				push @lines, $verdict;
				push @crossings, $verdict;
				push @lines, "Repeats of this threshold are suppressed for $a{suppress_text}."
					if $suppress;
				if ($a{keep}) {
					$state->{alerts}{$key} = {
						since      => ($entry && ($entry->{since} // 0)) ? $entry->{since} : $now,
						last_alert => $now,
						value      => $actual,
					};
					$changed = 1;
				}
			}
			else {
				# Crossed, and already announced: say what is going on and stay
				# quiet; nothing is being announced, so no CROSSED line.
				push @lines, "THRESHOLD SUPPRESSED: $who$alias ($actual) $op $tval; last alert "
					. iso($last_alert) . ', next alert after '
					. iso($last_alert + $suppress);
			}
		}
		else {
			push @lines, "Threshold not crossed: $who$alias ($actual) $op $tval";

			# Cleared.  Finding an entry is what makes this run the end of an
			# incident rather than the first sight of a threshold that was never
			# crossed, which is why the recovery is said once and only for a
			# crossing somebody was told about.  The entry goes either way, so the
			# next crossing alerts immediately instead of waiting out a period
			# that belongs to an incident that is over.
			if ($entry) {
				my $since = $entry->{since} // 0;
				if ($a{recovery}) {
					my $verdict = "THRESHOLD RECOVERED: $who$alias ($actual) $op $tval";
					push @lines, "$verdict; crossed since " . iso($since) . ', cleared ' . iso($now);
					push @recoveries, $verdict;
				}
				else {
					push @lines, "THRESHOLD CLEARED: $who$alias ($actual) $op $tval; crossed since " . iso($since);
				}
				delete $state->{alerts}{$key};
				$changed = 1;
			}
		}
	}
	return { lines => \@lines, crossings => \@crossings, recoveries => \@recoveries, changed => $changed };
}

=head2 parse_duration

    my $seconds = parse_duration('6h');

C<30>, C<30s>, C<15m>, C<6h>, C<2d>, C<1w>; a bare number is seconds.  Anything
else is undef.

=head3 API SPECIFICATION

=head4 INPUT

    $text : string

=head4 OUTPUT

Seconds, or undef.

=cut

sub parse_duration {
	my $text = shift;
	return undef unless defined $text && length $text;
	my ($value, $unit) = $text =~ /\A\s*([0-9]+(?:\.[0-9]+)?)\s*([smhdw]?)\s*\z/i;
	return undef unless defined $value;
	my %seconds = ('' => 1, s => 1, m => 60, h => 3_600, d => 86_400, w => 604_800);
	return $value * $seconds{ lc $unit } + 0;
}

=head2 iso

    iso($epoch)    # 2026-11-24T16:00:00Z

UTC, so a state file written in one zone reads the same in another.

=cut

sub iso {
	my @t = gmtime($_[0] // 0);
	return sprintf '%04d-%02d-%02dT%02d:%02d:%02dZ', $t[5] + 1900, $t[4] + 1, @t[3, 2, 1, 0];
}

=head2 load_state

    my ($state, $problem) = load_state($path);

The throttle's memory.  A file that cannot be read or parsed gives an empty state
and a C<$problem> to report, so a damaged file costs one repeated alert rather
than a run that never alerts again.

=head2 save_state

    my ($ok, $problem) = save_state($path, $state);

Written through a temporary file in the same folder and renamed into place, so
overlapping runs, or one that dies mid-write, never leave half a file.

=head3 SIDE EFFECTS

Writes the state file, creating its directory when it is missing.

=cut

sub load_state {
	my $path = shift;
	local ($@, $!);
	my %empty = (version => 1, alerts => {});
	return (\%empty) unless -f $path;

	my $json = eval { Mojo::File->new($path)->slurp };
	return (\%empty, "cannot read state file '$path': " . ($@ || $!)) unless defined $json;

	my $state = eval { decode_json($json) };
	unless (ref $state eq 'HASH' && ref $state->{alerts} eq 'HASH') {
		return (\%empty, "state file '$path' is not a throttle state file; starting from nothing");
	}
	return ($state);
}

sub save_state {
	my ($path, $state) = @_;
	local ($@, $!);
	return _write_json($path, $state, 'state file');
}

sub _write_json {
	my ($path, $data, $what) = @_;
	return (0, "cannot write a $what: no path given") unless defined $path && length $path;
	my (undef, $dirs) = File::Spec->splitpath($path);
	my $dir = length $dirs ? $dirs : '.';
	unless (-d $dir) {
		eval { make_path($dir) };
		return (0, "cannot create $what directory '$dir': " . ($@ || $!)) unless -d $dir;
	}
	my ($fh, $tmp) = eval { tempfile(DIR => $dir, UNLINK => 0) };
	return (0, "cannot write a $what in '$dir': " . ($@ || $!)) unless $fh;

	my $ok = eval {
		print {$fh} encode_json($data);
		close $fh or croak "close: $!";
		rename($tmp, $path) or croak "rename $tmp to $path: $!";
		1;
	};
	unless ($ok) {
		my $why = $@ || $!;
		close $fh if defined $fh;
		unlink $tmp if defined $tmp;
		return (0, "cannot write $what '$path': $why");
	}
	return (1);
}

=head2 load_log

    my @events = load_log($path);

The recent alerts the application has announced, newest last: each
C<< { time, id, kind, text } >>, where C<kind> is C<crossed> or C<recovered>.
An unreadable file is an empty list.

=head2 append_log

    append_log($path, $now, $id, \@crossings, \@recoveries);

Adds the announcements of one check and keeps the newest 200.

=head3 SIDE EFFECTS

Writes the alert log file, creating its directory when it is missing.

=cut

sub load_log {
	my ($path) = @_;
	local ($@, $!);
	return () unless defined $path && -f $path;
	my $json = eval { Mojo::File->new($path)->slurp };
	return () unless defined $json;
	my $data = eval { decode_json($json) };
	return () unless ref $data eq 'HASH' && ref $data->{events} eq 'ARRAY';
	return grep { ref $_ eq 'HASH' } @{ $data->{events} };
}

sub append_log {
	my ($path, $now, $id, $crossings, $recoveries) = @_;
	$crossings  = [] unless ref $crossings  eq 'ARRAY';
	$recoveries = [] unless ref $recoveries eq 'ARRAY';
	my @new = ((map { { time => $now, id => $id, kind => 'crossed',   text => $_ } } @$crossings),
	           (map { { time => $now, id => $id, kind => 'recovered', text => $_ } } @$recoveries));
	return (1) unless @new;
	my @all = (load_log($path), @new);
	@all = @all[-$LOG_MAX .. -1] if @all > $LOG_MAX;
	return _write_json($path, { version => 1, events => \@all }, 'alert log');
}

=head2 deliver

    my ($ok, $problem) = deliver(command => ..., event => 'crossed', subject => ..., message => ..., timeout => 30);

Runs the delivery command once through the shell, with the text as its standard
input and C<BI_ALERT_EVENT>, C<BI_ALERT_SUBJECT> and C<BI_ALERT_MESSAGE_FILE>
(the same text in a file, for a command that posts a body) in its environment.
C<timeout> (seconds, default none) kills a command that does not finish.

=cut

sub deliver {
	my %a = @_;
	local ($@, $!);
	my ($fh, $file) = eval { tempfile(DIR => File::Spec->tmpdir, UNLINK => 0) };
	return (0, 'cannot write a message file: ' . ($@ || $!)) unless $fh;
	my $written = print {$fh} $a{message};
	close $fh;
	unless ($written) {
		my $why = $!;
		unlink $file;
		return (0, "cannot write the message to '$file': $why");
	}

	# A process of its own rather than a shell redirect appended to the text: a
	# redirect written after "cmd1; cmd2" would land on cmd2 alone.
	my $status = -1;
	{
		local $ENV{BI_ALERT_EVENT}        = $a{event};
		local $ENV{BI_ALERT_SUBJECT}      = $a{subject};
		local $ENV{BI_ALERT_MESSAGE_FILE} = $file;

		my $pid = fork;
		if (!defined $pid) {
			unlink $file;
			return (0, "cannot fork for the delivery command: $!");
		}
		elsif ($pid == 0) {
			open(STDIN, '<', $file) or POSIX::_exit(127);
			if ($^O eq 'MSWin32') {
				exec($ENV{COMSPEC} || 'cmd.exe', '/c', $a{command}) or POSIX::_exit(127);
			}
			exec('/bin/sh', '-c', $a{command}) or POSIX::_exit(127);
		}
		else {
			if ($a{timeout}) {
				my $until = Time::HiRes::time() + $a{timeout};
				my $done;
				while (!($done = waitpid($pid, POSIX::WNOHANG()))) {
					if (Time::HiRes::time() > $until) {
						kill 'KILL', $pid;
						waitpid($pid, 0);
						unlink $file;
						return (0, "the delivery command did not finish in $a{timeout} seconds");
					}
					Time::HiRes::sleep(0.05);
				}
			}
			else {
				waitpid($pid, 0);
			}
			$status = $?;
		}
	}
	unlink $file;
	return (1) if $status == 0;

	my $why = $status == -1   ? 'cannot run it'
		: ($status & 127) ? 'killed by signal ' . ($status & 127)
		: 'exit ' . ($status >> 8);
	return (0, "the delivery command failed ($why)");
}

=head2 check_for

    my $verdict = check_for($threshold);

The part of a stored panel threshold C<evaluate> reads: C<{ alias, op, value }>.
The alias is the threshold's C<measure>.

=cut

sub check_for {
	my ($t) = @_;
	return { alias => $t->{measure}, op => $t->{op}, value => $t->{value} };
}

=head1 AUTHOR

Nigel Horne C<< <njh@nigelhorne.com> >>

=head1 LICENCE AND COPYRIGHT

Copyright 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.

=cut

1;
