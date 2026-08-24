use strict;
use warnings;
use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('Database::BI');

$t->get_ok('/')->status_is(200)->content_like(qr/Choose a Database/i);
$t->get_ok('/view/sales')->status_is(200);

# Reject invalid table names
$t->get_ok('/view/../etc/passwd')->status_is(404);

done_testing();
