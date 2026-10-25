#!/usr/bin/env perl

# A test that loads a recommended module has to say which version it needs.
#
# "Is it installed" is not the question the test is asking.  The application
# asks HTML::OSM for 0.12 and Geo::Coder::Free for 0.48; a machine with 0.11
# installed answers an installation check truthfully and then fails every
# assertion about the page, in a run that reads like a bug in the application.
# The floor is already written down once, in Makefile.PL's prereqs recommends
# and in the cpanfile generated from it; this file holds the tests to it, so the
# assumption cannot come back one eval { require ... } at a time.
#
# What is checked:
#
#   * every load of a recommended module - require M or use M - in t/*.t and
#     t/lib/**/*.pm is gated, in the same statement, by M->VERSION(n) with n no
#     lower than the declared floor.  The gate and the load in one statement is
#     the idiom the tree already uses, and it keeps the check independent of
#     what else the file does with the module;
#   * every Test::Needs spec that names a recommended module declares the floor
#     too.  A spec without a version - { 'M' => 0 }, or M in the bare list -
#     skips on any installed copy, which is the same assumption as a bare
#     require and drifts the same way; the module a test hides with
#     Test::Without::Module has no version to name and is reported as such;
#   * a recommended module with no declared floor (Redis) is reported rather
#     than quietly exempt, so nothing is unchecked by accident;
#   * Makefile.PL and cpanfile still agree on the set, because a floor only one
#     of them knows about is enforced nowhere;
#   * the checker itself, on probe files it writes: a bare load is rejected, a
#     gate below the floor is rejected, a gate in a multi-line probe counts,
#     and a module that is a hard prerequisite is left alone.  A regex that had
#     stopped matching would otherwise let this file pass while checking
#     nothing.
#
# Nothing is executed from the tree: the files are read.
#
#   prove -l t/recommended-versions.t

use strict;
use warnings;

use Test::Most;
use File::Find ();
use File::Spec ();
use File::Temp qw(tempdir);

# ---------------------------------------------------------------------------
# What the distribution recommends, and at what version
# ---------------------------------------------------------------------------

# A floor of 0 or '' is no floor: 'Redis' => 0 says "nice to have", not "this
# version".  Everything else is a decimal version, compared as a number like
# the rest of the distribution compares them.
sub _floor {
	my ($value) = @_;

	return undef unless defined $value;

	# The value arrives as '0.12' from Makefile.PL, as 0.12 from cpanfile, and
	# with the trailing comma of the hash entry when it is the last one.
	$value =~ s/[^0-9._]//g;

	return undef if !length($value) || $value eq '0';

	return $value;
}

# The recommends blocks of META_MERGE, runtime and test alike.  Comments inside
# them carry the reason for a floor, so they are dropped before the keys are
# read.
sub _makefile_recommends {
	open my $fh, '<', 'Makefile.PL' or BAIL_OUT("cannot read Makefile.PL: $!");

	my %floor;
	my $in_block = 0;
	while (my $line = <$fh>) {
		chomp $line;

		if (!$in_block) {
			$in_block = 1 if $line =~ /^\s*recommends\s*=>\s*\{/;
			next;
		}

		if ($line =~ /^\s*\}\s*,?\s*$/) {
			$in_block = 0;
			next;
		}

		next if $line =~ /^\s*#/;
		$line =~ s/\s+#.*\z//;

		next unless $line =~ /^\s*'([\w:]+)'\s*=>\s*(\S+)/;
		$floor{$1} = _floor($2);
	}
	close $fh;

	return \%floor;
}

sub _cpanfile_recommends {
	open my $fh, '<', 'cpanfile' or BAIL_OUT("cannot read cpanfile: $!");

	my %floor;
	while (my $line = <$fh>) {
		next unless $line =~ /^\s*recommends\s+'([\w:]+)'(?:\s*,\s*'([^']*)')?\s*;/;
		$floor{$1} = _floor($2);
	}
	close $fh;

	return \%floor;
}

