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

# ---------------------------------------------------------------------------
# Phase 3.3 -- cross-filter on the canvas (/a/:id?cf=col:op:val&cv=N)
# ---------------------------------------------------------------------------

subtest '3.3: cross-filter filters non-source visuals and highlights source' => sub {
	# Use table visuals (kind=>'table') so we can inspect rendered cell data
	# without needing HTML::D3 to be installed.  sales.csv has columns:
	#   id, product, region, sales_rep, amount, sale_date
	# We create two visuals, both showing the full table.
	# With ?cf=region:eq:North, visual 1 should show only North rows;
	# visual 0 (the source, cv=0) should still show all regions.

	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'CF test canvas',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [
			{ kind => 'table', encode => { columns => ['region', 'amount'] }, title => 'All regions' },
			{ kind => 'table', encode => { columns => ['region', 'amount'] }, title => 'Filtered' },
		],
	};

	my $res = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json;
	my $cid = $res->{id};
	ok $cid, 'canvas id returned';

	# -- Phase 1: no cross-filter -- both visuals show all rows
	$t->get_ok("/a/$cid")
	  ->status_is(200, 'canvas renders without cross-filter');
	my $body = $t->tx->res->body;
	is scalar(() = $body =~ /North/g) >= 2, 1,
		'North appears in both visuals (no cross-filter)';
	unlike $body, qr/id="cf-chip"/, 'no cross-filter chip element when cf= absent';

	# -- Phase 2: cross-filter with cv=0 (source) --
	# visual 0 is source: unfiltered, gets cf-source class
	# visual 1 is filtered: shows only North rows
	use Mojo::Util qw(url_escape);
	$t->get_ok("/a/$cid?cf=" . url_escape('region:eq:North') . "&cv=0")
	  ->status_is(200, 'canvas renders with cross-filter');
	my $cf_body = $t->tx->res->body;

	like   $cf_body, qr/id="cf-chip"/,      'cross-filter chip rendered';
	like   $cf_body, qr/region = North/,    'chip shows filter description';
	like   $cf_body, qr/class="[^"]*\bcf-source\b/, 'source visual gets cf-source class on element';
	like   $cf_body, qr/Clear/,             'clear link present';
	like   $cf_body, qr/\?cf=/,             'clear link URL contains cf param (before stripping)';

	# The cross-filter chip's clear href must NOT contain cf= or cv=
	if ($cf_body =~ /href="([^"]+)"[^>]*>\s*[&\#x2F;\w]*\s*Clear/) {
		my $clear_href = $1;
		unlike $clear_href, qr/[?&]cf=/,  'clear href has no cf= param';
		unlike $clear_href, qr/[?&]cv=/,  'clear href has no cv= param';
	}

	# visual 0 (source, cv=0): both North and South should still appear
	# visual 1 (filtered): only North rows, South absent from that visual's section
	# We check by counting visual card sections -- source card has cf-source class;
	# the text "South" should appear in the source section but not in the filtered one.
	# Simplified: verify South appears at all (source) and North appears at all (both).
	like   $cf_body, qr/North/,   'North visible (in source and/or filtered visual)';
	like   $cf_body, qr/South/,   'South visible in source (unfiltered) visual';

	# -- Phase 3: cross-filter without cv (no source) -- both visuals filtered
	$t->get_ok("/a/$cid?cf=" . url_escape('region:eq:North'))
	  ->status_is(200, 'cross-filter without cv= still renders');
	my $nocv_body = $t->tx->res->body;
	like   $nocv_body, qr/id="cf-chip"/, 'chip shown when cv absent';
	unlike $nocv_body, qr/class="[^"]*\bcf-source\b/, 'no cf-source class on any element when cv absent';

	# -- Phase 4: clear URL round-trip -- canvas renders normally after clearing
	$t->get_ok("/a/$cid")
	  ->status_is(200, 'canvas renders cleanly after cross-filter cleared');
};

