package BI::Test::Boundary;

# A stand-in for Nominatim's reverse lookup, for Database::BI::Model::Boundary:
# given areas as boxes, it answers a point with the first box holding it, as
# Nominatim answers with the county a point is in, and with "Unable to
# geocode" elsewhere (the sea).  It records each URL it is asked, and can
# fail every request instead.  No test reaches the network through it.
#
#   my $ua = BI::Test::Boundary->new(areas => [
#       { name => 'Square County', id => 101, box => [ 10, 20, 11, 21 ] },   # south, west, north, east
#       { name => 'Holed County',  id => 102, box => [ ... ], hole => [ ... ] },
#       { name => 'A State',       id => 103, box => [ ... ], rank => 8 },
#   ]);
#   $ua->asked;    # the URLs asked, in order
#
# with_ua($ua, sub { ... }) makes it the user agent Geocode::nominatim_ua()
# hands out, which is the one Boundary asks with, for the length of the block.

use strict;
use warnings;

use HTTP::Response ();
use JSON::PP ();
use URI ();

sub new {
	my ($class, %args) = @_;
	return bless { areas => $args{areas} // [], fail => $args{fail}, asked => [] }, $class;
}

sub asked { return @{ $_[0]->{asked} } }

sub clear { @{ $_[0]->{asked} } = (); return }

# A closed ring round a box, as GeoJSON has it: [lon, lat], first point last.
sub ring {
	my ($south, $west, $north, $east) = @_;
	return [ [ $west, $south ], [ $east, $south ], [ $east, $north ], [ $west, $north ], [ $west, $south ] ];
}

sub _inside {
	my ($box, $lat, $lon) = @_;
	return $lat >= $box->[0] && $lat <= $box->[2] && $lon >= $box->[1] && $lon <= $box->[3];
}

sub get {
	my ($self, $url) = @_;
	push @{ $self->{asked} }, "$url";
	return HTTP::Response->new(500, 'Internal Server Error', [], 'down') if $self->{fail};

	my %query = URI->new($url)->query_form;
	my ($lat, $lon) = @query{qw(lat lon)};
	for my $area (@{ $self->{areas} }) {
		next unless _inside($area->{box}, $lat, $lon);
		next if $area->{hole} && _inside($area->{hole}, $lat, $lon);
		my $polygon = [ ring(@{ $area->{box} }), ($area->{hole} ? ring(@{ $area->{hole} }) : ()) ];
		return _reply({
			category     => 'boundary',
			type         => 'administrative',
			osm_type     => 'relation',
			osm_id       => $area->{id},
			place_rank   => $area->{rank} // 12,
			addresstype  => 'county',
			name         => $area->{name},
			display_name => "$area->{name}, Somewhere",
			geojson      => { type => 'Polygon', coordinates => $polygon },
		});
	}
	return _reply({ error => 'Unable to geocode' });
}

sub _reply {
	return HTTP::Response->new(200, 'OK', [ 'Content-Type' => 'application/json; charset=utf-8' ],
		JSON::PP->new->utf8->canonical->encode($_[0]));
}

sub with_ua {
	my ($ua, $code) = @_;
	require Database::BI::Model::Geocode;
	no warnings qw(redefine);
	local *Database::BI::Model::Geocode::nominatim_ua = sub { $ua };
	return $code->();
}

1;
