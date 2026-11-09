#!/usr/bin/env perl

# "Page N of M" under a paged table, whenever every row was read; a SQL table
# paged on the server (no filter, sort, cs= or d=) is never counted, so it
# shows "Page N" alone (COUNT(*) is too slow on a big SQLite file).

use strict;
use warnings;

use DBI;
use File::Spec;
use File::Temp qw(tempdir);
use Mojo::File;
use Test::Mojo;
use Test::Most;

my $data = tempdir(CLEANUP => 1);

# 25 rows: 3 pages of 10, the last holding 5.
my $csv = join("\n", 'sku,colour,qty', map { "s$_," . ($_ % 2 ? 'Red' : 'Blue') . ",$_" } 1 .. 25) . "\n";
Mojo::File->new($data, 'stock.csv')->spew($csv);

my $db  = File::Spec->catfile($data, 'items.sqlite');
my $dbh = DBI->connect("dbi:SQLite:dbname=$db", '', '', { RaiseError => 1, PrintError => 0 });
$dbh->do('CREATE TABLE items (sku TEXT, colour TEXT, qty INTEGER)');
$dbh->do('INSERT INTO items VALUES (?, ?, ?)', undef, "s$_", ($_ % 2 ? 'Red' : 'Blue'), $_) for 1 .. 25;
$dbh->disconnect;

my $t = Test::Mojo->new('Database::BI', { data_dir => $data, model_dir => tempdir(CLEANUP => 1) });

sub info {
	my ($url) = @_;
	$t->get_ok($url)->status_is(200);
	my $el = $t->tx->res->dom->at('.page-info');
	return $el ? $el->all_text : undef;
}

subtest 'a file read whole: the number of pages' => sub {
	like info('/view/stock?per_page=10'), qr/\APage 1 of 3\b/, 'page 1 of 3';
	like info('/view/stock?per_page=10&page=3'), qr/\APage 3 of 3\b/, 'the last page';
	like info('/view/stock?per_page=4'), qr/\APage 1 of 7\b/, 'a part page counts';
	like info('/view/stock?per_page=10&f=colour:eq:red'), qr/\APage 1 of 2\b/, 'counted after the filter (13 rows)';
	is info('/view/stock?per_page=25'), undef, 'one page: no pagination at all';
};

subtest 'SQLite: counted only when every row is read anyway' => sub {
	like info('/view/items?per_page=10'), qr/\APage 1\s*\x{2014}/, 'paged on the server: the page alone';
	unlike info('/view/items?per_page=10'), qr/ of /, 'with no count';
	like info('/view/items?per_page=10&f=colour:eq:blue'), qr/\APage 1 of 2\b/, 'a filter reads every row: counted (12 rows)';
	like info('/view/items?per_page=10&sort=qty&dir=desc'), qr/\APage 1 of 3\b/, 'so does a sort';
};

subtest '/combine counts the stacked rows' => sub {
	like info('/combine?l=table:stock&c=table:items&per_page=10'), qr/\APage 1 of 5\b/, '50 rows, 5 pages';
};

subtest '_page_count' => sub {
	my $pc = \&Database::BI::Controller::Dashboard::_page_count;
	is $pc->(0, 10), 1, 'no rows: one (empty) page';
	is $pc->(10, 10), 1, 'exactly one page';
	is $pc->(11, 10), 2, 'one row over';
	is $pc->(5, 0), 1, 'a page size of 0 is not a division by zero';
};

done_testing();
