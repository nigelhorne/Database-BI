#!/usr/bin/env perl
use strict;
use warnings;

# Live MariaDB integration tests for Database::BI.
#
# Only run when MARIADB_SERVER is set to a reachable MariaDB or MySQL server:
#   MARIADB_SERVER=mariadb://user:pass@host/test prove -lv t/mariadb_live.t
#
# MARIADB_SERVER formats accepted:
#   mariadb://user:pass@host:port/database
#   mariadb://user@host/database
#   mariadb://host/database
#   host
#   host:port
#   host/database
#   dbi:MariaDB:database=db;host=host
#   dbi:mysql:database=db;host=host
#
# Two PID-unique tables are created and dropped in END, so this is safe to run
# against a shared server.  The user needs CREATE, DROP, INSERT and SELECT on the
# database:
#   CREATE DATABASE test;
#   GRANT ALL ON test.* TO 'dbtest'@'client';
#
# The application has no mariadb: spec yet.  As in t/mariadb.t, the routes reach
# the server by replacing the open_table helper, so this holds what a MariaDB
# backend does in the application, and what the mock in t/mariadb.t cannot show:
# real SQL, column types, NULLs and character sets.

use Test::Most;
use Test::Returns;
use File::Temp qw(tempdir);
use Mojo::File;
use Mojo::JSON qw(decode_json);
use Mojo::Util qw(url_escape);

BEGIN {
	plan skip_all => 'MARIADB_SERVER not set (e.g. MARIADB_SERVER=mariadb://root:pass@host/test)'
		unless $ENV{MARIADB_SERVER};
	eval { require DBD::MariaDB } or eval { require DBD::mysql };
	plan skip_all => 'DBD::MariaDB or DBD::mysql required'
		unless defined $INC{'DBD/MariaDB.pm'} || defined $INC{'DBD/mysql.pm'};
	eval { require Database::Abstraction };
	plan skip_all => 'Database::Abstraction required' if $@;
	eval { require Database::Join };
	plan skip_all => 'Database::Join required' if $@;
}

use DBI;
use Readonly;
use Scalar::Util qw(refaddr);
use Test::Mojo;

# ---------------------------------------------------------------------------
# Parse MARIADB_SERVER into DSN + credentials
# ---------------------------------------------------------------------------
my ($DSN, $DB_USER, $DB_PASS) = _parse_server($ENV{MARIADB_SERVER});

