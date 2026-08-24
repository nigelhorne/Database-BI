use strict;
use warnings;
use Test::More;
use Test::Mojo;
use File::Spec ();
use File::Temp ();
use Mojo::File;
use Mojo::Util qw(url_escape);

my $t = Test::Mojo->new('Database::BI');

$t->get_ok('/')->status_is(200)->content_like(qr/Choose a Database/i);
$t->get_ok('/')->content_like(qr/Browse filesystem/i);
$t->get_ok('/view/sales')->status_is(200);

# Reject invalid table names
$t->get_ok('/view/../etc/passwd')->status_is(404);

# Filesystem browser -- use the platform temp dir, not the Unix-only /tmp
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

# Join -- missing left table returns 404; valid join of sales with itself renders
$t->get_ok('/join')->status_is(404);
$t->get_ok('/join?l=table:nonexistent_xyz')->status_is(404);
if (-f $sales) {
    my $jspec = url_escape('table:sales|product|product');
    $t->get_ok('/join?l=' . url_escape('table:sales') . '&j=' . $jspec)
      ->status_is(200)->content_like(qr/sales/i);
}

# Export CSV
$t->get_ok('/export?l=' . url_escape('table:sales') . '&format=csv')
  ->status_is(200)
  ->content_type_like(qr{text/csv})
  ->content_like(qr/product/i);
# Export SQLite
$t->get_ok('/export?l=' . url_escape('table:sales') . '&format=sqlite')
  ->status_is(200)
  ->content_type_like(qr{sqlite});
# Export missing table
$t->get_ok('/export')->status_is(404);
$t->get_ok('/export?l=' . url_escape('table:nonexistent_xyz'))->status_is(404);

# Filter support (CSV)
$t->get_ok('/view/sales?f=' . url_escape('region:eq:North'))
  ->status_is(200)->content_like(qr/North/i);
$t->get_ok('/join?l=' . url_escape('table:sales') . '&f=' . url_escape('region:eq:North'))
  ->status_is(200)->content_like(qr/North/i);
# Filter that matches no rows still renders 200 (empty-state message)
$t->get_ok('/join?l=' . url_escape('table:sales') . '&f=' . url_escape('region:eq:XYZZY'))
  ->status_is(200);

# -----------------------------------------------------------------------
# PSV format (data/products.psv)
# -----------------------------------------------------------------------
my $products_psv = File::Spec->rel2abs('data/products.psv');
SKIP: {
    skip 'data/products.psv not found', 8 unless -f $products_psv;

    $t->get_ok('/view/products')->status_is(200)
      ->content_like(qr/Hammer/)->content_like(qr/Screwdriver/);

    # Columns API works for PSV
    $t->get_ok('/api/columns?table=products')->status_is(200)->json_has('/columns');

    # Filter on PSV column
    $t->get_ok('/view/products?f=' . url_escape('category:eq:Tools'))
      ->status_is(200)->content_like(qr/Hammer/);

    # Export PSV data as CSV
    $t->get_ok('/export?l=' . url_escape('table:products') . '&format=csv')
      ->status_is(200)->content_type_like(qr{text/csv})->content_like(qr/Hammer/);

    # Export PSV data as SQLite
    $t->get_ok('/export?l=' . url_escape('table:products') . '&format=sqlite')
      ->status_is(200)->content_type_like(qr{sqlite});

    # Cross-format join: CSV sales left-joined with PSV products on product/name
    my $jspec = url_escape('table:products|product|name');
    $t->get_ok('/join?l=' . url_escape('table:sales') . '&j=' . $jspec)
      ->status_is(200)->content_like(qr/product|category/i);

    # Open PSV by absolute path
    $t->get_ok('/open?path=' . url_escape($products_psv))
      ->status_is(200)->content_like(qr/Hammer/);
}

# -----------------------------------------------------------------------
# XML format (data/catalog.xml)
# -----------------------------------------------------------------------
my $catalog_xml = File::Spec->rel2abs('data/catalog.xml');
SKIP: {
    skip 'data/catalog.xml not found', 5 unless -f $catalog_xml;

    $t->get_ok('/view/catalog')->status_is(200)
      ->content_like(qr/Widget A/)->content_like(qr/Gizmo B/);

    # Filter on XML column
    $t->get_ok('/view/catalog?f=' . url_escape('category:eq:hardware'))
      ->status_is(200)->content_like(qr/Widget A/);

    # Export XML data as CSV
    $t->get_ok('/export?l=' . url_escape('table:catalog') . '&format=csv')
      ->status_is(200)->content_type_like(qr{text/csv})->content_like(qr/Widget A/);

    # Columns API works for XML
    $t->get_ok('/api/columns?table=catalog')->status_is(200)->json_has('/columns');

    # Open XML by absolute path
    $t->get_ok('/open?path=' . url_escape($catalog_xml))
      ->status_is(200)->content_like(qr/Widget A/);
}