my $from_makefile = _makefile_recommends();
my $from_cpanfile = _cpanfile_recommends();

ok(scalar(keys %$from_makefile), 'Makefile.PL declares recommended modules')
	or BAIL_OUT('no recommends were parsed, so this file would check nothing');

is_deeply($from_cpanfile, $from_makefile,
	'cpanfile recommends the same modules at the same versions as Makefile.PL')
	or diag('a floor only one of the two files knows about is enforced nowhere');

# The floor this file is about: without it the rest of the checks are a scan
# of a set that could have lost its only interesting member.
is($from_makefile->{'HTML::OSM'}, 0.12,
	'HTML::OSM is recommended at 0.12, the version /map needs');
ok(!defined $from_makefile->{'HTML::D3'},
	'HTML::D3 is a hard prerequisite, so loading it needs no gate of its own');

my $minima = $from_makefile;

# ---------------------------------------------------------------------------
# Reading a test file
# ---------------------------------------------------------------------------

# POD and comments are dropped: a load or a gate that is commented out is not
# one, and a comment that mentions a version should not satisfy the check.  An
# inline comment is recognised by the whitespace before it, which is how they
# are written here and what keeps a '#' inside a quoted string - '#visual-0' in
# the browser tests - out of it.
sub _source_lines {
	my ($file) = @_;

	open my $fh, '<', $file or BAIL_OUT("cannot read $file: $!");
	my @raw = <$fh>;
	close $fh;
	chomp @raw;

	my @clean;
	my $in_pod = 0;
	for my $line (@raw) {
		if ($in_pod) {
			$in_pod = 0 if $line =~ /^=cut\b/;
			push @clean, '';
			next;
		}

		if ($line =~ /^=\w/) {
			$in_pod = 1 unless $line =~ /^=cut\b/;
			push @clean, '';
			next;
		}

		$line = '' if $line =~ /^\s*#/;
		$line =~ s/\s+#.*\z//;

		push @clean, $line;
	}

	return @clean;
}

# How deeply the text is inside braces, brackets and parentheses.  Approximate
# by design: it decides where a statement ends, and a probe written over
# several lines is the only thing it has to get right.
sub _depth {
	my ($text) = @_;

	my $opens  = () = $text =~ /[\{\(\[]/g;
	my $closes = () = $text =~ /[\}\)\]]/g;

	return $opens - $closes;
}

# The file, split into statements, each with the lines it spans.  A statement
# runs on until what it opened is closed and a semicolon has been seen, and a
# closing brace on its own ends one, so a probe written over several lines is a
# single statement whether the load comes first or last in it.  Splitting the
# file once, rather than walking forward from each load, is what makes the
# load's line and the gate's line the same statement.
sub _statements {
	my ($lines) = @_;

	my @statements;
	my ($text, $start) = ('', 0);
	for my $index (0 .. $#$lines) {
		if (!length $text) {
			$start = $index;
			$text  = $lines->[$index];
		} else {
			$text .= "\n" . $lines->[$index];
		}

		my $depth = _depth($text);
		next unless $depth <= 0 && ($text =~ /;/ || $text =~ /\}\s*\z/);

		push @statements, { start => $start, end => $index, text => $text };
		$text = '';
	}
	push @statements, { start => $start, end => $#$lines, text => $text } if length $text;

	return \@statements;
}

# Which statement each line is in, so a load can be handed the whole of it
# without the file being walked again.
sub _statement_by_line {
	my ($lines) = @_;

	my %text;
	for my $statement (@{ _statements($lines) }) {
		$text{$_} = $statement->{text} for $statement->{start} .. $statement->{end};
	}

	return \%text;
}

# The highest version a statement asks of the module, or undef when it asks
# nothing.  M->VERSION with no argument is "what is installed", which is the
# question this file exists to tell apart from "is it new enough".
sub _gated_version {
	my ($statement, $module) = @_;

	my $highest;
	while ($statement =~ /\Q$module\E\s*->\s*VERSION\s*\(\s*([0-9][0-9._]*)\s*\)/g) {
		$highest = $1 if !defined($highest) || $1 >= $highest;
	}

	return $highest;
}

