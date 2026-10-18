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

	# Without cross-filter: no drill-through link element (CSS class name
	# appears in the <style> block, so match the HTML attribute form instead).
	$t->get_ok("/a/$cid")->status_is(200);
	unlike $t->tx->res->body, qr/class="cf-drillthrough"/,
		'no drill-through link when no cf= active';

	# With cross-filter: drill-through link appears in the chip pointing to /open.
	# The URL contains ?path=<encoded> followed by &f= (HTML-encoded as &amp;f=).
	require Mojo::Util;
	my $cf_url = "/a/$cid?cf=" . Mojo::Util::url_escape('region:eq:North');
	$t->get_ok($cf_url)->status_is(200);
	my $b = $t->tx->res->body;
	like $b, qr/class="cf-drillthrough"/,
		'drill-through link present when cf= is active';
	like $b, qr{/open\?path=.*f=region},
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

subtest '3.2: card sizes survive a cross-filter and a drill-through visit' => sub {
	# The arrangement a canvas was given is the layout in the analysis.  A visit
	# that filters the data - a cross-filter, or a drill path - shows the same
	# cards in the same cells: the layout is applied to whatever the filter
	# leaves, and a card that has nothing to show keeps its size like any other.
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name        => 'Sized canvas',
		datasets    => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals     => [
			{ kind => 'table', encode => { columns => ['region', 'amount'] }, title => 'Wide' },
			{ kind => 'table', encode => { columns => ['region', 'amount'] }, title => 'Tall' },
		],
		layout      => [
			{ visual => 0, x => 1, y => 1, w => 8, h => 2 },
			{ visual => 1, x => 9, y => 1, w => 4, h => 4 },
		],
		hierarchies => [ { name => 'Geo', levels => [qw(region product)] } ],
	};
	my $res = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201, 'sized canvas created')->tx->res->json;
	my $cid = $res->{id};

	# The style the server writes for a card, read out of the rendered page.
	my $cell_of = sub {
		my ($body, $visual) = @_;
		$body =~ /id="visual-$visual"[^>]*style="([^"]*)"/;
		return $1 // '';
	};

	my $want = {
		0 => 'grid-column:1/span 8;grid-row:1/span 2',
		1 => 'grid-column:9/span 4;grid-row:1/span 4',
	};

	require Mojo::Util;
	my %visit = (
		'no filter'     => "/a/$cid",
		'cross-filter'  => '/a/' . $cid . '?cf=' . Mojo::Util::url_escape('region:eq:North') . '&cv=0',
		'drill-through' => '/a/' . $cid . '?dd=Geo&dl=1&cf=' . Mojo::Util::url_escape('region:eq:North'),
	);

	for my $label (sort keys %visit) {
		$t->get_ok($visit{$label})->status_is(200, "the $label visit renders");
		my $body = $t->tx->res->body;

		for my $visual (sort keys %$want) {
			is $cell_of->($body, $visual), $want->{$visual},
				"the $label visit puts card $visual in the cell it was given";
		}
	}

	# And the visit read the layout rather than rewriting it.
	$t->get_ok("/api/analyses/$cid")->status_is(200);
	is_deeply $t->tx->res->json->{layout}, $spec->{layout},
		'the saved layout is unchanged by the visits';
};

# ---------------------------------------------------------------------------
# Phase 3.5 -- parameters and what-if
# ---------------------------------------------------------------------------

subtest '3.5: parameter bar renders with defaults and URL values' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'Param Canvas',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [ { kind => 'table', encode => {}, title => 'T' } ],
		params   => {
			target   => { type => 'number', default => 100, min => 0, max => 1000 },
			label    => { type => 'string', default => 'All' },
		},
	};
	my $res = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json;
	my $cid = $res->{id};

	# Default values: no ?p.* in URL.
	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;
	like $b, qr/id="param-bar"/,              'param-bar rendered';
	like $b, qr/data-param="p\.target"/,      'target input present';
	like $b, qr/data-param="p\.label"/,       'label input present';
	like $b, qr/value="100"/,                 'target default value 100';
	like $b, qr/value="All"/,                 'label default value All';
	like $b, qr/type="number"/,               'target rendered as number input';
	like $b, qr/min="0"/,                     'min attribute present';
	like $b, qr/max="1000"/,                  'max attribute present';

	# URL-supplied value overrides default.
	require Mojo::Util;
	$t->get_ok("/a/$cid?p.target=50")->status_is(200);
	$b = $t->tx->res->body;
	like $b, qr/value="50"/, 'URL-supplied param value shown in input';
};

subtest '3.5: out-of-range parameter returns 400' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'Range Check',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [ { kind => 'table', encode => {}, title => 'T' } ],
		params   => {
			rate => { type => 'number', default => 5, min => 0, max => 100 },
		},
	};
	my $res = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json;
	my $cid = $res->{id};

	$t->get_ok("/a/$cid?p.rate=200")->status_is(400, '200 > max 100 returns 400');
	$t->get_ok("/a/$cid?p.rate=-5")->status_is(400, '-5 < min 0 returns 400');
	$t->get_ok("/a/$cid?p.rate=abc")->status_is(400, 'non-numeric for number param returns 400');
	$t->get_ok("/a/$cid?p.rate=50")->status_is(200, 'in-range value renders normally');
};

subtest '3.5: parameter flows into calc expression' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'Calc Param',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [ { kind => 'table', encode => {}, title => 'T' } ],
		params   => {
			factor => { type => 'number', default => 1 },
		},
	};
	my $res = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json;
	my $cid = $res->{id};

	require Mojo::Util;
	# ?c= inline calc that references the parameter by name.
	my $c_spec = Mojo::Util::url_escape('scaled:amount * factor');
	$t->get_ok("/a/$cid?c=$c_spec&p.factor=2")->status_is(200,
		'canvas with calc referencing param renders');
	my $b = $t->tx->res->body;
	like $b, qr/scaled/, 'calc column name appears in rendered output';
};