# -----------------------------------------------------------------------
# SQLite format (.sql extension -- Database::Abstraction's SQLite probe)
# -----------------------------------------------------------------------
{
    require DBI;

    my $sql_dir  = File::Temp::tempdir(CLEANUP => 1);
    my $sql_file = File::Spec->catfile($sql_dir, 'inventory.sql');

    my $dbh = DBI->connect(
        "dbi:SQLite:dbname=$sql_file", '', '',
        { RaiseError => 1, AutoCommit => 1 },
    );
    $dbh->do('CREATE TABLE inventory (sku TEXT, description TEXT, qty INTEGER)');
    $dbh->do("INSERT INTO inventory VALUES ('SKU001', 'Bolt M6',  100)");
    $dbh->do("INSERT INTO inventory VALUES ('SKU002', 'Nut M6',   200)");
    $dbh->disconnect;

    # Open SQLite file via /open
    $t->get_ok('/open?path=' . url_escape($sql_file))
      ->status_is(200)->content_like(qr/Bolt M6/);

    # Filter on SQLite data
    $t->get_ok('/open?path=' . url_escape($sql_file) . '&f=' . url_escape('sku:eq:SKU001'))
      ->status_is(200)->content_like(qr/Bolt M6/);

    # Export SQLite source as CSV
    $t->get_ok('/export?l=' . url_escape("path:$sql_file") . '&format=csv')
      ->status_is(200)->content_type_like(qr{text/csv})->content_like(qr/Bolt/);

    # Export SQLite source as SQLite
    $t->get_ok('/export?l=' . url_escape("path:$sql_file") . '&format=sqlite')
      ->status_is(200)->content_type_like(qr{sqlite});

    # Browse the temp dir and expect the .sql file to appear as a link
    $t->get_ok('/browse?path=' . url_escape($sql_dir))
      ->status_is(200)->content_like(qr/inventory\.sql/);
}

# -----------------------------------------------------------------------
# Drag-and-drop upload endpoint
# -----------------------------------------------------------------------
{
    # Upload a CSV file and expect a redirect URL back
    my $csv_content = "id,name,qty\r\n1,Widget,100\r\n2,Gadget,200\r\n";
    $t->post_ok('/upload',
        form => { file => { content => $csv_content, filename => 'upload_test.csv' } }
    )->status_is(200)->json_has('/url')->json_has('/path')
     ->json_like('/url', qr{/open\?path=});

    # Upload file: verify the path is openable
    my $url = $t->tx->res->json('/url');
    $t->get_ok($url)->status_is(200)->content_like(qr/Widget/) if defined $url;

    # Upload with no file returns 400
    $t->post_ok('/upload')->status_is(400);

    # Upload unsupported extension returns 415
    $t->post_ok('/upload',
        form => { file => { content => 'data', filename => 'bad.txt' } }
    )->status_is(415);

    # Upload a PSV file
    my $psv_content = "id|name|price\n1|Bolt|0.99\n2|Nut|0.49\n";
    $t->post_ok('/upload',
        form => { file => { content => $psv_content, filename => 'parts.psv' } }
    )->status_is(200)->json_like('/url', qr{/open\?path=});

    # Upload a SQLite .sql file
    {
        my $sql_dir2  = File::Temp::tempdir(CLEANUP => 1);
        my $sql_file2 = File::Spec->catfile($sql_dir2, 'upload_sq.sql');
        my $dbh2 = DBI->connect(
            "dbi:SQLite:dbname=$sql_file2", '', '', { RaiseError => 1, AutoCommit => 1 }
        );
        $dbh2->do('CREATE TABLE upload_sq (col1 TEXT, col2 TEXT)');
        $dbh2->do("INSERT INTO upload_sq VALUES ('hello', 'world')");
        $dbh2->disconnect;

        my $bytes = Mojo::File->new($sql_file2)->slurp;
        $t->post_ok('/upload',
            form => { file => { content => $bytes, filename => 'upload_sq.sql' } }
        )->status_is(200)->json_like('/url', qr{/open\?path=});

        my $sq_url = $t->tx->res->json('/url');
        $t->get_ok($sq_url)->status_is(200)->content_like(qr/hello/) if defined $sq_url;
    }
}

done_testing();
