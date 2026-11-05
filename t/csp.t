#!/usr/bin/env perl

# Every HTML reply carries a Content-Security-Policy built from the config:
# script, style and images from this site and the hosts d3_url, the leaflet_*
# keys, tile_url and tile_sources name, connect-src 'self' so a script that
# got in cannot post data elsewhere, and frame-ancestors 'self'.  Inline script
# runs only by the request's nonce: every <script> a page writes carries it,
# and no element has an on* attribute, which no nonce can cover.  Other
# replies (JSON, downloads) carry none.  The page checks below read each page's own
# <script src> and <link href>, so a library the pages start loading from a new
# host fails here before it is blocked in a browser.
#
#   prove -l t/csp.t

use strict;
use warnings;

use Test::Most;
use Test::Mojo;
use File::Spec ();
use File::Temp qw(tempdir);
use Mojo::JSON qw(encode_json);
use Mojo::File;
use Mojo::URL;
use Mojo::Util qw(url_escape);

use Database::BI;

my $t = Test::Mojo->new('Database::BI');
$t->app->config->{model_dir} = tempdir(CLEANUP => 1);
my $config = $t->app->config;
my %saved  = %{$config};
sub restore { %{$config} = %saved; return }

my $CSP = 'Content-Security-Policy';

# The directives of a policy, as name => [sources].
sub directives {
	my ($policy) = @_;
	my %d;
	for my $part (split /\s*;\s*/, $policy // '') {
		my ($name, @sources) = split ' ', $part;
		$d{$name} = \@sources if defined $name;
	}
	return \%d;
}

# Whether a source list allows the absolute URL $url (scheme, host with a
# leading-label wildcard, port).  Enough of CSP's matching for what the
# policy writes; 'self' is the test server.
sub allows {
	my ($sources, $url) = @_;
	my $u = Mojo::URL->new($url);
	return grep { $_ eq "'self'" } @{$sources} unless $u->host;
	for my $s (@{$sources}) {
		return 1 if $s eq $u->scheme . ':';
		my ($scheme, $host, $port) = $s =~ m{\A(https?)://([^:/]+)(?::(\S+))?\z} or next;
		next unless $scheme eq $u->scheme;
		next if defined $port && $port ne '*' && $port ne ($u->port // '');
		if ($host =~ s/\A\*\.//) {
			return 1 if $u->host =~ /\.\Q$host\E\z/;
		} else {
			return 1 if lc $u->host eq $host;
		}
	}
	return 0;
}

# The policy with its nonce taken out, for comparing two replies.
sub without_nonce {
	my ($policy) = @_;
	$policy =~ s/'nonce-[^']*'/'nonce'/g;
	return $policy;
}

# The nonce a policy names, or undef.
sub nonce_of {
	my ($d) = @_;
	my @n = map { /\A'nonce-([^']+)'\z/ ? $1 : () } @{ $d->{'script-src'} // [] };
	return @n == 1 ? $n[0] : undef;
}

