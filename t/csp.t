#!/usr/bin/env perl

# Every HTML reply carries a Content-Security-Policy built from the config:
# script, style and images from this site and the hosts d3_url, the leaflet_*
# keys, tile_url and tile_sources name, connect-src 'self' so a script that
# got in cannot post data elsewhere, and frame-ancestors 'self'.  Other replies
# (JSON, downloads) carry none.  The page checks below read each page's own
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
		skip 'HTML::OSM 0.13 is not installed', 1
			unless eval { require HTML::OSM; HTML::OSM->VERSION(0.13); 1 };
		my $dir = tempdir(CLEANUP => 1);
		my $csv = File::Spec->catfile($dir, 'points.csv');
		open my $fh, '>', $csv or BAIL_OUT("cannot write $csv: $!");
		print {$fh} "id,name,lat,lon\n1,A,51.5,-0.12\n2,B,48.85,2.35\n";
		close $fh or BAIL_OUT("cannot close $csv: $!");
		page_loads_allowed('/map?l=' . url_escape("path:$csv") . '&lat=lat&lon=lon', 'map');
	}
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
	my @seen = map { $t->get_ok('/'); $t->tx->res->headers->header($CSP) } 1 .. 3;
	is(scalar(keys %{{ map { $_ => 1 } @seen }}), 1, 'the policy is the same on every reply');

	$config->{tile_sources} = { broken => 'not a hash', none => {} };
	$t->get_ok('/')->status_is(200)->header_exists($CSP, 'a malformed tile_sources still gives a policy');
};

subtest 'content_security_policy overrides or turns it off' => sub {
	restore();
	$config->{content_security_policy} = "default-src 'none'";
	$t->get_ok('/')->status_is(200)->header_is($CSP => "default-src 'none'");

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

restore();
done_testing();