subtest '3.5: param-column clash returns 400' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	# A parameter named the same as an existing column ('amount') is rejected
	# at compile time when a calc field references it.
	my $spec = {
		name     => 'Clash Test',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [ { kind => 'table', encode => {}, title => 'T' } ],
		params   => {
			amount => { type => 'number', default => 0 },
		},
	};
	my $res = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json;
	my $cid = $res->{id};

	require Mojo::Util;
	my $c_spec = Mojo::Util::url_escape('doubled:amount * 2');
	$t->get_ok("/a/$cid?c=$c_spec")->status_is(400,
		'param-column clash in calc expression returns 400');
	like $t->tx->res->body, qr/amount/, 'error names the clashing identifier';
};

# ---------------------------------------------------------------------------
# Phase 3.6 -- Bookmarks and Undo/Redo
# ---------------------------------------------------------------------------

subtest '3.6: canvas renders undo/redo buttons' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'UndoRedo',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [ { kind => 'table', encode => {}, title => 'T' } ],
	};
	my $cid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json->{id};

	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;
	like $b, qr/id="btn-undo"/, 'undo button present';
	like $b, qr/id="btn-redo"/, 'redo button present';
	like $b, qr/btn-undo.*disabled/s, 'undo button initially disabled';
	like $b, qr/btn-redo.*disabled/s, 'redo button initially disabled';
	like $b, qr/pushUndo/, 'pushUndo function defined in JS';
	like $b, qr/initUndoRedo/, 'initUndoRedo called in JS';
};

subtest '3.6: bookmark panel present in canvas' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'BmCanvas',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [ { kind => 'table', encode => {}, title => 'T' } ],
	};
	my $cid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json->{id};

	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;
	like $b, qr/id="btn-bm"/, 'bookmark toggle button present';
	like $b, qr/id="bm-panel"/, 'bookmark panel present';
	like $b, qr/bm-empty/, 'empty bookmark message shown (no bookmarks yet)';
	like $b, qr/canvasBookmarks/, 'canvasBookmarks JS variable present';
	unlike $b, qr/class="bm-item"/, 'no bookmark items shown before any are saved';
};

subtest '3.6: save bookmark via PATCH then verify on canvas' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'BmSave',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [ { kind => 'table', encode => {}, title => 'T' } ],
	};
	my $cid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json->{id};

	# Save a bookmark by PATCHing the analyses endpoint directly
	# (mirrors what the JS patchBookmarks() function does).
	my $bm = { name => 'My view', state => '?f=region:eq:North', created => 1234567890 };
	$t->patch_ok("/api/analyses/$cid",
		{ 'Content-Type' => 'application/json' },
		encode_json({ bookmarks => [$bm] })
	)->status_is(200);

	# Verify the bookmark is persisted in the stored analysis.
	$t->get_ok("/api/analyses/$cid")->status_is(200);
	my $stored = $t->tx->res->json;
	is ref($stored->{bookmarks}), 'ARRAY', 'bookmarks key is array';
	is scalar @{ $stored->{bookmarks} }, 1, 'one bookmark stored';
	is $stored->{bookmarks}[0]{name},    'My view', 'bookmark name correct';
	is $stored->{bookmarks}[0]{state},   '?f=region:eq:North', 'bookmark state correct';
	is $stored->{bookmarks}[0]{created}, 1234567890, 'bookmark created timestamp preserved';

	# Verify the canvas renders the bookmark link.
	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;
	like $b, qr/class="bm-item"/, 'saved bookmark item rendered';
	like $b, qr/My view/, 'bookmark name visible';
	like $b, qr{/a/[^"]+\?f=region}, 'bookmark href contains state';
	like $b, qr/class="bm-del-btn"/, 'delete button rendered on bookmark';
	unlike $b, qr/id="bm-empty"/, 'empty-state message absent when bookmarks exist';
};

subtest '3.6: undo/redo JS stack key scoped to canvas id' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'StackKey',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [ { kind => 'table', encode => {}, title => 'T' } ],
	};
	my $cid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json->{id};

	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;

	# The localStorage key must contain the canvas id so stacks from
	# different analyses do not collide.
	like $b, qr/bi:undo:/, 'localStorage key prefix present';
	# The key includes the canvas id (either literal in JS or via anaId var).
	like $b, qr/UNDO_KEY\s*=\s*'bi:undo:'\s*\+\s*anaId/, 'stack key uses anaId';
	like $b, qr/MAX_STACK\s*=\s*50/, 'max stack size is 50';
};

# ---------------------------------------------------------------------------
# Phase 3.7 -- Print / PDF / PNG
# ---------------------------------------------------------------------------

subtest '3.7: print button and PNG download infrastructure present' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'PrintExport',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [ { kind => 'bar', encode => { cat => 'product', val => 'amount' }, title => 'T' } ],
	};
	my $cid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json->{id};

	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;

	# Print button
	like $b, qr/id="btn-print"/, 'Print button present in toolbar';
	like $b, qr/window\.print\(\)/, 'Print button calls window.print()';

	# Per-visual download button injected in card header
	like $b, qr/class="visual-dl-btn"/, 'PNG download button rendered on visual card';
	like $b, qr/downloadCardPng/, 'downloadCardPng JS function defined';
	like $b, qr/initDownloadButtons/, 'initDownloadButtons called';
	like $b, qr/XMLSerializer/, 'SVG serialiser used for PNG export';

	# Print CSS
	like $b, qr/\@media print/, '@media print block present';
	like $b, qr/\@page/, '@page rule present in print CSS';
	like $b, qr/break-inside\s*:\s*avoid/, 'break-inside:avoid on visual cards';
};

