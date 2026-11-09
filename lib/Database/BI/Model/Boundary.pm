package Database::BI::Model::Boundary;

# The outline of the area each map marker is in: its county, for now.
#
# A map can draw the boundary of the county around each of its markers.  The
# outlines come from OpenStreetMap's Nominatim, through its reverse lookup:
# given a point and a zoom, it names the administrative area there and, with
# polygon_geojson, sends its shape.  Asking by point rather than by name means
# the same code serves coordinate columns and geocoded places, in any country,
# and needs no state or country column to tell one Richmond from another.
#
# Nominatim allows one request a second, so this module asks as little as it
# can:
#
#   1. Each point is rounded to 3 decimal places (about 110 m), which is also
#      all of it that leaves this machine, and remembered with the outline it
#      fell in (or with none, for a point at sea).
#   2. A point not remembered is first tested against the outlines already
#      known, through an index of their bounding boxes, so ten thousand shops
#      in one county cost one request, not ten thousand.
#   3. Only then is Nominatim asked, at most online_max times a call, and a
#      point it does not answer is left pending, not remembered as nowhere.
#
# The outlines are simplified by Nominatim (polygon_threshold), a few KB each,
# because they are written into the page.  The level is a "county": Nominatim's
# place rank 12, which is a US county or county-equivalent city, an English
# county, and an Indian sub-district (taluk).  Choosing the level per country
# comes later; %LEVELS is where it will go.

use strict;
use warnings;

use Carp			qw(croak);
use JSON::PP			();
use Params::Get			();
use Params::Validate::Strict	qw(validate_strict);
use Readonly;
use Scalar::Util		qw(blessed);
use URI				();

our $VERSION = '0.022.0';

# What each level asks Nominatim: the reverse zoom, and the place rank an
# answer must have.  A zoom names the most detailed rank it may return, so a
# point in a country with no area at that rank comes back as something larger
# (a state), which the rank check turns away rather than drawing.
Readonly my %LEVELS => (
	county => { zoom => 8, rank => 12 },
);

Readonly my $REVERSE_URL    => 'https://nominatim.openstreetmap.org/reverse';
Readonly my $THRESHOLD      => 0.005;	# degrees, about 500 m: enough detail at the zoom a county is seen at
Readonly my $DECIMALS       => 3;	# of a point, in its key and in what is sent
Readonly my $DEFAULT_MAX    => 20;	# Nominatim requests in one call, as map_geocode_online_max
Readonly my $CACHE_DIR      => 'boundary-cache';	# under model_dir, for file_cache()
Readonly my $CACHE_NAMESPACE => __PACKAGE__;
Readonly my $CACHE_MAX_SIZE => 8 * 1024 * 1024;	# bytes, for the process-wide default

my $json = JSON::PP->new->canonical->utf8;

=head1 NAME

Database::BI::Model::Boundary - The county outline around each map marker

=head1 VERSION

0.022.0

=head1 SYNOPSIS

    use Database::BI::Model::Boundary;

    my $boundary = Database::BI::Model::Boundary->new(
        cache  => Database::BI::Model::Boundary->file_cache('.bi'),
        online => 1,
    );

    my $result = $boundary->outlines([ [ 39.09, -77.64 ], [ 38.85, -77.31 ] ]);
    $map->add_geojson(
        { type => 'FeatureCollection', features => $result->{features} },
        name => 'County boundaries',
    );

    # A point the map page listed as pending, looked up on its own
    my $answer = $boundary->lookup_point($result->{pending}[0]);

=head1 DESCRIPTION

Finds the county each point is in and returns its outline as a GeoJSON
Feature, for L<HTML::OSM>'s C<add_geojson>.  The outlines come from
OpenStreetMap's Nominatim reverse lookup, through the same throttled user agent
as the geocoder (L<Database::BI::Model::Geocode/nominatim_ua>), so the two
together never ask more than once a second.

Only the point is sent, rounded to three decimal places (about 110 metres).
Every answer is cached: a point with the outline it is in, and the outline
itself.  A point inside an outline already known is matched here, without a
request, so many points in one county cost one lookup.

