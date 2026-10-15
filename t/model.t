#!/usr/bin/env perl
use strict;
use warnings;

use Test::Most;
use Test::Mojo;
use File::Temp qw(tempdir);
use Mojo::File;
use Mojo::JSON qw(decode_json encode_json);

# Minimal valid analysis spec used throughout the test file.
my %BASE_SPEC = (
	name     => 'Test Analysis',
	datasets => [ { spec => 'table:sales', alias => 'left' } ],
);

my $t = Test::Mojo->new('Database::BI');

# Redirect model storage to a per-run temp directory so tests are isolated.
my $model_dir = tempdir(CLEANUP => 1);
$t->app->config->{model_dir} = $model_dir;

# ---------------------------------------------------------------------------
# Phase 3.1 -- /api/analyses CRUD
# ---------------------------------------------------------------------------

subtest 'list returns empty array on fresh store' => sub {
	$t->get_ok('/api/analyses')
	  ->status_is(200)
	  ->json_is('/analyses' => []);
};

subtest 'create returns 201 with id' => sub {
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json(\%BASE_SPEC)
	)->status_is(201)
	 ->json_has('/id')
	 ->json_is('/created' => 1);
};

subtest 'get retrieves created analysis' => sub {
	# Create one
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json({ %BASE_SPEC, name => 'GetTest' })
	)->status_is(201);
	my $id = $t->tx->res->json->{id};
	ok $id, 'got an id';

	$t->get_ok("/api/analyses/$id")
	  ->status_is(200)
	  ->json_is('/name' => 'GetTest')
	  ->json_is('/id'   => $id);
};

subtest 'list shows created analyses' => sub {
	$t->get_ok('/api/analyses')
	  ->status_is(200);
	my $list = $t->tx->res->json->{analyses};
	ok ref $list eq 'ARRAY' && @$list >= 2, 'at least two analyses in list';
	ok defined $_->{id} && defined $_->{name}, 'each entry has id and name'
		for @$list;
};

subtest 'full replace via PUT' => sub {
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json({ %BASE_SPEC, name => 'BeforeReplace' })
	)->status_is(201);
	my $id = $t->tx->res->json->{id};

	$t->put_ok("/api/analyses/$id",
		{ 'Content-Type' => 'application/json' },
		encode_json({ %BASE_SPEC, name => 'AfterReplace' })
	)->status_is(200)
	 ->json_is('/updated' => 1);

	$t->get_ok("/api/analyses/$id")
	  ->status_is(200)
	  ->json_is('/name' => 'AfterReplace');
};

subtest 'partial update via PATCH preserves untouched fields' => sub {
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json({ %BASE_SPEC, name => 'PatchBase' })
	)->status_is(201);
	my $id = $t->tx->res->json->{id};

	$t->patch_ok("/api/analyses/$id",
		{ 'Content-Type' => 'application/json' },
		encode_json({ name => 'PatchedName' })
	)->status_is(200)
	 ->json_is('/updated' => 1);

	$t->get_ok("/api/analyses/$id")
	  ->status_is(200)
	  ->json_is('/name' => 'PatchedName');

	# datasets were not in the PATCH body -- they must still be present
	my $ds = $t->tx->res->json->{datasets};
	ok ref $ds eq 'ARRAY' && @$ds, 'datasets preserved after PATCH';
};

subtest 'delete removes analysis' => sub {
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json({ %BASE_SPEC, name => 'ToDelete' })
	)->status_is(201);
	my $id = $t->tx->res->json->{id};

	$t->delete_ok("/api/analyses/$id")
	  ->status_is(200)
	  ->json_is('/deleted' => 1);

	$t->get_ok("/api/analyses/$id")
	  ->status_is(404);
};

# ---------------------------------------------------------------------------
# Export / import round-trip
# ---------------------------------------------------------------------------

subtest 'export downloads JSON document' => sub {
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json({ %BASE_SPEC, name => 'ExportTest' })
	)->status_is(201);
	my $id = $t->tx->res->json->{id};

	$t->get_ok("/api/analyses/$id/export")
	  ->status_is(200);

	my $body = $t->tx->res->body;
	my $doc  = eval { decode_json($body) };
	ok !$@,               'exported body is valid JSON';
	is $doc->{name}, 'ExportTest', 'exported name matches';
	is $doc->{id},   $id,          'exported id matches';
};

subtest 'import creates a new analysis from raw JSON body' => sub {
	my $doc = { %BASE_SPEC, name => 'ImportedAnalysis', id => 'should-be-stripped' };
	$t->post_ok('/api/analyses/import',
		{ 'Content-Type' => 'application/json' },
		encode_json($doc)
	)->status_is(201)
	 ->json_is('/imported' => 1)
	 ->json_has('/id');

	my $new_id = $t->tx->res->json->{id};
	isnt $new_id, 'should-be-stripped', 'server assigns a fresh id';

	$t->get_ok("/api/analyses/$new_id")
	  ->status_is(200)
	  ->json_is('/name' => 'ImportedAnalysis');
};