sub _parse_server {
	my ($raw) = @_;

	return ($raw, undef, undef) if $raw =~ /\Adbi:/i;

	$raw = "mariadb://$raw" unless $raw =~ m{\A[a-z]+://}i;

	my ($user, $pass, $host, $port, $db);
	if ($raw =~ m{\Amariadb://([^:@]+):([^@]*)@([^/:]+)(?::(\d+))?(?:/(\S*))?}i) {
		($user, $pass, $host, $port, $db) = ($1, $2, $3, $4, $5);
	} elsif ($raw =~ m{\Amariadb://([^@]+)@([^/:]+)(?::(\d+))?(?:/(\S*))?}i) {
		($user, $host, $port, $db) = ($1, $2, $3, $4);
	} elsif ($raw =~ m{\Amariadb://([^/:]+)(?::(\d+))?(?:/(\S*))?}i) {
		($host, $port, $db) = ($1, $2, $3);
	}
	$host //= 'localhost';
	$port //= 3306;
	$db   //= 'test';
	$db     =~ s{/}{}g;

	my $driver = defined $INC{'DBD/MariaDB.pm'} ? 'MariaDB' : 'mysql';
	return ("dbi:${driver}:database=${db};host=${host};port=${port}", $user, $pass);
}

# ---------------------------------------------------------------------------
# Connect -- skip all if unreachable
# ---------------------------------------------------------------------------
my $setup_dbh = eval {
	DBI->connect($DSN, $DB_USER, $DB_PASS, { RaiseError => 1, PrintError => 0, AutoCommit => 1 });
};
plan skip_all => "Cannot connect to MariaDB ($DSN): $@" unless $setup_dbh;

# ---------------------------------------------------------------------------
# PID-unique tables, to avoid collisions on a shared server
# ---------------------------------------------------------------------------
Readonly my $ORDERS => sprintf 'bilive_%d_orders', $$;   # entry/region/amount/day/label
Readonly my $TIERS  => sprintf 'bilive_%d_tiers',  $$;   # entry/tier

END {
	if ($setup_dbh) {
		eval { $setup_dbh->do("DROP TABLE IF EXISTS `$ORDERS`") };
		eval { $setup_dbh->do("DROP TABLE IF EXISTS `$TIERS`") };
		eval { $setup_dbh->disconnect };
	}
}

$setup_dbh->do(<<"SQL");
CREATE TABLE `$ORDERS` (
	entry   VARCHAR(64)   NOT NULL PRIMARY KEY,
	region  VARCHAR(32),
	amount  DECIMAL(10,2),
	day     DATE,
	label   VARCHAR(64)
) DEFAULT CHARSET=utf8mb4
SQL

$setup_dbh->do(<<"SQL");
CREATE TABLE `$TIERS` (
	entry  VARCHAR(64) NOT NULL PRIMARY KEY,
	tier   VARCHAR(32) NOT NULL
)
SQL

# row4 has NULLs in every optional column, and no row in $TIERS.
my @ORDER_ROWS = (
	[ 'row1', 'North', 10.50, '2026-01-01', 'first'        ],
	[ 'row2', 'South', 20.00, '2026-01-02', "Zo\x{eb}"     ],
	[ 'row3', 'North', 5.00,  '2026-01-03', '<b>bold</b>'  ],
	[ 'row4', undef,   undef, undef,        undef          ],
);
$setup_dbh->do("INSERT INTO `$ORDERS` VALUES (?, ?, ?, ?, ?)", undef, @{$_}) for @ORDER_ROWS;
$setup_dbh->do("INSERT INTO `$TIERS` VALUES (?, ?)", undef, @{$_})
	for [ 'row1', 'gold' ], [ 'row2', 'silver' ], [ 'row3', 'bronze' ];

# ---------------------------------------------------------------------------
# The application, with table:orders and table:tiers opening the server
# ---------------------------------------------------------------------------
my $data_dir = tempdir(CLEANUP => 1);

# _open_spec looks for a file before it calls open_table.  These are never read,
# except csvtiers.csv, which is what a Merge with a real file reads.
Mojo::File->new($data_dir)->child('orders.csv')->spew("entry,region\nfile,NotMariaDB\n");
Mojo::File->new($data_dir)->child('tiers.csv')->spew("entry,tier\nfile,NotMariaDB\n");
Mojo::File->new($data_dir)->child('csvtiers.csv')->spew("entry,csvtier\nrow1,csvgold\nrow2,csvsilver\n");

my $t = Test::Mojo->new('Database::BI', {
	data_dir  => $data_dir,
	model_dir => tempdir(CLEANUP => 1),
});
require Database::BI::Model::DataSource;
require Database::BI::Controller::Dashboard;

# A DataSource over a MariaDB-backed Database::Abstraction.  DataSource has no
# constructor for one, so this holds what _new_from_redis would have set.
sub _maria_source {
	my ($table, %opts) = @_;
	(my $pkg = "Database::BI::_DB::Mariadb_$table") =~ s/\W+\z//;
	{
		no strict 'refs';
		@{"${pkg}::ISA"} = ('Database::Abstraction');
	}
	my $db = $pkg->new(
		dsn      => $DSN,
		username => $opts{username} // $DB_USER,
		password => $opts{password} // $DB_PASS,
		table    => $table,
		no_entry => 1,
	);
	return bless {
		_table     => $table,
		_raw_table => $table,
		_id_col    => 'entry',
		_columns   => undef,
		_db        => $db,
	}, 'Database::BI::Model::DataSource';
}

my %SERVER_TABLE = (orders => $ORDERS, tiers => $TIERS);
my $real_open_table = $t->app->renderer->get_helper('open_table');
$t->app->helper(open_table => sub {
	my ($c, $table, %opts) = @_;
	return $SERVER_TABLE{$table} ? _maria_source($SERVER_TABLE{$table}) : $c->$real_open_table($table, %opts);
});

sub _orders { return _maria_source($ORDERS) }

sub _export_rows {
	my ($query) = @_;
	$t->get_ok("/export?$query&format=json")->status_is(200);
	return decode_json($t->tx->res->body);
}

sub _entries { return [ sort map { $_->{entry} } @{ $_[0] } ] }

# ---------------------------------------------------------------------------
# InlineDA -- the non-MariaDB side of some joins
# ---------------------------------------------------------------------------
{
	package InlineDA;

	sub new {
		my ($class, %args) = @_;
		return bless { _cols => $args{cols} // [], _rows => $args{rows} // [] }, $class;
	}

	sub columns    { return $_[0]->{_cols} }
	sub schema     { return {} }
	sub updated    { return 1 }
	sub set_logger { return $_[0] }

	sub selectall_arrayref {
		my ($self, $criteria) = @_;
		my @rows = @{ $self->{_rows} };
		for my $col (CORE::keys %{ $criteria // {} }) {
			my $val = $criteria->{$col};
			next if ref $val;
			@rows = grep { defined $_->{$col} && $_->{$col} eq $val } @rows;
		}
		return \@rows;
	}
}

sub _inline_da {
	return InlineDA->new(
		cols => [qw(entry tier)],
		rows => [
			{ entry => 'row1', tier => 'gold'   },
			{ entry => 'row2', tier => 'silver' },
			{ entry => 'row3', tier => 'bronze' },
		],
	);
}

sub _join {
	my (%extra) = @_;
	return Database::Join->new(
		databases   => [ _orders(), _inline_da() ],
		join_column => 'entry',
		%extra,
	);
}

plan tests => 22;

# ---------------------------------------------------------------------------
# The DataSource methods
# ---------------------------------------------------------------------------
subtest 'L1: a DataSource connects, and lists the columns' => sub {
	plan tests => 3;
	my $src = _orders();
	is($src->table_name, $ORDERS, 'table_name');
	my $cols = $src->columns;
	returns_is($cols, { type => 'arrayref' }, 'columns() is an arrayref');
	is_deeply([ sort @{$cols} ], [qw(amount day entry label region)], 'with every column');
};

subtest 'L2: fetch_all returns the rows, with the types the server sends' => sub {
	plan tests => 6;
	my $rows = _orders()->fetch_all;
	returns_is($rows, { type => 'arrayref', min => 4, max => 4 }, 'all 4 rows');
	my %by = map { $_->{entry} => $_ } @{$rows};
	is($by{row1}{amount}, '10.50', 'a DECIMAL keeps its scale');
	is($by{row1}{day}, '2026-01-01', 'a DATE is ISO');
	ok(exists $by{row4}{amount}, 'a NULL column is still a key of the row');
	ok(!defined $by{row4}{amount}, 'and has no value');
	is($by{row2}{label}, "Zo\x{eb}", 'non-ASCII text comes back as characters');
};

subtest 'L3: count and selectall_arrayref agree with fetch_all' => sub {
	plan tests => 2;
	my $src = _orders();
	cmp_ok($src->count, '==', 4, 'count');
	returns_is($src->selectall_arrayref, { type => 'arrayref', min => 4, max => 4 }, 'selectall_arrayref');
};

subtest 'L4: sort_by, limit and offset reach the server' => sub {
	plan tests => 3;
	my $rows = _orders()->selectall_arrayref(sort_by => 'entry', limit => 2, offset => 1);
	returns_is($rows, { type => 'arrayref', min => 2, max => 2 }, 'two rows');
	is($rows->[0]{entry}, 'row2', 'after the offset');
	is($rows->[1]{entry}, 'row3', 'in order');
};

subtest 'L5: selectall_arrayref takes criteria as a hashref, as Database::Join sends them' => sub {
	plan tests => 2;
	my $rows = _orders()->selectall_arrayref({ entry => 'row2' });
	returns_is($rows, { type => 'arrayref', min => 1, max => 1 }, 'one row');
	is($rows->[0]{region}, 'South', 'the right one');
};

subtest 'L6: dbi_source() answers only for SQLite, and aggregate() still pushes to the server' => sub {
	plan tests => 3;
	my $src = _orders();
	is($src->dbi_source, undef, 'dbi_source');
	my $rows = $src->aggregate(
		by       => ['region'],
		measures => [ { col => 'amount', fn => 'sum', as => 'total' } ],
		region   => 'North',
	);
	returns_is($rows, { type => 'arrayref', min => 1, max => 1 }, 'aggregate() returns one group');
	cmp_ok($rows->[0]{total}, '==', 15.5, 'with the right total');
};

subtest 'L7: rows are locked, so a new column cannot be written straight onto one' => sub {
	plan tests => 1;
	my $row = _orders()->fetch_all->[0];
	throws_ok { $row->{extra} = 1 } qr/restricted hash|disallowed/, 'which is why _extend_row exists';
};

# ---------------------------------------------------------------------------
# Database::Join
# ---------------------------------------------------------------------------
subtest 'L8: left, inner and outer joins with a stub on the right' => sub {
	plan tests => 3;
	cmp_ok(_join()->count, '==', 4, 'left: every MariaDB row');
	cmp_ok(_join(join_type => 'inner')->count, '==', 3, 'inner: the rows on both sides');
	cmp_ok(scalar @{ _join(join_type => 'outer')->selectall_arrayref }, '==', 4, 'outer: the union');
};

subtest 'L9: a merged row holds both sides, and a gap is undef' => sub {
	plan tests => 3;
	my %by = map { $_->{entry} => $_ } @{ _join()->selectall_arrayref };
	is($by{row1}{region}, 'North', 'the MariaDB value');
	is($by{row1}{tier}, 'gold', 'the other value');
	ok(!defined $by{row4}{tier}, 'row4 has nothing from the right');
};

subtest 'L10: a join between two MariaDB tables' => sub {
	plan tests => 3;
	my $join = Database::Join->new(
		databases   => [ _orders(), _maria_source($TIERS) ],
		join_column => 'entry',
	);
	cmp_ok($join->count, '==', 4, 'count');
	my $row = $join->fetchrow_hashref('row1');
	is($row->{region}, 'North', 'a column of the left table');
	is($row->{tier}, 'gold', 'and of the right');
};

subtest 'L11: two sources are independent' => sub {
	plan tests => 3;
	my ($one, $two) = (_orders(), _orders());
	isnt(refaddr($one), refaddr($two), 'they are different objects');
	cmp_ok($one->count, '==', 4, 'the first reads');
	cmp_ok($two->count, '==', 4, 'and so does the second');
};

# ---------------------------------------------------------------------------
# Through the routes
# ---------------------------------------------------------------------------
subtest 'L12: /join and /view draw the table' => sub {
	plan tests => 11;
	for my $url ('/join?l=table:orders', '/view/orders') {
		$t->get_ok($url)->status_is(200);
		my $body = $t->tx->res->body;
		unlike($body, qr/\Qdbi:\E(?:MariaDB|mysql)/, "$url does not show the DSN");
		like($body, qr{<td[^>]*>North</td>}, "$url shows a value");
		like($body, qr{&lt;b&gt;bold}, "$url escapes markup from the server");
	}
	unlike($t->tx->res->body, qr/<b>bold/, 'and does not write it as markup');
};

subtest 'L13: /export gives every row, NULLs included' => sub {
	plan tests => 5;
	my $rows = _export_rows('l=table:orders');
	is_deeply(_entries($rows), [qw(row1 row2 row3 row4)], 'each row once');
	my %by = map { $_->{entry} => $_ } @{$rows};
	is($by{row4}{amount}, undef, 'a NULL stays empty');
	is($by{row2}{label}, "Zo\x{eb}", 'non-ASCII text survives the whole way');
};

subtest 'L14: filters run over what the server returned' => sub {
	plan tests => 12;
	is_deeply(_entries(_export_rows('l=table:orders&f=region:eq:north')), [qw(row1 row3)], 'eq is case-insensitive');
	is_deeply(_entries(_export_rows('l=table:orders&f=amount:gt:9')), [qw(row1 row2)], 'gt compares a DECIMAL as a number');
	is_deeply(_entries(_export_rows('l=table:orders&f=region:empty')), [qw(row4)], 'a NULL is empty');
	is_deeply(_entries(_export_rows('l=table:orders&f=amount:lt:9')), [qw(row3)], 'and is not less than a number');
};

subtest 'L15: /bar totals by category, on the server and in Perl alike' => sub {
	plan tests => 9;
	my $url = '/bar?l=table:orders&cat=region&val=amount';
	$t->get_ok($url)->status_is(200);
	my $pushed = $t->tx->res->body;
	like($pushed, qr/\b15\.5\b/, 'North is 10.50 + 5');
	like($pushed, qr/\b20\b/, 'South is 20');
	like($pushed, qr/\b2 bars\b/, 'the NULL region is not a bar');
	{
		local $ENV{BI_FORCE_PERL_AGG} = 1;
		$t->get_ok($url)->status_is(200);
		like($t->tx->res->body, qr/\b15\.5\b/, 'the fold agrees');
		like($t->tx->res->body, qr/\b2 bars\b/, 'about the NULL too');
	}
};

subtest 'L16: /pivot and /stats read the server' => sub {
	plan tests => 6;
	$t->get_ok('/pivot?l=table:orders&rows=region&m=' . url_escape('amount:sum:total'))->status_is(200);
	like($t->tx->res->body, qr/\b15\.5\b/, 'the pivot totals North');
	$t->get_ok('/stats?l=table:orders')->status_is(200);
	like($t->tx->res->body, qr/\b4 rows\b/, 'the statistics count the rows');
};

subtest 'L17: a calculated column can be added to rows the backend has locked' => sub {
	plan tests => 4;
	my $rows = _export_rows('l=table:orders&c=' . url_escape('double:amount*2'));
	my ($row1) = grep { $_->{entry} eq 'row1' } @{$rows};
	cmp_ok($row1->{double}, '==', 21, 'the new column');
	is($row1->{amount}, '10.50', 'beside the old one');
};

subtest 'L18: a Merge runs the whole pipeline, with a file and with another table' => sub {
	plan tests => 9;
	my $rows = _export_rows('l=table:orders&j=table:csvtiers|entry|entry');
	my %by = map { $_->{entry} => $_ } @{$rows};
	is(scalar @{$rows}, 4, 'left, with a CSV file: every row');
	is($by{row1}{csvtier}, 'csvgold', 'a value from the file');
	is($by{row1}{region}, 'North', 'beside a value from the server');

	$rows = _export_rows('l=table:orders&j=table:tiers|entry|entry&jtype=inner');
	is_deeply(_entries($rows), [qw(row1 row2 row3)], 'inner, with another table: the rows on both sides');
	my ($row2) = grep { $_->{entry} eq 'row2' } @{$rows};
	is($row2->{tier}, 'silver', 'with its value');
};

subtest 'L22: every way of paging leaves the read-only array alone' => sub {
	plan tests => 12;
	for my $query ('/view/orders?per_page=2', '/view/orders?per_page=2&page=2', '/view/orders?d=1', '/view/orders?page=9',
		'/join?l=table:orders&per_page=2', '/combine?l=table:orders&c=table:tiers') {
		$t->get_ok($query);
		unlike($t->tx->res->body, qr/Modification of a read-only/, "$query is not refused");
	}
};

# ---------------------------------------------------------------------------
# When things go wrong
# ---------------------------------------------------------------------------
subtest 'L19: SQL in a parameter stays data' => sub {
	plan tests => 7;
	my $attack = url_escape(q{x' OR '1'='1});
	is_deeply(_export_rows("l=table:orders&f=region:eq:$attack"), [], 'a filter value matches nothing');

	my $drop = url_escape("entry; DROP TABLE `$ORDERS`");
	$t->get_ok("/export?l=table:orders&format=json&sort=$drop");
	cmp_ok($t->tx->res->code, '<', 500, 'a sort column is not a 500');

	my ($still) = $setup_dbh->selectrow_array("SELECT COUNT(*) FROM `$ORDERS`");
	is($still, 4, 'and the table is still there');
	my $rows = _orders()->selectall_arrayref({ entry => q{row1' OR '1'='1} });
	is_deeply($rows // [], [], 'a criterion is bound, not written into the SQL');
};

subtest 'L20: a table that is not there is an error naming it' => sub {
	plan tests => 2;
	my $src = _maria_source("${ORDERS}_missing");
	throws_ok { $src->fetch_all } qr/\Q${ORDERS}_missing\E/, 'fetch_all names the table';
	throws_ok { $src->selectall_arrayref } qr/./, 'selectall_arrayref does not swallow it';
};

subtest 'L21: a refused login is a page that keeps the credentials to itself' => sub {
	plan tests => 5;
	my $wrong = 'not-the-password-' . $$;
	my $real  = $t->app->renderer->get_helper('open_table');
	$t->app->helper(open_table => sub { return _maria_source($ORDERS, password => $wrong) });
	$t->get_ok('/join?l=table:orders');
	my ($code, $body) = ($t->tx->res->code, $t->tx->res->body);
	$t->app->helper(open_table => $real);

	cmp_ok($code, '<', 500, 'no 500');
	unlike($body, qr/\Q$wrong\E/, 'the password is not on the page');
	unlike($body, qr/\Qdbi:\E(?:MariaDB|mysql)/, 'nor is the DSN');
	unlike($body, qr/\.pm line \d+/, 'nor a source location');
};
