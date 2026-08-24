use strict;
use warnings;
use Test::More;
use Test::Mojo;
use File::Spec ();
use Mojo::Util qw(url_escape);

my $t = Test::Mojo->new('Database::BI');

$t->get_ok('/')->status_is(200)->content_like(qr/Choose a Database/i);
$t->get_ok('/')->content_like(qr/Browse filesystem/i);
$t->get_ok('/view/sales')->status_is(200);

# Reject invalid table names
$t->get_ok('/view/../etc/passwd')->status_is(404);

# Filesystem browser — use the platform temp dir, not the Unix-only /tmp
my $tmpdir = File::Spec->tmpdir;
$t->get_ok('/browse')->status_is(200)->content_like(qr/Browse Files/i);
$t->get_ok('/browse?path=' . url_escape($tmpdir))->status_is(200);
$t->get_ok('/browse?path=' . url_escape('/nonexistent/path/xyz'))->status_is(404);

# Open a file by absolute path
my $sales = File::Spec->rel2abs('data/sales.csv');
$t->get_ok('/open?path=' . url_escape($sales))->status_is(200)->content_like(qr/sales\.csv/i)
    if -f $sales;
$t->get_ok('/open')->status_is(404);
$t->get_ok('/open?path=' . url_escape('/etc/passwd'))->status_is(404);

# Column API
$t->get_ok('/api/columns?table=sales')->status_is(200)->json_has('/columns');
$t->get_ok('/api/columns?table=nonexistent_xyz')->status_is(404);
$t->get_ok('/api/columns')->status_is(404);

# Join — missing left table returns 404; valid join of sales with itself renders
$t->get_ok('/join')->status_is(404);
$t->get_ok('/join?l=table:nonexistent_xyz')->status_is(404);
if (-f $sales) {
    my $jspec = url_escape('table:sales|product|product');
    $t->get_ok('/join?l=' . url_escape('table:sales') . '&j=' . $jspec)
      ->status_is(200)->content_like(qr/sales/i);
}

# Export
$t->get_ok('/export?l=' . url_escape('table:sales') . '&format=csv')
  ->status_is(200)
  ->content_type_like(qr{text/csv})
  ->content_like(qr/product/i);
$t->get_ok('/export?l=' . url_escape('table:sales') . '&format=sqlite')
  ->status_is(200)
  ->content_type_like(qr{sqlite});
$t->get_ok('/export')->status_is(404);
$t->get_ok('/export?l=' . url_escape('table:nonexistent_xyz'))->status_is(404);

# Filter support
$t->get_ok('/view/sales?f=' . url_escape('region:eq:North'))
  ->status_is(200)->content_like(qr/North/i);
$t->get_ok('/join?l=' . url_escape('table:sales') . '&f=' . url_escape('region:eq:North'))
  ->status_is(200)->content_like(qr/North/i);
# Filter that should return no rows still renders 200 (empty-state)
$t->get_ok('/join?l=' . url_escape('table:sales') . '&f=' . url_escape('region:eq:XYZZY'))
  ->status_is(200);

done_testing();
