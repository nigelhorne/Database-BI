#!/usr/bin/env perl
# A workbook's sheets are its tables: ?sheet= (or it=) opens one, a workbook
# with two or more sheets goes to the /tables picker, and a sheet whose name is
# not a safe identifier ("Q1 Sales") still opens.
use strict;
use warnings;
use Test::Most;
use Test::Mojo;
use File::Temp qw(tempdir);
use Mojo::Util qw(url_escape);

BEGIN {
	eval { require Excel::Writer::XLSX; require Spreadsheet::ParseXLSX; 1 }
		or plan skip_all => 'Excel::Writer::XLSX and Spreadsheet::ParseXLSX are needed';
}
use_ok('Database::BI::Model::DataSource');

my $dir = tempdir(CLEANUP => 1);
my $wb  = Excel::Writer::XLSX->new("$dir/book.xlsx");
my $q1  = $wb->add_worksheet('Q1 Sales');
$q1->write_row(0, 0, [qw(region amount)]);
$q1->write_row(1, 0, ['North', 10]);
$q1->write_row(2, 0, ['South', 20]);
my $costs = $wb->add_worksheet('Costs');
$costs->write_row(0, 0, [qw(item cost)]);
$costs->write_row(1, 0, ['Rent', 5]);
$wb->add_worksheet('Blank');
$wb->close;

my $one = Excel::Writer::XLSX->new("$dir/single.xlsx");
my $only = $one->add_worksheet('Data');
$only->write_row(0, 0, [qw(a b)]);
$only->write_row(1, 0, [1, 2]);
$one->close;

my $path = url_escape("$dir/book.xlsx");
my $t = Test::Mojo->new('Database::BI', { data_dir => $dir, model_dir => tempdir(CLEANUP => 1) });

subtest 'DataSource' => sub {
	is_deeply(Database::BI::Model::DataSource->xlsx_sheets("$dir/book.xlsx"),
		[ { name => 'Q1 Sales', columns => [qw(region amount)] },
		  { name => 'Costs', columns => [qw(item cost)] },
		  { name => 'Blank', columns => [] } ], 'the sheets, with their first columns');
	is_deeply(Database::BI::Model::DataSource->xlsx_sheets("$dir/nothing.xlsx"), [], 'no file: no sheets');

	my $s = Database::BI::Model::DataSource->new(directory => $dir, table => 'book', internal_table => 'Costs');
	is_deeply([ map { $_->{item} } @{ $s->fetch_all } ], ['Rent'], 'a safe name opens');
	is_deeply($s->sqlite_tables, [ 'Q1 Sales', 'Costs', 'Blank' ], 'and lists the sheets');
	$s = Database::BI::Model::DataSource->new(directory => $dir, table => 'book', internal_table => 'Q1 Sales');
	is_deeply([ map { $_->{region} } @{ $s->fetch_all } ], [ 'North', 'South' ], 'so does one with a space');
	is_deeply($s->columns, [qw(region amount)], '... in sheet order');
	throws_ok { Database::BI::Model::DataSource->new(directory => $dir, table => 'book', internal_table => 'Nope') }
		qr/no sheet called "Nope".*Q1 Sales, Costs, Blank/, 'a sheet it has not got names the ones it has';
	$s = Database::BI::Model::DataSource->new(directory => $dir, table => 'single');
	is($s->sqlite_tables, undef, 'one sheet: no picker');
};

subtest 'pages' => sub {
	$t->get_ok("/open?path=$path")->status_is(302)->header_like(Location => qr{/tables\?l=});
	$t->get_ok('/tables?l=' . url_escape("path:$dir/book.xlsx"))->status_is(200)
		->content_like(qr/Q1 Sales/)->content_like(qr/Costs/)->content_unlike(qr/cannot be opened/);
	$t->get_ok("/open?path=$path&sheet=" . url_escape('Q1 Sales'))->status_is(200)
		->content_like(qr{<td[^>]*>North</td>})->content_unlike(qr{<td[^>]*>Rent</td>});
	$t->get_ok("/open?path=$path&sheet=Costs")->status_is(200)
		->content_like(qr{<td[^>]*>Rent</td>})->content_unlike(qr{<td[^>]*>North</td>});
	$t->get_ok("/open?path=$path&it=Costs")->status_is(200)->content_like(qr{<td[^>]*>Rent</td>});
	$t->get_ok("/open?path=$path&sheet=Nope")->content_like(qr/no sheet called/);
	$t->get_ok('/open?path=' . url_escape("$dir/single.xlsx"))->status_is(200)->content_like(qr{<td[^>]*>1</td>});
	$t->get_ok('/bar?cat=region&val=amount&l=' . url_escape("path:$dir/book.xlsx#Q1 Sales"))->status_is(200);
};

done_testing();
