#!/usr/bin/env perl

# County outlines on a map (bounds=county): Database::BI::Model::Boundary finds
# the county around each marker through Nominatim's reverse lookup, and the map
# draws them as one GeoJSON layer the reader can hide.
#
# Nominatim is BI::Test::Boundary's stand-in throughout, made the user agent
# Geocode::nominatim_ua() hands out, so nothing here reaches the network, and
# every request is counted: the point of the module is to ask as little as it
# can.  The map's renderer is a recording stand-in for HTML::OSM, so what the
# map is given is checked on any machine; the last subtests draw with the real
# HTML::OSM when it is installed.
#
#   prove -l t/boundary.t

use strict;
use warnings;

use lib 't/lib';

use File::Spec ();
use File::Temp qw(tempdir);
use Mojo::JSON qw(decode_json);
use Mojo::Util qw(url_escape html_unescape);
use Test::Most;
use Test::Mojo;

use BI::Test::Boundary;
use Database::BI::Model::Boundary;

# Two counties side by side, one with a hole (an independent city inside it,
# as the City of Fairfax is inside Fairfax County), and a state where there
# is no county: Nominatim answers such a point at another rank.
my @AREAS = (
	{ name => 'West County', id => 101, box => [ 10, 20, 11, 21 ] },
	{ name => 'East <b>County</b> & Co', id => 102, box => [ 10, 21, 11, 22 ], hole => [ 10.4, 21.4, 10.6, 21.6 ] },
	{ name => 'The City', id => 103, box => [ 10.4, 21.4, 10.6, 21.6 ] },
	{ name => 'A State', id => 104, box => [ 30, 30, 31, 31 ], rank => 8 },
);

sub boundary {
	my (%args) = @_;
	return Database::BI::Model::Boundary->new(
		online => 1,
		cache  => CHI->new(driver => 'Memory', global => 0),
		%args,
	);
}

require CHI;

subtest 'point_key rounds a point to three places' => sub {
	my $class = 'Database::BI::Model::Boundary';
	is($class->point_key(39.09012, -77.64049), '39.090,-77.640', 'rounded');
	is($class->point_key(-0.0001, 0.0002), '0.000,0.000', 'no minus zero');
	is($class->point_key(91, 0), undef, 'latitude out of range');
	is($class->point_key(0, -181), undef, 'longitude out of range');
	is($class->point_key('x', 1), undef, 'not a number');
	is_deeply([ $class->levels ], [ 'county' ], 'county is the only level');
	throws_ok { $class->new(level => 'state') } qr/Unknown boundary level 'state'/, 'another level is refused';
};