A county here is Nominatim's place rank 12: a US county or independent city,
an English county, an Indian sub-district.  Anything else Nominatim answers is
taken as "no county here" and remembered as such.

=head1 METHODS

=head2 new

    my $boundary = Database::BI::Model::Boundary->new(%args);

=head3 API SPECIFICATION

=head4 INPUT

  cache      : object with get() and set() (CHI)  optional; default one
               CHI Memory cache for the process
  online     : boolean   optional, default 0: may Nominatim be asked
  online_max : integer   optional, default 20: requests in one outlines() call
  level      : string    optional, default 'county'; the only level so far
  ua         : object with get()   optional: the user agent to ask with
               (tests); default Geocode::nominatim_ua()

=head4 OUTPUT

A Database::BI::Model::Boundary object.  Croaks on an unknown level, or a
cache without get and set.

=cut

sub new {
	my $class = shift;
	my $raw   = Params::Get::get_params(undef, \@_) // {};

	my $args = validate_strict(
		schema => {
			cache      => { type => 'object',  optional => 1, default => undef },
			online     => { type => 'boolean', optional => 1, default => 0 },
			online_max => { type => 'integer', optional => 1, default => $DEFAULT_MAX, min => 0 },
			level      => { type => 'string',  optional => 1, default => 'county' },
			ua         => { type => 'object',  optional => 1, default => undef, can => 'get' },
		},
		input => $raw,
	);

	croak "Unknown boundary level '$args->{level}'" unless $LEVELS{ $args->{level} };
	croak 'The boundary cache needs get() and set()'
		if defined($args->{cache}) && !($args->{cache}->can('get') && $args->{cache}->can('set'));

	return bless {
		%{$args},
		cache => $args->{cache} // _default_cache(),
	}, $class;
}

=head2 levels

    my @levels = Database::BI::Model::Boundary->levels;    # ('county')

=head3 API SPECIFICATION

=head4 INPUT

None.

=head4 OUTPUT

The names of the levels new() takes, sorted.

=cut

sub levels {
	return sort keys %LEVELS;
}

=head2 point_key

    my $key = Database::BI::Model::Boundary->point_key(39.0901, -77.6402);    # '39.090,-77.640'

=head3 API SPECIFICATION

=head4 INPUT

  lat : number  -90 .. 90
  lon : number  -180 .. 180

=head4 OUTPUT

The point rounded to three decimal places, as C<"lat,lon">: what the cache is
keyed by and all of the point that is sent.  Undef for a point out of range.

=cut

sub point_key {
	my (undef, $lat, $lon) = @_;

	return unless defined($lat) && defined($lon)
		&& $lat =~ /\A-?\d+(?:\.\d+)?\z/ && $lon =~ /\A-?\d+(?:\.\d+)?\z/
		&& abs($lat) <= 90 && abs($lon) <= 180;

	my @parts = map {
		my $text = sprintf("%.${DECIMALS}f", $_);
		$text =~ s/\A-(?=0\.0+\z)//;	# no "-0.000", so a point has one key
		$text;
	} ($lat, $lon);
	return join(',', @parts);
}

=head2 outlines

    my $result = $boundary->outlines(\@points, lookup => 1);

=head3 API SPECIFICATION

=head4 INPUT

  points : arrayref of [lat, lon]
  lookup : boolean, default 1.  0 asks Nominatim nothing: the points not
           known yet come back in pending, for the caller to look up one at
           a time (lookup_point)

=head4 OUTPUT

  {
    features => [ GeoJSON Feature, ... ]   one per outline, in the order
                 their first point came; properties { name, osm }
    pending  => [ point_key, ... ]         points not known, not asked
    counts   => { points, drawn, attempted, nowhere }
    offline  => 0|1   points were left because Nominatim may not be asked
    failed   => 0|1   Nominatim did not answer; the rest were left
  }

A point out of range is ignored.  A Feature's name is the place's name as
OpenStreetMap has it: text, not HTML.

=cut

