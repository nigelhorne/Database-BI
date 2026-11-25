#!/usr/bin/env perl
# Alerts in the app: limits kept on a canvas, a check on demand and on a timer,
# the throttle and recovery shared with script/bi-alert, recent alerts, and a
# delivery command that only the server's configuration can set.
use strict;
use warnings;
use Test::Most;
use Test::Mojo;
use Mojo::File;
use Mojo::JSON qw(decode_json);
use File::Temp qw(tempdir);
use Database::BI::Alert;

my $data  = Mojo::File->new(tempdir(CLEANUP => 1));
my $model = Mojo::File->new(tempdir(CLEANUP => 1));
my $out   = Mojo::File->new(tempdir(CLEANUP => 1))->child('delivered.txt');

my $gen = 0;
# The file's rows are remembered by its modification time, so each rewrite moves it on.
sub put_rows {
	my $n = shift;
	my $f = $data->child('orders.csv');
	$f->spew(join("\n", 'id,region,amount', map { "$_,North," . $_ * 10 } 1 .. $n) . "\n");
	my $when = time + 10 * ++$gen;
	utime $when, $when, "$f";
}
put_rows(5);

my $t = Test::Mojo->new('Database::BI', {
	data_dir => "$data", model_dir => "$model",
	alert_notify_cmd => "cat >> $out; echo \"[\$BI_ALERT_EVENT] \$BI_ALERT_SUBJECT\" >> $out",
});

sub canvas {
	$t->post_ok('/api/analyses' => json => {
		name => 'Orders', datasets => [ { spec => 'table:orders' } ],
		visuals => [ { kind => 'bar', encode => { cat => 'region', value => 'amount' } } ],
	})->status_is(201);
	return $t->tx->res->json->{id};
}
sub set_alerts { my ($id, $al) = @_; $t->patch_ok("/api/analyses/$id" => json => { alerts => $al }) }

my $id = canvas();

subtest 'what may be saved' => sub {
	set_alerts($id, { thresholds => [ { measure => 'count', op => 'bigger', value => 3 } ] })->status_is(400)->content_like(qr/comparison/);
	set_alerts($id, { thresholds => [ { measure => 'count', op => 'gt', value => 'lots' } ] })->status_is(400)->content_like(qr/number/);
	set_alerts($id, { thresholds => [ { measure => 'x', op => 'gt', value => 1, fn => 'sum' } ] })->status_is(400)->content_like(qr/column/);
	set_alerts($id, { thresholds => [], suppress => 'sometimes' })->status_is(400)->content_like(qr/suppress/);
	set_alerts($id, 'x')->status_is(400);
	$t->post_ok("/api/analyses/$id/alerts/check" => json => {})->status_is(400)->json_like('/error', qr/no alert thresholds/);

	set_alerts($id, { thresholds => [
		{ measure => 'count', fn => 'count', op => 'gt', value => 3 },
		{ measure => 'amount_sum', fn => 'sum', col => 'amount', op => 'gt', value => 1000 },
	], suppress => '1h', recovery => 1 })->status_is(200);
	$t->get_ok("/api/analyses/$id/alerts")->status_is(200)
		->json_is('/suppress', '1h')->json_is('/recovery', 1)->json_is('/thresholds/1/measure', 'amount_sum')
		->json_is('/spec', 'table:orders')->json_is('/notify', 1)->json_is('/recent', []);
};

subtest 'try it records and sends nothing' => sub {
	$t->post_ok("/api/analyses/$id/alerts/check" => json => { dry => 1 })->status_is(200)
		->json_is('/dry', 1)->json_has('/crossings/0');
	ok !-e $model->child('alerts-state.json'), 'no state';
	ok !-e $out, 'nothing delivered';
};

subtest 'a crossing is announced, delivered, logged and then throttled' => sub {
	$t->post_ok("/api/analyses/$id/alerts/check" => json => {})->status_is(200)
		->json_is('/crossings/0', 'THRESHOLD CROSSED: count (5) gt 3')->json_is('/delivered', 1);
	my @lines = @{ $t->tx->res->json->{lines} };
	ok((grep { /\ARows:\s+5\z/ } @lines), 'the digest says the rows');
	ok((grep { /amount_sum = 150/ } @lines), 'and a measure the threshold defined');
	like $out->slurp, qr/THRESHOLD CROSSED: count \(5\) gt 3.*\[crossed\] THRESHOLD CROSSED/s, 'the command got the text and the verdict';
	ok -f $model->child('alerts-state.json'), 'state kept';

	$t->post_ok("/api/analyses/$id/alerts/check" => json => {})->status_is(200)
		->json_is('/crossings', [])->content_like(qr/THRESHOLD SUPPRESSED/);
	$t->get_ok("/api/analyses/$id/alerts")->json_is('/recent/0/kind', 'crossed')->json_like('/recent/0/when', qr/\A\d{4}-/);
	is scalar @{ $t->tx->res->json->{recent} }, 1, 'announced once';
};