subtest 'points in one county cost one request' => sub {
	my $ua = BI::Test::Boundary->new(areas => \@AREAS);
	my $b  = boundary(ua => $ua);
	my $r  = $b->outlines([ [ 10.1, 20.1 ], [ 10.2, 20.2 ], [ 10.9, 20.9 ], [ 10.1, 21.1 ] ]);

	is(scalar($ua->asked), 2, 'one request for each county, not each point');
	is_deeply([ map { $_->{properties}{name} } @{ $r->{features} } ],
		[ 'West County', 'East <b>County</b> & Co' ], 'both outlines, in the order of their first point');
	is($r->{features}[0]{properties}{osm}, 'R101', 'named by OSM relation');
	is($r->{features}[0]{geometry}{type}, 'Polygon', 'with the shape');
	is_deeply($r->{counts}, { points => 4, drawn => 2, attempted => 2, nowhere => 0 }, 'counted');
	is_deeply($r->{pending}, [], 'nothing left');

	like(($ua->asked)[0], qr{^https://nominatim\.openstreetmap\.org/reverse\?}, 'over https');
	like(($ua->asked)[0], qr/[?&]lat=10\.100&lon=20\.100&/, 'the point, rounded');
	like(($ua->asked)[0], qr/[?&]zoom=8&/, 'at county zoom');
	like(($ua->asked)[0], qr/[?&]polygon_geojson=1&polygon_threshold=0\.005/, 'a simplified outline');

	$ua->clear;
	my $again = $b->outlines([ [ 10.1, 20.1 ], [ 10.5, 20.5 ], [ 10.2, 21.2 ] ]);
	is(scalar($ua->asked), 0, 'a second map asks nothing');
	is($again->{counts}{drawn}, 2, 'and draws both');
};

subtest 'a point in a hole is not in the county around it' => sub {
	my $ua = BI::Test::Boundary->new(areas => \@AREAS);
	my $b  = boundary(ua => $ua);
	$b->outlines([ [ 10.1, 21.1 ] ]);
	$ua->clear;

	my $r = $b->outlines([ [ 10.5, 21.5 ] ]);
	is(scalar($ua->asked), 1, 'asked, not matched to the county around the hole');
	is($r->{features}[0]{properties}{name}, 'The City', 'the city in the hole');
};

subtest 'the sea, and an area at another rank, are nowhere' => sub {
	my $ua = BI::Test::Boundary->new(areas => \@AREAS);
	my $b  = boundary(ua => $ua);
	my $r  = $b->outlines([ [ 50, 50 ], [ 30.5, 30.5 ] ]);
	is($r->{counts}{nowhere}, 2, 'both');
	is_deeply($r->{features}, [], 'no state outline drawn for a county');
	$ua->clear;
	$b->outlines([ [ 50, 50 ], [ 30.5, 30.5 ] ]);
	is(scalar($ua->asked), 0, 'and remembered as such');
};

subtest 'lookup => 0 asks nothing and lists the points' => sub {
	my $ua = BI::Test::Boundary->new(areas => \@AREAS);
	my $b  = boundary(ua => $ua);
	my $r  = $b->outlines([ [ 10.1, 20.1 ], [ 10.1, 20.1 ], [ 10.1, 21.1 ] ], lookup => 0);
	is(scalar($ua->asked), 0, 'nothing asked');
	is_deeply($r->{pending}, [ '10.100,20.100', '10.100,21.100' ], 'each point once');

	is_deeply($b->lookup_point('10.100,20.100'), { status => 'found', name => 'West County', asked => 1 },
		'one looked up on its own');
	is_deeply($b->lookup_point('50.000,50.000'), { status => 'nowhere', name => undef, asked => 1 }, 'the sea');
	is_deeply($b->lookup_point('10.500,20.500'), { status => 'found', name => 'West County', asked => 0 },
		'a point inside a known outline is not asked');
	throws_ok { $b->lookup_point('10.1,20.1') } qr/needs a point key/, 'a key not rounded as point_key rounds';
	throws_ok { $b->lookup_point('-0.000,1.000') } qr/needs a point key/, 'nor minus zero';
};

subtest 'at most online_max requests a call' => sub {
	my $ua = BI::Test::Boundary->new(areas => \@AREAS);
	my $b  = boundary(ua => $ua, online_max => 1);
	my $r  = $b->outlines([ [ 10.1, 20.1 ], [ 10.1, 21.1 ], [ 10.2, 20.2 ] ]);
	is(scalar($ua->asked), 1, 'one request');
	is_deeply($r->{pending}, [ '10.100,21.100' ], 'the other county is left');
	is($r->{counts}{drawn}, 1, 'the point in the first county is still matched');
};

subtest 'a failure is not remembered' => sub {
	my $ua = BI::Test::Boundary->new(areas => \@AREAS, fail => 1);
	my $b  = boundary(ua => $ua);
	my $r  = $b->outlines([ [ 10.1, 20.1 ], [ 10.1, 21.1 ] ]);
	is(scalar($ua->asked), 1, 'the first failure stops the lookups');
	ok($r->{failed}, 'reported');
	is_deeply($r->{pending}, [ '10.100,20.100', '10.100,21.100' ], 'both left');
	is($b->lookup_point('10.100,20.100')->{status}, 'held', 'held, not nowhere');

	$ua->{fail} = 0;
	is($b->outlines([ [ 10.1, 20.1 ] ])->{counts}{drawn}, 1, 'asked again once it answers');
};

subtest 'offline asks nothing' => sub {
	my $ua = BI::Test::Boundary->new(areas => \@AREAS);
	my $r  = boundary(ua => $ua, online => 0)->outlines([ [ 10.1, 20.1 ] ]);
	is(scalar($ua->asked), 0, 'nothing asked');
	ok($r->{offline}, 'reported');
	is($r->{counts}{drawn}, 0, 'nothing drawn');
	is(boundary(ua => $ua, online => 0)->lookup_point('10.100,20.100')->{status}, 'held', 'held');
};

subtest 'the file cache outlives the object' => sub {
	my $dir = tempdir(CLEANUP => 1);
	my $ua  = BI::Test::Boundary->new(areas => \@AREAS);
	Database::BI::Model::Boundary->new(online => 1, ua => $ua,
		cache => Database::BI::Model::Boundary->file_cache($dir))->outlines([ [ 10.1, 20.1 ] ]);
	ok(-d File::Spec->catdir($dir, 'boundary-cache'), 'kept under model_dir');
	$ua->clear;
	my $r = Database::BI::Model::Boundary->new(online => 1, ua => $ua,
		cache => Database::BI::Model::Boundary->file_cache($dir))->outlines([ [ 10.7, 20.7 ] ]);
	is(scalar($ua->asked), 0, 'a new object asks nothing');
	is($r->{counts}{drawn}, 1, 'and draws it');
	throws_ok { Database::BI::Model::Boundary->file_cache(File::Spec->catdir($dir, 'nope')) }
		qr/needs a directory/, 'a folder that is not there';
};

# ===========================================================================
# The map page
# ===========================================================================

# HTML::OSM stood in for: what the map is given is recorded.
{
	package Fake::OSM;
	our @geojson;
	sub new               { return bless {}, shift }
	sub add_marker        { return 1 }
	sub add_circle_marker { return 1 }
	sub add_heatmap       { return 1 }
	sub add_geojson       { my ($self, @args) = @_; push @geojson, [ @args ]; return 1 }
	sub onload_render     { return ('', '<div id="map"></div>') }
}

my $data = tempdir(CLEANUP => 1);
{
	open my $fh, '>', File::Spec->catfile($data, 'spots.csv') or die $!;
	print {$fh} "name,lat,lon\nOne,10.1,20.1\nTwo,10.2,20.2\nThree,10.1,21.1\nWet,50,50\n";
	close $fh;
}
my $spec = 'path:' . File::Spec->catfile($data, 'spots.csv');
my $map  = '/map?l=' . url_escape($spec) . '&lat=lat&lon=lon';

sub fresh_app {
	my $t = Test::Mojo->new('Database::BI');
	$t->app->config->{model_dir} = tempdir(CLEANUP => 1);
	return $t;
}

# Run $code with Nominatim and HTML::OSM stood in for.
sub with_fakes {
	my ($ua, $code) = @_;
	no warnings qw(redefine once);
	local *Database::BI::Controller::Dashboard::_map_renderer_version = sub { (1, '0.15') };
	local *HTML::OSM::new = sub { Fake::OSM->new };
	@Fake::OSM::geojson = ();
	return BI::Test::Boundary::with_ua($ua, $code);
}

subtest 'bounds=county draws the outlines as one named layer' => sub {
	my $t  = fresh_app();
	my $ua = BI::Test::Boundary->new(areas => \@AREAS);
	with_fakes($ua, sub {
		$t->get_ok("$map&bounds=county")->status_is(200)
			->content_like(qr/with 2 county outlines\./, 'the summary counts them');
	});
	is(scalar($ua->asked), 3, 'two counties and the sea');
	is(scalar(@Fake::OSM::geojson), 1, 'one layer');
	my ($collection, %opts) = @{ $Fake::OSM::geojson[0] };
	is($opts{name}, 'County boundaries', 'named, for the checkbox on the map');
	is($opts{popup}, 'name', 'each outline names itself');
	is_deeply([ map { $_->{properties}{name} } @{ $collection->{features} } ],
		[ 'West County', 'East &lt;b&gt;County&lt;/b&gt; &amp; Co' ],
		'the names escaped, because Leaflet reads a popup as HTML');
	is(${ $opts{style}{fill} }, 0, 'outlines, not filled areas');

	$ua->clear;
	with_fakes($ua, sub { $t->get_ok("$map&bounds=county")->status_is(200) });
	is(scalar($ua->asked), 0, 'the next view asks nothing');
	is(scalar(@{ $Fake::OSM::geojson[0][0]{features} }), 2, 'and draws the same');

	with_fakes($ua, sub { $t->get_ok($map)->status_is(200) });
	is(scalar(@Fake::OSM::geojson), 0, 'no outlines without bounds=');
};

subtest 'an unknown bounds= is refused' => sub {
	my $t = fresh_app();
	$t->get_ok("$map&bounds=state")->status_is(400)
		->content_like(qr/bounds= must be "county"/);
};

subtest 'a browser gets a progress bar for the outlines not known' => sub {
	my $t  = fresh_app();
	my $ua = BI::Test::Boundary->new(areas => \@AREAS);
	my @items;
	with_fakes($ua, sub {
		$t->get_ok("$map&bounds=county", { Accept => 'text/html' })->status_is(200)
			->element_exists('#map-progress')
			->content_like(qr/Looking up\s+4 county outlines\s+that are not in the cache yet/);
		my ($json) = $t->tx->res->body =~ m{<script[^>]*id="map-pending">(.*?)</script>}s;
		@items = @{ decode_json(html_unescape($json // '[]')) };
	});
	is(scalar($ua->asked), 0, 'the page asked nothing');
	is_deeply([ map { $_->{point} } @items ],
		[ '10.100,20.100', '10.200,20.200', '10.100,21.100', '50.000,50.000' ], 'every point listed');
	is($items[0]{level}, 'county', 'with its level');

	with_fakes($ua, sub {
		$t->post_ok('/geo/boundary' => form => { %{ $items[0] } })->status_is(200)
			->json_is('/status' => 'found')->json_is('/stored' => 1)->json_is('/name' => 'West County');
		$t->post_ok('/geo/boundary' => form => { %{ $items[1] } })->status_is(200)
			->json_is('/status' => 'found');
		$t->post_ok('/geo/boundary' => form => { %{ $items[3] } })->status_is(200)
			->json_is('/status' => 'nowhere')->json_is('/stored' => 1);
		$t->post_ok('/geo/boundary' => form => { %{ $items[2] }, online => 0 })->status_is(200)
			->json_is('/status' => 'held')->json_is('/stored' => 0)->json_is('/online_failed' => 0);
	});
	is(scalar($ua->asked), 2, 'the second point was inside the first outline; online=0 asked nothing');

	with_fakes($ua, sub {
		$t->post_ok('/geo/boundary' => form => { %{ $items[0] }, point => '10.300,20.300' })->status_is(403)
			->json_like('/error' => qr/not listed by a map page/);
		$t->post_ok('/geo/boundary' => form => { point => '10.100,20.100' })->status_is(400)
			->json_like('/error' => qr/needs point= and the sig=/);
		$t->post_ok('/geo/boundary' => form => { %{ $items[0] }, level => 'state' })->status_is(400);
	});

	# Cancelled: what the cache knows, and a note for the rest.
	with_fakes($ua, sub {
		$t->get_ok("$map&bounds=county&geocode=cached", { Accept => 'text/html' })->status_is(200)
			->element_exists_not('#map-progress')
			->content_like(qr/1 of 4 places have no county outline yet/);
	});
	is(scalar(@{ $Fake::OSM::geojson[0][0]{features} }), 1, 'the outline found is drawn');
};

subtest 'messages when outlines cannot be had' => sub {
	my $t = fresh_app();
	$t->app->config->{map_geocode_online} = 0;
	with_fakes(BI::Test::Boundary->new(areas => \@AREAS), sub {
		$t->get_ok("$map&bounds=county")->status_is(200)
			->content_like(qr/4 of 4 places have no county outline: outlines come from OpenStreetMap/);
	});

	$t = fresh_app();
	my $down = BI::Test::Boundary->new(areas => \@AREAS, fail => 1);
	with_fakes($down, sub {
		$t->get_ok("$map&bounds=county")->status_is(200)
			->content_like(qr/OpenStreetMap did not answer, so 4 of 4 places have no county outline/);
	});
	is(scalar($down->asked), 1, 'one failure ends the lookups for the request');

	$t = fresh_app();
	$t->app->config->{map_geocode_online_max} = 1;
	with_fakes(BI::Test::Boundary->new(areas => \@AREAS), sub {
		$t->get_ok("$map&bounds=county")->status_is(200)
			->content_like(qr/2 of 4 places have no county outline yet/);
	});
};

subtest 'the map card keeps bounds' => sub {
	my $t = fresh_app();
	with_fakes(BI::Test::Boundary->new(areas => \@AREAS), sub {
		$t->get_ok("$map&bounds=county")->status_is(200);
	});
	my $chart = decode_json($t->tx->res->dom->at('#new-canvas-panel')->attr('data-chart'));
	is($chart->{options}{bounds}, 'county', 'in the chart spec a canvas card is made from');
};

# ===========================================================================
# The real renderer
# ===========================================================================

SKIP: {
	skip 'HTML::OSM 0.14 or later is needed to draw a map', 1
		unless eval { require HTML::OSM; HTML::OSM->VERSION(0.14); 1 };

	subtest 'HTML::OSM draws them' => sub {
		my $t = fresh_app();
		BI::Test::Boundary::with_ua(BI::Test::Boundary->new(areas => \@AREAS), sub {
			$t->get_ok("$map&bounds=county")->status_is(200);
		});
		my $body = $t->tx->res->body;
		like($body, qr/L\.geoJSON\(\{[^\n]*"West County"/, 'the outlines are in the page');
		unlike($body, qr/<b>County/, 'no markup from a name');
		if (eval { HTML::OSM->VERSION(0.15); 1 }) {
			like($body, qr/L\.control\.layers\(null, overlays/, 'with the checkbox on the map');
			like($body, qr/overlays\['County boundaries'\]/, 'labelled');
		} else {
			unlike($body, qr/L\.control\.layers/, 'HTML::OSM before 0.15 draws them with no checkbox');
		}
	};
}

done_testing();