sub outlines {
	my ($self, $points, @rest) = @_;
	croak 'outlines() needs an arrayref of [lat, lon]' unless ref($points) eq 'ARRAY';
	my %opt = @rest;
	my $lookup = exists($opt{lookup}) ? $opt{lookup} : 1;

	local ($@, $!);

	my (@keys, %seen);
	for my $point (@{$points}) {
		next unless ref($point) eq 'ARRAY';
		my $key = $self->point_key(@{$point}[0, 1]);
		push @keys, $key if defined($key) && !$seen{$key}++;
	}

	my %counts = (points => scalar(@keys), drawn => 0, attempted => 0, nowhere => 0);
	my (@order, %used, @pending, $failed, $offline);
	my $index = $self->_index;

	for my $key (@keys) {
		my ($osm, $status) = $self->_known($key, $index);
		if (!defined($status) && $lookup) {
			if (!$self->_can_ask) {
				$offline = 1;
			} elsif (!$failed && $counts{attempted} < $self->{online_max}) {
				$counts{attempted}++;
				($osm, $status) = $self->_ask($key, $index);
				$failed = 1 if $status eq 'failed';
			}
		}
		if (!defined($status) || $status eq 'failed') {
			push @pending, $key;
			next;
		}
		if ($status eq 'nowhere') {
			$counts{nowhere}++;
			next;
		}
		push @order, $osm unless $used{$osm}++;
	}

	my @features;
	for my $osm (@order) {
		my $outline = $self->_get("outline:$osm") or next;
		push @features, {
			type       => 'Feature',
			properties => { name => $outline->{name}, osm => $osm },
			geometry   => $outline->{geometry},
		};
	}
	$counts{drawn} = scalar @features;

	return {
		features => \@features,
		pending  => \@pending,
		counts   => \%counts,
		offline  => $offline ? 1 : 0,
		failed   => $failed  ? 1 : 0,
	};
}

=head2 lookup_point

    my $answer = $boundary->lookup_point('39.090,-77.640');

=head3 API SPECIFICATION

=head4 INPUT

  key : string, a point_key

=head4 OUTPUT

  { status => 'found' | 'nowhere' | 'held', name => string|undef, asked => 0|1 }

'found' and 'nowhere' are remembered.  'held' is a point that could not be
settled now - Nominatim did not answer, or may not be asked - and is asked
again next time.  asked says whether Nominatim was asked.  Croaks on a key
that is not a point_key.

=cut

sub lookup_point {
	my ($self, $key) = @_;

	croak 'lookup_point() needs a point key such as 39.090,-77.640'
		unless defined($key) && !ref($key)
		&& $key =~ /\A(-?\d{1,2}\.\d{$DECIMALS}),(-?\d{1,3}\.\d{$DECIMALS})\z/
		&& defined($self->point_key($1, $2)) && $self->point_key($1, $2) eq $key;

	local ($@, $!);

	my $index = $self->_index;
	my ($osm, $status) = $self->_known($key, $index);
	my $asked = 0;
	if (!defined($status) && $self->_can_ask) {
		$asked = 1;
		($osm, $status) = $self->_ask($key, $index);
	}

	return { status => 'held', name => undef, asked => $asked }
		if !defined($status) || $status eq 'failed';
	return { status => 'nowhere', name => undef, asked => $asked } if $status eq 'nowhere';

	my $outline = $self->_get("outline:$osm");
	return { status => 'found', name => ($outline ? $outline->{name} : undef), asked => $asked };
}

=head2 file_cache

    my $cache = Database::BI::Model::Boundary->file_cache($model_dir);

=head3 API SPECIFICATION

=head4 INPUT

  dir : string, an existing directory (model_dir)

=head4 OUTPUT

A CHI File cache under C<< <dir>/boundary-cache >>, with a copy of what it
reads in memory for as long as the cache object lives.  Croaks when dir is not a directory.

=cut

sub file_cache {
	my (undef, $dir) = @_;

	croak 'The boundary cache needs a directory, not ' . (defined($dir) ? $dir : 'undef')
		unless defined($dir) && !ref($dir) && -d $dir;

	require CHI;
	require File::Spec;
	return CHI->new(
		driver    => 'File',
		root_dir  => File::Spec->catdir($dir, $CACHE_DIR),
		namespace => $CACHE_NAMESPACE,
		# A copy in memory for this object, which a request makes afresh: it
		# saves reading the index and outlines again within the request.  Not
		# global, which would share it with every cache of this namespace in
		# the process, whatever its folder, and keep a worker from seeing
		# what another has added since.
		l1_cache  => { driver => 'RawMemory', global => 0, max_size => $CACHE_MAX_SIZE },
	);
}

