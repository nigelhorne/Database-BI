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
	like(($ua->asked)[0], qr/[?&]polygon_geojson=1&polygon_threshold=0\.001/, 'a simplified outline');

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

# The county level is a different rank in each country: an Indian district is
# rank 10, its sub-districts 12; a Kenyan county is rank 8.  Nominatim names a
# point's country in its reply.
my @WORLD = (
	{ name => 'Pune District',  id => 201, box => [ 18, 73, 19, 74 ],     rank => 10, country => 'in' },
	{ name => 'Pune City',      id => 202, box => [ 18.4, 73.8, 18.6, 74 ], rank => 12, country => 'in' },
	{ name => 'Haveli',         id => 203, box => [ 18, 73, 18.4, 73.8 ],  rank => 12, country => 'in' },
	{ name => 'Satara District', id => 204, box => [ 17, 73, 18, 74 ],    rank => 10, country => 'in' },
	{ name => 'Maharashtra',    id => 205, box => [ 15, 72, 22, 80 ],     rank => 8,  country => 'in' },
	{ name => 'Loudoun County', id => 301, box => [ 39, -78, 39.3, -77.4 ], rank => 12, country => 'us' },
	{ name => 'Virginia',       id => 302, box => [ 36, -84, 40, -75 ],   rank => 8,  country => 'us' },
	{ name => 'Kiambu',         id => 401, box => [ -1.3, 36.5, -0.7, 37.3 ], rank => 8, country => 'ke' },
	{ name => 'Thika Town',     id => 402, box => [ -1.1, 36.9, -0.9, 37.1 ], rank => 12, country => 'ke' },
	{ name => 'Andalusia',      id => 501, box => [ 36, -7, 38.5, -2 ],   rank => 8,  country => 'es' },
	{ name => 'Seville',        id => 502, box => [ 37, -6.5, 38, -5.5 ], rank => 10, country => 'es' },
);

sub zooms { return map { /[?&]zoom=(\d+)/ ? $1 : '?' } @_ }

subtest 'the county rank depends on the country' => sub {
	my $b = boundary(ua => BI::Test::Boundary->new);
	is($b->rank_for('us'), 12, 'a US county is rank 12');
	is($b->rank_for('GB'), 12, 'as is a country not listed, in any case');
	is($b->rank_for('in'), 10, 'an Indian district is 10');
	is($b->rank_for($_), 10, "$_ too") for qw(bd cn es);
	is($b->rank_for('ke'), 8, 'a Kenyan county is 8');
	is($b->rank_for(undef), 12, 'no country (the sea) is the level\'s own');
	is($b->rank_for(''), 12, 'as is an empty code');

	my $mine = boundary(ranks => { LK => 10, in => 12 });
	is($mine->rank_for('lk'), 10, 'ranks adds a country');
	is($mine->rank_for('in'), 12, 'and changes one');
	is($mine->rank_for('ke'), 8, 'and leaves the rest');
};

subtest 'ranks that are not a hash of codes to 8, 10 or 12 are refused' => sub {
	my $class = 'Database::BI::Model::Boundary';
	is_deeply($class->check_ranks({ LK => '10', np => 12 }), { lk => 10, np => 12 }, 'codes in lower case, ranks numbers');
	throws_ok { $class->check_ranks([]) }            qr/must be a hash/,                  'a list';
	throws_ok { $class->check_ranks({ lka => 10 }) } qr/'lka' is not a two-letter country code/, 'a three-letter code';
	throws_ok { $class->check_ranks({ lk => 9 }) }   qr/the rank for 'lk' must be one of 8, 10, 12/, 'a rank with no zoom';
	throws_ok { $class->check_ranks({ lk => 'x' }) } qr/the rank for 'lk'/,               'not a number';
	throws_ok { $class->check_ranks({ lk => undef }) } qr/the rank for 'lk'/,             'undef';
	throws_ok { $class->check_ranks({ lk => 10, LK => 12 }) } qr/given twice/,            'one country twice';
	throws_ok { $class->new(ranks => { x => 10 }) } qr/'x' is not a two-letter/,         'new() checks them too';
};