# Every place a file loads a recommended module.  The module name has to end
# there: HTML::OSM::Extra is a different module.
sub _recommended_loads {
	my ($file, $lines, $minima) = @_;

	my $statement_of = _statement_by_line($lines);

	my @loads;
	for my $index (0 .. $#$lines) {
		for my $module (sort keys %$minima) {
			next unless $lines->[$index] =~ /\b(?:require|use)\s+\Q$module\E\b(?![\w:])/;

			my $statement = $statement_of->{$index};
			push @loads, {
				file  => $file,
				line  => $index + 1,
				module => $module,
				needs => $minima->{$module},
				gated => _gated_version($statement, $module),
			};
		}
	}

	return @loads;
}

sub _is_gated {
	my ($load) = @_;

	return 1 unless defined $load->{needs};
	return 0 unless defined $load->{gated};

	return $load->{gated} >= $load->{needs} ? 1 : 0;
}

# The version a Test::Needs spec asks for, or undef when it asks for none.  Both
# forms the module accepts are read: { 'M' => '1.2' } and { 'M' => 0 } are a hash
# entry, and 'M' on its own in the bare list cannot carry a version at all.
sub _spec_version {
	my ($statement, $module) = @_;

	return $1
		if $statement =~ /['"]?\Q$module\E['"]?\s*=>\s*['"]?([0-9][0-9._]*)/;

	return undef;
}

sub _spec_is_floor {
	my ($spec) = @_;

	return 0 unless defined $spec->{specifies};

	return $spec->{specifies} >= $spec->{needs} ? 1 : 0;
}