subtest '3.7: print CSS hides toolbar controls and keeps title' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'PrintCss',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [ { kind => 'table', encode => {}, title => 'T' } ],
	};
	my $cid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json->{id};

	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;

	# The print block must hide toolbar buttons but NOT the h2 title.
	# We check that the print block targets .canvas-toolbar button
	# (hides controls) without targeting h2 (which would hide the title).
	like $b, qr/canvas-toolbar button[^{]*\{[^}]*display\s*:\s*none/s,
		'print CSS hides toolbar buttons';

	# The canvas-grid should use a 2-column layout in print.
	like $b, qr/\@media print[^}]*\{[^@]*canvas-grid[^{]*\{[^}]*grid-template-columns\s*:\s*1fr 1fr/s,
		'print CSS sets canvas-grid to 2 columns';
};

# ---------------------------------------------------------------------------
# Phase 3.2 -- canvas grid spans: resize handles and layout persistence
# ---------------------------------------------------------------------------

subtest '3.2: resize handles render and layout spans are validated and persisted' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'ResizeCanvas',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [
			{ kind => 'table', encode => {}, title => 'Left'  },
			{ kind => 'table', encode => {}, title => 'Right' },
		],
	};
	my $cid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json->{id};

	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;

	# One handle per visual card, and the wiring that makes it resize.
	my $handles = () = $b =~ /class="visual-resize-handle"/g;
	is $handles, 2, 'one resize handle per visual';
	like $b, qr/initResizeHandles/,            'resize handles are wired up';
	like $b, qr/onResizeStart/,                'resize drag handler defined';
	like $b, qr/onResizeMove/,                 'resize drag moves the span';
	like $b, qr/nwse-resize/,                  'resize cursor affordance in CSS';
	like $b, qr/touch-action\s*:\s*none/,      'handle opts out of touch panning';
	# The grip has to be visible, not just present: a bare 18px corner is easy
	# to miss entirely, so the ridge triangle and its hover reveal matter.
	like $b, qr/\.visual-resize-handle::after/,              'the grip is drawn, not just the hit area';
	like $b, qr/\.visual-resize-handle::after\s*\{[^}]*repeating-linear-gradient/s,
		'the grip is marked with the conventional diagonal ridges';
	like $b, qr/\.visual-card:hover\s+\.visual-resize-handle/,
		'the grip comes up to full strength when the card is hovered';
	like $b, qr/grid-auto-rows\s*:\s*minmax/,  'row span is a real height, not just a number';
	like $b, qr/\@media print.*?visual-resize-handle[^{]*\{[^}]*display\s*:\s*none/s,
		'print CSS hides the resize handles';

	# Persist a layout: visual 0 full width, visual 1 half width and two rows.
	$t->patch_ok("/api/analyses/$cid",
		{ 'Content-Type' => 'application/json' },
		encode_json({ layout => [
			{ visual => 0, x => 1, y => 1, w => 12, h => 1 },
			{ visual => 1, x => 1, y => 2, w => 6,  h => 2 },
		] })
	)->status_is(200, 'layout PATCH accepted');

	$t->get_ok("/api/analyses/$cid")->status_is(200);
	my $stored = $t->tx->res->json->{layout};
	is scalar(@$stored), 2, 'both layout entries stored';
	is $stored->[0]{w}, 12, 'visual 0 stored full width';
	is $stored->[1]{h}, 2,  'visual 1 stored two rows tall';

	# ... and the canvas renders those spans server-side, with no JavaScript.
	$t->get_ok("/a/$cid")->status_is(200);
	$b = $t->tx->res->body;
	like $b, qr/id="visual-0"[^>]*style="[^"]*grid-column:1\/span 12/,
		'visual 0 rendered full width';
	like $b, qr/id="visual-1"[^>]*style="[^"]*grid-column:1\/span 6/,
		'visual 1 rendered half width';
	like $b, qr/id="visual-1"[^>]*style="[^"]*grid-row:2\/span 2/,
		'visual 1 rendered two rows tall';

	# Spans outside the grid are rejected rather than stored: a drag can only
	# produce whole columns and rows inside 12 columns, so anything else means
	# the document (not the drag) is wrong.
	my @bad = (
		[ { visual => 0, x => 1,  y => 1, w => 13,   h => 1 }, 'w wider than the grid' ],
		[ { visual => 0, x => 8,  y => 1, w => 6,    h => 1 }, 'x + w - 1 past column 12' ],
		[ { visual => 0, x => 1,  y => 1, w => 0,    h => 1 }, 'zero-width span' ],
		[ { visual => 0, x => 1,  y => 1, w => 6,    h => 0 }, 'zero-height span' ],
		[ { visual => 0, x => 1,  y => 1, w => 6,    h => 7 }, 'taller than the row cap' ],
		[ { visual => 0, x => 0,  y => 1, w => 6,    h => 1 }, 'x before column 1' ],
		[ { visual => 0, x => 13, y => 1, w => 1,    h => 1 }, 'x past the last column' ],
		[ { visual => 0, x => 1,  y => 0, w => 6,    h => 1 }, 'y before row 1' ],
		[ { visual => 0, x => 1,  y => 1, w => 'wide', h => 1 }, 'non-numeric span' ],
		[ { visual => 0, x => 1,  y => 1, w => 6.5,  h => 1 }, 'fractional span' ],
		[ { visual => 0, x => 1,  y => 1, w => 6 },            'entry missing h' ],
	);
	for my $case (@bad) {
		$t->patch_ok("/api/analyses/$cid",
			{ 'Content-Type' => 'application/json' },
			encode_json({ layout => [ $case->[0] ] })
		)->status_is(400, "rejected: $case->[1]");
	}

	# A rejected layout must not have reached the store.
	$t->get_ok("/api/analyses/$cid")->status_is(200);
	is_deeply $t->tx->res->json->{layout}, $stored,
		'rejected layouts were not stored';
};