subtest 'an Indian point is asked again at district zoom, and the next once' => sub {
	my $ua = BI::Test::Boundary->new(areas => \@WORLD);
	my $b  = boundary(ua => $ua);

	my $r = $b->outlines([ [ 18.5, 73.9 ] ]);
	is_deeply([ zooms($ua->asked) ], [ 8, 6 ], 'county zoom first, then the zoom India\'s rank needs');
	is_deeply([ map { $_->{properties}{name} } @{ $r->{features} } ], [ 'Pune District' ],
		'the district, not the sub-district (Pune City)');
	is($r->{counts}{attempted}, 1, 'one point asked, though in two requests');

	$ua->clear;
	$r = $b->outlines([ [ 18.2, 73.5 ], [ 17.5, 73.5 ] ]);
	is_deeply([ zooms($ua->asked) ], [ 6 ], 'the last country\'s zoom first: Satara is asked once, Haveli not at all');
	is_deeply([ map { $_->{properties}{name} } @{ $r->{features} } ], [ 'Pune District', 'Satara District' ],
		'a point in a sub-district is drawn in its district');

	$ua->clear;
	$r = $b->outlines([ [ 39.1, -77.6 ] ]);
	is_deeply([ zooms($ua->asked) ], [ 6, 8 ], 'crossing to the US: the Indian zoom gives Virginia, then county zoom');
	is($r->{features}[0]{properties}{name}, 'Loudoun County', 'and the county');
};

subtest 'a Kenyan county is rank 8, and Spain\'s province 10' => sub {
	my $ua = BI::Test::Boundary->new(areas => \@WORLD);
	my $r  = boundary(ua => $ua)->outlines([ [ -1.0, 37.0 ], [ 37.4, -6.0 ] ]);
	is_deeply([ map { $_->{properties}{name} } @{ $r->{features} } ], [ 'Kiambu', 'Seville' ],
		'the county, not the sub-county; the province, which Spain has instead of rank 12');
	is_deeply([ zooms($ua->asked) ], [ 8, 5, 5, 6 ], 'each asked again at its own zoom');
};

subtest 'last country seen is remembered between objects' => sub {
	my $dir = tempdir(CLEANUP => 1);
	my $ua  = BI::Test::Boundary->new(areas => \@WORLD);
	my $new = sub { Database::BI::Model::Boundary->new(online => 1, ua => $ua,
		cache => Database::BI::Model::Boundary->file_cache($dir)) };
	$new->()->outlines([ [ 18.5, 73.9 ] ]);
	$ua->clear;
	$new->()->outlines([ [ 17.5, 73.5 ] ]);
	is_deeply([ zooms($ua->asked) ], [ 6 ], 'the next map of India asks once a point');
};

subtest 'a changed rank asks again, rather than drawing the old level' => sub {
	my $cache = CHI->new(driver => 'Memory', global => 0);
	my $ua    = BI::Test::Boundary->new(areas => \@WORLD);
	boundary(ua => $ua, cache => $cache)->outlines([ [ 18.5, 73.9 ], [ 37.4, -6.0 ] ]);

	$ua->clear;
	my $r = boundary(ua => $ua, cache => $cache, ranks => { in => 12 })->outlines([ [ 18.5, 73.9 ] ]);
	is($r->{features}[0]{properties}{name}, 'Pune City', 'with India at 12, the sub-district');
	ok(scalar($ua->asked), 'which was asked for');

	$ua->clear;
	$r = boundary(ua => $ua, cache => $cache, ranks => { es => 12 })->outlines([ [ 37.4, -6.0 ] ]);
	is($r->{counts}{nowhere}, 1, 'Spain at 12 has nothing there');
	$ua->clear;
	$r = boundary(ua => $ua, cache => $cache, ranks => { es => 12 })->outlines([ [ 37.4, -6.0 ] ]);
	is(scalar($ua->asked), 0, 'which is remembered at that rank');
	$r = boundary(ua => $ua, cache => $cache)->outlines([ [ 37.4, -6.0 ] ]);
	is($r->{features}[0]{properties}{name}, 'Seville', 'and asked again when the rank goes back to 10');

	$ua->clear;
	$r = boundary(ua => $ua, cache => $cache)->outlines([ [ 18.5, 73.9 ] ]);
	is($r->{features}[0]{properties}{name}, 'Pune District', 'and India back at 10 draws the district');
};