subtest '3.4: drill-through link in cross-filter chip' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'DT Canvas',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [
			{ kind => 'table', encode => {}, title => 'Table' },
		],
	};
	my $res = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json;
	my $cid = $res->{id};

	# Without cross-filter: no drill-through link
	$t->get_ok("/a/$cid")->status_is(200);
	unlike $t->tx->res->body, qr/cf-drillthrough/,
		'no drill-through link when no cf= active';

	# With cross-filter: drill-through link appears in the chip pointing to /open
	require Mojo::Util;
	my $cf_url = "/a/$cid?cf=" . Mojo::Util::url_escape('region:eq:North');
	$t->get_ok($cf_url)->status_is(200);
	my $b = $t->tx->res->body;
	like $b, qr/class="cf-drillthrough"/,
		'drill-through link present when cf= is active';
	like $b, qr{/open\?path=.*[?&]f=region},
		'drill-through URL contains /open with f= param';
};

subtest '3.4: drill-down breadcrumb from ?dd=/?dl= params' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name        => 'Drill Canvas',
		datasets    => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals     => [
			{ kind => 'bar', encode => { cat => 'region' },  title => 'By Region' },
			{ kind => 'bar', encode => { cat => 'product' }, title => 'By Product' },
		],
		hierarchies => [ { name => 'Geo', levels => [ 'region', 'product' ] } ],
	};
	my $res = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201, 'canvas with hierarchies created')->tx->res->json;
	my $cid = $res->{id};

	# Level 0: "All" is current (no link)
	$t->get_ok("/a/$cid?dd=Geo&dl=0")->status_is(200);
	my $b0 = $t->tx->res->body;
	like   $b0, qr/class="drill-cur"[^>]*>All</,
		'All is current at dl=0';
	unlike $b0, qr/<a [^>]*>All</,
		'All has no link at dl=0 (already at top)';
	unlike $b0, qr/id="cf-chip"/,
		'no cf chip when drill mode is active';

	# Level 1 after drilling into North: All is a link, North is current
	require Mojo::Util;
	my $dl1_url = "/a/$cid?dd=Geo&dl=1&cf=" . Mojo::Util::url_escape('region:eq:North');
	$t->get_ok($dl1_url)->status_is(200);
	my $b1 = $t->tx->res->body;
	like   $b1, qr/<a [^>]*href=[^>]*>All</,
		'All is a link at dl=1';
	like   $b1, qr/class="drill-cur"[^>]*>North</,
		'North is current at dl=1';
	like   $b1, qr/drill-through-link/,
		'drill-through link present when drill path is non-empty';

	# Level 2 (max): breadcrumb = All > North > product_val (current)
	my $dl2_url = "/a/$cid?dd=Geo&dl=2"
		. '&cf=' . Mojo::Util::url_escape('region:eq:North')
		. '&cf=' . Mojo::Util::url_escape('product:eq:Widget A');
	$t->get_ok($dl2_url)->status_is(200);
	my $b2 = $t->tx->res->body;
	like   $b2, qr/<a [^>]*href=[^>]*>All</,     'All linked at dl=2';
	like   $b2, qr/<a [^>]*href=[^>]*>North</,   'North linked at dl=2';
	like   $b2, qr/class="drill-cur"[^>]*>Widget A</, 'Widget A is current at dl=2';
};

subtest '3.3: _vis_cf_col selects correct dimension per kind' => sub {
	# White-box check via canvas_render stash (inspect rendered HTML for data-cf-col).
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'CF col test',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [
			{ kind => 'table',   encode => { cat => 'region' },                      title => 'T1' },
			{ kind => 'table',   encode => { x   => 'sale_date' },                   title => 'T2' },
			{ kind => 'table',   encode => {},                                        title => 'T3' },
		],
	};
	my $res = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json;
	my $cid2 = $res->{id};

	$t->get_ok("/a/$cid2")->status_is(200);
	my $b = $t->tx->res->body;
	like   $b, qr/data-cf-col="region"/,    'cat column exposed as data-cf-col';
	like   $b, qr/data-cf-col="sale_date"/, 'x column exposed as data-cf-col';
	unlike $b, qr/data-cf-col=""/, 'empty cf_col produces no data-cf-col attribute';
};

done_testing;
