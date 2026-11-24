use strict;
use warnings;

# Windows anchored to the data: "the first decade in the data".  They are worked
# out from a column's own earliest and latest day (Util::data_windows, served by
# /api/range), not from today, and the Time range menu applies one as two
# ordinary filters on that column.
#
#   prove -l t/data-windows.t

use Test::Most;
use Test::Mojo;
use File::Temp qw(tempdir);
use Mojo::File;
use Database::BI::Util;

my @warnings;
$SIG{__WARN__} = sub { push @warnings, $_[0] };

sub windows { return { map { $_->{name} => $_ } @{ Database::BI::Util::data_windows(@_) } } }

subtest 'the windows of a long extent' => sub {
	my $w = windows('1883-04-09', '1957-01-02');
	is_deeply([ sort keys %$w ], [qw(data_first_decade data_first_year data_last_decade data_last_year)], 'all four');
	is_deeply([ @{ $w->{data_first_decade} }{qw(lo hi)} ], [ '1883-04-09', '1893-04-08' ], 'the first decade ends the day before its anniversary');
	is_deeply([ @{ $w->{data_last_decade} }{qw(lo hi)} ],  [ '1947-01-03', '1957-01-02' ], 'the last decade is counted back from the last day');
	is_deeply([ @{ $w->{data_first_year} }{qw(lo hi)} ],   [ '1883-04-09', '1884-04-08' ], 'the first year');
	is_deeply([ @{ $w->{data_last_year} }{qw(lo hi)} ],    [ '1956-01-03', '1957-01-02' ], 'the last year');
	like($w->{data_first_decade}{label}, qr/First decade in the data/, 'a label a reader can read');

	my $list = Database::BI::Util::data_windows('1883-04-09', '1957-01-02');
	is_deeply([ map { $_->{name} } @$list ],
		[qw(data_first_decade data_last_decade data_first_year data_last_year)], 'in the order the menu shows');
};

subtest 'a window as long as the data is not offered' => sub {
	is_deeply(windows('2000-01-01', '2000-12-31'), {}, 'a year of data has no first year, for it is all of it');
	my $w = windows('2000-01-01', '2005-06-30');
	is_deeply([ sort keys %$w ], [qw(data_first_year data_last_year)], 'five years have years but no decades');
	$w = windows('2000-01-01', '2010-01-01');
	ok($w->{data_first_decade}, 'ten years and a day have a first decade');
	is($w->{data_first_decade}{hi}, '2009-12-31', 'that ends the day before the data does');
	$w = windows('2000-01-01', '2009-12-31');
	ok(!$w->{data_first_decade}, 'exactly ten years is the whole of it');
	is_deeply(windows('2020-05-05', '2020-05-05'), {}, 'one day has none');
};

subtest 'leap days' => sub {
	my $w = windows('2000-02-29', '2040-01-01');
	is($w->{data_first_year}{hi}, '2001-02-27', 'a year from 29 February lands on the 28th and ends the day before');
	$w = windows('1990-01-01', '2024-02-29');
	is($w->{data_last_year}{lo}, '2023-03-01', 'counted back from 29 February');
	$w = windows('1990-01-01', '2000-03-01');
	is($w->{data_last_decade}{lo}, '1990-03-02', 'a century year that is a leap year');
};

subtest 'not dates, not windows' => sub {
	for my $case ([ undef, '2020-01-01' ], [ '2020-01-01', undef ], [ '', '' ], [ 'x', 'y' ],
		[ '2020-13-01', '2030-01-01' ], [ '2021-02-29', '2040-01-01' ], [ '2020-01-01', '2020-04-31' ],
		[ '2030-01-01', '2020-01-01' ], [ [], '2020-01-01' ], [ '2020-1-1', '2040-1-1' ]) {
		my $got = Database::BI::Util::data_windows(@$case);
		is_deeply($got, [], 'none for ' . join(' / ', map { defined $_ ? (ref $_ ? 'ref' : "'$_'") : 'undef' } @$case));
	}
	is_deeply(Database::BI::Util::data_windows(), [], 'none for no arguments');
};

subtest 'the page and the API' => sub {
	my $data   = Mojo::File->new(tempdir(CLEANUP => 1));
	my $models = Mojo::File->new(tempdir(CLEANUP => 1));
	$data->child('events.csv')->spurt("id,when,n\n1,1883-04-09,1\n2,1900-06-01,2\n3,1957-01-02,3\n4,not a date,4\n5,,5\n");
	$data->child('clean.csv')->spurt("id,when\n1,1883-04-09\n2,1900-06-01\n3,1957-01-02\n");
	$data->child('short.csv')->spurt("id,when\n1,2024-01-01\n2,2024-03-01\n");
	my $t = Test::Mojo->new('Database::BI', { data_dir => "$data", model_dir => "$models" });
	$t->app->log->level('fatal');

	$t->get_ok('/api/range?l=table:events&col=when')->status_is(200);
	my $j = $t->tx->res->json;
	is($j->{min}, '1883-04-09', 'the earliest day');
	is($j->{max}, '1957-01-02', 'the latest');
	is(scalar @{ $j->{windows} }, 4, 'four windows');
	is($j->{windows}[0]{name}, 'data_first_decade', 'the first is the first decade');
	is($j->{windows}[0]{hi}, '1893-04-08', 'and it ends where it should');

	$t->get_ok('/api/range?l=table:short&col=when')->status_is(200);
	is_deeply($t->tx->res->json->{windows}, [ ], 'a short extent has none');

	$t->get_ok('/api/range?l=table:events&col=n')->status_is(200);
	is($t->tx->res->json->{min}, undef, 'a column with no dates has no range');
	ok(!exists $t->tx->res->json->{windows}, 'and no windows');

	# What the window does is ordinary: two filters on the column.
	my $rows = $t->get_ok('/view/events?f=when:ge:1883-04-09&f=when:le:1893-04-08')->status_is(200)->tx->res->body;
	like($rows, qr{<td[^>]*>1883-04-09</td>}, 'the first decade holds its first day');
	unlike($rows, qr{<td[^>]*>1900-06-01</td>}, 'and not the next century');

	# The menu is drawn only when every date on the page reads as one.
	my $page = $t->get_ok('/view/clean')->status_is(200)->tx->res->body;
	like($page, qr/id="dash-range-data"/, 'the Time range menu has the data group');
	for my $name (qw(data_first_decade data_last_decade data_first_year data_last_year)) {
		like($page, qr/<option value="$name" disabled>/, "$name starts disabled until the extent is known");
	}
	like($page, qr/goAnchored/, 'and the script that applies one');
	like($page, qr/ge:'/, 'as a filter on the column');
};

ok(!(grep { !/Too late to run CHECK block/ } @warnings), 'no warnings') or diag(@warnings);

done_testing;