subtest 'a cache from before ranks were kept is asked again' => sub {
	my $cache = CHI->new(driver => 'Memory', global => 0);
	$cache->set('point:county:18.500,73.900', 'R202');
	$cache->set('outline:R202', { name => 'Pune City', geometry => { type => 'Polygon',
		coordinates => [ BI::Test::Boundary::ring(18.4, 73.8, 18.6, 74) ] } });
	$cache->set('index:county', [ [ 'R202', 18.4, 73.8, 18.6, 74 ] ]);
	$cache->set('point:county:50.000,50.000', '');

	my $ua = BI::Test::Boundary->new(areas => \@WORLD);
	my $r  = boundary(ua => $ua, cache => $cache)->outlines([ [ 18.5, 73.9 ], [ 18.45, 73.85 ], [ 50, 50 ] ]);
	is_deeply([ map { $_->{properties}{name} } @{ $r->{features} } ], [ 'Pune District' ],
		'the old sub-district is not drawn, nor matched for a point inside it');
	is($r->{counts}{nowhere}, 1, 'the sea is still nowhere');
	is(scalar($ua->asked), 3, 'the district asked twice, and the sea once');
};

subtest 'an outline kept at a coarser detail is asked again' => sub {
	my $cache = CHI->new(driver => 'Memory', global => 0);
	my $ua    = BI::Test::Boundary->new(areas => \@AREAS);
	boundary(ua => $ua, cache => $cache)->outlines([ [ 10.1, 20.1 ] ]);
	is($cache->get('outline:R101')->{detail}, '0.001', 'an outline is kept with how far it was simplified');
	$ua->clear;
	boundary(ua => $ua, cache => $cache)->outlines([ [ 10.1, 20.1 ], [ 10.2, 20.2 ] ]);
	is(scalar($ua->asked), 0, 'and is used as it is');

	# As 0.005 was: neighbours' borders half a kilometre apart.
	$cache->set('outline:R101', { %{ $cache->get('outline:R101') }, detail => '0.005' });
	my $r = boundary(ua => $ua, cache => $cache)->outlines([ [ 10.1, 20.1 ], [ 10.2, 20.2 ] ]);
	is(scalar($ua->asked), 1, 'a coarser one is fetched again, once for the county');
	is($r->{counts}{drawn}, 1, 'and drawn');
	is($cache->get('outline:R101')->{detail}, '0.001', 'at today\'s detail');
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

	# Trying again lists only the points still unknown: the two found before
	# Cancel (and the sea) are remembered, and nothing is asked to draw them.
	$ua->clear;
	my @again;
	with_fakes($ua, sub {
		$t->get_ok("$map&bounds=county", { Accept => 'text/html' })->status_is(200)
			->content_like(qr/Looking up\s+1 county outline\s+that is not in the cache yet/);
		my ($json) = $t->tx->res->body =~ m{<script[^>]*id="map-pending">(.*?)</script>}s;
		@again = @{ decode_json(html_unescape($json // '[]')) };
	});
	is_deeply([ map { $_->{point} } @again ], [ '10.100,21.100' ], 'only the point held at Cancel');
	is(scalar($ua->asked), 0, 'nothing asked to draw the rest');
	is(scalar(@{ $Fake::OSM::geojson[0][0]{features} }), 1, 'the outline found before is drawn at once');
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

subtest 'map_bounds_ranks in the config' => sub {
	my $t = fresh_app();
	$t->app->config->{map_bounds_ranks} = { aa => 10 };
	my $ua = BI::Test::Boundary->new(areas => [
		{ name => 'Big', id => 601, box => [ 10, 20, 11, 21 ], rank => 10, country => 'aa' },
		{ name => 'Small', id => 602, box => [ 10, 20, 10.5, 20.5 ], rank => 12, country => 'aa' },
	]);
	with_fakes($ua, sub { $t->get_ok("$map&bounds=county&geocode=wait")->status_is(200) });
	is_deeply([ map { $_->{properties}{name} } @{ $Fake::OSM::geojson[0][0]{features} } ], [ 'Big' ],
		'the map uses its rank for that country');

	require Database::BI;
	for my $bad ([ [] , qr/map_bounds_ranks: give a hash/ ], [ { lk => 9 }, qr/map_bounds_ranks: the rank for 'lk'/ ]) {
		local $ENV{MOJO_CONFIG} = do {
			my $file = File::Spec->catfile(tempdir(CLEANUP => 1), 'bi.conf');
			open my $fh, '>', $file or die $!;
			print {$fh} '{ map_bounds_ranks => ' . (ref $bad->[0] eq 'ARRAY' ? '[]' : '{ lk => 9 }') . ' }';
			close $fh;
			$file;
		};
		throws_ok { Test::Mojo->new('Database::BI') } $bad->[1], 'startup refuses a bad one';
	}
};

subtest 'outlines() says which outline each point is in' => sub {
	my $r = boundary(ua => BI::Test::Boundary->new(areas => \@AREAS))
		->outlines([ [ 10.1, 20.1 ], [ 10.2, 20.2 ], [ 10.5, 21.5 ], [ 50, 50 ] ]);
	is_deeply($r->{inside}, { '10.100,20.100' => 'R101', '10.200,20.200' => 'R101', '10.500,21.500' => 'R103' },
		'by point key, the sea left out');
};

subtest 'with the heat layer, outlines are coloured by what is in them' => sub {
	my $csv = File::Spec->catfile($data, 'people.csv');
	open my $fh, '>', $csv or die $!;
	# West County: two rows at one point and one at another (37); East: 1000;
	# The City, in East's hole: 5.
	print {$fh} "name,lat,lon,pop\nA,10.1,20.1,10\nB,10.1,20.1,20\nC,10.5,20.5,7\nD,10.1,21.1,1000\nE,10.5,21.5,5\nF,10.6,20.6,n/a\n";
	close $fh;
	my $people = '/map?l=' . url_escape("path:$csv") . '&lat=lat&lon=lon&bounds=county&geocode=wait';
	my $t  = fresh_app();
	my $ua = BI::Test::Boundary->new(areas => \@AREAS);
	my $layers = sub {
		return [ map {
			my ($collection, %opts) = @{$_};
			[ $opts{style}{color}, [ map { html_unescape($_->{properties}{name}) } @{ $collection->{features} } ] ];
		} @Fake::OSM::geojson ];
	};

	with_fakes($ua, sub { $t->get_ok("$people&heat=1&weight=pop")->status_is(200) });
	is_deeply($layers->(), [
		[ '#1a9850', [ 'The City: 5 pop' ] ],
		[ '#bea32e', [ 'West County: 37 pop' ] ],
		[ '#d73027', [ 'East <b>County</b> & Co: 1,000 pop' ] ],
	], 'green to red by size, low first so the highest is on top; every row counted, a cell not a number none');
	my (undef, %opts) = @{ $Fake::OSM::geojson[0] };
	is($opts{name}, 'County boundaries', 'every colour under one name, so one checkbox hides them all');
	is(${ $opts{style}{fill} }, 0, 'still outlines');
	like($Fake::OSM::geojson[2][0]{features}[0]{properties}{name}, qr/&lt;b&gt;/, 'the name still escaped');
	is_deeply($opts{key}, {
		title   => 'pop in each county',
		entries => [
			{ colour => '#d73027', label => '1,000' },
			{ colour => '#bea32e', label => '37' },
			{ colour => '#1a9850', label => '5' },
		],
	}, 'a key to the colours, highest first, with the first layer');
	ok(!(grep { my (undef, %o) = @{$_}; $o{key} } @Fake::OSM::geojson[1, 2]), 'and only the first');
	$t->content_like(qr/with 3 county outlines coloured by pop, from green \(least\) to red \(most\)\./,
		'the summary says what the colours mean');

	with_fakes($ua, sub { $t->get_ok("$people&heat=1")->status_is(200) });
	is_deeply($layers->(), [
		[ '#1a9850', [ 'East <b>County</b> & Co: 1 row', 'The City: 1 row' ] ],
		[ '#d73027', [ 'West County: 4 rows' ] ],
	], 'with no weight column, rows counted; equal counts share a colour');
	is_deeply({ @{ $Fake::OSM::geojson[0] }[1 .. $#{ $Fake::OSM::geojson[0] }] }->{key}, {
		title   => 'Rows in each county',
		entries => [ { colour => '#d73027', label => '4' }, { colour => '#1a9850', label => '1' } ],
	}, 'the key counts rows');
	$t->content_like(qr/coloured by rows, from green \(fewest\) to red \(most\)\./, 'which the summary says');

	# A total that rounds to nothing is 0, never "-0".
	is(Database::BI::Controller::Dashboard::_map_total_text(-0.001), '0', 'a tiny negative total is 0');
	is(Database::BI::Controller::Dashboard::_map_total_text(-1234.5), '-1,234.5', 'a real negative total keeps its sign');

	with_fakes($ua, sub { $t->get_ok($people)->status_is(200) });
	is_deeply($layers->(), [ [ '#555555', [ 'West County', 'East <b>County</b> & Co', 'The City' ] ] ],
		'without the heat layer, grey');
	ok(!{ @{ $Fake::OSM::geojson[0] }[1 .. $#{ $Fake::OSM::geojson[0] }] }->{key}, 'with no key');
	$t->content_unlike(qr/coloured by/, 'and nothing to explain');

	with_fakes($ua, sub { $t->get_ok("$people&heat=1&weight=pop&f=" . url_escape('name:eq:D'))->status_is(200) });
	is_deeply($layers->(), [ [ '#555555', [ 'East <b>County</b> & Co: 1,000 pop' ] ] ],
		'a lone outline has nothing to be compared with: grey, but its popup still gives the total');
	ok(!{ @{ $Fake::OSM::geojson[0] }[1 .. $#{ $Fake::OSM::geojson[0] }] }->{key}, 'so no key');
	$t->content_like(qr/with 1 county outline\./, 'and the summary claims no colours');

	# D and E are one row each: equal totals, so again nothing to compare.
	with_fakes($ua, sub {
		$t->get_ok("$people&heat=1&f=" . url_escape('name:in:["D","E"]'))->status_is(200);
	});
	is_deeply($layers->(), [ [ '#555555', [ 'East <b>County</b> & Co: 1 row', 'The City: 1 row' ] ] ],
		'outlines with totals all alike are grey too');
	$t->content_unlike(qr/coloured by/, 'with no colours claimed');
};

subtest 'when the markers are coloured, each outline takes their colours' => sub {
	my $csv = File::Spec->catfile($data, 'ruled.csv');
	open my $fh, '>', $csv or die $!;
	# West County: two small and one large; East: one large; The City: one small.
	print {$fh} "name,lat,lon,pop\nA,10.1,20.1,10\nB,10.2,20.2,20\nC,10.5,20.5,700\nD,10.1,21.1,1000\nE,10.5,21.5,5\n";
	close $fh;
	my $ruled = '/map?l=' . url_escape("path:$csv") . '&lat=lat&lon=lon&bounds=county&geocode=wait'
		. '&color=pop&color_rule=gt:500:red&color_default=%2300f';
	my $t  = fresh_app();
	my $ua = BI::Test::Boundary->new(areas => \@AREAS);
	my $drawn = sub {
		return [ map {
			my ($collection, %opts) = @{$_};
			[ $opts{style}{color}, $opts{bands},
				[ map { [ html_unescape($_->{properties}{name}), @{ $_->{properties}{colours} } ] } @{ $collection->{features} } ] ];
		} @Fake::OSM::geojson ];
	};

	for my $heat ('', '&heat=1&weight=pop') {
		with_fakes($ua, sub { $t->get_ok("$ruled$heat")->status_is(200) });
		is_deeply($drawn->(), [
			[ '#ff0000', 'colours', [ [ 'East <b>County</b> & Co', '#ff0000' ] ] ],
			[ '#0000ff', 'colours', [ [ 'The City', '#0000ff' ] ] ],
			[ '#0000ff', 'colours', [ [ 'West County', '#0000ff', '#ff0000' ] ] ],
		], 'one colour, or every colour with the commonest first, each drawn inside its own edge'
			. ($heat ? '; the heat layer does not change that' : ''));
		ok(!(grep { my (undef, %o) = @{$_}; $o{key} } @Fake::OSM::geojson), 'no key: the markers have one');
		is({ @{ $Fake::OSM::geojson[0] }[1 .. $#{ $Fake::OSM::geojson[0] }] }->{name}, 'County boundaries',
			'still under the one checkbox');
		$t->content_like(qr/with 3 county outlines coloured as the markers in them\./, 'the summary says so');
	}

	with_fakes($ua, sub { $t->get_ok("$ruled&f=" . url_escape('name:in:["A","C"]'))->status_is(200) });
	is_deeply($drawn->(), [ [ '#0000ff', 'colours', [ [ 'West County', '#0000ff', '#ff0000' ] ] ] ],
		'one marker of each colour: the first met is outermost');
};

subtest 'colours follow size, so close totals share one' => sub {
	my $shares = \&Database::BI::Controller::Dashboard::_outline_shares;
	my $by_size = $shares->([ 1000, 1001, 1_000_000 ]);
	is($by_size->{1000}, 0, 'the lowest is at the green end');
	is($by_size->{1_000_000}, 1, 'the highest at the red end');
	cmp_ok($by_size->{1001}, '<', 0.001, 'a total one above the lowest is beside it, not half way up');
	my $steps = $shares->([ 1, 10, 100 ]);
	cmp_ok(abs($steps->{10} - 0.5), '<', 1e-9, 'ten times as much is the same step each time');
	is_deeply($shares->([ 0, 5, 1000 ]), { 0 => 0, 5 => 0.5, 1000 => 1 },
		'a total of nothing has no logarithm, so then they are spread by rank');
	is_deeply($shares->([ -3, 4 ]), { -3 => 0, 4 => 1 }, 'a negative total too');
};

subtest 'an outline is called what its country calls it' => sub {
	my $csv = File::Spec->catfile($data, 'called.csv');
	open my $fh, '>', $csv or die $!;
	print {$fh} "name,lat,lon,pop\nA,50.5,60.5,10\nB,50.5,61.5,200\nC,50.5,70.5,30\n";
	close $fh;
	my $called = '/map?l=' . url_escape("path:$csv") . '&lat=lat&lon=lon&bounds=county&geocode=wait&heat=1&weight=pop';
	my @india = (
		{ name => 'Pune', id => 801, box => [ 50, 60, 51, 61 ], rank => 10, country => 'in' },
		{ name => 'Nashik', id => 802, box => [ 50, 61, 51, 62 ], rank => 10, country => 'in' },
	);
	my $t = fresh_app();
	with_fakes(BI::Test::Boundary->new(areas => \@india), sub {
		$t->get_ok($called)->status_is(200)
			->content_like(qr/with 2 district outlines coloured by pop/, 'the summary says district');
	});
	my (undef, %opts) = @{ $Fake::OSM::geojson[0] };
	is($opts{name}, 'District boundaries', 'the checkbox too');
	is($opts{key}{title}, 'pop in each district', 'and the key');

	# A French departement beside them: no one word covers both.
	$t = fresh_app();
	with_fakes(BI::Test::Boundary->new(areas => [ @india,
		{ name => 'Ain', id => 803, box => [ 50, 70, 51, 71 ], country => 'fr' },
		# Its region: what a lookup at India's zoom finds, naming the country.
		{ name => 'A Region', id => 804, box => [ 49, 69, 52, 72 ], rank => 8, country => 'fr' } ]), sub {
		$t->get_ok($called)->status_is(200)
			->content_like(qr/with 3 area outlines coloured by pop/, 'a map of mixed kinds says area');
	});
	(undef, %opts) = @{ $Fake::OSM::geojson[0] };
	is($opts{name}, 'Area boundaries', 'on the checkbox');
	is($opts{key}{title}, 'pop in each area', 'and in the key');

	my $class = 'Database::BI::Model::Boundary';
	is($class->name_for('IN'), 'district', 'name_for reads a code in any case');
	is($class->name_for('fr'), 'department', 'a departement');
	is($class->name_for('us'), 'county', 'a country not listed is a county');
	is($class->name_for(undef), 'county', 'and so is no country');
};

subtest 'a colour in the key covers the totals drawn in it' => sub {
	# Twenty counties in a row, one marker each, populations 1 to 20.
	my @areas = map { { name => "C$_", id => 700 + $_, box => [ 40, $_, 41, $_ + 1 ] } } 1 .. 20;
	my $csv = File::Spec->catfile($data, 'row.csv');
	open my $fh, '>', $csv or die $!;
	print {$fh} "name,lat,lon,pop\n", map { "P$_,40.5,@{[ $_ + 0.5 ]},$_\n" } 1 .. 20;
	close $fh;
	my $t  = fresh_app();
	with_fakes(BI::Test::Boundary->new(areas => \@areas), sub {
		$t->get_ok('/map?l=' . url_escape("path:$csv") . '&lat=lat&lon=lon&bounds=county&geocode=wait&heat=1&weight=pop')
			->status_is(200);
	});
	my (undef, %opts) = @{ $Fake::OSM::geojson[0] };
	my @labels = map { $_->{label} } @{ $opts{key}{entries} };
	cmp_ok(scalar(@labels), '<=', 9, 'no more than nine colours');
	is($labels[0], '17 to 20', 'the highest covers those close to it in size, from smallest to largest');
	is($labels[-1], '1', 'the lowest stands alone: 2 is twice as much');
	is(scalar(@{ $Fake::OSM::geojson[-1][0]{features} }), 4, 'the four drawn in the highest');
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

	# The key is HTML::OSM 0.16's; an older copy takes the option and draws
	# nothing, so only a copy that new can show the key reaches the page.
	subtest 'HTML::OSM draws the key to the colours' => sub {
		plan skip_all => 'HTML::OSM 0.16 or later is needed to draw a key to the outlines'
			unless eval { HTML::OSM->VERSION(0.16); 1 };
		my $csv = File::Spec->catfile($data, 'keyed.csv');
		open my $fh, '>', $csv or die $!;
		print {$fh} "name,lat,lon,pop\nA,10.1,20.1,30\nD,10.1,21.1,1000\n";
		close $fh;
		my $t = fresh_app();
		BI::Test::Boundary::with_ua(BI::Test::Boundary->new(areas => \@AREAS), sub {
			$t->get_ok('/map?l=' . url_escape("path:$csv")
				. '&lat=lat&lon=lon&bounds=county&geocode=wait&heat=1&weight=pop')->status_is(200);
		});
		my $body = $t->tx->res->body;
		like($body, qr/layerKey\(group, \{[^\n]*"title":"pop in each county"/, 'the key is given to the layer');
		like($body, qr/layerKey\(group, [^\n]*"label":"1,000"[^\n]*"label":"30"/, 'highest first');
		like($body, qr/layerKey\(group, [^\n]*"colour":"#d73027"[^\n]*"colour":"#1a9850"/, 'red down to green');
		is(scalar(() = $body =~ /layerKey\(group,/g), 1, 'one key for the two colours');
	};

	# Side-by-side colours are HTML::OSM 0.17's; an older copy draws the first.
	subtest 'HTML::OSM draws an outline in each of its markers\' colours' => sub {
		plan skip_all => 'HTML::OSM 0.17 or later is needed to draw an outline in two colours'
			unless eval { HTML::OSM->VERSION(0.17); 1 };
		my $csv = File::Spec->catfile($data, 'banded.csv');
		open my $fh, '>', $csv or die $!;
		print {$fh} "name,lat,lon,pop\nA,10.1,20.1,10\nC,10.5,20.5,700\n";
		close $fh;
		my $t = fresh_app();
		BI::Test::Boundary::with_ua(BI::Test::Boundary->new(areas => \@AREAS), sub {
			$t->get_ok('/map?l=' . url_escape("path:$csv")
				. '&lat=lat&lon=lon&bounds=county&geocode=wait&color=pop&color_rule=gt:500:red')->status_is(200);
		});
		like($t->tx->res->body, qr/bandLayer\(\{[^\n]*"colours":\["#[0-9a-f]{6}","#ff0000"\][^\n]*, 'colours'\)/,
			'the outline is given both colours to draw side by side');
	};
}

done_testing();