subtest 'export then import round-trip preserves name and datasets' => sub {
	# Create
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json({ %BASE_SPEC, name => 'RoundTrip' })
	)->status_is(201);
	my $orig_id = $t->tx->res->json->{id};

	# Export
	$t->get_ok("/api/analyses/$orig_id/export")->status_is(200);
	my $exported_json = $t->tx->res->body;

	# Import
	$t->post_ok('/api/analyses/import',
		{ 'Content-Type' => 'application/json' },
		$exported_json
	)->status_is(201);
	my $new_id = $t->tx->res->json->{id};
	isnt $new_id, $orig_id, 'import creates a distinct id';

	# Verify
	$t->get_ok("/api/analyses/$new_id")->status_is(200);
	is $t->tx->res->json->{name}, 'RoundTrip', 'name survives round-trip';
	my $ds_orig = decode_json($exported_json)->{datasets};
	my $ds_new  = $t->tx->res->json->{datasets};
	is_deeply $ds_new, $ds_orig, 'datasets survive round-trip';
};

# ---------------------------------------------------------------------------
# Validation rejection table
# ---------------------------------------------------------------------------

subtest 'create rejects missing name' => sub {
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json({ datasets => [{ spec => 'table:sales' }] })
	)->status_is(400)
	 ->json_has('/error');
};

subtest 'create rejects missing datasets' => sub {
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json({ name => 'NoDatasets' })
	)->status_is(400)
	 ->json_has('/error');
};

subtest 'create rejects empty datasets array' => sub {
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json({ name => 'EmptyDS', datasets => [] })
	)->status_is(400)
	 ->json_has('/error');
};

subtest 'create rejects dataset spec with forbidden prefix' => sub {
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json({ name => 'BadSpec', datasets => [{ spec => 'file:///etc/passwd' }] })
	)->status_is(400)
	 ->json_has('/error');
};

subtest 'create rejects unsupported analysis version' => sub {
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json({ %BASE_SPEC, version => 99 })
	)->status_is(400)
	 ->json_has('/error');
};

subtest 'create rejects invalid JSON body' => sub {
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		'not json at all'
	)->status_is(400)
	 ->json_has('/error');
};

subtest 'get returns 404 for unknown id' => sub {
	$t->get_ok('/api/analyses/doesnotexist99')
	  ->status_is(404)
	  ->json_has('/error');
};

subtest 'put returns 404 for unknown id' => sub {
	$t->put_ok('/api/analyses/doesnotexist99',
		{ 'Content-Type' => 'application/json' },
		encode_json(\%BASE_SPEC)
	)->status_is(404);
};

subtest 'patch returns 404 for unknown id' => sub {
	$t->patch_ok('/api/analyses/doesnotexist99',
		{ 'Content-Type' => 'application/json' },
		encode_json({ name => 'x' })
	)->status_is(404);
};

subtest 'delete returns 404 for unknown id' => sub {
	$t->delete_ok('/api/analyses/doesnotexist99')
	  ->status_is(404);
};

subtest 'id with non-alphanumeric chars returns 400' => sub {
	# Use an id that passes Mojo routing (single path segment) but fails the
	# /\A[A-Za-z0-9]+\z/ guard inside the controller.
	$t->get_ok('/api/analyses/abc!def')
	  ->status_is(400);
};

# ---------------------------------------------------------------------------
# /a/:id -- render redirect (Phase 3.1)
# ---------------------------------------------------------------------------

subtest '/a/:id redirects to reconstructed URL' => sub {
	my $spec = {
		name     => 'RedirectTest',
		datasets => [
			{ spec => 'table:sales', alias => 'left', filters => [] },
		],
		joins => [],
	};
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201);
	my $id = $t->tx->res->json->{id};

	$t->get_ok("/a/$id")
	  ->status_is(302);

	my $loc = $t->tx->res->headers->location;
	like $loc, qr{/join\?l=}, 'redirect points to /join with l= param';
	like $loc, qr{table%3Asales|table:sales}, 'left spec is in the redirect URL';
};

subtest '/a/:id returns 404 for unknown id' => sub {
	$t->get_ok('/a/nosuchanalysis')
	  ->status_is(404);
};

# ---------------------------------------------------------------------------
# Atomic write: verify no partial JSON on disk
# ---------------------------------------------------------------------------

subtest 'analyses.json is valid JSON after write' => sub {
	$t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json({ %BASE_SPEC, name => 'AtomicWrite' })
	)->status_is(201);

	my $file = Mojo::File->new($model_dir)->child('analyses.json');
	ok -f $file, 'analyses.json file exists';
	my $content = $file->slurp;
	my $parsed  = eval { decode_json($content) };
	ok !$@,                 'analyses.json contains valid JSON';
	ok ref $parsed eq 'HASH', 'analyses.json decoded to a hash';
};

# ---------------------------------------------------------------------------
# Degraded mode: read-only model_dir
# ---------------------------------------------------------------------------

SKIP: {
	# Only run this test when we can actually chmod (root can always write)
	skip 'Cannot test read-only dir as root', 2 if $> == 0;

	my $ro_dir = tempdir(CLEANUP => 1);
	# Create the analyses.json first so the app can read but not write
	Mojo::File->new($ro_dir)->child('analyses.json')
		->spurt(encode_json({}));
	chmod 0555, $ro_dir;

	my $ro_t = Test::Mojo->new('Database::BI');
	$ro_t->app->config->{model_dir} = $ro_dir;

	$ro_t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json(\%BASE_SPEC)
	)->status_is(503, 'write to read-only dir returns 503');

	$ro_t->get_ok('/api/analyses')
	  ->status_is(200, 'read still works on read-only dir');

	chmod 0755, $ro_dir;  # restore for CLEANUP
}

done_testing;
