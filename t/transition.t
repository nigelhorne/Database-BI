#!/usr/bin/env perl

# State transition tests for the two state machines documented in the POD: the
# lifecycle of a DataSource, and the geocoder load state and value-level states
# of Geocode.
#
# Neither object has a state field, so a state is what can be seen from outside:
# whether the backend was read, whether the cache was asked, what is held on the
# object.  Each path through a diagram gets a subtest named after it, through
# _transition(), which records the path as covered.  The compliance subtests at
# the end read the diagrams out of the POD and compare, in both directions, so
# that a path added to a diagram fails here until it has a test, and a tested
# path removed from one fails too.
#
# Where the code and the diagram disagree the behaviour is pinned as it is, since
# in each case it is what the code means to do, and _discrepancy() asks the POD to
# describe it.  That is a TAP TODO, so it fails quietly until the diagram is put
# right and then reports an unexpected pass, which is the cue to delete it.  Each
# carries a "TODO: FSM Discrepancy" comment.

use strict;
use warnings;

use File::Spec;
use File::Temp qw(tempdir);
use HTTP::Response;
use Readonly;
use Scalar::Util qw(blessed weaken);
use Test::Mockingbird qw(around mock_scoped restore_all);
use Test::Mojo;
use Test::Most;

# DataSource must be loaded through the app first: see the note in t/unit.t.
my $t = Test::Mojo->new('Database::BI');
$t->app->config->{model_dir} = tempdir(CLEANUP => 1);

require DBI;
require Database::Abstraction;
require Database::BI::Model::DataSource;
require Database::BI::Model::Geocode;
require LWP::UserAgent;
require Net::SFTP::Foreign;

Readonly my $DS       => 'Database::BI::Model::DataSource';
Readonly my $GEOCODE  => 'Database::BI::Model::Geocode';
Readonly my $BACKEND  => 'Database::Abstraction';
Readonly my $GCF      => 'Geo::Coder::Free';
Readonly my $GCF_FILE => 'Geo/Coder/Free.pm';

# The states of DataSource, as the diagram spells them.
Readonly my $START         => '[START]';
Readonly my $INITIALISING  => 'INITIALISING';
Readonly my $ERROR         => 'ERROR';
Readonly my $READY         => 'READY';
Readonly my $FETCHING      => 'FETCHING';
Readonly my $DATA_RETURNED => 'DATA RETURNED';
Readonly my $CACHE_CHECK   => 'CACHE CHECK';
Readonly my $DESTROY       => 'DESTROY';

# The states of Geocode.
Readonly my $NEW               => 'new()';
Readonly my $CONSTRUCTED       => 'CONSTRUCTED';
Readonly my $UNAVAILABLE       => 'UNAVAILABLE';
Readonly my $RECEIVED          => 'RECEIVED';
Readonly my $ATTEMPT           => 'ATTEMPT';
Readonly my $SKIPPED           => 'SKIPPED';
Readonly my $CACHED_RESOLVED   => 'CACHED_RESOLVED';
Readonly my $CACHED_UNRESOLVED => 'CACHED_UNRESOLVED';
Readonly my $NOT_ATTEMPTED     => 'NOT_ATTEMPTED';
Readonly my $RESOLVED_NEW      => 'RESOLVED_NEW';
Readonly my $UNRESOLVED_NEW    => 'UNRESOLVED_NEW';

Readonly my $TABLE       => 'sales';
Readonly my $HEADER      => "name,value\n";
Readonly my $CSV_TEXT    => "name,value\nA,1\n";
Readonly my $ROWS        => [ { name => 'A', value => 1 } ];
Readonly my $URL         => 'http://example.com/page/table.html';
Readonly my $URL_TTL     => '15 min';
Readonly my $REMOTE_DIR  => '/remote';
Readonly my $REMOTE_HOST => 'h.example';
Readonly my $BDB_MAGIC   => 0x00061561;
Readonly my $BDB_PADDING => 60;

Readonly my $HIGH_VERSION => '99';
Readonly my $LOW_VERSION  => '1';
Readonly my $LAT          => 51.5;
Readonly my $LON          => -0.1;
Readonly my $PLACE        => 'Ramsgate';
Readonly my $OTHER_PLACE  => 'Margate';
Readonly my $THIRD_PLACE  => 'Deal';
Readonly my $REFUSED      => 'refused by the rule';
Readonly my $LOST         => 'found by no one';
Readonly my $CAP          => 2;

