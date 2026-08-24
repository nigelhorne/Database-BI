use strict;
use warnings;
use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('Database::BI');

$t->get_ok('/')->status_is(200)->content_like(qr/Choose a Database/i);
$t->get_ok('/')->content_like(qr/Browse filesystem/i);
$t->get_ok('/view/sales')->status_is(200);

# Reject invalid table names
$t->get_ok('/view/../etc/passwd')->status_is(404);

# Filesystem browser
$t->get_ok('/browse')->status_is(200)->content_like(qr/Browse Files/i);
$t->get_ok('/browse?path=/tmp')->status_is(200);
$t->get_ok('/browse?path=/nonexistent/path/xyz')->status_is(404);

# Open a file by absolute path
use File::Spec ();
my $sales = File::Spec->rel2abs('data/sales.csv');
$t->get_ok("/open?path=$sales")->status_is(200)->content_like(qr/sales\.csv/i)
    if -f $sales;
$t->get_ok('/open')->status_is(404);
$t->get_ok('/open?path=/etc/passwd')->status_is(404);  # not a supported extension

done_testing();