# A page's scripts all carry the nonce its policy names, its policy allows no
# other inline script, and nothing on it has an on* attribute.
sub scripts_by_nonce {
	my ($path, $name, $headers) = @_;
	$t->get_ok($path, $headers // {});
	my $d     = directives($t->tx->res->headers->header($CSP));
	my $nonce = nonce_of($d);
	ok(defined $nonce, "$name: script-src names one nonce");
	ok(!(grep { $_ eq "'unsafe-inline'" } @{ $d->{'script-src'} // [] }), "$name: no unsafe-inline for script");

	my $dom = $t->tx->res->dom;
	my @scripts = $dom->find('script')->each;
	my @bad = grep { ($_->attr('nonce') // '') ne ($nonce // "\0") } @scripts;
	is(scalar(@bad), 0, "$name: all " . scalar(@scripts) . ' scripts carry it')
		or diag(map { substr($_->to_string, 0, 120) . "\n" } @bad);

	my @handlers = grep { my $e = $_; grep { /\Aon/i } keys %{ $e->attr } } $dom->find('*')->each;
	is(scalar(@handlers), 0, "$name: no on* attribute")
		or diag(map { substr($_->to_string, 0, 120) . "\n" } @handlers);
	my @js = grep { ($_->attr('href') // '') =~ /\A\s*javascript:/i } $dom->find('[href]')->each;
	is(scalar(@js), 0, "$name: no javascript: link");
	return $nonce;
}

# Every external script and stylesheet the page names is allowed by its policy.
sub page_loads_allowed {
	my ($path, $name) = @_;
	$t->get_ok($path)->status_is(200);
	my $d   = directives($t->tx->res->headers->header($CSP));
	my $dom = $t->tx->res->dom;
	my @scripts = grep { defined } $dom->find('script[src]')->map(attr => 'src')->each;
	my @styles  = grep { defined } $dom->find('link[rel=stylesheet][href]')->map(attr => 'href')->each;
	ok(@scripts || @styles, "$name loads a script or stylesheet");
	ok(allows($d->{'script-src'}, $_), "$name: script-src allows $_") for @scripts;
	ok(allows($d->{'style-src'},  $_), "$name: style-src allows $_")  for @styles;
	return $d;
}

subtest 'source expressions' => sub {
	my %want = (
		'https://cdnjs.cloudflare.com/ajax/libs/d3/7.9.0/d3.min.js' => 'https://cdnjs.cloudflare.com',
		'/static/d3/d3.min.js'                                      => "'self'",
		'static/d3.min.js'                                          => "'self'",
		'//cdn.example.com:8443/d3.js'                              => 'cdn.example.com:8443',
		'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'        => 'https://*.tile.openstreetmap.org',
		'http://tiles.internal/{z}/{x}/{y}.png'                     => 'http://tiles.internal',
		'https://Tiles.Example.COM:8080/{z}/{x}/{y}.png'            => 'https://tiles.example.com:8080',
		'https://user:pw@tiles.example.com/x'                       => 'https://tiles.example.com',
		# A placeholder CSP cannot write as a host allows the scheme instead.
		'https://a.{s}.example.com/{z}.png'                         => 'https:',
		'https://tiles.example.com:{port}/x'                        => 'https://tiles.example.com:*',
	);
	is(Database::BI::_csp_source($_), $want{$_}, $_) for sort keys %want;

	for my $none ('', 'data:text/javascript,alert(1)', 'javascript:alert(1)', 'ftp://example.com/x') {
		is(Database::BI::_csp_source($none), undef, "'$none' allows nothing");
	}
	is(Database::BI::_csp_source(undef), undef, 'undef allows nothing');
	is(Database::BI::_csp_source([]), undef, 'a reference allows nothing');
};

subtest 'an HTML page carries the policy' => sub {
	restore();
	$t->get_ok('/')->status_is(200)->header_exists($CSP);
	my $d = directives($t->tx->res->headers->header($CSP));

	is_deeply($d->{'default-src'},     ["'self'"], 'default-src');
	is_deeply($d->{'connect-src'},     ["'self'"], 'connect-src keeps script talking only to this site');
	is_deeply($d->{'object-src'},      ["'none'"], 'object-src');
	is_deeply($d->{'base-uri'},        ["'self'"], 'base-uri');
	is_deeply($d->{'form-action'},     ["'self'"], 'form-action');
	is_deeply($d->{'frame-ancestors'}, ["'self'"], 'frame-ancestors');
	ok(!(grep { $_ eq "'unsafe-eval'" } @{ $d->{'script-src'} }), 'no unsafe-eval');
	ok(!(grep { $_ eq '*' || $_ eq 'https:' } map { @{$_} } values %{$d}),
		'the defaults allow no whole scheme or *');
	ok(allows($d->{'script-src'}, 'https://cdnjs.cloudflare.com/ajax/libs/d3/7.9.0/d3.min.js'),
		'the default D3 is allowed');
	ok(allows($d->{'img-src'}, 'https://b.tile.openstreetmap.org/3/4/2.png'),
		'the default tiles are allowed');
	ok(allows($d->{'img-src'}, 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png'),
		"Leaflet's marker images are allowed");
	ok((grep { $_ eq 'data:' } @{ $d->{'img-src'} }), 'data: images (map pins, chart exports)');
};

subtest 'the page loads only what its policy allows' => sub {
	restore();
	my $sales = '?l=' . url_escape('table:sales');
	page_loads_allowed("/bar$sales&cat=region&val=amount", 'bar chart');
	page_loads_allowed("/graph$sales&x=sale_date&y=amount", 'line chart');

	SKIP: {
		skip 'HTML::OSM 0.14 is not installed', 1
			unless eval { require HTML::OSM; HTML::OSM->VERSION(0.14); 1 };
		my $dir = tempdir(CLEANUP => 1);
		my $csv = File::Spec->catfile($dir, 'points.csv');
		open my $fh, '>', $csv or BAIL_OUT("cannot write $csv: $!");
		print {$fh} "id,name,lat,lon\n1,A,51.5,-0.12\n2,B,48.85,2.35\n";
		close $fh or BAIL_OUT("cannot close $csv: $!");
		page_loads_allowed('/map?l=' . url_escape("path:$csv") . '&lat=lat&lon=lon', 'map');
	}
};

subtest 'inline script runs only by the nonce' => sub {
	restore();
	my $sales = '?l=' . url_escape('table:sales');
	my %pages = (
		'/'            => 'home',
		'/tutorial'    => 'tutorial',
		'/preferences' => 'preferences',
		'/canvases'    => 'canvases',
		'/catalog'     => 'catalog',
		'/browse'      => 'browse',
		'/view/sales'  => 'table',
		"/bar$sales&cat=region&val=amount"                  => 'bar chart',
		"/pie$sales&cat=region&val=amount"                  => 'pie chart',
		"/graph$sales&x=sale_date&y=amount"                 => 'line chart',
		"/graph$sales&x=sale_date&y=amount&series=region"   => 'line chart by series',
		"/treemap$sales&cat=region&val=amount"              => 'treemap',
		"/stacked$sales&cat=region&series=product&val=amount" => 'stacked bar',
		"/combo$sales&cat=region&bar=amount&line=amount"    => 'combo',
		"/scatter$sales&x=id&y=amount"                      => 'scatter',
		"/histogram$sales&col=amount"                       => 'histogram',
		"/heatmap$sales&x=region&y=product&val=amount"      => 'heatmap',
		"/wordcloud$sales&col=product"                      => 'word cloud',
		"/pivot$sales&rows=region&cols=product&m=amount:sum:total" => 'pivot',
		"/stats$sales"                                      => 'stats',
		"/insights$sales"                                   => 'insights',
	);
	scripts_by_nonce($_, $pages{$_}) for sort keys %pages;
	scripts_by_nonce('/no/such/page', '404 page', { Accept => 'text/html' });
	scripts_by_nonce("/bar$sales&cat=nosuch&val=amount", '400 page', { Accept => 'text/html' });

	SKIP: {
		skip 'HTML::OSM 0.14 is not installed', 1
			unless eval { require HTML::OSM; HTML::OSM->VERSION(0.14); 1 };
		my $dir = tempdir(CLEANUP => 1);
		my $csv = File::Spec->catfile($dir, 'points.csv');
		open my $fh, '>', $csv or BAIL_OUT("cannot write $csv: $!");
		print {$fh} "id,name,lat,lon\n1,A,51.5,-0.12\n2,B,48.85,2.35\n";
		close $fh or BAIL_OUT("cannot close $csv: $!");
		scripts_by_nonce('/map?l=' . url_escape("path:$csv") . '&lat=lat&lon=lon&heat=1', 'map');
	}

	my $a = scripts_by_nonce('/', 'first request');
	my $b = scripts_by_nonce('/', 'second request');
	isnt($a, $b, 'each request has a nonce of its own');
	like($a, qr/\A[A-Za-z0-9_-]{22}\z/, 'of 22 base64url characters');
};

subtest 'a canvas, and a card added to it' => sub {
	restore();
	my $id = $t->post_ok('/api/analyses' => json => {
		name     => 'CSP',
		datasets => [ { spec => 'table:sales', alias => 'left' } ],
		visuals  => [
			{ kind => 'bar', title => 'Bar', encode => { cat => 'region', val => 'amount' } },
			{ kind => 'pie', title => 'Pie', encode => { cat => 'product', val => 'amount' } },
		],
	})->status_is(201)->tx->res->json('/id');

	scripts_by_nonce("/a/$id", 'canvas');
	my $token = $t->post_ok("/api/analyses/$id/share")->status_is(200)->tx->res->json('/token');
	scripts_by_nonce("/share/$id?token=" . url_escape($token), 'shared canvas');
	scripts_by_nonce("/embed/$id?token=" . url_escape($token), 'embedded canvas');

	# A card added without a reload comes as JSON.  Its scripts carry the nonce
	# the reply names, which is how the page knows which ones to run.
	my $json = $t->post_ok("/api/analyses/$id/visuals" => json =>
		{ kind => 'line', title => 'Line', encode => { x => 'sale_date', y => 'amount' } })
		->status_is(201)->tx->res->json;
	like($json->{nonce} // '', qr/\A[A-Za-z0-9_-]+\z/, 'the reply names a nonce');
	my @tags = ($json->{html} // '') =~ /(<script\b[^>]*>)/g;
	ok(scalar(@tags), 'the card has scripts');
	is(scalar(grep { /\bnonce="\Q$json->{nonce}\E"/ } @tags), scalar(@tags), 'each carries that nonce');

	my $patched = $t->patch_ok("/api/analyses/$id/visuals/0" => json => { encode => { cat => 'product', val => 'amount' } })
		->status_is(200)->tx->res->json;
	@tags = ($patched->{html} // '') =~ /(<script\b[^>]*>)/g;
	is(scalar(grep { /\bnonce="\Q$patched->{nonce}\E"/ } @tags), scalar(@tags),
		'a card changed in place carries the reply\'s nonce too');

	# The page itself: it re-creates only scripts with the reply's nonce.
	$t->get_ok("/a/$id");
	my $page = $t->tx->res->body;
	like($page, qr/own !== nonce/, 'the canvas page checks a card script\'s nonce before running it');
	unlike($page, qr/function runCardScripts\(card\)/, 'and runs none without one');
};

# The pages above are a sample; the templates are all of them.  A <script> in
# a template without the nonce would not run, and an on* attribute -- in the
# markup, or in markup a script builds -- is inline script no nonce can cover.
subtest 'every template script carries the nonce, and none uses on*' => sub {
	my $root = File::Spec->catdir($t->app->home->to_string, 'templates');
	my @files = Mojo::File->new($root)->list_tree->grep(qr/\.tt\z/)->each;
	ok(scalar(@files), 'templates found');
	for my $file (@files) {
		my $name = $file->to_rel($root);
		my $text = $file->slurp;
		# Comments name <script> in prose.
		(my $code = $text) =~ s{/\*.*?\*/}{}gs;
		$code =~ s{^\s*//.*$}{}mg;
		$code =~ s{\[%#.*?%\]}{}gs;
		my @bare = grep { !/\bnonce="\[% csp_nonce \| html %\]"/ } $code =~ /(<script\b[^>]*>)/g;
		is(scalar(@bare), 0, "$name: every <script> has the nonce") or diag(join "\n", @bare);
		my @on = $code =~ /(<[a-z][^<>]*\son[a-z]+\s*=)/gi;
		is(scalar(@on), 0, "$name: no on* attribute") or diag(join "\n", @on);
	}
};

subtest 'a page from the page cache keeps the nonce it was drawn with' => sub {
	my $cache = tempdir(CLEANUP => 1);
	my $tc = Test::Mojo->new('Database::BI', { page_cache_dir => $cache, model_dir => tempdir(CLEANUP => 1) });
	$tc->get_ok('/tutorial')->status_is(200);
	my $first = nonce_of(directives($tc->tx->res->headers->header($CSP)));
	$tc->get_ok('/tutorial')->status_is(200)->header_is('X-Cache' => 'HIT', 'the second is from the cache');
	my $second = nonce_of(directives($tc->tx->res->headers->header($CSP)));
	is($second, $first, 'the header is the one stored with the page');
	my @tags = $tc->tx->res->dom->find('script')->map(attr => 'nonce')->each;
	is(scalar(grep { ($_ // '') eq ($second // "\0") } @tags), scalar(@tags),
		'and every script on it carries that nonce');
};

subtest 'self-hosted libraries and named tile sources' => sub {
	restore();
	$config->{d3_url}         = '/static/d3/d3.min.js';
	$config->{leaflet_js_url} = 'https://assets.example.com/leaflet.js';
	$config->{tile_url}       = 'http://tiles.internal/{z}/{x}/{y}.png';
	$config->{tile_sources}   = { topo => { url => 'https://{s}.topo.example.org/{z}/{x}/{y}.png' } };
	$t->get_ok('/')->status_is(200);
	my $d = directives($t->tx->res->headers->header($CSP));

	ok(!allows($d->{'script-src'}, 'https://cdnjs.cloudflare.com/x.js'), 'the CDN is gone with d3_url local');
	ok(allows($d->{'script-src'}, 'https://assets.example.com/leaflet.js'), 'leaflet_js_url host');
	ok(allows($d->{'img-src'}, 'http://tiles.internal/1/2/3.png'), 'tile_url host');
	ok(allows($d->{'img-src'}, 'https://c.topo.example.org/1/2/3.png'), 'a tile_sources host');
	ok(!allows($d->{'img-src'}, 'https://a.tile.openstreetmap.org/1/2/3.png'),
		'OSM tiles are gone with tile_url set');

	$config->{tile_sources} = { b => { url => 'https://b.example.org/x' }, a => { url => 'https://a.example.org/x' } };
	my @seen = map { $t->get_ok('/'); without_nonce($t->tx->res->headers->header($CSP)) } 1 .. 3;
	is(scalar(keys %{{ map { $_ => 1 } @seen }}), 1, 'the policy is the same on every reply but for its nonce');

	$config->{tile_sources} = { broken => 'not a hash', none => {} };
	$t->get_ok('/')->status_is(200)->header_exists($CSP, 'a malformed tile_sources still gives a policy');
};

subtest 'content_security_policy overrides or turns it off' => sub {
	restore();
	$config->{content_security_policy} = "default-src 'none'";
	$t->get_ok('/')->status_is(200)->header_is($CSP => "default-src 'none'");

	$config->{content_security_policy} = "script-src 'nonce-{nonce}'";
	$t->get_ok('/')->status_is(200)->header_like($CSP => qr/\Ascript-src 'nonce-[A-Za-z0-9_-]{22}'\z/,
		'{nonce} in a policy of its own becomes the nonce');
	my ($in_header) = $t->tx->res->headers->header($CSP) =~ /'nonce-([^']+)'/;
	is($t->tx->res->dom->at('script')->attr('nonce'), $in_header, 'the one the scripts carry');

	for my $off ('', 0) {
		$config->{content_security_policy} = $off;
		$t->get_ok('/')->status_is(200)->header_exists_not($CSP, "'$off' turns it off");
	}

	restore();
	$config->{content_security_policy_report_only} = 1;
	$t->get_ok('/')->status_is(200)
		->header_exists_not($CSP)
		->header_like("$CSP-Report-Only" => qr/connect-src 'self'/, 'report-only sends the other header');
};

subtest 'error pages carry it, other replies do not' => sub {
	restore();
	$t->get_ok('/no/such/page', { Accept => 'text/html' })->status_is(404)->header_exists($CSP, '404 page');
	$t->get_ok('/bar?l=' . url_escape('table:sales') . '&cat=nosuch&val=amount', { Accept => 'text/html' })
		->status_is(400)->header_exists($CSP, '400 page');

	$t->get_ok('/export?l=' . url_escape('table:sales') . '&format=csv')->status_is(200)
		->header_exists_not($CSP, 'a CSV download');
	$t->get_ok('/calc/list?l=' . url_escape('table:sales'))->status_is(200)
		->content_type_like(qr{json})
		->header_exists_not($CSP, 'a JSON reply');
};

# No other site may frame a page, however the policy is configured: a
# report-only policy only reports frame-ancestors, a policy of one's own may
# leave it out, and '' sends none.  X-Frame-Options covers each of those, and
# the browsers that read nothing else.
subtest 'no page can be framed by another site' => sub {
	my $sales = url_escape('table:sales');
	my %cases = (
		'default'          => {},
		'report-only'      => { content_security_policy_report_only => 1 },
		'no policy'        => { content_security_policy => '' },
		'a policy without frame-ancestors' => { content_security_policy => "default-src 'self'" },
	);
	for my $case (sort keys %cases) {
		restore();
		%{$config} = (%{$config}, %{ $cases{$case} });
		for my $page ('/', "/bar?l=$sales&cat=region&val=amount", '/no/such/page', "/bar?l=$sales&cat=nosuch&val=amount") {
			$t->get_ok($page, { Accept => 'text/html' })
				->header_is('X-Frame-Options' => 'SAMEORIGIN', "$case: $page sends X-Frame-Options");
		}
	}
	restore();
	$t->get_ok('/')->header_like($CSP => qr/frame-ancestors 'self'/, 'and the default policy says the same');
};

# embed_frame_ancestors lets the sites it names frame /embed/, and only /embed/.
# However the policy is configured, an enforced frame-ancestors names them, so
# turning it on never lets every site in.
subtest 'embed_frame_ancestors' => sub {
	restore();
	my $id = $t->post_ok('/api/analyses' => json => {
		name     => 'Embedded',
		datasets => [ { spec => 'table:sales', alias => 'left' } ],
		visuals  => [ { kind => 'bar', title => 'Bar', encode => { cat => 'region', val => 'amount' } } ],
	})->status_is(201)->tx->res->json('/id');
	my $token = $t->post_ok("/api/analyses/$id/share")->status_is(200)->tx->res->json('/token');
	my $embed = "/embed/$id?token=" . url_escape($token);
	my $ALLOWED = "frame-ancestors 'self' https://intranet.example.com https://*.corp.example";

	# The frame-ancestors of each enforced policy the reply carries.
	my $enforced = sub {
		my @p = @{ $t->tx->res->headers->every_header($CSP) };
		return [ map { /(frame-ancestors[^;]*)/ ? $1 : '(none)' } @p ];
	};

	$t->get_ok($embed)->status_is(200)->header_is('X-Frame-Options' => 'SAMEORIGIN');
	is_deeply($enforced->(), ["frame-ancestors 'self'"], 'without the key, /embed/ is this site only');

	$config->{embed_frame_ancestors} = [ 'https://Intranet.Example.com/', 'https://*.corp.example', 'https://intranet.example.com' ];
	$t->get_ok($embed)->status_is(200)
		->header_is('X-Frame-Options' => 'SAMEORIGIN', 'X-Frame-Options stays, for browsers that know only it');
	is_deeply($enforced->(), [ $ALLOWED ], 'with it, /embed/ names those sites, once each, in lower case');
	for my $page ('/', "/a/$id", "/share/$id?token=" . url_escape($token)) {
		$t->get_ok($page)->status_is(200);
		is_deeply($enforced->(), ["frame-ancestors 'self'"], "$page is still this site only");
	}
	$t->get_ok("/a/$id")->content_like(qr{another page of this site, or of https://intranet\.example\.com, https://\*\.corp\.example\.},
		'the Share panel says where the embed code works');

	$config->{content_security_policy_report_only} = 1;
	$t->get_ok($embed)->status_is(200)
		->header_like("$CSP-Report-Only" => qr/\Q$ALLOWED\E/, 'report-only: the full policy is reported');
	is_deeply($enforced->(), [ $ALLOWED ], 'and frame-ancestors is enforced on its own');
	delete $config->{content_security_policy_report_only};

	$config->{content_security_policy} = '';
	$t->get_ok($embed)->status_is(200);
	is_deeply($enforced->(), [ $ALLOWED ], 'no policy: frame-ancestors is still sent');

	$config->{content_security_policy} = "default-src 'self'";
	$t->get_ok($embed)->status_is(200);
	is_deeply($enforced->(), [ '(none)', $ALLOWED ], 'a policy without it: it is sent beside that one');

	$config->{content_security_policy} = "default-src 'self'; frame-ancestors 'none'";
	$t->get_ok($embed)->status_is(200);
	is_deeply($enforced->(), [ "frame-ancestors 'none'" ], 'a policy that names its own is left to say so');
	delete $config->{content_security_policy};

	# Changed after startup, a bad entry is left out rather than written.
	$config->{embed_frame_ancestors} = [ '*', 'https:', "'none'", 'https://ok.example/path', 'https://ok.example', "https://x.example; script-src *" ];
	$t->get_ok($embed)->status_is(200);
	is_deeply($enforced->(), [ "frame-ancestors 'self' https://ok.example" ], 'only an origin gets in');
	$config->{embed_frame_ancestors} = 'https://one.example';
	$t->get_ok($embed)->status_is(200);
	is_deeply($enforced->(), [ "frame-ancestors 'self' https://one.example" ], 'one origin may be a string');
	restore();

	# At startup a bad entry stops the application.
	for my $bad ([ 'https://x.example/path' ], [ '*' ], [ 'https:' ], [ "'self'" ], 'ftp://x.example', { a => 1 }, [ undef ]) {
		throws_ok { Test::Mojo->new('Database::BI', { embed_frame_ancestors => $bad }) }
			qr/embed_frame_ancestors/, 'startup refuses ' . (ref $bad ? encode_json($bad) : $bad);
	}
	lives_ok { Test::Mojo->new('Database::BI', { embed_frame_ancestors => [ 'http://localhost:8080' ] }) }
		'and starts with an origin';
};

# Specs, filter values and share tokens travel in query strings, so a reply
# says how much of its URL a request it starts may send on: all of it to this
# site, the origin alone to another (OpenStreetMap's tiles ask for one), and
# nothing from https to http.  It is on every reply, not only pages.
subtest 'Referrer-Policy' => sub {
	restore();
	my $sales = url_escape('table:sales');
	my $id = $t->post_ok('/api/analyses' => json => {
		name     => 'Referrer',
		datasets => [ { spec => 'table:sales', alias => 'left' } ],
		visuals  => [ { kind => 'bar', title => 'Bar', encode => { cat => 'region', val => 'amount' } } ],
	})->status_is(201)
	  ->header_is('Referrer-Policy' => 'strict-origin-when-cross-origin', 'a JSON reply')
	  ->tx->res->json('/id');
	my $token = $t->post_ok("/api/analyses/$id/share")->status_is(200)->tx->res->json('/token');

	my %replies = (
		'/'                                       => 'home',
		"/bar?l=$sales&cat=region&val=amount"     => 'chart',
		"/share/$id?token=" . url_escape($token)  => 'shared canvas, whose URL holds a token',
		"/embed/$id?token=" . url_escape($token)  => 'embedded canvas',
		'/no/such/page'                           => '404 page',
		"/bar?l=$sales&cat=nosuch&val=amount"     => '400 page',
		"/export?l=$sales&format=csv"             => 'CSV download',
		"/calc/list?l=$sales"                     => 'JSON',
		'/favicon.ico'                            => 'static file',
	);
	for my $url (sort keys %replies) {
		$t->get_ok($url, { Accept => 'text/html' })
			->header_is('Referrer-Policy' => 'strict-origin-when-cross-origin', $replies{$url});
	}

	# Whatever the policy keys say: it is not part of the policy.
	$config->{content_security_policy} = '';
	$t->get_ok('/')->header_is('Referrer-Policy' => 'strict-origin-when-cross-origin', 'with no policy too');
	restore();
};

# Every reply is what its Content-Type says.  The pages a browser loads are
# checked too: under nosniff a script or stylesheet whose type is wrong does
# not load, so each one this site serves must be named as what it is.
subtest 'X-Content-Type-Options' => sub {
	restore();
	my $sales = url_escape('table:sales');
	my %replies = (
		'/'                                   => 'home',
		"/bar?l=$sales&cat=region&val=amount" => 'chart',
		'/no/such/page'                       => '404 page',
		"/bar?l=$sales&cat=nosuch&val=amount" => '400 page',
		"/export?l=$sales&format=csv"         => 'CSV download',
		"/export?l=$sales&format=json"        => 'JSON download',
		"/export?l=$sales&format=sqlite"      => 'SQLite download',
		"/calc/list?l=$sales"                 => 'JSON',
		'/favicon.ico'                        => 'static file',
	);
	for my $url (sort keys %replies) {
		$t->get_ok($url, { Accept => 'text/html' })
			->header_is('X-Content-Type-Options' => 'nosniff', $replies{$url})
			->header_like('Content-Type' => qr{\A[a-z]+/[a-z0-9.+-]+}, "$replies{$url} names its type");
	}
	$config->{content_security_policy} = '';
	$t->get_ok('/')->header_is('X-Content-Type-Options' => 'nosniff', 'with no policy too');
	restore();

	# A self-hosted library is served with the type a browser will run.
	# A directory of its own, put in front of the app's static paths, so the
	# test writes nothing into the distribution.
	my $public = tempdir(CLEANUP => 1);
	my $dir = Mojo::File->new($public, 'csp-test');
	$dir->make_path;
	$dir->child('lib.js')->spew('window.x = 1;');
	$dir->child('lib.css')->spew('p { color: red }');
	unshift @{ $t->app->static->paths }, $public;
	$t->get_ok('/csp-test/lib.js')->status_is(200)->content_type_like(qr{\A(?:application|text)/javascript\b})
		->header_is('X-Content-Type-Options' => 'nosniff');
	$t->get_ok('/csp-test/lib.css')->status_is(200)->content_type_like(qr{\Atext/css\b});
	shift @{ $t->app->static->paths };
};

restore();
done_testing();