# ---------------------------------------------------------------------------
# Stand-ins
# ---------------------------------------------------------------------------
{
	package Local::Cache;

	sub new { return bless { store => {}, sets => [], gets => 0 }, shift }
	sub get { my ($self, $key) = @_; $self->{gets}++; return $self->{store}{$key} }
	sub set {
		my ($self, @args) = @_;
		push @{ $self->{sets} }, \@args;
		$self->{store}{ $args[0] } = $args[1];
		return;
	}
}
{
	# Serves files by remote path, as Net::SFTP::Foreign's get does.
	package Local::SFTP;

	my %files;
	sub serve { my ($class, %serve) = @_; %files = %serve; return }
	sub new   { return bless {}, shift }
	sub error { return 0 }
	sub get {
		my ($self, $remote, $local) = @_;
		return unless exists $files{$remote};
		open my $fh, '>', $local or die "$local: $!";
		print {$fh} $files{$remote};
		close $fh or die "$local: $!";
		return 1;
	}
}
{
	# A geocoder that says what it was asked.  It knows the places in `known`,
	# refuses $REFUSED through valid_location, and dies if told to.
	package Local::Geocoder;

	sub new { my ($class, %args) = @_; return bless { asked => [], valid => [], %args }, $class }
	sub valid_location {
		my ($self, $value) = @_;
		push @{ $self->{valid} }, $value;
		return $value ne ($self->{refuse} // '');
	}
	sub geocode_many {
		my ($self, $values, %opts) = @_;
		die "geocoder failure\n" if $self->{dies};
		push @{ $self->{asked} }, [ @{$values} ];
		$self->{opts} = \%opts;
		return { map { $_ => $self->{known}{$_} } @{$values} };
	}
}
{
	# Has neither method a geocoder needs.
	package Local::NotAGeocoder;

	sub new { return bless {}, shift }
}

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

my %covered;

# A documented path: the subtest is named after it, and it counts as covered.
sub _transition {
	my ($from, $trigger, $to, $code) = @_;
	$covered{"$from -> $to"}++;
	$covered{"$from -> [$trigger] -> $to"}++;
	return subtest "State: $from -> Trigger: $trigger -> State: $to" => $code;
}

# A path that must not exist.
sub _illegal {
	my ($from, $trigger, $to, $code) = @_;
	return subtest "Illegal: $from -> Trigger: $trigger -> State: $to" => $code;
}

# The code does something its diagram does not show.  The behaviour has been
# pinned by the caller; this asks the POD to say so.
sub _discrepancy {
	my ($details, $pod, $wanted) = @_;
	local $TODO = "FSM Discrepancy - $details";
	return ok($pod =~ $wanted, "the diagram shows: $details");
}

# The =head1 STATE DIAGRAM section of a module.
sub _diagram_of {
	my ($module) = @_;
	(my $file = "$module.pm") =~ s{::}{/}g;
	open my $fh, '<', $INC{$file} or die "$INC{$file}: $!";
	my $text = do { local $/ = undef; <$fh> };
	close $fh or die "$INC{$file}: $!";
	my ($section) = $text =~ /^=head1 STATE DIAGRAM\n(.*?)^=head1 /ms;
	return $section // '';
}

# The exact text an error starts with.
sub _error_re {
	my ($key, @args) = @_;
	my $text = Database::BI::Model::DataSource::_fmt($key, @args);
	return qr/\A\Q$text\E/;
}

sub _write_file {
	my ($dir, $name, $text) = @_;
	my $path = File::Spec->catfile($dir, $name);
	open my $fh, '>:raw', $path or die "$path: $!";
	print {$fh} $text;
	close $fh or die "$path: $!";
	return $path;
}

# A fresh directory holding one file: two files with one stem are one table.
sub _dir_with {
	my ($name, $text) = @_;
	my $dir = tempdir(CLEANUP => 1);
	_write_file($dir, $name, $text);
	return $dir;
}

# A SQLite file with the given tables, each holding one row naming its table.
sub _sqlite {
	my ($dir, $stem, @tables) = @_;
	my $dbh = DBI->connect('dbi:SQLite:dbname=' . File::Spec->catfile($dir, "$stem.sqlite"), '', '',
		{ RaiseError => 1, PrintError => 0 });
	for my $table (@tables) {
		$dbh->do(qq{CREATE TABLE "$table" (label TEXT)});
		$dbh->do(qq{INSERT INTO "$table" VALUES ('in $table')});
	}
	return $dbh;
}

# Counts every call of a method or function, and otherwise leaves it alone.  The
# wrapper goes when restore_all() is called.
sub _count_calls {
	my ($package, $method) = @_;
	my $count = 0;
	around($package, $method, sub {
		my ($orig, @args) = @_;
		$count++;
		return $orig->(@args);
	});
	return \$count;
}

# A ready source over one CSV, and a count of its reads of the backend.
sub _counted_source {
	my (%args) = @_;
	my $reads = _count_calls($BACKEND, 'selectall_hashref');
	my $src   = $DS->new(directory => _dir_with("$TABLE.csv", $CSV_TEXT), table => $TABLE, %args);
	return ($src, $reads);
}

# Run some code and answer what it warned, then what it answered.
sub _quietly {
	my ($code) = @_;
	my @warnings;
	local $SIG{__WARN__} = sub { push @warnings, @_ };
	my @result = $code->();
	return (\@warnings, @result);
}

# Stand in for the default geocoder module's constructor.  The caller makes the
# module look present with `local`, which cannot be done from in here because it
# would end with this sub.
sub _install_fake_gcf {
	my ($made) = @_;
	no warnings qw(redefine once);
	no strict 'refs';
	*{"${GCF}::new"} = sub { ${$made}++; return Local::Geocoder->new(known => {}) };
	return;
}

my $ABSENT_HOOK = sub {
	my (undef, $file) = @_;
	die "Can't locate $file in \@INC (hidden by this test)\n" if $file eq $GCF_FILE;
	return;
};

# ===========================================================================
# DataSource: creating one
# ===========================================================================

_transition($START, 'new() invoked', $INITIALISING, sub {
	# Side effects: _init_backend runs once, and it runs _detect_file_info.  The
	# constructor does no more than that: no row is read until someone asks.
	my $inits   = _count_calls($DS, '_init_backend');
	my $detects = _count_calls($DS, '_detect_file_info');
	my ($src, $reads) = _counted_source();

	is(${$inits},   1, 'the backend is set up once');
	is(${$detects}, 1, 'and the file is looked at once');
	is(${$reads},   0, 'and no row has been read');
	isa_ok($src, $DS);
	restore_all();
});

_transition($INITIALISING, 'all checks passed', $READY, sub {
	my ($src, $reads) = _counted_source();

	isa_ok($src, $DS, 'new answers the object');
	ok(blessed($src->{_db}), 'it holds a backend');
	like($src->{_file_path}, qr/\Q$TABLE\E\.csv\z/, 'and knows its file');
	is($src->table_name, $TABLE, 'and its name');
	is_deeply($src->columns, [qw(name value)], 'and its columns, without a read');
	is(${$reads}, 0, 'READY is stable until a fetch');
	restore_all();
});

_transition($INITIALISING, 'croak on bad args', $ERROR, sub {
	my $good_dir = _dir_with("$TABLE.csv", $CSV_TEXT);

	throws_ok { $DS->new(directory => $good_dir) } _error_re('error_table_required'), 'no table';
	throws_ok { $DS->new(directory => File::Spec->catdir($good_dir, 'absent'), table => $TABLE) }
		_error_re('error_directory_missing', File::Spec->catdir($good_dir, 'absent')), 'no directory';
	throws_ok { $DS->new(directory => $good_dir, table => '../up') }
		_error_re('error_table_name_invalid', '../up'), 'a table name that climbs out';
	throws_ok { $DS->new(url => 'ftp://example.com/x') }
		_error_re('error_url_invalid', 'ftp://example.com/x'), 'a URL that is not http';
});

_transition($INITIALISING, 'no safe id', $ERROR, sub {
	my $dir = _dir_with('words.csv', "First Name,Last Name\nA,B\n");
	throws_ok { $DS->new(directory => $dir, table => 'words') } _error_re('error_no_safe_id', 'words'),
		'a header with no name usable as an id';
});

_transition($INITIALISING, 'no SQLite tables', $ERROR, sub {
	my $dir = tempdir(CLEANUP => 1);
	my $dbh = _sqlite($dir, 'hollow', 'gone');
	$dbh->do('DROP TABLE gone');
	$dbh->disconnect;
	throws_ok { $DS->new(directory => $dir, table => 'hollow') } _error_re('error_no_tables', 'hollow'),
		'a database with nothing in it';
});

_transition($INITIALISING, 'unopenable database', $ERROR, sub {
	my $dir = _dir_with('broken.db', pack('N', $BDB_MAGIC) . ('x' x $BDB_PADDING));
	throws_ok { $DS->new(directory => $dir, table => 'broken') } _error_re('error_unsupported_db', 'broken'),
		'it is refused rather than read as text';
});

_transition($INITIALISING, 'SFTP failure', $ERROR, sub {
	my $guard = mock_scoped('Net::SFTP::Foreign', new => sub { return Local::SFTP->new });
	Local::SFTP->serve();
	throws_ok { $DS->new(directory => $REMOTE_DIR, table => $TABLE, host => $REMOTE_HOST) }
		qr/could not fetch any supported file from \Q$REMOTE_HOST\E/, 'nothing to download';
});

# ===========================================================================
# DataSource: fetching without a cache
# ===========================================================================

_transition($READY, 'fetch_all, no cache', $FETCHING, sub {
	my ($src, $reads) = _counted_source();
	$src->fetch_all;
	is(${$reads}, 1, 'the backend is read');
	restore_all();
});

_transition($FETCHING, 'query completed', $DATA_RETURNED, sub {
	my ($src) = _counted_source();
	is_deeply($src->fetch_all, $ROWS, 'fetch_all answers an array of rows');
	is_deeply($src->selectall_arrayref, $ROWS, 'and so does selectall_arrayref');
	restore_all();
});

_transition($DATA_RETURNED, 'next call, no cache', $FETCHING, sub {
	my ($src, $reads) = _counted_source();
	$src->fetch_all;
	is_deeply($src->fetch_all, $ROWS, 'the second call answers the same rows');
	is(${$reads}, 2, 'and with no cache it read again');
	restore_all();
});

# ===========================================================================
# DataSource: fetching with a cache
# ===========================================================================

_transition($READY, 'fetch_all, cache configured', $CACHE_CHECK, sub {
	my $cache = Local::Cache->new;
	my ($src) = _counted_source(cache => $cache);
	is($cache->{gets}, 0, 'a new source has not asked the cache');
	$src->fetch_all;
	is($cache->{gets}, 1, 'the first call asks it, before anything else');
	restore_all();
});

_transition($CACHE_CHECK, 'cache miss', $FETCHING, sub {
	my $cache = Local::Cache->new;
	my ($src, $reads) = _counted_source(cache => $cache);
	is_deeply($src->fetch_all, $ROWS, 'a miss answers the rows');
	is(${$reads}, 1, 'by reading the backend');

	# Side effect of FETCHING, as the diagram says: the result is stored.  A file's
	# entry has no time limit, as its key carries the file's time.
	my $path  = $src->{_file_path};
	my $mtime = (stat $path)[9];
	is_deeply($cache->{sets}, [ [ "bi:file:$path:$mtime", $ROWS ] ], 'and the result is stored');

	# A changed file is a new key, so a natural miss.  The object does not go back
	# to INITIALISING for it.
	my $later = $mtime + 60;
	utime $later, $later, $path or die "$path: $!";
	$src->fetch_all;
	is(${$reads}, 2, 'a changed file misses');
	is(scalar @{ $cache->{sets} }, 2, 'and is stored under its new key');
	restore_all();
});

_transition($CACHE_CHECK, 'cache hit', $DATA_RETURNED, sub {
	my $cache = Local::Cache->new;
	my ($src, $reads) = _counted_source(cache => $cache);
	my $key = $src->_cache_key;
	my $held = [ { name => 'held' } ];
	$cache->{store}{$key} = $held;

	is($src->fetch_all, $held, 'the entry in the cache is what comes back');
	is($src->selectall_arrayref, $held, 'for both ways of asking');
	is(${$reads}, 0, 'the backend is not read');
	is_deeply($cache->{sets}, [], 'and nothing is stored again');
	restore_all();
});

_transition($DATA_RETURNED, 'next call, cache configured', $CACHE_CHECK, sub {
	my $cache = Local::Cache->new;
	my ($src, $reads) = _counted_source(cache => $cache);
	$src->fetch_all;
	is_deeply($src->fetch_all, $ROWS, 'the second call answers the same rows');
	is($cache->{gets}, 2, 'having asked the cache again');
	is(${$reads}, 1, 'and it did not read again');
	restore_all();
});

subtest 'Side effect of FETCHING: a URL entry has a time limit' => sub {
	# The URL is fetched while INITIALISING, as the diagram says, and the rows it
	# gives are stored with the TTL, since a URL has no time of its own to key on.
	no warnings qw(redefine once);
	local *LWP::UserAgent::get = sub {
		return HTTP::Response->new(200, 'OK', [ 'Content-Type' => 'text/html' ],
			'<html><body><table><tr><th>name</th></tr><tr><td>A</td></tr></table></body></html>');
	};
	my $cache = Local::Cache->new;
	my $src   = $DS->new(url => $URL, cache => $cache);
	is_deeply($src->fetch_all, [ { name => 'A' } ], 'the page gives its rows');
	is_deeply($cache->{sets}, [ [ "bi:url:$URL:0", [ { name => 'A' } ], $URL_TTL ] ], 'stored with a time limit');
};

# ===========================================================================
# DataSource: the special cases branching from INITIALISING
# ===========================================================================

_transition($READY, 'fetch_all on an empty file', $DATA_RETURNED, sub {
	# Case 1.  The fast path: an answer of [] with no backend, no warning and no
	# cache.  A blank first line is the same as no bytes at all.
	for my $text ('', "\n") {
		my $cache = Local::Cache->new;
		my $dir   = _dir_with("$TABLE.csv", $text);
		my $src   = $DS->new(directory => $dir, table => $TABLE, cache => $cache);

		ok($src->{_file_is_empty}, 'the flag is set');
		is($src->{_db}, undef, 'and there is no backend to read');
		my ($warnings, $rows) = _quietly(sub { $src->fetch_all });
		is_deeply($rows, [], 'fetch_all answers no rows');
		is_deeply($warnings, [], 'without a warning');
		is($cache->{gets}, 0, 'and without asking the cache');
		is($src->count, 0, 'and there are 0 of them');
	}
});

subtest 'Special case 2: a header-less file becomes a copy with a header' => sub {
	my $dir = _dir_with('bank.csv', "2026-01-02,12.50,Two words\n");
	my $src = $DS->new(directory => $dir, table => 'bank');

	ok(-d "$src->{_headerless_tmpdir}", 'the copy is in a temporary directory');
	is_deeply($src->columns, [qw(Date Amount Description)], 'its columns are made up');
	my ($row) = @{ $src->fetch_all };
	is($row->{Description}, 'Two words', 'and its rows are read from the copy');
};

subtest 'Special case 3: several SQLite tables, none named' => sub {
	# READY with the list held, and no fetch needed to see it: a caller can look at
	# the list and go elsewhere.  A fetch opens the table chosen automatically.
	my $dir = tempdir(CLEANUP => 1);
	_sqlite($dir, 'shop', qw(orders customers))->disconnect;

	my $reads = _count_calls($BACKEND, 'selectall_hashref');
	my $src   = $DS->new(directory => $dir, table => 'shop');
	is_deeply([ sort @{ $src->sqlite_tables } ], [qw(customers orders)], 'the tables are listed');
	is(${$reads}, 0, 'with nothing read');
	is_deeply($src->fetch_all, [ { label => 'in customers' } ], 'a fetch opens the first by name');
	restore_all();
};

subtest 'Special case 4: several SQLite tables, one named' => sub {
	my $dir = tempdir(CLEANUP => 1);
	_sqlite($dir, 'shop', qw(orders customers))->disconnect;

	my $src = $DS->new(directory => $dir, table => 'shop', internal_table => 'orders');
	ok(-l File::Spec->catfile("$src->{_tmpdir}", 'orders.sqlite'), 'a symlink for the named table');
	is_deeply($src->fetch_all, [ { label => 'in orders' } ], 'a fetch opens that table');

	throws_ok { $DS->new(directory => $dir, table => 'shop', internal_table => 'absent') }
		_error_re('error_table_not_found', 'shop', 'absent'), 'a table it does not have goes to ERROR';
};

subtest 'Special case 5: an SFTP file' => sub {
	# Downloaded to a directory the object keeps alive, then normal from there on.
	my $guard = mock_scoped('Net::SFTP::Foreign', new => sub { return Local::SFTP->new });
	Local::SFTP->serve("$REMOTE_DIR/$TABLE.csv" => $CSV_TEXT);

	my $src = $DS->new(directory => $REMOTE_DIR, table => $TABLE, host => $REMOTE_HOST);
	my $tmp = "$src->{_remote_tmpdir}";
	ok(-d $tmp, 'the download directory is kept');
	is_deeply($src->fetch_all, $ROWS, 'and the copy in it is read');

	undef $src;
	ok(!-d $tmp, 'until the object is destroyed');
};

# ===========================================================================
# DataSource: the end
# ===========================================================================

_transition($READY, 'out of scope', $DESTROY, sub {
	my $src = $DS->new(directory => _dir_with('my data.csv', $CSV_TEXT), table => 'my data');
	my $tmp = "$src->{_tmpdir}";
	ok(-l File::Spec->catfile($tmp, 'my_data.csv'), 'a symlink is held');

	my $weak = $src;
	weaken($weak);
	undef $src;
	is($weak, undef, 'nothing else holds the object');
	ok(!-d $tmp, 'and its temporary directory went with it');
});

_transition($DATA_RETURNED, 'out of scope', $DESTROY, sub {
	my $src = $DS->new(directory => _dir_with('my data.csv', $CSV_TEXT), table => 'my data');
	my $tmp = "$src->{_tmpdir}";
	my $rows = $src->fetch_all;

	undef $src;
	ok(!-d $tmp, 'the temporary directory is removed');
	is_deeply($rows, $ROWS, 'and the rows already answered are still good');
});

# ===========================================================================
# DataSource: paths the diagram does not have
# ===========================================================================

_illegal($START, 'fetch_all with no object', $FETCHING, sub {
	# Nothing can be fetched without going through new().
	throws_ok { $DS->fetch_all } qr/strict refs/, 'fetch_all on the class';
	throws_ok { $DS->selectall_arrayref } qr/strict refs/, 'selectall_arrayref on the class';
	throws_ok { $DS->count } qr/strict refs/, 'count on the class';
});

_illegal($ERROR, 'carry on regardless', $READY, sub {
	# ERROR is terminal: no object escapes, so there is nothing to carry on with.
	my $dir = _dir_with('words.csv', "First Name,Last Name\nA,B\n");
	my $src = eval { $DS->new(directory => $dir, table => 'words') };
	ok($@, 'new failed');
	is($src, undef, 'and no object came out of it');

	# Nor does the failure stay behind: the next object over a good file starts afresh.
	_write_file($dir, 'words.csv', "first,last\nA,B\n");
	my $fixed = $DS->new(directory => $dir, table => 'words');
	is_deeply($fixed->fetch_all, [ { first => 'A', last => 'B' } ], 'a new object is unaffected');
});

_illegal($READY, 'any read', $INITIALISING, sub {
	# Once READY a source stays set up.  A fetch does not set it up again, even
	# when the file underneath has changed.
	my $inits   = _count_calls($DS, '_init_backend');
	my $detects = _count_calls($DS, '_detect_file_info');
	my ($src) = _counted_source(cache => Local::Cache->new);

	my $path  = $src->{_file_path};
	my $later = (stat $path)[9] + 60;
	$src->fetch_all;
	utime $later, $later, $path or die "$path: $!";
	$src->fetch_all;
	$src->selectall_arrayref;
	$src->columns;
	$src->count;

	is(${$inits},   1, 'the backend was set up only once');
	is(${$detects}, 1, 'and the file was looked at only once');
	restore_all();
});

_illegal($READY, 'calling _init_backend from outside', $INITIALISING, sub {
	# The one way to force it is refused.  HARNESS_ACTIVE turns the protection off, so
	# this runs in a child without it, and the source must still read afterwards.
	my $dir = _dir_with("$TABLE.csv", $CSV_TEXT);
	my $program = <<'END_PROGRAM';
use Database::BI::Model::DataSource;
my ($dir, $table) = @ARGV;
my $src = Database::BI::Model::DataSource->new(directory => $dir, table => $table);
my $ok  = eval { $src->_init_backend; 1 };
print $ok ? "ALLOWED\n" : "REFUSED\n";
print scalar(@{ $src->fetch_all }), " rows\n";
END_PROGRAM

	delete local $ENV{HARNESS_ACTIVE};
	my @lib = map { "-I$_" } grep { !ref } @INC;
	open my $child, '-|', $^X, @lib, '-e', $program, $dir, $TABLE or die "$^X: $!";
	my @output = <$child>;
	close $child;

	is_deeply(\@output, [ "REFUSED\n", "1 rows\n" ], 'it is refused, and the object is unharmed');
});

subtest 'Undocumented: a fetch that fails' => sub {
	# TODO: FSM Discrepancy - FETCHING -> ERROR exists in the code (a backend that
	# fails, a table with no file, a URL that does not answer with rows) and not in
	# the diagram, where the only way to ERROR is from INITIALISING.
	my $cache = Local::Cache->new;
	my ($src, $reads) = _counted_source(cache => $cache);

	{
		my $guard = mock_scoped($BACKEND, selectall_hashref => sub { die "backend failure\n" });
		throws_ok { $src->fetch_all } _error_re('error_fetch_failed', $TABLE, "backend failure\n"), 'it is reported';
	}
	is_deeply($cache->{sets}, [], 'nothing was stored, so the failure cannot be served later');
	is_deeply($src->fetch_all, $ROWS, 'and the object is not spoilt: the next fetch works');
	restore_all();

	my $no_file = $DS->new(directory => tempdir(CLEANUP => 1), table => $TABLE);
	throws_ok { $no_file->fetch_all } qr/\A\QDataSource: fetch_all failed\E/, 'a table with no file reaches READY, and fails here';

	_discrepancy('FETCHING -> ERROR when a fetch fails', _diagram_of($DS), qr/FETCHING\s+->\s+ERROR/);
};

subtest 'Undocumented: selectall_arrayref on an empty file' => sub {
	# TODO: FSM Discrepancy - READY -> DATA RETURNED is documented for fetch_all only,
	# and selectall_arrayref takes the same fast path.
	my $src = $DS->new(directory => _dir_with("$TABLE.csv", ''), table => $TABLE);
	is_deeply($src->selectall_arrayref, [], 'it answers no rows');

	_discrepancy('the empty-file fast path for selectall_arrayref too', _diagram_of($DS),
		qr/READY\s+->\s+DATA RETURNED\s+\(fetch_all \/ selectall_arrayref/);
};

subtest 'Undocumented: a narrowed query with a cache configured' => sub {
	# TODO: FSM Discrepancy - READY -> CACHE CHECK is documented for every call with
	# a cache configured, but selectall_arrayref with arguments goes straight to
	# FETCHING and stores nothing.  That is right: a narrowed result is not the table.
	my $cache = Local::Cache->new;
	my ($src) = _counted_source(cache => $cache);

	my $rows = $src->selectall_arrayref({ name => 'A' });
	is($rows->[0]{name}, 'A', 'the query is answered');
	is($cache->{gets}, 0, 'without asking the cache');
	is_deeply($cache->{sets}, [], 'or storing in it');
	restore_all();

	_discrepancy('READY -> FETCHING with a cache, for a query with arguments', _diagram_of($DS),
		qr/READY\s+->\s+FETCHING\s+\([^)]*arguments/);
};

subtest 'Undocumented: Redis' => sub {
	# TODO: FSM Discrepancy - new(redis => ...) is a way from [START] to READY that
	# the diagram does not list among what INITIALISING does.  URL and Redis sources
	# also do not run _detect_file_info, which the diagram says runs for all.
	my $detects = _count_calls($DS, '_detect_file_info');
	my $redis   = mock_scoped($DS, _init_redis_backend => sub { return });
	my $url     = mock_scoped($DS, _init_url_backend => sub { return });

	isa_ok($DS->new(redis => 'redis://localhost:6379', table => $TABLE), $DS, 'a Redis source');
	isa_ok($DS->new(url => $URL), $DS, 'a URL source');
	is(${$detects}, 0, 'neither looks at a file');
	restore_all();

	_discrepancy('a Redis source being set up', _diagram_of($DS), qr/Redis/i);
};

# ===========================================================================
# Geocode: the load state
# ===========================================================================

_transition($NEW, 'new() with no geocoder', $CONSTRUCTED, sub {
	# Nothing is loaded until it is needed, so the application starts without it.
	my $loads = _count_calls($GEOCODE, '_load_geocoder');
	my $geocode = $GEOCODE->new;
	ok(!exists $geocode->{_geocoder}, 'no attempt has been made');
	is(${$loads}, 0, 'and nothing was loaded');
	restore_all();
});

_transition($CONSTRUCTED, 'first call, module OK', $READY, sub {
	# The stand-in module is in %INC, so nothing real is loaded.
	my $made = 0;
	local $INC{$GCF_FILE} = __FILE__;
	no warnings 'once';
	local $Geo::Coder::Free::VERSION = $HIGH_VERSION;
	local *Geo::Coder::Free::new;
	_install_fake_gcf(\$made);
	my $loads = _count_calls($GEOCODE, '_load_geocoder');

	my $geocode = $GEOCODE->new;
	my ($available, $reason) = $geocode->geocoder_available;
	is($available, 1, 'geocoder_available: it can be had');
	is($reason, undef, 'with no reason why not');
	is($made, 1, 'and it was built');
	is(${$loads}, 1, 'by one load');

	# The other first call: resolve_values gets there as well.
	my $second = $GEOCODE->new;
	is($second->resolve_values([])->{available}, 1, 'resolve_values: the same');
	is(${$loads}, 2, 'by its own load');
	restore_all();
});

_transition($CONSTRUCTED, 'first call, module absent', $UNAVAILABLE, sub {
	delete local $INC{$GCF_FILE};
	local @INC = ($ABSENT_HOOK, @INC);

	my $geocode = $GEOCODE->new;
	my ($available, $reason) = $geocode->geocoder_available;
	is($available, 0, 'it cannot be had');
	like($reason, qr/it is not installed/, 'and the reason says why');
	ok(exists $geocode->{_geocoder}, 'the attempt has been made');
	is($geocode->{_geocoder}, undef, 'and came to nothing');
});

_transition($CONSTRUCTED, 'first call, module too old', $UNAVAILABLE, sub {
	my $made = 0;
	local $INC{$GCF_FILE} = __FILE__;
	no warnings 'once';
	local $Geo::Coder::Free::VERSION = $LOW_VERSION;
	local *Geo::Coder::Free::new;
	_install_fake_gcf(\$made);

	my $geocode = $GEOCODE->new(min_geocoder_version => $HIGH_VERSION);
	my ($available, $reason) = $geocode->geocoder_available;
	is($available, 0, 'it cannot be had');
	like($reason, qr/\Q$LOW_VERSION\E is installed/, 'and the reason names the version it found');
	is($made, 0, 'and an old one is not built');
});

_transition($READY, 'resolve_*() geocodes + cache', $READY, sub {
	my $geocoder = Local::Geocoder->new(known => { $PLACE => { lat => $LAT, lon => $LON } });
	my $geocode  = $GEOCODE->new(geocoder => $geocoder);
	my $loads    = _count_calls($GEOCODE, '_load_geocoder');

	for my $resolve (
		sub { return $geocode->resolve_values([$PLACE]) },
		sub { return $geocode->resolve_column([ { where => $PLACE } ], 'where') },
	) {
		my $result = $resolve->();
		is($result->{available}, 1, 'it is still available');
		is_deeply([ @{ $result->{points}{$PLACE} }{qw(lat lon)} ], [ $LAT, $LON ], 'the place is found');
		is_deeply($result->{cache}{$PLACE}, [ $LAT, $LON ], 'and remembered in the answer');
	}
	is($geocode->{_geocoder}, $geocoder, 'the geocoder is the same one');
	is(${$loads}, 0, 'and nothing was loaded');
	restore_all();
});

_transition($UNAVAILABLE, 'resolve_*() cache only; not_attempted', $UNAVAILABLE, sub {
	delete local $INC{$GCF_FILE};
	local @INC = ($ABSENT_HOOK, @INC);
	my $geocode = $GEOCODE->new;
	my $loads   = _count_calls($GEOCODE, '_load_geocoder');

	for my $resolve (
		sub { return $geocode->resolve_values([ $PLACE, $OTHER_PLACE ], cache => { $PLACE => [ $LAT, $LON ] }) },
		sub {
			return $geocode->resolve_column(
				[ { where => $PLACE }, { where => $OTHER_PLACE } ], 'where',
				cache => { $PLACE => [ $LAT, $LON ] },
			);
		},
	) {
		my $result = $resolve->();
		is($result->{available}, 0, 'it is still unavailable');
		is_deeply([ @{ $result->{points}{$PLACE} }{qw(lat lon)} ], [ $LAT, $LON ], 'the cache is still served');
		is_deeply($result->{not_attempted}, [$OTHER_PLACE], 'and the rest is left alone');
		ok(!exists $result->{cache}{$OTHER_PLACE}, 'and not remembered, so it can be tried again');
		ok(scalar(grep { $_->{key} eq 'error_map_geocoder_missing' } @{ $result->{messages} }), 'and the reason is given');
	}
	is(${$loads}, 1, 'and it was looked for once only');
	restore_all();
});

# ===========================================================================
# Geocode: paths the load state diagram does not have
# ===========================================================================

_illegal($UNAVAILABLE, 'the module appears', $READY, sub {
	# "The object's geocoder-load state does not change after the first load attempt."
	my $geocode;
	{
		delete local $INC{$GCF_FILE};
		local @INC = ($ABSENT_HOOK, @INC);
		$geocode = $GEOCODE->new;
		my ($available) = $geocode->geocoder_available;
		is($available, 0, 'it starts unavailable');
	}

	my $made = 0;
	local $INC{$GCF_FILE} = __FILE__;
	no warnings 'once';
	local $Geo::Coder::Free::VERSION = $HIGH_VERSION;
	local *Geo::Coder::Free::new;
	_install_fake_gcf(\$made);

	my ($available) = $geocode->geocoder_available;
	is($available, 0, 'and stays so, though the module could now be loaded');
	is($made, 0, 'nothing was built');
});

_illegal($READY, 'the module disappears', $UNAVAILABLE, sub {
	my $geocoder = Local::Geocoder->new;
	my $geocode  = $GEOCODE->new(geocoder => $geocoder);

	delete local $INC{$GCF_FILE};
	local @INC = ($ABSENT_HOOK, @INC);
	my ($available) = $geocode->geocoder_available;
	is($available, 1, 'it stays available');
	is($geocode->{_geocoder}, $geocoder, 'with the same geocoder');
});

_illegal($CONSTRUCTED, 'a call that is refused', $READY, sub {
	# A refused call is a caller's mistake, and uses up nothing: the attempt to load
	# is still to come.
	my $loads   = _count_calls($GEOCODE, '_load_geocoder');
	my $geocode = $GEOCODE->new;

	throws_ok { $geocode->resolve_values('not a list') } qr/./, 'values that are not a list';
	throws_ok { $geocode->resolve_values([], max => 0) } qr/./, 'a cap of nothing';
	throws_ok { $geocode->resolve_column('not a list', 'where') } qr/./, 'rows that are not a list';
	throws_ok { $geocode->resolve_column([], '') } qr/./, 'no column';

	is(${$loads}, 0, 'nothing was loaded');
	ok(!exists $geocode->{_geocoder}, 'and it is still CONSTRUCTED');
	restore_all();
});

_illegal($READY, 'a call that is refused', $ATTEMPT, sub {
	# The same with a geocoder in hand: none of these may reach it.
	my $geocoder = Local::Geocoder->new;
	my $geocode  = $GEOCODE->new(geocoder => $geocoder);

	throws_ok { $geocode->resolve_values('not a list') } qr/./, 'values that are not a list';
	for my $max (0, -1, 'many', '1.5') {
		throws_ok { $geocode->resolve_values([$PLACE], max => $max) } qr/\Q$max\E/, "a cap of $max";
	}
	throws_ok { $geocode->resolve_column([ { a => 1 } ], 'where') } qr/where/, 'a column the rows do not have';

	is_deeply($geocoder->{asked}, [], 'the geocoder was asked nothing');
	is_deeply($geocoder->{valid}, [], 'not even whether a value is valid');
});

subtest 'Undocumented: a geocoder given to new' => sub {
	# TODO: FSM Discrepancy - new(geocoder => $g) goes straight to READY, where the
	# diagram has every new() going to CONSTRUCTED.
	my $loads   = _count_calls($GEOCODE, '_load_geocoder');
	my $geocode = $GEOCODE->new(geocoder => Local::Geocoder->new);
	my ($available) = $geocode->geocoder_available;
	is($available, 1, 'it is available');
	is(${$loads}, 0, 'with nothing loaded');
	restore_all();

	_discrepancy('new(geocoder => ...) -> READY', _diagram_of($GEOCODE), qr/geocoder\s*=>/);
};

subtest 'Undocumented: new can refuse' => sub {
	# TODO: FSM Discrepancy - new() croaks on a geocoder without the methods it needs
	# and on bad arguments.  The diagram has no state for that.
	throws_ok { $GEOCODE->new(geocoder => Local::NotAGeocoder->new) } qr/valid_location/,
		'a geocoder that cannot answer is refused';
	throws_ok { $GEOCODE->new(geocoder => 'not an object') } qr/./, 'and so is something else';

	_discrepancy('new() refusing its arguments', _diagram_of($GEOCODE), qr/\bERROR\b/);
};

subtest 'Undocumented: building the geocoder fails' => sub {
	# TODO: FSM Discrepancy - a module that loads and then dies in its new() leaves
	# the object in CONSTRUCTED, and the next call tries again.  The diagram says
	# the state does not change after the first load attempt, and has this reach
	# neither READY nor UNAVAILABLE.
	my $built = 0;
	local $INC{$GCF_FILE} = __FILE__;
	no warnings qw(once redefine);
	local $Geo::Coder::Free::VERSION = $HIGH_VERSION;
	local *Geo::Coder::Free::new = sub {
		$built++;
		die "no data files\n" if $built == 1;
		return Local::Geocoder->new;
	};

	my $geocode = $GEOCODE->new;
	throws_ok { $geocode->geocoder_available } qr/no data files/, 'the failure comes out';
	ok(!exists $geocode->{_geocoder}, 'and nothing is remembered');
	my ($available) = $geocode->geocoder_available;
	is($available, 1, 'so the next call tries again, and can succeed');
	is($built, 2, 'having built it twice');

	_discrepancy('a failure to build the geocoder', _diagram_of($GEOCODE), qr/fails|dies|croaks/);
};

# ===========================================================================
# Geocode: what happens to one value in one call
# ===========================================================================

_transition($RECEIVED, 'undef / ref / empty', $SKIPPED, sub {
	# The first test of all: it is refused whether or not there is a geocoder.
	my $geocoder = Local::Geocoder->new;
	my $result   = $GEOCODE->new(geocoder => $geocoder)->resolve_values([ undef, [], {} ]);
	is($result->{counts}{skipped}, 1, 'all of them are one distinct nothing');
	is_deeply($geocoder->{valid}, [], 'and the geocoder is not asked');

	my $empty = $GEOCODE->new(geocoder => $geocoder)->resolve_values(['']);
	is_deeply($empty->{skipped}, [''], 'an empty string is the same');
});

_transition($RECEIVED, 'in cache, has position', $CACHED_RESOLVED, sub {
	# -> POINTS.  The cache comes before the rule: a place remembered is plotted even
	# if the rule would now refuse it, and the geocoder is not asked.
	my $geocoder = Local::Geocoder->new(refuse => $PLACE);
	my $result   = $GEOCODE->new(geocoder => $geocoder)
		->resolve_values([$PLACE], cache => { $PLACE => [ $LAT, $LON ] });

	is_deeply($result->{points}{$PLACE}, { lat => $LAT, lon => $LON }, 'it is a point');
	is($result->{counts}{cached}, 1, 'counted as cached');
	is($result->{counts}{resolved}, 1, 'and resolved');
	is_deeply($geocoder->{valid}, [], 'the rule is not asked');
	is_deeply($geocoder->{asked}, [], 'nor the geocoder');
});

_transition($RECEIVED, 'in cache, no position (= 0)', $CACHED_UNRESOLVED, sub {
	# -> UNRESOLVED.  A remembered failure stays one, and is not asked about again.
	my $geocoder = Local::Geocoder->new(known => { $PLACE => { lat => $LAT, lon => $LON } });
	my $result   = $GEOCODE->new(geocoder => $geocoder)->resolve_values([$PLACE], cache => { $PLACE => 0 });

	is_deeply($result->{unresolved}, [$PLACE], 'it is unresolved');
	is_deeply($result->{points}, {}, 'and not a point');
	is($result->{cache}{$PLACE}, 0, 'and stays remembered');
	is_deeply($geocoder->{asked}, [], 'and the geocoder, which now knows it, is not asked');
});

_transition($RECEIVED, 'geocoder unavailable', $NOT_ATTEMPTED, sub {
	delete local $INC{$GCF_FILE};
	local @INC = ($ABSENT_HOOK, @INC);

	my $result = $GEOCODE->new->resolve_values([$PLACE]);
	is_deeply($result->{not_attempted}, [$PLACE], 'it is not attempted');
	is_deeply($result->{skipped}, [], 'and not refused, since there is no rule to ask');
	is_deeply($result->{cache}, {}, 'and not remembered');
});

_transition($RECEIVED, 'valid_location() = false', $SKIPPED, sub {
	my $geocoder = Local::Geocoder->new(refuse => $REFUSED);
	my $result   = $GEOCODE->new(geocoder => $geocoder)->resolve_values([$REFUSED]);

	is_deeply($result->{skipped}, [$REFUSED], 'it is skipped');
	is_deeply($geocoder->{valid}, [$REFUSED], 'on the word of the rule');
	is_deeply($geocoder->{asked}, [], 'and never reaches a lookup');
	is_deeply($result->{cache}, {}, 'and is not remembered');
});

_transition($RECEIVED, 'within cap', $ATTEMPT, sub {
	my $geocoder = Local::Geocoder->new;
	my $result   = $GEOCODE->new(geocoder => $geocoder)
		->resolve_values([ $PLACE, $OTHER_PLACE ], max => $CAP, region => 'gb');

	is_deeply($geocoder->{asked}, [ [ $PLACE, $OTHER_PLACE ] ], 'one batch, with every value at the cap');
	is_deeply($geocoder->{opts}, { region => 'gb', on_error => 'undef' }, 'in the non-croaking mode, with the hint');
	is($result->{counts}{attempted}, $CAP, 'counted as attempted');
	is($result->{capped}, 0, 'and the cap did not bite');
});

_transition($RECEIVED, 'beyond cap', $NOT_ATTEMPTED, sub {
	my $geocoder = Local::Geocoder->new;
	my $result   = $GEOCODE->new(geocoder => $geocoder)
		->resolve_values([ $PLACE, $OTHER_PLACE, $THIRD_PLACE ], max => $CAP);

	is_deeply($geocoder->{asked}, [ [ $PLACE, $OTHER_PLACE ] ], 'the first ones are asked about');
	is_deeply($result->{not_attempted}, [$THIRD_PLACE], 'the last is held back');
	is($result->{capped}, 1, 'and it says so');
	ok(!exists $result->{cache}{$THIRD_PLACE}, 'and it is left out of the cache, for the next request');
	is_deeply([ map { $_->{key} } @{ $result->{messages} } ], ['warn_map_geocode_capped'], 'with a message');
});

_transition($ATTEMPT, 'geocoder returns position', $RESOLVED_NEW, sub {
	# -> POINTS, CACHE==[lat,lon].  In the answer's cache, not the caller's.
	my $geocoder = Local::Geocoder->new(known => { $PLACE => { lat => $LAT, lon => $LON, database => 'osm' } });
	my %mine;
	my $result = $GEOCODE->new(geocoder => $geocoder)->resolve_values([$PLACE], cache => \%mine);

	is_deeply($result->{points}{$PLACE}, { lat => $LAT, lon => $LON, backend => 'osm' }, 'it is a point');
	is_deeply($result->{cache}{$PLACE}, [ $LAT, $LON ], 'remembered with its position');
	is($result->{counts}{resolved}, 1, 'and counted');
	is_deeply(\%mine, {}, 'the cache that was passed in is not touched');
});

_transition($ATTEMPT, 'geocoder returns undef', $UNRESOLVED_NEW, sub {
	# CACHE==0: looked up and not found, so the next request does not ask again.
	my $geocoder = Local::Geocoder->new;
	my $geocode  = $GEOCODE->new(geocoder => $geocoder);
	my $result   = $geocode->resolve_values([$LOST]);

	is_deeply($result->{unresolved}, [$LOST], 'it is unresolved');
	is($result->{cache}{$LOST}, 0, 'and remembered as such');
	is_deeply($result->{points}, {}, 'and is not a point');

	# Round the loop: the next request starts from that cache, which is the edge to
	# CACHED_UNRESOLVED.
	my $next = $geocode->resolve_values([$LOST], cache => $result->{cache});
	is(scalar @{ $geocoder->{asked} }, 1, 'the next request does not ask again');
	is_deeply($next->{unresolved}, [$LOST], 'and it is still unresolved');
});

subtest 'Undocumented: a geocoder that throws' => sub {
	# TODO: FSM Discrepancy - ATTEMPT has two ways out in the diagram, and a geocoder
	# that dies is a third.  It breaks the request on purpose (see the POD and
	# t/geocode.t), so that a caller's cache cannot be half-written.
	my %mine = ($PLACE => [ $LAT, $LON ]);
	my $geocoder = Local::Geocoder->new(dies => 1);
	my $geocode  = $GEOCODE->new(geocoder => $geocoder);

	throws_ok { $geocode->resolve_values([ $PLACE, $OTHER_PLACE ], cache => \%mine) } qr/geocoder failure/, 'it comes out';
	is_deeply(\%mine, { $PLACE => [ $LAT, $LON ] }, 'with the cache as it was');
	is($geocode->{_geocoder}, $geocoder, 'and the load state is not changed: READY');

	_discrepancy('ATTEMPT -> an exception from the geocoder', _diagram_of($GEOCODE), qr/\+--\[geocoder (?:dies|throws)/);
};

# ===========================================================================
# Compliance: the tests against the diagrams, read from the POD
# ===========================================================================

subtest 'Compliance: every path in the DataSource summary is tested, and no other' => sub {
	my ($summary) = _diagram_of($DS) =~ /Valid state transitions summary:\n(.*)/s;
	ok(defined $summary, 'the summary was found') or return;

	my %documented;
	for my $line (split /\n/, $summary) {
		next unless $line =~ /\A\s*(\[?[A-Z][A-Z \/]*\]?)\s+->\s+([A-Z][A-Z ]*?)\s+\(/;
		my ($from, $to) = ($1, $2);
		$from =~ s/\s+\z//;
		$documented{"$_ -> $to"} = 1 for split m{\s*/\s*}, $from;
	}
	cmp_ok(scalar keys %documented, '>', 1, 'the paths were read');

	# %covered holds Geocode's paths too.  READY is a state of both machines, and
	# READY -> READY and READY -> nothing else are Geocode's.
	my %states = map { $_ => 1 } $START, $INITIALISING, $ERROR, $READY, $FETCHING, $DATA_RETURNED, $CACHE_CHECK;
	my @ours = grep {
		my ($from) = /\A(.+?) -> /;
		$states{$from} && !/ -> \[/ && $_ ne "$READY -> $READY";
	} keys %covered;

	is_deeply([ sort @ours ], [ sort keys %documented ], 'the tests above and the summary agree');
};

subtest 'Compliance: every value path in the Geocode diagram is tested, and no other' => sub {
	my %documented;
	for my $line (split /\n/, _diagram_of($GEOCODE)) {
		next unless $line =~ /\+--\[(.+?)\]-*>\s*(\w+)/;
		my ($trigger, $to) = ($1, $2);
		my $from = $line =~ /\|\s+\+--/ ? $ATTEMPT : $RECEIVED;
		$documented{"$from -> [$trigger] -> $to"} = 1;
	}
	cmp_ok(scalar keys %documented, '>', 1, 'the paths were read');

	my %ours = map { $_ => 1 } grep { /\A(?:\Q$RECEIVED\E|\Q$ATTEMPT\E) -> \[/ } keys %covered;
	is_deeply([ sort keys %ours ], [ sort keys %documented ], 'the tests above and the diagram agree');
};

subtest 'Compliance: the Geocode load states are the ones in the diagram' => sub {
	# This part of the diagram is a drawing, so its boxes and labels are checked, not
	# read as paths.  A renamed state or trigger fails here.
	my $diagram = _diagram_of($GEOCODE);
	for my $word ($CONSTRUCTED, $READY, $UNAVAILABLE, 'module OK', 'module absent or too old', 'geocodes +', 'cache only') {
		like($diagram, qr/\Q$word\E/, "the diagram has: $word");
		ok(scalar(grep { /\Q$word\E/ } keys %covered), "and a test covers: $word")
			unless $word eq 'module absent or too old';
	}
	ok($covered{"$CONSTRUCTED -> [first call, module absent] -> $UNAVAILABLE"}, 'absent is covered');
	ok($covered{"$CONSTRUCTED -> [first call, module too old] -> $UNAVAILABLE"}, 'and too old');
};

restore_all();
done_testing();
