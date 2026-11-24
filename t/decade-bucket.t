use strict;
use warnings;

# Decade and century time buckets, and buckets for a column that holds only a
# year.  span(v, '1dec') and span(v, '1c') are ten and a hundred years; a bare
# year such as 1887 is read as 1 January of it, by the year units alone.
#
#   prove -l t/decade-bucket.t

use Test::Most;
use Test::Mojo;
use File::Temp qw(tempdir);
use Mojo::File;
use Database::BI::Calc ();

my @warnings;
$SIG{__WARN__} = sub { push @warnings, $_[0] };

sub _calc {
	my ($expr, $row) = @_;
	my $calc = Database::BI::Calc->new(expr => $expr, columns => [ sort keys %$row ]);
	die "compile error in $expr: " . $calc->error if $calc->has_error;
	return $calc->evaluate($row);
}

subtest 'the interval vocabulary' => sub {
	is_deeply(Database::BI::Calc::span_interval('1dec'), { n => 10,  unit => 'y' }, '1dec is ten years');
	is_deeply(Database::BI::Calc::span_interval('3dec'), { n => 30,  unit => 'y' }, '3dec is thirty');
	is_deeply(Database::BI::Calc::span_interval('1c'),   { n => 100, unit => 'y' }, '1c is a hundred years');
	is_deeply(Database::BI::Calc::span_interval('10y'),  { n => 10,  unit => 'y' }, '10y is the same as 1dec');
	is(Database::BI::Calc::span_interval('0dec'), undef, 'a count of none is refused');
	is(Database::BI::Calc::span_interval('1decade'), undef, 'a word is not a unit');
	is(Database::BI::Calc::span_interval('dec'), undef, 'a unit with no count is refused');
	is(Database::BI::Calc::span_interval('1cent'), undef, 'nor is cent');
	is(Database::BI::Calc::span_interval('1mon')->{unit}, 'mon', 'months are as they were');
	is(Database::BI::Calc::span_interval('1m')->{unit}, 'm', 'and m is still minutes');
};

subtest 'a decade and a century of a date' => sub {
	my %cases = (
		'1987-05-04'          => [ '1980-01-01', '1900-01-01' ],
		'1980-01-01'          => [ '1980-01-01', '1900-01-01' ],
		'1989-12-31'          => [ '1980-01-01', '1900-01-01' ],
		'2000-06-15'          => [ '2000-01-01', '2000-01-01' ],
		'1999-12-31'          => [ '1990-01-01', '1900-01-01' ],
		'2026-10-27T14:05:03' => [ '2020-01-01', '2000-01-01' ],
		'1887-03-02'          => [ '1880-01-01', '1800-01-01' ],
	);
	for my $v (sort keys %cases) {
		is(_calc("span(d, '1dec')", { d => $v }), $cases{$v}[0], "$v: decade");
		is(_calc("span(d, '1c')",   { d => $v }), $cases{$v}[1], "$v: century");
		is(_calc("span(d, '1dec')", { d => $v }), _calc("span(d, '10y')",  { d => $v }), "$v: 1dec is 10y");
		is(_calc("span(d, '1c')",   { d => $v }), _calc("span(d, '100y')", { d => $v }), "$v: 1c is 100y");
	}
	is(_calc("span(d, '2dec')", { d => '1987-05-04' }), '1980-01-01', 'two decades align to the twenties of the century');
	is(_calc("span(d, '2dec')", { d => '1999-05-04' }), '1980-01-01', 'a double decade is 1980 to 1999');
	is(_calc("span(d, '5y')",   { d => '1987-05-04' }), '1985-01-01', 'five years are as they were');
};

subtest 'a column that holds only a year' => sub {
	is(_calc("span(y, '1y')",   { y => '1887' }), '1887-01-01', 'a year bucket of a year');
	is(_calc("span(y, '1dec')", { y => '1887' }), '1880-01-01', 'a decade');
	is(_calc("span(y, '1dec')", { y => 1887 }),   '1880-01-01', 'a number is read as it is');
	is(_calc("span(y, '1c')",   { y => '1887' }), '1800-01-01', 'a century');
	is(_calc("span(y, '1dec')", { y => ' 1887 ' }), '1880-01-01', 'spaces round it are left out');
	is(_calc("span(y, '1dec')", { y => '905' }),  '0900-01-01', 'a three-digit year');
	is(_calc("span(y, '1c')",   { y => '2000' }), '2000-01-01', 'the year 2000 starts its own century');

	# Not a year: nothing is made up.
	for my $bad ('', 'abc', '12', '12345', '1887.5', '-1887', '18 87', '1887-', '0x7B3') {
		is(_calc("span(y, '1dec')", { y => $bad }), undef, "'$bad' is not a year");
	}
	is(_calc("span(y, '1mon')", { y => '1887' }), undef, 'a month of a bare year would be made up');
	is(_calc("span(y, '1d')",   { y => '1887' }), undef, 'and so would a day');
	is(_calc("span(y, '1h')",   { y => '1887' }), undef, 'or an hour');
	is(_calc("span(y, '1dec')", { y => undef }),  undef, 'a missing cell is undef');
	is(_calc("span(y, '1dec')", { y => "1887\n" }), '1880-01-01', 'a line end is left out');
};

subtest 'a bad interval is refused when the expression is compiled' => sub {
	for my $bad (qw(0dec 1decade dec 1cc 1C)) {
		my $calc = Database::BI::Calc->new(expr => "span(d, '$bad')", columns => ['d']);
		ok($calc->has_error, "$bad is an error");
		like($calc->error, qr/dec or c/, "$bad: and the message lists the new units");
	}
};

subtest 'the page buckets a year column by decade' => sub {
	my $data   = Mojo::File->new(tempdir(CLEANUP => 1));
	my $models = Mojo::File->new(tempdir(CLEANUP => 1));
	$data->child('births.csv')->spurt("year,count\n1887,3\n1889,4\n1893,5\n1901,7\n1999,2\n2003,6\n");
	my $t = Test::Mojo->new('Database::BI', { data_dir => "$data", model_dir => "$models" });
	$t->app->log->level('fatal');

	my $page = $t->get_ok('/bar?l=table:births&cat=year&val=count&span=1dec&tcol=year&sort=label')
		->status_is(200)->tx->res->body;
	for my $label (qw(1880-01-01 1890-01-01 1900-01-01 1990-01-01 2000-01-01)) {
		like($page, qr/\Q$label\E/, "the chart has the decade $label");
	}
	unlike($page, qr/1887-01-01|1893-01-01/, 'and not the single years');
	unlike($page, qr/\(unparseable\)/, 'every year was read');

	my $cent = $t->get_ok('/bar?l=table:births&cat=year&val=count&span=1c&tcol=year')->status_is(200)->tx->res->body;
	like($cent, qr/1800-01-01/, 'a century bucket');
	like($cent, qr/2000-01-01/, 'the next one');

	my $bad = $t->ua->get('/bar?l=table:births&cat=year&val=count&span=1decade&tcol=year' => { Accept => 'text/html' })->res;
	is($bad->code, 400, 'an unknown unit is a 400');
	like($bad->body, qr/1decade/, 'that names it');
	like($bad->body, qr/dec or c/, 'and the units there are');
};

ok(!(grep { !/Too late to run CHECK block/ } @warnings), 'no warnings') or diag(@warnings);

done_testing;