# ---------------------------------------------------------------------------
# Private
# ---------------------------------------------------------------------------

my $default_cache;

sub _default_cache {
	require CHI;
	$default_cache //= CHI->new(
		driver    => 'Memory',
		global    => 1,
		namespace => $CACHE_NAMESPACE,
		max_size  => $CACHE_MAX_SIZE,
	);
	return $default_cache;
}

# _get($key) / _set($key, $value): the cache, under this level's prefix for a
# point and the plain key for an outline (an OSM relation is one outline at any
# level).  A cache that fails reads as empty and writes as nothing: the page
# still draws, and asks again next time.
sub _get {
	my ($self, $key) = @_;
	my $value = eval { $self->{cache}->get($key) };
	return $value;
}

sub _set {
	my ($self, $key, $value) = @_;
	return eval { $self->{cache}->set($key, $value, 'never'); 1 };
}

sub _point_cache_key {
	my ($self, $key) = @_;
	return "point:$self->{level}:$key";
}

# _index() -> arrayref of [osm, south, west, north, east]
#
# The bounding box of every outline this level has found, so a point can be
# tested against the few that could hold it.  Two processes adding at once can
# lose one's entry; that costs a request later, not a wrong answer.
sub _index {
	my $self = shift;
	my $index = $self->_get("index:$self->{level}");
	return ref($index) eq 'ARRAY' ? [ @{$index} ] : [];
}

# _known($key, \@index) -> ($osm, $status) or ()
#
# What is known of a point without asking: remembered with an outline or with
# none, or inside an outline the index holds (which is then remembered).
sub _known {
	my ($self, $key, $index) = @_;

	my $remembered = $self->_get($self->_point_cache_key($key));
	if (defined $remembered) {
		return (undef, 'nowhere') unless length $remembered;
		return ($remembered, 'found') if $self->_get("outline:$remembered");
		# The outline itself has gone from the cache: ask again.
	}

	my ($lat, $lon) = split /,/, $key;
	for my $entry (@{$index}) {
		my ($osm, $south, $west, $north, $east) = @{$entry};
		next if $lat < $south || $lat > $north || $lon < $west || $lon > $east;
		my $outline = $self->_get("outline:$osm") or next;
		next unless _contains($outline->{geometry}, $lat, $lon);
		$self->_set($self->_point_cache_key($key), $osm);
		return ($osm, 'found');
	}

	return;
}

sub _can_ask {
	my $self = shift;
	return 0 unless $self->{online};
	return 1 if $self->{ua};
	require Database::BI::Model::Geocode;
	return Database::BI::Model::Geocode::nominatim_ua() ? 1 : 0;
}

