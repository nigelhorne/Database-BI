#!/usr/bin/perl
use strict;
use warnings;

# ---------------------------------------------------------------------------
# Scatter colour-by-series and bubble size (HTML::D3 >= 0.20), over HTTP.
#
# GET /scatter takes series= (one colour per value, with a legend), scheme=
# (the categorical palette for series=), size= (radius by area) and
# min_r=/max_r= (the radius range, clamped to 1..40).  The scatter panel on
# the table page offers all of them.  This suite pins:
#   * series= emits an ordinal colour scale over the distinct values and a
#     legend, and scheme= picks the palette;
#   * scheme= outside the five categorical names is a 400 when series= is
#     set, and is ignored (not even saved in data-chart) when it is not;
#   * size= emits the sqrt radius scale over the observed sizes, and
#     min_r=/max_r= set its range, clamped and reordered;
#   * with none of them the chart is the plain single-colour scatter;
#   * the panel carries the five inputs, and the scheme select offers
#     exactly the five categorical names.
#
# What is NOT here: the drawn SVG needs a browser.
# ---------------------------------------------------------------------------

use Test::Most;
use Test::Mojo;
use File::Temp qw(tempdir);
use Mojo::JSON qw(decode_json);
use Mojo::Util qw(url_escape html_unescape);

my $t = Test::Mojo->new('Database::BI');
$t->app->config->{model_dir} = tempdir(CLEANUP => 1);

plan skip_all => 'data/sales.csv not found' unless -f 'data/sales.csv';

# data/sales.csv: 6 rows; region is North South East West North East;
# amount runs from 725.25 to 2100.
my $BASE = '/scatter?l=' . url_escape('table:sales') . '&x=id&y=amount';

# First colour of each categorical palette, as HTML::D3 writes it.
my %FIRST_COLOUR = (
	tableau10  => '#4e79a7',
	category10 => '#1f77b4',
	set2       => '#66c2a5',
	set3       => '#8dd3c7',
	paired     => '#a6cee3',
);

sub body_of {
	my ($query, $name) = @_;
	$t->get_ok("$BASE$query", $name)->status_is(200);
	return $t->tx->res->body;
}

# The chart_spec the page hands to "Add to canvas".
sub chart_spec_of {
	my ($body) = @_;
	my ($json) = $body =~ /id="new-canvas-panel" data-chart="([^"]*)"/;
	return defined $json ? decode_json(html_unescape($json)) : undef;
}

# The page without its data array, whose key order is random per request.
sub without_data {
	my ($body) = @_;
	$body =~ s/^\s*var data = .*$//m;
	return $body;
}

subtest 'no new parameters: the plain single-colour scatter' => sub {
	my $body = body_of('', 'plain scatter');
	unlike $body, qr/scaleOrdinal/, 'no colour scale';
	unlike $body, qr/legendG/,      'no legend';
	unlike $body, qr/rScale|scaleSqrt/, 'no radius scale';
	like $body, qr/\.attr\("r",\s*5\)/, 'every point has the fixed radius';
	my $spec = chart_spec_of($body);
	ok $spec, 'data-chart is present';
	is_deeply $spec->{encode}, { x => 'id', y => 'amount' }, 'encode has x and y only';
	ok !exists $spec->{options}{scheme}, 'no scheme saved without series=';
};

