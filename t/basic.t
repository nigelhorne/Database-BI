use strict;
use warnings;
use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('Database::BI');

$t->get_ok('/')->status_is(200)->content_like(qr/Dashboard/i);
$t->get_ok('/dashboard')->status_is(200);

done_testing;