# _ask($key, \@index) -> ($osm, 'found') | (undef, 'nowhere') | (undef, 'failed')
#
# One reverse lookup.  A found outline is remembered, added to the index (and
# to @$index, so the caller's later points are tested against it), and the
# point remembered with it.  An answer that is not an outline at this level's
# rank is remembered as nowhere.  A failure is remembered as nothing.
sub _ask {
	my ($self, $key, $index) = @_;
	my $level = $LEVELS{ $self->{level} };
	my ($lat, $lon) = split /,/, $key;

	my $uri = URI->new($REVERSE_URL);
	$uri->query_form(
		lat               => $lat,
		lon               => $lon,
		zoom              => $level->{zoom},
		format            => 'jsonv2',
		polygon_geojson   => 1,
		polygon_threshold => $THRESHOLD,
		'accept-language' => 'en',
	);

	require Database::BI::Model::Geocode;
	my $ua  = $self->{ua} // Database::BI::Model::Geocode::nominatim_ua();
	my $res = eval { $ua->get($uri) };
	return (undef, 'failed') unless blessed($res) && $res->can('is_success') && $res->is_success;

	my $reply = eval { $json->decode($res->decoded_content // '') };
	return (undef, 'failed') unless ref($reply) eq 'HASH';

	my $geometry = $reply->{geojson};
	my $is_outline = ($reply->{category} // '') eq 'boundary'
		&& ($reply->{type} // '') eq 'administrative'
		&& ($reply->{osm_type} // '') eq 'relation'
		&& defined($reply->{osm_id}) && $reply->{osm_id} =~ /\A\d+\z/
		&& ($reply->{place_rank} // -1) == $level->{rank}
		&& ref($geometry) eq 'HASH'
		&& ($geometry->{type} // '') =~ /\A(?:Multi)?Polygon\z/
		&& ref($geometry->{coordinates}) eq 'ARRAY';

	unless ($is_outline) {
		# "Unable to geocode" (the sea) and an answer at another rank alike.
		$self->_set($self->_point_cache_key($key), '');
		return (undef, 'nowhere');
	}

	my $osm  = "R$reply->{osm_id}";
	my $name = $reply->{name};
	$name = $reply->{display_name} unless defined($name) && length($name);
	$self->_set("outline:$osm", { name => $name // $osm, geometry => $geometry });

	unless (grep { $_->[0] eq $osm } @{$index}) {
		my $box = _bounds($geometry);
		if ($box) {
			push @{$index}, [ $osm, @{$box} ];
			my $stored = $self->_index;
			push @{$stored}, [ $osm, @{$box} ] unless grep { $_->[0] eq $osm } @{$stored};
			$self->_set("index:$self->{level}", $stored);
		}
	}
	$self->_set($self->_point_cache_key($key), $osm);

	return ($osm, 'found');
}

# _polygons($geometry) -> list of polygons, each an arrayref of rings, each
# ring an arrayref of [lon, lat].
sub _polygons {
	my $geometry = shift;
	return () unless ref($geometry) eq 'HASH' && ref($geometry->{coordinates}) eq 'ARRAY';
	return ($geometry->{coordinates}) if ($geometry->{type} // '') eq 'Polygon';
	return @{ $geometry->{coordinates} } if ($geometry->{type} // '') eq 'MultiPolygon';
	return ();
}

# _bounds($geometry) -> [south, west, north, east], or undef with no points
sub _bounds {
	my $geometry = shift;
	my ($south, $west, $north, $east);
	for my $polygon (_polygons($geometry)) {
		for my $position (@{ $polygon->[0] // [] }) {
			my ($lon, $lat) = @{$position};
			$south = $lat if !defined($south) || $lat < $south;
			$north = $lat if !defined($north) || $lat > $north;
			$west  = $lon if !defined($west)  || $lon < $west;
			$east  = $lon if !defined($east)  || $lon > $east;
		}
	}
	return defined($south) ? [ $south, $west, $north, $east ] : undef;
}

# _contains($geometry, $lat, $lon) -> 1 when the point is inside a polygon's
# outer ring and none of its holes (Fairfax County's hole is the City of
# Fairfax).  Even-odd ray casting, with longitude as x.
sub _contains {
	my ($geometry, $lat, $lon) = @_;
	for my $polygon (_polygons($geometry)) {
		my ($outer, @holes) = @{$polygon};
		next unless _in_ring($outer, $lon, $lat);
		return 1 unless grep { _in_ring($_, $lon, $lat) } @holes;
	}
	return 0;
}

sub _in_ring {
	my ($ring, $x, $y) = @_;
	return 0 unless ref($ring) eq 'ARRAY' && @{$ring} >= 3;
	my $inside = 0;
	my ($px, $py) = @{ $ring->[-1] };
	for my $position (@{$ring}) {
		my ($qx, $qy) = @{$position};
		if ((($qy > $y) != ($py > $y))
				&& ($x < ($px - $qx) * ($y - $qy) / ($py - $qy) + $qx)) {
			$inside = !$inside;
		}
		($px, $py) = ($qx, $qy);
	}
	return $inside ? 1 : 0;
}

1;

__END__

=head1 AUTHOR

Nigel Horne C<< <njh@nigelhorne.com> >>

=head1 LICENCE AND COPYRIGHT

Copyright 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.
If you use it,
please let me know.

=cut