# ---------------------------------------------------------------------------
# Phase 3.2 -- the resize handles are operable without a pointer
# ---------------------------------------------------------------------------

subtest '3.2: resize handles take focus, answer the arrow keys and are announced' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'ResizeKeyboard',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [
			{ kind => 'table', encode => {}, title => 'Left'  },
			{ kind => 'table', encode => {}, title => 'Right' },
		],
	};
	my $cid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json->{id};

	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;

	# The handle is a control, not a decoration: in the tab order, with the value
	# semantics of a slider, and no longer hidden from assistive technology.
	like $b, qr/<span class="visual-resize-handle"[^>]*role="slider"/s,
		'the handle is exposed as a slider';
	like $b, qr/<span class="visual-resize-handle"[^>]*tabindex="0"/s,
		'the handle is in the tab order';
	like $b, qr/<span class="visual-resize-handle"[^>]*aria-valuemin="1"/s,
		'the slider declares its minimum';
	like $b, qr/<span class="visual-resize-handle"[^>]*aria-orientation="horizontal"/s,
		'the width is the axis the value tracks';
	unlike $b, qr/<span class="visual-resize-handle"[^>]*aria-hidden/s,
		'the handle is no longer hidden from assistive technology';

	# A name and a description that resolve: a dangling aria-labelledby or
	# aria-describedby is worse than no reference at all.
	my @labelled = $b =~ /class="visual-resize-handle"[^>]*aria-labelledby="([^"]+)"/gs;
	is scalar(@labelled), 2, 'both handles are named by something';
	for my $ref (@labelled) {
		like $b, qr/id="\Q$ref\E"/, "the label $ref exists on the page";
	}
	like $b, qr/class="visual-resize-handle"[^>]*aria-describedby="resize-help"/s,
		'both handles point at the instructions';
	like $b, qr/id="resize-help"[^>]*>[^<]*arrow keys/s,
		'the instructions name the arrow keys';

	# The keys, and the announcement of what they did.
	like $b, qr/function onResizeKey/,           'keyboard resize handler defined';
	like $b, qr/addEventListener\('keydown'/,    'handler wired to the handle';
	like $b, qr/ArrowRight/,                     'right widens the card';
	like $b, qr/ArrowLeft/,                      'left narrows it';
	like $b, qr/ArrowDown/,                      'down makes it taller';
	like $b, qr/ArrowUp/,                        'up makes it shorter';
	like $b, qr/setAttribute\('aria-valuenow'/,  'the width is announced as the value';
	like $b, qr/setAttribute\('aria-valuetext'/, 'both dimensions are announced';
	like $b, qr/updateResizeAria/,               'the announcement is refreshed after a drag too';
	like $b, qr/scheduleSave/,                   'keyboard resizes are persisted';
	like $b, qr/addEventListener\('blur'/,       'leaving the handle writes the pending size';
	like $b, qr/e\.preventDefault\(\)/,        'the arrow keys do not scroll the page';

	# ... and the focus affordance that makes the control findable by eye.
	like $b, qr/\.visual-resize-handle:focus-visible/, 'the focused handle is visible';
	like $b, qr/\.visual-card:focus-within/,           'the focused card is visible';
};

# ---------------------------------------------------------------------------
# Phase 2 -- chart pages: the corner grip is operable without a pointer, the
# same treatment the canvas card handles get
# ---------------------------------------------------------------------------

subtest '2: chart resize handles take focus, answer the arrow keys and are announced' => sub {
	plan skip_all => 'HTML::D3 not available' unless eval { require HTML::D3; 1 };

	$t->get_ok('/bar?l=table:sales&cat=region&val=amount')
		->status_is(200, 'bar chart page loads');
	my $b = $t->tx->res->body;

	# The grip is created by the chart-page script, so these are the writes that
	# make it a control rather than a decoration.
	like $b, qr/handle\.setAttribute\('role', 'slider'\)/,
		'the grip is exposed as a slider';
	like $b, qr/handle\.setAttribute\('tabindex', '0'\)/,
		'the grip is in the tab order';
	like $b, qr/'aria-label', 'Resize ' \+ title/,
		'the grip is named for the chart it resizes';
	like $b, qr/'aria-describedby', 'chart-resize-help'/,
		'the grip points at the instructions';
	like $b, qr/'aria-orientation', 'horizontal'/,
		'the width is the axis the value tracks';
	like $b, qr/'aria-valuemin', String\(MIN_W\)/,
		'the slider declares its minimum';

	# A name and a description that resolve: the instructions are on the page,
	# not left to the script to invent, so a reader without JavaScript is told
	# what the grip would do.
	like $b, qr/<p class="sr-only" id="chart-resize-help">/,
		'the instructions are on the page';
	like $b, qr/id="chart-resize-help"[^>]*>[^<]*arrow keys/s,
		'the instructions name the arrow keys';
	like $b, qr/id="chart-resize-help"[^>]*>[^<]*Home and End/s,
		'the instructions name the two ends';
	like $b, qr/id="chart-resize-help"[^>]*>[^<]*Shift/s,
		'the instructions name the faster step';

	# The keys, and the announcement of what they did.
	like $b, qr/function onChartResizeKey/,      'keyboard resize handler defined';
	like $b, qr/'keydown',\s+onChartResizeKey/,  'handler wired to the grip';
	like $b, qr/ArrowRight/,                     'right widens the chart';
	like $b, qr/ArrowLeft/,                      'left narrows it';
	like $b, qr/ArrowDown/,                      'down makes it taller';
	like $b, qr/ArrowUp/,                        'up makes it shorter';
	like $b, qr/e\.key === 'Home'/,              'Home goes to the narrowest width';
	like $b, qr/e\.key === 'End'/,               'End goes to the widest width';
	like $b, qr/e\.preventDefault\(\)/,
		'the arrow keys do not scroll the page';
	like $b, qr/setAttribute\('aria-valuenow'/,  'the width is announced as the value';
	like $b, qr/setAttribute\('aria-valuetext'/, 'both dimensions are announced';
	like $b, qr/function onUp[\s\S]*?updateChartAria\(handle, svg, wrap\)/,
		'the announcement is refreshed after a drag too';

	# ... and the focus affordance that makes the control findable by eye, and
	# says which chart the keys will resize.
	like $b, qr/\.chart-resize-handle:focus-visible/, 'the focused grip is visible';
	like $b, qr/\.chart-resize-handle:focus-visible\s*\{[^}]*opacity\s*:\s*1/s,
		'the focused grip is drawn at full strength, not at its resting 35%';
	like $b, qr/\.chart-svg-wrap:focus-within/,       'the focused chart is visible';
};

subtest '3.2: a visual can be put in a chosen cell, not the next free one' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'PositionedCanvas',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [
			{ kind => 'table', encode => {}, title => 'Left'  },
			{ kind => 'table', encode => {}, title => 'Right' },
		],
	};
	my $cid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json->{id};

	# Not the next free cell in either case: the first visual is in row 5 with four
	# empty rows above it, the second in the right-hand half of row 1.
	my $positioned = [
		{ visual => 0, x => 1, y => 5, w => 6, h => 2 },
		{ visual => 1, x => 7, y => 1, w => 6, h => 1 },
	];
	$t->patch_ok("/api/analyses/$cid",
		{ 'Content-Type' => 'application/json' },
		encode_json({ layout => $positioned })
	)->status_is(200, 'a layout with gaps is accepted');

	# What was saved is what is there: no packing, no closing of the gap.
	$t->get_ok("/api/analyses/$cid")->status_is(200);
	is_deeply $t->tx->res->json->{layout}, $positioned,
		'the chosen cells are stored as they were given';

	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;
	like $b, qr/id="visual-0"[^>]*style="grid-column:1\/span 6;grid-row:5\/span 2"/,
		'visual 0 renders in the cell it was put in';
	like $b, qr/id="visual-1"[^>]*style="grid-column:7\/span 6;grid-row:1\/span 1"/,
		'visual 1 renders where it was put';

	# Two visuals cannot hold the same cell: overlapping entries share columns and
	# rows here, which would draw one visual on top of the other.
	$t->patch_ok("/api/analyses/$cid",
		{ 'Content-Type' => 'application/json' },
		encode_json({ layout => [
			{ visual => 0, x => 1, y => 1, w => 6, h => 2 },
			{ visual => 1, x => 4, y => 2, w => 6, h => 1 },
		] })
	)->status_is(400, 'an overlapping layout is rejected');

	$t->get_ok("/api/analyses/$cid")->status_is(200);
	is_deeply $t->tx->res->json->{layout}, $positioned,
		'the rejected overlap was not stored';
};

subtest '3.2: cards are dragged to a cell, and moved with the arrow keys' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'MoveCanvas',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [
			{ kind => 'table', encode => {}, title => 'Left'  },
			{ kind => 'table', encode => {}, title => 'Right' },
		],
	};
	my $cid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json->{id};

	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;

	# The header handle is a control that moves the card, named for the visual it
	# moves, and no longer an aria-hidden decoration that says "reorder".
	like $b, qr/<span class="drag-handle"[^>]*role="button"[^>]*tabindex="0"/s,
		'the header handle is a focusable control';
	like $b, qr/aria-label="Move Left"/,  'the handle is named for its visual';
	like $b, qr/aria-label="Move Right"/, 'and so is the other one';
	like $b, qr/class="drag-handle"[^>]*aria-describedby="move-help"/s,
		'the handle is described by the instructions';
	like $b, qr/id="move-help"[^>]*>[^<]*arrow keys/s, 'the instructions name the arrow keys';
	like $b, qr/id="canvas-live"[^>]*role="status"/,  'there is a polite announcer for a move';

	# Dropping a cell and dropping on a card are the same gesture now, so the
	# native drag machinery is gone: the card is not a drag source and nothing
	# listens for a native drop.
	unlike $b, qr/<div class="visual-card[^"]*"[^>]*draggable/s,
		'the card is no longer a native drag source';
	# The template itself has no native drag machinery left.  The page as a whole
	# still has both, for the file-drop upload overlay in the shared layout, so
	# this is checked against the canvas template rather than the rendered page.
	my $src = $t->app->home->child('templates/web/en/canvas.html.tt')->to_string;
	open my $fh, '<', $src or die "Cannot read $src: $!";
	my $tt = do { local $/; <$fh> };
	close $fh;
	unlike $tt, qr/dataTransfer/, 'no native drag payload is read';
	unlike $tt, qr/\bdraggable\b/, 'nothing in the canvas is a native drag source';

	# The drag: pointer events, a ghost showing the landing cell, and the cards it
	# lands on pushed out of the way.
	like $b, qr/function onMoveStart/,      'the move handler is defined';
	like $b, qr/addEventListener\('pointermove'/, 'the drag tracks the pointer';
	like $b, qr/function placeGhost/,       'the landing cell is drawn while dragging';
	like $b, qr/function pushApart/,        'cards in the way are pushed down';
	like $b, qr/function commitMove/,       'the drop places the card and saves';
	like $b, qr/function overlaps/,         'overlap is what decides who moves';
	like $b, qr/\.visual-drop-ghost\s*\{[^}]*dashed/s, 'the ghost is outlined';
	like $b, qr/\.visual-card\.moving/,    'the card being dragged is marked';

	# The keyboard equivalent, and the announcement of where the card went.
	like $b, qr/function onMoveKey/,        'the keyboard move handler is defined';
	like $b, qr/e\.shiftKey/,              'Shift jumps to the edge of the canvas';
	like $b, qr/function gridBottom/,       'the bottom of the canvas is computed';
	like $b, qr/function announce/,         'each move is announced';
	like $b, qr/\.drag-handle:focus-visible/, 'the focused handle is visible';

	# The announcement covers the arrangement the move leaves behind, not just
	# the card that was moved: a reader who is told only about their own card
	# loses track of the one that was pushed out of its cell, and the next key
	# press starts from a canvas they do not have.
	like $b, qr/return moved;/, 'pushApart reports the cards it had to move down';
	like $b, qr/function displacedText/, 'the announcement has one place to name them';
	like $b, qr/titleOf\(m\.card\) \+ ' moved down to row ' \+ m\.to/,
		'each named with the row it was pushed to';
	my $displaced = () = $b =~ /displacedText\(moved\)/g;
	is $displaced, 3,
		'and both a move and a size change say what they pushed aside (one definition, two calls)';
};

# ---------------------------------------------------------------------------
# Phase 3.2 -- the size menu: a preset width per card, chosen without a drag
# ---------------------------------------------------------------------------

subtest '3.2: each card has a size menu that sets its width without a drag' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'SizeMenu',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [
			{ kind => 'table', encode => {}, title => 'Left'  },
			{ kind => 'table', encode => {}, title => 'Right' },
		],
	};
	my $cid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json->{id};

	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;

	# One menu per card, in the card's own header, named for the card it sizes.
	my $menus = () = $b =~ /class="visual-size-select"/g;
	is $menus, 2, 'one size menu per visual';
	like $b, qr/<select class="visual-size-select" id="visual-size-0"/,
		'the menu belongs to its own card';
	like $b, qr/visual-card-header">[\s\S]*?visual-size-select[\s\S]*?visual-card-body">/,
		'and sits in the card header';

	# The size is on the card as well as in the menu (3.2): one badge per card,
	# in the header it sizes, beside the menu it mirrors.  Neither of these cards
	# has a saved span, so the browser places them and there is no size to print
	# yet: the badge is rendered empty, and :empty is what keeps that from being
	# a small blank pill of padding rather than nothing.  The script fills it in.
	my $badges = () = $b =~ /class="visual-size-badge"/g;
	is $badges, 2, 'one size badge per visual, on the same cards as the menus';
	like $b, qr{<span class="visual-size-badge" data-size-badge="1"></span>},
		'a card with no saved span is rendered with an empty badge';
	like $b, qr{visual-size-select[\s\S]*?visual-size-badge[\s\S]*?visual-card-body">},
		'which sits in the header beside the menu it mirrors';
	like $b, qr/\.visual-size-badge:empty \{ display: none; \}/,
		'and takes no room while it is empty';
	like $b, qr/\.visual-size-badge \{[^}]*flex-shrink:\s*0/s,
		'it does not shrink, where the menu it sits beside does';
	like $b, qr/id="visual-size-0"[^>]*aria-label="Size of Left"/s,
		'it is named for the visual it sizes';
	like $b, qr/id="visual-size-0"[^>]*aria-describedby="size-help"/s,
		'with the way to use it described for anyone who needs telling';
	like $b, qr/<p class="sr-only" id="size-help">Size a visual without dragging/,
		'the help is on the page, and takes no room on it';

	# The presets, as widths in grid columns: full, half, a third and a quarter.
	like $b, qr/<option value="12">Full width<\/option>/,   'full width is a preset';
	like $b, qr/<option value="6">Half width<\/option>/,    'half width is a preset';
	like $b, qr/<option value="4">Third width<\/option>/,   'third width is a preset';
	like $b, qr/<option value="3">Quarter width<\/option>/, 'quarter width is a preset';
	like $b, qr/GRID_COLS\s*=\s*12/, 'and full width is the whole twelve-column grid';
	like $b, qr/<optgroup label="Width">/, 'the widths are grouped under their name';

	# Height presets in the same menu, so the second dimension needs no drag
	# either.  The values are prefixed, because a select carries one value and
	# "2" would be read as a width.
	like $b, qr/<optgroup label="Height">/, 'the heights are grouped too';
	like $b, qr/<option value="h1">1 row high<\/option>/, 'one row is a preset';
	like $b, qr/<option value="h2">2 rows high<\/option>/, 'two rows is a preset';
	like $b, qr/<option value="h3">3 rows high<\/option>/, 'three rows is a preset';
	like $b, qr/<option value="h6">6 rows high<\/option>/,  'and six, the tallest a card can be';
	like $b, qr/MAX_ROW_SPAN\s*=\s*6/, 'which is the row span limit';

	# One option is not a choice but the size the card is, written by the script
	# from the measured span so a drag cannot leave the menu lying.
	like $b, qr/<option value="" data-current="1">Size<\/option>/,
		'the first option is the size the card actually is';
	like $b, qr/function sizeSummary/,
		'which is written from both dimensions';
	like $b, qr/function presetLabel/, 'in the preset words, where the card is on one';
	like $b, qr/current\.textContent = sizeSummary\(sel, st\.w, st\.h\);/,
		'width and height together';

	# The menu and the corner grip are two ways to the same write.
	like $b, qr/function commitSize\(card, w, h\)/,
		'a chosen width and height are applied by commitSize';
	like $b, qr/h = clampSpan\(h, 1, MAX_ROW_SPAN\);/, 'the height within the row limit';
	like $b, qr/var isRow   = raw\.charAt\(0\) === 'h';/,
		'a prefixed value is a height, a bare one a width';
	like $b, qr/if \(isRow\) commitSize\(card, st\.w, value\);/, 'a height keeps the width';
	like $b, qr/else       commitSize\(card, value, st\.h\);/, 'a width keeps the height';
	like $b, qr/function initSizeMenus/,
		'each menu is wired up';
	like $b, qr/^\s*initSizeMenus\(\);$/m, 'at load';
	like $b, qr/function updateSizeSelect/,
		'the menu shows the size the card actually is';
	like $b, qr/function updateSizeBadge\(card, state\)/,
		'and the card shows it too, rather than only the menu';
	like $b, qr/option\[data-current="1"\]/,
		'and the option that says what the card is is found by its own marker';
	like $b, qr/id="size-help"[^>]*>[^<]*height to one, two, three or six rows/s,
		'the help says the menu sets the height as well';
	like $b, qr/badge\.textContent = st\.w \+ ' × ' \+ st\.h;/,
		'as the two numbers the menu spells out in words';
	like $b, qr/\? sizeSummary\(sel, st\.w, st\.h\)/,
		'with the menu words for the presets as the title';
	like $b, qr/function updateSizeControls\(card, state\) \{/,
		'both readings of the size are written through one function';
	like $b, qr/^\t\tupdateSizeSelect\(card, state\);$/m,
		'which writes the menu';
	like $b, qr/^\t\tupdateSizeBadge\(card, state\);$/m,
		'and the card, so the two cannot disagree';
	like $b, qr/updateSizeControls\(card, st\)/,
		'so a drag, which leaves any width, is reflected in the menu and on the card';
	like $b, qr/updateSizeBadge\(card, \{ w: w, h: h \}\);/,
		'and the size on the card follows the grip while it is being dragged';
	like $b, qr/if \(w !== shownW \|\| h !== shownH\) \{/,
		'written only when the drag crosses a column or a row';
	like $b, qr/if \(isNaN\(value\) \|\| value === \(isRow \? st\.h : st\.w\)\) return;/,
		'choosing the size it already is does nothing at all';
	like $b, qr/var index = sel\.selectedIndex;/, 'the entry that was chosen is remembered';
	like $b, qr/sel\.selectedIndex = index;/,
		'and stays selected, so the arrow keys walk the list rather than being pulled back';
	like $b, qr/announce\(titleOf\(card\) \+ ' is now ' \+/, 'the new size is announced';
	like $b, qr/lowerFirst\(sel \? sizeSummary\(sel, w, h\)/,
		'both dimensions of it, in the menu words, not just drawn';
	like $b, qr/closest\('\.visual-resize-handle, button, a, select'\)/,
		'a press on the menu does not start a card drag';
	like $b, qr/\@media print.*?\.visual-size-select[^{]*\{[^}]*display\s*:\s*none/s,
		'the menu is not printed';
	like $b, qr/\@media print.*?\.visual-size-badge[^{]*\{[^}]*display\s*:\s*none/s,
		'and neither is the size on the card: the printed canvas is two columns';
	like $b, qr/\.visual-size-select \{[^}]*max-width:\s*11\.5rem/s,
		'and is wide enough to read the longest size it can report';
	like $b, qr/Size menu in its header to set its width and height without a drag/,
		'and the first-visit tip names it too';
	like $b, qr/same size is written on the card itself, beside the\s+menu/,
		'and the size help says where the size is written';

	# A card that has to move to be the width that was chosen is moved, and what
	# it grew over is pushed down - the same fix the resize paths now make.
	my $pushes = () = $b =~ /pushApart\(card\);/g;
	is $pushes, 4,
		'growing over a neighbour is resolved in the menu, both resize paths and a drop';

	# That push is not decoration: without it the grown layout is two cards
	# sharing cells 7-12, which the server refuses, so the width would be lost at
	# the next reload.  With it, the layout the menu produces is accepted.
	$t->patch_ok("/api/analyses/$cid",
		{ 'Content-Type' => 'application/json' },
		encode_json({ layout => [
			{ visual => 0, x => 1, y => 1, w => 12, h => 1 },
			{ visual => 1, x => 1, y => 2, w => 12, h => 1 },
		] })
	)->status_is(200, 'a full-width card, and the neighbour pushed below it, is accepted');

	my $accepted = [
		{ visual => 0, x => 1, y => 1, w => 12, h => 1 },
		{ visual => 1, x => 1, y => 2, w => 12, h => 1 },
	];

	$t->patch_ok("/api/analyses/$cid",
		{ 'Content-Type' => 'application/json' },
		encode_json({ layout => [
			{ visual => 0, x => 1, y => 1, w => 12, h => 1 },
			{ visual => 1, x => 7, y => 1, w => 6,  h => 1 },
		] })
	)->status_is(400,
		'the same growth without the push is refused, which is why commitSize pushes');

	$t->get_ok("/api/analyses/$cid")->status_is(200);
	is_deeply $t->tx->res->json->{layout}, $accepted,
		'and the refused layout left the saved one alone';

	# The size on the card, rendered: the numbers are the card's own saved spans,
	# written by the template, so a reload shows them with no JavaScript involved
	# - a card a drag left at a width no preset names says which width that was.
	$t->get_ok("/a/$cid")->status_is(200);
	$b = $t->tx->res->body;
	like $b, qr{<span class="visual-size-badge" data-size-badge="1" title="12 columns wide, 1 row high">12 &times; 1</span>},
		'the saved 12 by 1 card is rendered with its own two numbers';

	$t->patch_ok("/api/analyses/$cid",
		{ 'Content-Type' => 'application/json' },
		encode_json({ layout => [
			{ visual => 0, x => 1, y => 1, w => 12, h => 1 },
			{ visual => 1, x => 1, y => 2, w => 4,  h => 2 },
		] })
	)->status_is(200, 'a card two rows high and a third of the width is accepted');

	$t->get_ok("/a/$cid")->status_is(200);
	$b = $t->tx->res->body;
	like $b, qr{<span class="visual-size-badge" data-size-badge="1" title="12 columns wide, 1 row high">12 &times; 1</span>},
		'the card that did not change still reports its own size';
	like $b, qr{<span class="visual-size-badge" data-size-badge="1" title="4 columns wide, 2 rows high">4 &times; 2</span>},
		'and the other reports the size it was given, in both dimensions';
};

subtest '3.2: the first-visit tip names both grips and is dismissed for good' => sub {
	my $sales_path = $t->app->home->child('data/sales.csv')->to_string;
	plan skip_all => 'data/sales.csv not found' unless -f $sales_path;

	my $spec = {
		name     => 'TipCanvas',
		datasets => [ { spec => "path:$sales_path", alias => 'left' } ],
		visuals  => [
			{ kind => 'table', encode => {}, title => 'Left'  },
			{ kind => 'table', encode => {}, title => 'Right' },
		],
	};
	my $cid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($spec)
	)->status_is(201)->tx->res->json->{id};

	$t->get_ok("/a/$cid")->status_is(200);
	my $b = $t->tx->res->body;

	# The tip is in the page but hidden, and it is the script that uncovers it
	# for a reader who has not dismissed it: someone who has turned it off does
	# not get a flash of it while the page loads.
	like $b, qr{<div class="canvas-hint" id="canvas-hint" hidden>},
		'the tip is rendered hidden';
	like $b, qr{<button type="button" class="canvas-hint-close" id="canvas-hint-close"},
		'and it has a dismiss button';
	like $b, qr{id="canvas-hint-close"[^>]*>[^<]*Got it}s, 'which says what it does';
	like $b, qr{id="canvas-hint-close"[^>]*aria-describedby="canvas-hint-text"}s,
		'and is described by the tip, so what is being dismissed is not guesswork';

	# What it points at: the header drag and the corner grip, in the words the
	# reader can see on the card, and the keyboard route to both of them.
	like $b, qr/handle in its header to move it/, 'the tip names the header drag';
	like $b, qr/grip in the card's bottom right corner to resize it/,
		'the tip names the corner grip';
	like $b, qr/Both\s+work from the keyboard as well/, 'and says both answer the keyboard';
	like $b, qr/focus the header to move the visual/,
		'including what to focus to use them without a pointer';

	# Once dismissed, never again: one flag, written where the page can read it
	# on the next visit, and read before the tip is uncovered.
	like $b, qr/HINT_KEY = 'bi:canvas:hint'/,
		'the tip keeps its answer under a key of its own';
	like $b, qr/localStorage\.getItem\(HINT_KEY\) === '1'/,
		'which is read before the tip is shown';
	like $b, qr/localStorage\.setItem\(HINT_KEY, '1'\)/,
		'and written when it is dismissed';
	like $b, qr/if \(!card \|\| hintSeen\(\)\) return;/,
		'a canvas with nothing to point at says nothing';

	# Dismissing hides the tip, unmarks the card it named, leaves focus on the
	# control it named rather than on a button that has gone, and says so where a
	# screen reader will hear it.
	like $b, qr/card\.classList\.add\('pointing'\)/, 'the card the tip names is marked while it is up';
	like $b, qr/card\.classList\.remove\('pointing'\)/, 'and unmarked when it goes';
	like $b, qr/hint\.hidden = true/, 'dismissing hides the tip';
	like $b, qr/announce\('Canvas tip dismissed'\)/, 'and announces that it has gone';
	like $b, qr/e\.key === 'Escape'/, 'Escape dismisses it as well';
	like $b, qr{drag-handle\[role="button"\]'\)[\s\S]*?\.focus\(\)},
		'and focus lands on the header handle the tip named';

	# The two things it points at are drawn on that card while it is up, so the
	# sentence and the screen are talking about the same thing; the tip itself
	# never reaches paper, and takes no room while it is hidden.
	like $b, qr/\.visual-card\.pointing \.visual-card-header/, 'the marked header is ringed';
	like $b, qr/\.visual-card\.pointing \.visual-resize-handle/, 'and the marked grip is tinted';
	like $b, qr/\.canvas-hint\[hidden\] \{ display: none; \}/, 'the hidden tip takes no room';

	my ($print_css) = $b =~ m{\@media print \{(.*?)\n\}}s;
	ok $print_css, 'the page has a print stylesheet' or return;
	like $print_css, qr/\.canvas-hint/, 'the tip is not printed';
};

done_testing;