# Test::Needs is the other place a test declares what it needs, and it is read
# the same way: the statement that mentions it, and the recommended modules in
# it.  A spec for a module that is a hard prerequisite is not this file's
# business.
sub _recommended_specs {
	my ($file, $lines, $minima) = @_;

	my $statement_of = _statement_by_line($lines);

	my @specs;
	for my $index (0 .. $#$lines) {
		next unless $lines->[$index] =~ /\bTest::Needs\b/;

		my $statement = $statement_of->{$index};
		for my $module (sort keys %$minima) {
			next unless $statement =~ /['"]?\Q$module\E['"]?/;

			push @specs, {
				file      => $file,
				line      => $index + 1,
				module    => $module,
				needs     => $minima->{$module},
				specifies => _spec_version($statement, $module),
			};
		}
	}

	return @specs;
}

# A recommended module a test hides, rather than loads, has no version to name:
# hiding it is how the "not installed" branch is reached.  It is collected so the
# run says which declaration forms were looked at.
sub _hidden_modules {
	my ($file, $lines, $minima) = @_;

	my $statement_of = _statement_by_line($lines);

	my @hidden;
	for my $index (0 .. $#$lines) {
		next unless $lines->[$index] =~ /\bTest::Without::Module\b/;

		my $statement = $statement_of->{$index};
		for my $module (sort keys %$minima) {
			next unless $statement =~ /['"]?\Q$module\E['"]?/;

			push @hidden, { file => $file, line => $index + 1, module => $module };
		}
	}

	return @hidden;
}

# ---------------------------------------------------------------------------
# The checker, on files it writes
# ---------------------------------------------------------------------------

# Probe sources interpolate the module name, so this file contains no load of
# its own for the real scan below to find and complain about.
sub _write_probe {
	my ($source) = @_;

	my $dir  = tempdir(CLEANUP => 1);
	my $file = File::Spec->catfile($dir, 'probe.t');
	open my $fh, '>', $file or BAIL_OUT("cannot write $file: $!");
	print {$fh} $source;
	close $fh;

	return $file;
}

sub _probe_loads {
	my ($source) = @_;

	my $file  = _write_probe($source);
	my @lines = _source_lines($file);

	return _recommended_loads('probe.t', \@lines, $minima);
}

sub _probe_specs {
	my ($source) = @_;

	my $file  = _write_probe($source);
	my @lines = _source_lines($file);

	return _recommended_specs('probe.t', \@lines, $minima);
}

sub _probe_hidden {
	my ($source) = @_;

	my $file  = _write_probe($source);
	my @lines = _source_lines($file);

	return _hidden_modules('probe.t', \@lines, $minima);
}

my $gated_module = 'HTML::OSM';
my $gated_floor  = $minima->{$gated_module};

subtest 'the checker rejects what it is meant to reject' => sub {
	my @bare = _probe_loads("my \$ok = eval { require $gated_module; 1 };\n");
	is(scalar @bare, 1, 'a bare load is seen');
	ok(!_is_gated($bare[0]), 'and rejected, because it only asks whether the module is there');
	like($bare[0]->{module}, qr/\A\Q$gated_module\E\z/, 'and named');
	is($bare[0]->{line}, 1, 'with the line it is on');

	my $below = '0.01';
	my @low = _probe_loads(
		"my \$ok = eval { require $gated_module; $gated_module->VERSION($below); 1 };\n"
	);
	is(scalar @low, 1, 'a gate below the floor is seen');
	ok(!_is_gated($low[0]), 'and rejected, because naming a version is not the same as naming the one needed');

	my @uses = _probe_loads("use $gated_module;\nmy \$map = $gated_module->new;\n");
	is(scalar @uses, 1, 'a load by use is seen too');
	ok(!_is_gated($uses[0]), 'and needs the same gate');
};

subtest 'the checker accepts what it is meant to accept' => sub {
	my @gated = _probe_loads(
		"my \$ok = eval { require $gated_module; $gated_module->VERSION($gated_floor); 1 };\n"
	);
	is(scalar @gated, 1, 'a gated load is seen');
	ok(_is_gated($gated[0]), 'and accepted');

	my $above = '99.0';
	my @newer = _probe_loads(
		"my \$ok = eval { require $gated_module; $gated_module->VERSION($above); 1 };\n"
	);
	ok(_is_gated($newer[0]), 'a gate above the floor is accepted as well');

	my $spread = "my \$ok = eval {\n"
		. "\trequire $gated_module;\n"
		. "\t$gated_module->VERSION($gated_floor);\n"
		. "\t1;\n"
		. "};\n";
	my @multi = _probe_loads($spread);
	is(scalar @multi, 1, 'a probe written over several lines is one load');
	ok(_is_gated($multi[0]), 'and its gate counts even on another line');

	my @hard = _probe_loads("my \$ok = eval { require HTML::D3; 1 };\n");
	is(scalar @hard, 0, 'a module that is a hard prerequisite is not this file\'s business');

	my @commented = _probe_loads(
		"# my \$ok = eval { require $gated_module; 1 };\n"
		. "my \$ok = eval { require $gated_module; $gated_module->VERSION($gated_floor); 1 };\n"
	);
	is(scalar @commented, 1, 'a commented-out load is not a load');
	ok(_is_gated($commented[0]), 'so it does not need a gate of its own');
};

subtest 'the checker reads the other ways a test declares an optional module' => sub {
	my @pinned = _probe_specs("use Test::Needs { '$gated_module' => '$gated_floor' };\n");
	is(scalar @pinned, 1, 'a Test::Needs spec is seen');
	ok(_spec_is_floor($pinned[0]), 'and accepted when it names the floor');

	my $below = '0.01';
	my @low = _probe_specs("use Test::Needs { '$gated_module' => '$below' };\n");
	is(scalar @low, 1, 'a spec below the floor is seen');
	ok(!_spec_is_floor($low[0]), 'and rejected, because it would run against the old copy too');

	my @unversioned = _probe_specs("use Test::Needs { '$gated_module' => 0 };\n");
	is(scalar @unversioned, 1, 'a spec that asks for any version is seen');
	ok(!_spec_is_floor($unversioned[0]), 'and rejected: Test::Needs would skip only a machine with no copy at all');

	my @listed = _probe_specs("use Test::Needs '$gated_module';\n");
	is(scalar @listed, 1, 'the bare list form is seen');
	ok(!_spec_is_floor($listed[0]), 'and cannot name a version, so it is rejected too');

	my $spread = "use Test::Needs {\n\t'$gated_module' => '$gated_floor'\n};\n";
	my @multi = _probe_specs($spread);
	is(scalar @multi, 1, 'a spec written over several lines is one spec');
	ok(_spec_is_floor($multi[0]), 'and its version counts');

	my @hard = _probe_specs("use Test::Needs { 'Test::CheckManifest' => '0.9' };\n");
	is(scalar @hard, 0, 'a spec for a hard prerequisite is not this file\'s business');

	my @hidden = _probe_hidden("Test::Without::Module->import('$gated_module');\n");
	is(scalar @hidden, 1, 'a module hidden rather than loaded is seen');
	is($hidden[0]->{module}, $gated_module, 'and named, so the run says the form was looked at');
};

# ---------------------------------------------------------------------------
# The tests in the tree
# ---------------------------------------------------------------------------

sub _test_files {
	my @files;
	File::Find::find({
		no_chdir => 1,
		wanted   => sub {
			my $file = $File::Find::name;
			return unless -f $file;
			push @files, $file if $file =~ /\.t\z/ || $file =~ m{\At/lib/.*\.pm\z};
		},
	}, 't');

	return sort @files;
}

my @files = _test_files();
cmp_ok(scalar @files, '>', 20, 'the scan found the test suite')
	or BAIL_OUT('the file scan found almost nothing, so it is not testing anything');

my (@loads, @specs, @hidden);
for my $file (@files) {
	my @lines = _source_lines($file);
	push @loads,  _recommended_loads($file, \@lines, $minima);
	push @specs,  _recommended_specs($file, \@lines, $minima);
	push @hidden, _hidden_modules($file, \@lines, $minima);
}

cmp_ok(scalar @loads, '>', 5, 'the scan found the loads of recommended modules')
	or BAIL_OUT('no recommended module is loaded anywhere, so the scan proves nothing');

ok(scalar(grep { defined $_->{needs} } @loads),
	'and some of them are loads of a module with a version floor');

for my $load (@loads) {
	my $where  = "$load->{file} line $load->{line}";
	my $module = $load->{module};
	my $needs  = $load->{needs};

	if (!defined $needs) {
		pass("$where loads $module, which declares no version, so there is none to name");
		next;
	}

	ok(_is_gated($load), "$where checks that $module is $needs or later")
		or diag(sprintf(
			"%s loads %s without checking the version it needs.\n"
			. "Installed is not the same as new enough: the application asks for %s,\n"
			. "and on a machine with an older copy every assertion about the result\n"
			. "fails for a reason the test cannot see.  Gate the load, in the same\n"
			. "statement, and skip below the floor:\n"
			. "    eval { require %s; %s->VERSION(%s); 1 }",
			$where, $module, $needs, $module, $module, $needs,
		));
}

cmp_ok(scalar @specs, '>', 0, 'the scan found Test::Needs specs for recommended modules')
	or BAIL_OUT('no spec was found, so the Test::Needs half of this file checks nothing');

for my $spec (@specs) {
	my $where  = "$spec->{file} line $spec->{line}";
	my $module = $spec->{module};
	my $needs  = $spec->{needs};

	ok(_spec_is_floor($spec), "$where asks Test::Needs for $module $needs or later")
		or diag(sprintf(
			"%s names %s without the version it needs.\n"
			. "Test::Needs skips a machine that has no copy; with no version in the\n"
			. "spec it accepts any copy there is, so a machine with an older one runs\n"
			. "the test and fails for a reason the spec was meant to stop.  Declare\n"
			. "the floor:\n"
			. "    use Test::Needs { '%s' => '%s' }",
			$where, $module, $module, $needs,
		));
}

for my $hidden (@hidden) {
	pass("$hidden->{file} line $hidden->{line} hides $hidden->{module}, so there is no version to name");
}

done_testing();
