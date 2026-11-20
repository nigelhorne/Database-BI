use strict;
use warnings;
use Test::Most;
use Test::Mojo;
use File::Temp qw(tempdir);
use Mojo::File qw(path);
use Mojo::Util qw(url_escape);

# Columns the reader deleted in the table are not exported: the Export panel
# sends the columns still shown as repeated xcol=, in the table's order.

my $data = tempdir(CLEANUP => 1);
my $out  = tempdir(CLEANUP => 1);
path($data, 'a.csv')->spurt("id,name,secret\n1,Ann,x\n2,Bob,y\n");

my $t = Test::Mojo->new('Database::BI');
$t->app->config->{data_dir}  = $data;
$t->app->config->{model_dir} = tempdir(CLEANUP => 1);

my $l = 'l=' . url_escape("path:$data/a.csv");

$t->get_ok("/export?$l&format=csv")->content_like(qr/secret/, 'all columns by default');
$t->get_ok("/export?$l&format=csv&xcol=name&xcol=id")
  ->content_like(qr/\A"?name"?,"?id"?\r?\n/, 'kept columns, in the given order')
  ->content_unlike(qr/secret|\bx\b/, 'deleted column is gone');
$t->get_ok("/export?$l&format=json&xcol=id")
  ->json_is('/0' => { id => 1 }, 'JSON rows hold only the kept column');
$t->get_ok("/export?$l&format=csv&xcol=nosuch")
  ->content_like(qr/secret/, 'no known column named: everything kept');

$t->get_ok("/export?$l&format=json&xcol=name&xcol=secret&xcol=id")
  ->content_like(qr/\A\[\{"name":"Ann","secret":"x","id":"?1"?\},/, 'JSON keys follow the column order')
  ->header_like('Content-Type' => qr{application/json}, 'still JSON');

done_testing;