subtest 'it is shared with bi-alert, which sees the throttle' => sub {
	my $run = qx{$^X -Ilib script/bi-alert --model-dir $model --data-dir $data --analysis $id --threshold count:gt:3 --suppress 1h 2>&1};
	like $run, qr/THRESHOLD SUPPRESSED/, 'the command line honours what the app announced';
	$run = qx{$^X -Ilib script/bi-alert --model-dir $model --data-dir $data --analysis $id --threshold amount_sum:gt:1000 2>&1};
	like $run, qr/Threshold not crossed: amount_sum \(150\) gt 1000/, 'and works out a measure the panel defined';
};

subtest 'recovery' => sub {
	put_rows(2);
	$t->post_ok("/api/analyses/$id/alerts/check" => json => {})->status_is(200)
		->json_is('/recoveries/0', 'THRESHOLD RECOVERED: count (2) gt 3');
	$t->get_ok("/api/analyses/$id/alerts")->json_is('/recent/0/kind', 'recovered');
	put_rows(5);
};

subtest 'a failed delivery records nothing, so it is announced again' => sub {
	my $bad = Test::Mojo->new('Database::BI', { data_dir => "$data", model_dir => "" . tempdir(CLEANUP => 1), alert_notify_cmd => 'exit 7' });
	$bad->post_ok('/api/analyses' => json => { name => 'O', datasets => [ { spec => 'table:orders' } ],
		visuals => [ { kind => 'bar', encode => { cat => 'region', value => 'amount' } } ],
		alerts => { thresholds => [ { measure => 'count', op => 'gt', value => 3 } ], suppress => '1h' } })->status_is(201);
	my $bid = $bad->tx->res->json->{id};
	$bad->post_ok("/api/analyses/$bid/alerts/check" => json => {})->status_is(200)
		->json_is("/delivered", 0)->json_like("/problem", qr/exit 7/);
	$bad->post_ok("/api/analyses/$bid/alerts/check" => json => {})
		->json_is('/crossings/0', 'THRESHOLD CROSSED: count (5) gt 3');
	$bad->get_ok("/api/analyses/$bid/alerts")->json_is('/recent', []);
};

subtest 'the timer' => sub {
	my $dir = Mojo::File->new(tempdir(CLEANUP => 1));
	$t->app->config->{model_dir} = "$dir";
	my $id2 = canvas();
	set_alerts($id2, { thresholds => [ { measure => 'count', op => 'gt', value => 3 } ] });
	is Database::BI::Controller::Dashboard::run_scheduled_alerts($t->app, every => 900, now => 1_000_000), 1, 'a canvas with limits is checked';
	is Database::BI::Controller::Dashboard::run_scheduled_alerts($t->app, every => 900, now => 1_000_100), 0, 'not again inside the period (another worker, or the same)';
	is Database::BI::Controller::Dashboard::run_scheduled_alerts($t->app, every => 900, now => 1_000_900), 1, 'and again after it';
};

subtest 'the panel, and the settings' => sub {
	$t->app->config->{model_dir} = "$model";
	$t->get_ok("/a/$id")->status_is(200)->content_like(qr/id="btn-alerts"/)->content_like(qr/id="alerts-panel"/)
		->content_like(qr{/alerts/check});
	for my $bad (qw(5s soon)) {
		throws_ok { Test::Mojo->new('Database::BI', { data_dir => "$data", model_dir => "$model", alert_every => $bad }) } qr/alert_every/, "alert_every $bad refused";
	}
	throws_ok { Test::Mojo->new('Database::BI', { data_dir => "$data", model_dir => "$model", alert_notify_cmd => ['x'] }) } qr/alert_notify_cmd/, 'a command must be a string';
	lives_ok { Test::Mojo->new('Database::BI', { data_dir => "$data", model_dir => "$model", alert_every => '15m' }) } '15m is fine';
};

done_testing();