subtest 'series= colours by region with a legend' => sub {
	my $body = body_of('&series=region', 'series=region');
	my ($names) = $body =~ /var seriesNames = (\[[^\]]*\]);/;
	ok defined $names, 'seriesNames emitted';
	is_deeply [ sort @{ decode_json($names // '[]') } ], [qw(East North South West)],
		'one entry per distinct region';
	like $body, qr/d3\.scaleOrdinal\(\[\s*'\Q$FIRST_COLOUR{tableau10}\E'/,
		'ordinal scale uses tableau10 by default';
	like $body, qr/legendG/, 'legend drawn';
	my $spec = chart_spec_of($body);
	is $spec->{encode}{series}, 'region', 'data-chart records series';
	is $spec->{options}{scheme}, 'tableau10', 'data-chart records the default scheme';
};

subtest 'scheme= picks each categorical palette' => sub {
	for my $scheme (sort keys %FIRST_COLOUR) {
		my $body = body_of("&series=region&scheme=$scheme", "scheme=$scheme");
		like $body, qr/d3\.scaleOrdinal\(\[\s*'\Q$FIRST_COLOUR{$scheme}\E'/,
			"$scheme palette emitted";
		is chart_spec_of($body)->{options}{scheme}, $scheme, "$scheme saved in data-chart";
	}
};

subtest 'scheme= outside the categorical names is refused with series=' => sub {
	for my $bad (qw(Blues YlOrRd Set2 bogus)) {
		$t->get_ok("$BASE&series=region&scheme=$bad")
		  ->status_is(400)
		  ->content_like(qr/Unknown colour scheme: \Q$bad\E/, "$bad named in the 400");
	}
};

subtest 'scheme= without series= changes nothing' => sub {
	my $plain = body_of('', 'plain');
	for my $scheme (qw(set2 Blues)) {
		my $body = body_of("&scheme=$scheme", "scheme=$scheme alone");
		is without_data($body), without_data($plain), "scheme=$scheme alone: page unchanged";
	}
};

subtest 'size= maps radius by area over the observed sizes' => sub {
	my $body = body_of('&size=amount', 'size=amount');
	like $body,
		qr/d3\.scaleSqrt\(\)\.domain\(\[725\.25,\s*2100\]\)\.range\(\[3,\s*15\]\)/,
		'sqrt scale from smallest to largest amount, default range 3..15';
	like $body, qr/rScale\(d\.size\)/, 'radius read through the scale';
	like $body, qr/"size":725\.25/, 'smallest size in the data';
	like $body, qr/"size":2100\b/,  'largest size in the data';
	unlike $body, qr/scaleOrdinal/, 'size= alone does not colour by series';
	my $spec = chart_spec_of($body);
	is $spec->{encode}{size}, 'amount', 'data-chart records size';
};

subtest 'min_r= / max_r= set the radius range' => sub {
	my @cases = (
		[ 'min_r=6&max_r=20', 6,  20, 'explicit range' ],
		[ 'min_r=999',        15, 40, 'min_r clamps to 40, then swaps with max_r' ],
		[ 'max_r=999',        3,  40, 'max_r clamps to 40' ],
		[ 'min_r=-5&max_r=8', 1,  8,  'negative min_r clamps to 1' ],
		[ 'min_r=20&max_r=6', 6,  20, 'min > max is reordered, not refused' ],
		[ 'min_r=&max_r=',    3,  15, 'empty values take the defaults' ],
	);
	for my $c (@cases) {
		my ($q, $lo, $hi, $name) = @$c;
		my $body = body_of("&size=amount&$q", $name);
		like $body, qr/\.range\(\[$lo,\s*$hi\]\)/, "$name: range [$lo,$hi]";
		like $body, qr/rScale\(d\.size\):$lo;/, "$name: a point with no size gets $lo";
	}
};

subtest 'min_r= / max_r= without size= change nothing' => sub {
	my $plain = body_of('', 'plain');
	my $body  = body_of('&min_r=6&max_r=20', 'radius without size');
	is without_data($body), without_data($plain), 'page unchanged';
};

subtest 'series= and size= together' => sub {
	my $body = body_of('&series=region&size=amount&scheme=paired&min_r=4&max_r=12', 'both');
	like $body, qr/d3\.scaleOrdinal\(\[\s*'\Q$FIRST_COLOUR{paired}\E'/, 'paired palette';
	like $body, qr/\.range\(\[4,\s*12\]\)/, 'radius range';
	like $body, qr/legendG/, 'legend';
};

subtest 'unknown series= or size= column is a 400' => sub {
	$t->get_ok("$BASE&series=no_such")->status_is(400)
	  ->content_like(qr/Column not found: no_such/);
	$t->get_ok("$BASE&size=no_such")->status_is(400)
	  ->content_like(qr/Column not found: no_such/);
};

subtest 'the scatter panel offers every parameter' => sub {
	$t->get_ok('/view/sales')->status_is(200);
	my $panel = $t->tx->res->dom->at('#scatter-panel');
	ok $panel, '#scatter-panel present';
	return unless $panel;
	for my $name (qw(x y series size scheme min_r max_r)) {
		ok $panel->at(qq{[name="$name"]}), qq{name="$name" in the panel};
	}

	my $scheme = $panel->at('select[name="scheme"]');
	is_deeply [ map { $_->attr('value') } $scheme->find('option')->each ],
		[qw(tableau10 category10 set2 set3 paired)],
		'scheme select offers exactly the five categorical names';
	ok exists $scheme->attr->{disabled}, 'scheme select starts disabled';

	my $series = $panel->at('select[name="series"]');
	my @series_values = map { $_->attr('value') } $series->find('option')->each;
	is $series_values[0], '', 'colour-by starts with an empty "none" option';
	ok((grep { $_ eq 'region' } @series_values), 'colour-by lists region');

	is $panel->at('select[name="size"] option')->attr('value'), '',
		'bubble size starts with an empty "none" option';

	for my $r ([ min_r => 3 ], [ max_r => 15 ]) {
		my $inp = $panel->at(qq{input[name="$r->[0]"]});
		is $inp->attr('value'), $r->[1], "$r->[0] defaults to $r->[1]";
		is $inp->attr('min'), 1,  "$r->[0] min 1";
		is $inp->attr('max'), 40, "$r->[0] max 40";
		ok exists $inp->attr->{disabled}, "$r->[0] starts disabled";
	}
};

done_testing();
