#!/usr/bin/env perl
use strict;
use warnings;

# The cross-row pass on a canvas.
#
# A canvas names cs=/by=/order= once, in its own query string.  The pass runs
# once per card, after that card's own filters and after the page's
# cross-filter, so each card's window is over the rows that card is drawn from.
# The fixture makes the three possible answers different numbers:
#
#   all rows (by day)  10, 30, 130, 330
#   North only         10, 30
#   South only         100, 300
#
# A pass shared across the cards would give every card the first row of
# numbers (or, if it ran before the filters, the same totals everywhere), and
# this file exists to keep that from happening.
#
#   prove -l t/canvas-cross-row.t

use Test::More;
use Test::Mojo;
use Mojo::DOM;
use Mojo::File;
use Mojo::JSON qw(encode_json);
use File::Temp qw(tempdir);

my $data_dir  = Mojo::File->new(tempdir(CLEANUP => 1))->to_string;
my $model_dir = Mojo::File->new(tempdir(CLEANUP => 1))->to_string;

Mojo::File->new($data_dir)->child('orders.csv')->spew(join("\n",
	'id,day,region,amount',
	'1,2026-01-01,North,10',
	'2,2026-01-02,North,20',
	'3,2026-01-03,South,100',
	'4,2026-01-04,South,200',
) . "\n");

my $t = Test::Mojo->new('Database::BI', {
	data_dir  => $data_dir,
	model_dir => $model_dir,
});

my $SPEC = {
	name     => 'Cross-row canvas',
	datasets => [ { spec => 'table:orders', alias => 'left' } ],
	visuals  => [
		{ kind => 'table', title => 'All rows',
		  encode => { columns => [qw(day region amount rt)] } },
		{ kind => 'table', title => 'North',
		  encode => { columns => [qw(day region amount rt)] },
		  filters => ['region:eq:North'] },
		{ kind => 'table', title => 'South',
		  encode => { columns => [qw(day region amount rt)] },
		  filters => ['region:eq:South'] },
		# A card that plots the produced column, not just a table that shows
		# it: the aggregation has to fold in Perl, because "rt" exists in no
		# backend.
		{ kind => 'bar', title => 'Running total by region',
		  encode => { cat => 'region', value => 'rt' } },
	],
};

# _card($dom, $n) -> the card element, or undef
sub _card {
	my ($dom, $n) = @_;
	return $dom->at("#visual-$n");
}

# _column($card, $idx) -> arrayref of the $idx-th cell of every table row
sub _column {
	my ($card, $idx) = @_;
	return [] unless $card;
	my @values;
	for my $tr (@{ $card->find('tbody tr')->to_array }) {
		my @cell = map { $_->all_text } @{ $tr->children('td')->to_array };
		push @values, $cell[$idx];
	}
	return \@values;
}

sub _error {
	my ($card) = @_;
	return '' unless $card;
	my $error = $card->at('.visual-error');
	return $error ? $error->all_text : '';
}

my $id = $t->post_ok('/api/analyses',
	{ 'Content-Type' => 'application/json' },
	encode_json($SPEC),
)->status_is(201)->tx->res->json->{id};

ok $id, 'the canvas was saved';

# ---------------------------------------------------------------------------
# One plan, one run per card
# ---------------------------------------------------------------------------

subtest 'each card totals the rows that card shows' => sub {
	$t->get_ok("/a/$id?cs=amount:running_total:rt&order=day")->status_is(200);

	my $dom = Mojo::DOM->new($t->tx->res->body);

	is_deeply _column(_card($dom, 0), 3), [ 10, 30, 130, 330 ],
		'the card with no filters totals every row, in day order';
	is_deeply _column(_card($dom, 1), 3), [ 10, 30 ],
		'the North card totals only North rows, starting again at its first row';
	is_deeply _column(_card($dom, 2), 3), [ 100, 300 ],
		'the South card totals only South rows';

	# The same three answers cannot come from one shared pass: a pass over all
	# rows would end the North card at 130, and a pass over the filterless rows
	# would give the South card 10 and 30.
	unlike join(',', @{ _column(_card($dom, 1), 3) }), qr/\b130\b/,
		'the North card does not carry the other card\'s rows into its total';
};

subtest 'a card can plot the column the pass produced' => sub {
	$t->get_ok("/a/$id?cs=amount:running_total:rt&order=day")->status_is(200);

	my $card = _card(Mojo::DOM->new($t->tx->res->body), 3);
	ok($card->at('svg'), 'the bar card is drawn from the running total column');
	is(_error($card), '', 'and no card reports an unknown column');

	# Without cs= the column does not exist, and the card says so rather than
	# drawing something else: the pass, not a saved field, is what creates it.
	$t->get_ok("/a/$id")->status_is(200);
	like(_error(_card(Mojo::DOM->new($t->tx->res->body), 3)),
		qr/Column not found: rt/, 'without cs= the card names the missing column');
};

# ---------------------------------------------------------------------------
# The cross-filter is part of "this card's rows"
# ---------------------------------------------------------------------------

subtest 'the pass sees the cross-filter, applied per card' => sub {
	$t->get_ok("/a/$id?cs=amount:running_total:rt&order=day&cf=region%3Aeq%3ANorth&cv=0")
		->status_is(200);

	my $dom = Mojo::DOM->new($t->tx->res->body);

	is_deeply _column(_card($dom, 0), 3), [ 10, 30, 130, 330 ],
		'the source card is unfiltered, so its total runs over every row';
	is_deeply _column(_card($dom, 1), 3), [ 10, 30 ],
		'the North card is filtered twice over and still totals its two rows';

	# The South card's own filter and the cross-filter have no row in common:
	# the card has nothing to draw, rather than South totals computed from
	# rows the page is not showing.
	is(_error(_card($dom, 2)), 'No data to display',
		'a card with no rows left reports it instead of a stale total');
};

# ---------------------------------------------------------------------------
# A card added in place is drawn like its neighbours
# ---------------------------------------------------------------------------

subtest 'a card added to the canvas while cs= is on is drawn with it' => sub {
	$t->post_ok("/api/analyses/$id/visuals",
		{ 'Content-Type' => 'application/json' },
		encode_json({
			kind   => 'table',
			title  => 'Added in place',
			encode => { columns => [qw(day region rt)] },
			query  => '?cs=amount:running_total:rt&order=day',
		}),
	)->status_is(201)->json_is('/visual' => 4);

	my $html = $t->tx->res->json->{html};
	my @values = $html =~ m{<td>(-?[\d.]+)</td>}g;
	is_deeply [ @values[ 0 .. 3 ] ], [ 10, 30, 130, 330 ],
		'the new card carries the running total of the rows it draws';
};

# ---------------------------------------------------------------------------
# Refusals belong to the page, not to one card
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# A card's own plan
# ---------------------------------------------------------------------------
#
# The page's cs= is the page's.  A card may bring a plan of its own -- which
# replaces the page's rather than adding to it -- or say that it has none, so a
# canvas of running totals can hold one card of raw numbers.

# _header($card) -> arrayref of the card's column headings
sub _header {
	my ($card) = @_;
	return [] unless $card;
	return [ map { $_->all_text } @{ $card->find('thead th')->to_array } ];
}

my $own = {
	name     => 'Cards with their own cross-row plans',
	datasets => [ { spec => 'table:orders', alias => 'left' } ],
	visuals  => [
		# Its own unpartitioned running total, under a name of its own.
		{ kind => 'table', title => 'Own total',
		  encode => { columns => [qw(day amount total)] },
		  cross_row => { cs => ['amount:running_total:total'], order => ['day'] } },
		# No plan of its own: it runs whatever the page names.
		{ kind => 'table', title => 'Inherits',
		  encode => { columns => [qw(day amount rt)] } },
		# An empty plan: this card has no cross-row column at all.
		{ kind => 'table', title => 'None',
		  encode => { columns => [qw(day amount)] },
		  cross_row => { cs => [] } },
	],
};

my $own_id = $t->post_ok('/api/analyses',
	{ 'Content-Type' => 'application/json' },
	encode_json($own),
)->status_is(201)->tx->res->json->{id};

ok $own_id, 'the canvas with per-card plans was saved';

subtest 'a card runs its own plan, not the page\'s' => sub {
	# The page partitions by region, which would give 10, 30, 100, 300.  The
	# card's own plan does not partition, so its numbers are 10, 30, 130, 330:
	# a card that stacked both plans would have neither set.
	$t->get_ok("/a/$own_id?cs=amount:running_total:rt&by=region&order=day")->status_is(200);

	my $dom = Mojo::DOM->new($t->tx->res->body);

	is_deeply _column(_card($dom, 0), 2), [ 10, 30, 130, 330 ],
		'the card with its own plan totals every row, under its own name';
	is_deeply _header(_card($dom, 0)), [qw(day amount total)],
		'and it does not also gain the page\'s column';

	is_deeply _column(_card($dom, 1), 2), [ 10, 30, 100, 300 ],
		'a card with no plan of its own still runs the page\'s, partition and all';

	is_deeply _header(_card($dom, 2)), [qw(day amount)],
		'a card that says it has none gets no cross-row column';
	is_deeply _column(_card($dom, 2), 1), [ 10, 20, 100, 200 ],
		'and its rows are the plain amounts';
};

subtest 'an own plan survives a reload, and the page need name nothing' => sub {
	$t->get_ok("/a/$own_id")->status_is(200);

	my $dom = Mojo::DOM->new($t->tx->res->body);
	is_deeply _column(_card($dom, 0), 2), [ 10, 30, 130, 330 ],
		'the saved plan is the card\'s, so a bare canvas URL still draws it';
	is_deeply [ grep { defined && length } @{ _column(_card($dom, 1), 2) } ],
		[], 'while the inheriting card has no page plan to inherit, so its rt column is empty';

	$t->get_ok("/api/analyses/$own_id")->status_is(200);
	my $saved = $t->tx->res->json->{visuals}[0]{cross_row};
	is_deeply $saved, { cs => ['amount:running_total:total'], order => ['day'] },
		'and the plan is stored as the URL spells it, so one parser reads both';
};

# ---------------------------------------------------------------------------
# Repairing a saved card's plan
# ---------------------------------------------------------------------------
#
# A plan is stored data like a column, so it can be replaced without deleting
# the card and losing its place on the canvas.  The three states a saved card
# can be in -- a plan of its own, no plan of its own, and a plan that runs
# nothing -- are the three things a repair can ask for.

my $rep = $t->post_ok('/api/analyses',
	{ 'Content-Type' => 'application/json' },
	encode_json({
		name     => 'Repair canvas',
		datasets => [ { spec => 'table:orders', alias => 'left' } ],
		visuals  => [
			{ kind => 'table', title => 'Own',
			  encode => { columns => [qw(day amount total)] },
			  cross_row => { cs => ['amount:running_total:total'], order => ['day'] } },
			{ kind => 'table', title => 'Inherits',
			  encode => { columns => [qw(day amount rt)] } },
		],
	}),
)->status_is(201)->tx->res->json->{id};

ok $rep, 'the canvas to be repaired was saved';

subtest 'a repair replaces the plan and leaves the card where it is' => sub {
	# The card inherited the page's plan and had none of its own; now it has one,
	# without a word about its columns -- the same column, a different function.
	$t->patch_ok("/api/analyses/$rep/visuals/1",
		{ 'Content-Type' => 'application/json' },
		encode_json({ cross_row => { cs => ['amount:rank:rt'], order => ['day'] } }),
	)->status_is(200)
	 ->json_is('/visual' => 1)
	 ->json_is('/kind'   => 'table');

	$t->get_ok("/a/$rep")->status_is(200);
	is_deeply _column(_card(Mojo::DOM->new($t->tx->res->body), 1), 2), [ 4, 3, 2, 1 ],
		'a bare canvas URL now draws the plan the repair wrote';

	# A repair that renames the column the pass produces writes both keys in the
	# one request, so the card is never left drawn against a column the plan no
	# longer makes.
	$t->patch_ok("/api/analyses/$rep/visuals/0",
		{ 'Content-Type' => 'application/json' },
		encode_json({
			encode    => { columns => [qw(day amount rk)] },
			cross_row => { cs => ['amount:running_total:rk'], by => 'region', order => ['day'] },
		}),
	)->status_is(200);

	my $dom = Mojo::DOM->new($t->tx->res->json->{html});
	is_deeply _header($dom), [qw(day amount rk)],
		'the renamed column is what the card now shows';
	is_deeply _column($dom, 2), [ 10, 30, 100, 300 ],
		'and it totals the partition the repair named';

	$t->get_ok("/api/analyses/$rep")->status_is(200);
	is_deeply $t->tx->res->json->{visuals}[0]{cross_row},
		{ cs => ['amount:running_total:rk'], by => 'region', order => ['day'] },
		'both keys are stored as the canvas spells them';
	is(scalar @{ $t->tx->res->json->{visuals} }, 2,
		'the card was changed, not removed and appended');
};

subtest 'a null plan gives the plan up and takes the page\'s again' => sub {
	$t->patch_ok("/api/analyses/$rep/visuals/0",
		{ 'Content-Type' => 'application/json' },
		encode_json({ cross_row => undef }),
	)->status_is(200);

	$t->get_ok("/api/analyses/$rep")->status_is(200);
	my $stored = $t->tx->res->json;
	ok(!exists $stored->{visuals}[0]{cross_row},
		'the card has no plan of its own, rather than a plan that runs nothing');
	is_deeply $stored->{visuals}[0]{encode}, { columns => [qw(day amount rk)] },
		'and giving the plan up did not touch its columns';
	is_deeply $stored->{visuals}[0]{cross_row}, undef,
		'the key is gone, not stored as null';

	# With no plan of its own it runs the page's: a page that ranks shows the rank
	# in the column the card still has, which its old running total did not give.
	$t->get_ok("/a/$rep?cs=amount:rank:rk&order=day")->status_is(200);
	is_deeply _column(_card(Mojo::DOM->new($t->tx->res->body), 0), 2), [ 4, 3, 2, 1 ],
		'the page\'s plan is the card\'s plan again';
};

subtest 'a repair the canvas cannot honour is refused, and keeps the card' => sub {
	$t->patch_ok("/api/analyses/$rep/visuals/1",
		{ 'Content-Type' => 'application/json' },
		encode_json({ cross_row => { cs => ['missing:running_total:rt'], order => ['day'] } }),
	)->status_is(400)
	 ->json_like('/error' => qr/names the column "missing"/);

	$t->get_ok("/api/analyses/$rep")->status_is(200);
	is_deeply $t->tx->res->json->{visuals}[1]{cross_row},
		{ cs => ['amount:rank:rt'], by => '', order => ['day'] },
		'a refused repair left the saved plan alone';

	# The body has to say which of the two things it is changing.
	$t->patch_ok("/api/analyses/$rep/visuals/1",
		{ 'Content-Type' => 'application/json' },
		encode_json({}),
	)->status_is(400)
	 ->json_like('/error' => qr/encode or cross_row must be given/);

	$t->patch_ok("/api/analyses/$rep/visuals/1",
		{ 'Content-Type' => 'application/json' },
		encode_json({ cross_row => 'rank' }),
	)->status_is(400)
	 ->json_like('/error' => qr/cross_row must be an object or null/);

	# A part of the plan that is the wrong kind is said so: storing an empty plan
	# instead would answer 200 and change the card to something nobody asked for.
	$t->patch_ok("/api/analyses/$rep/visuals/1",
		{ 'Content-Type' => 'application/json' },
		encode_json({ cross_row => { cs => 'amount:rank:rt' } }),
	)->status_is(400)
	 ->json_like('/error' => qr/cross_row\.cs must be a list/);

	$t->patch_ok("/api/analyses/$rep/visuals/1",
		{ 'Content-Type' => 'application/json' },
		encode_json({ cross_row => { cs => [] , by => ['region'] } }),
	)->status_is(400)
	 ->json_like('/error' => qr/cross_row\.by must be a column name/);

	$t->get_ok("/api/analyses/$rep")->status_is(200);
	is_deeply $t->tx->res->json->{visuals}[1]{cross_row},
		{ cs => ['amount:rank:rt'], by => '', order => ['day'] },
		'none of the refused repairs changed the card';

	# An empty plan is a choice, not a doubt: it is the card saying it runs no
	# cross-row pass even where the page runs one.
	$t->patch_ok("/api/analyses/$rep/visuals/1",
		{ 'Content-Type' => 'application/json' },
		encode_json({ cross_row => {} }),
	)->status_is(200);

	$t->get_ok("/api/analyses/$rep")->status_is(200);
	is_deeply $t->tx->res->json->{visuals}[1]{cross_row}, { cs => [], by => '', order => [] },
		'an empty plan is stored as the card that runs none';

	$t->get_ok("/a/$rep?cs=amount:rank:rt&order=day")->status_is(200);
	is_deeply [ grep { length } @{ _column(_card(Mojo::DOM->new($t->tx->res->body), 1), 2) } ],
		[], 'and the page\'s plan does not reach it';
};

subtest 'a card plan that cannot be honoured is that card\'s error' => sub {
	my $broken = {
		name     => 'Broken card plans',
		datasets => [ { spec => 'table:orders', alias => 'left' } ],
		visuals  => [
			{ kind => 'table', title => 'Unknown column',
			  encode => { columns => [qw(day x)] },
			  cross_row => { cs => ['nope:running_total:x'], order => ['day'] } },
			{ kind => 'table', title => 'No order',
			  encode => { columns => [qw(day ma3)] },
			  cross_row => { cs => ['amount:window_avg:ma3:3'] } },
		],
	};
	my $bid = $t->post_ok('/api/analyses',
		{ 'Content-Type' => 'application/json' },
		encode_json($broken),
	)->status_is(201)->tx->res->json->{id};

	$t->get_ok("/a/$bid")->status_is(200);
	my $dom = Mojo::DOM->new($t->tx->res->body);

	like(_error(_card($dom, 0)), qr/names the column "nope"/,
		'the card whose own column does not exist names it');
	like(_error(_card($dom, 1)), qr/needs order=/,
		'and the card whose plan reads rows in no order is told what it needs');
	ok($dom->at('#visual-0') && $dom->at('#visual-1'),
		'both cards are still on the page: one bad plan does not take the canvas down');
};

subtest 'a card added with an unworkable plan is refused, not stored' => sub {
	$t->post_ok("/api/analyses/$own_id/visuals",
		{ 'Content-Type' => 'application/json' },
		encode_json({
			kind      => 'table',
			encode    => { columns => [qw(day nope)] },
			cross_row => { cs => ['missing:running_total:nope'], order => ['day'] },
		}),
	)->status_is(400)->json_like('/error' => qr/names the column "missing"/);

	$t->get_ok("/api/analyses/$own_id")->status_is(200);
	is(scalar @{ $t->tx->res->json->{visuals} }, 3,
		'and the canvas still has its three cards');

	# The other half of the choice: the added card says it wants no plan, which
	# is a stored empty plan rather than an absence.
	$t->post_ok("/api/analyses/$own_id/visuals",
		{ 'Content-Type' => 'application/json' },
		encode_json({
			kind      => 'table',
			encode    => { columns => [qw(day amount)] },
			cross_row => { cs => [] },
			query     => '?cs=amount:running_total:rt&order=day',
		}),
	)->status_is(201)->json_is('/visual' => 3);

	my $html = $t->tx->res->json->{html};
	unlike($html, qr/<th>rt<\/th>/,
		'the new card opts out of the page\'s running total');
	like($html, qr/<td>10<\/td>/, 'and shows the plain amounts');
};

subtest 'a card can carry more than one cross-row column' => sub {
	# cs= is repeatable on a page, and a card's plan is the same list: a running
	# total and a rank belong to the one card that asked for them, and the rank
	# reads the same rows the running total does.
	$t->post_ok("/api/analyses/$own_id/visuals",
		{ 'Content-Type' => 'application/json' },
		encode_json({
			kind      => 'table',
			title     => 'Two columns',
			encode    => { columns => [qw(day amount rt rk)] },
			cross_row => {
				cs    => ['amount:running_total:rt', 'amount:rank:rk'],
				order => ['day'],
			},
		}),
	)->status_is(201)->json_is('/visual' => 4);

	my $dom  = Mojo::DOM->new($t->tx->res->json->{html});
	my @rows = map {
		[ map { $_->all_text } @{ $_->children('td')->to_array } ]
	} @{ $dom->find('tbody tr')->to_array };

	is_deeply [ map { $_->[2] } @rows ], [ 10, 30, 130, 330 ],
		'one of the two columns is the running total, in the order the card named';
	is_deeply [ map { $_->[3] } @rows ], [ 4, 3, 2, 1 ],
		'and the other is the rank, largest first';
};

subtest 'the add-view panel offers a plan for the card' => sub {
	$t->get_ok("/a/$own_id")->status_is(200);
	my $dom = Mojo::DOM->new($t->tx->res->body);

	my $mode = $dom->at('#ac-cs-mode');
	ok($mode, 'the panel asks what the card should do about cross-row columns');
	is_deeply [ map { $_->{value} } @{ $mode->find('option')->to_array } ],
		[qw(inherit none own)],
		'with inherit, none and a plan of its own to choose from';

	ok($dom->at('#ac-cs-col'), 'a number column can be chosen');
	my $fns = $dom->at('#ac-cs-fn');
	ok($fns, 'and a function');
	is(scalar @{ $fns->find('option')->to_array }, 11,
		'every function the pass knows is offered');
	is($dom->at('#ac-cs-fn option[data-order="1"]') ? 1 : 0, 1,
		'and the ones that read rows in an order say so');
	ok($dom->at('#ac-cs-window'), 'the window is there for the moving functions');
	ok($dom->at('#ac-cs-alias'), 'as is a name for the new column');
	ok($dom->at('#ac-cs-order') && $dom->at('#ac-cs-dir'),
		'and the column and direction the rows are read in');
	ok($dom->at('#ac-cs-by'), 'and the partition to restart for each');

	# A card may carry several, so the fields describe one at a time and the
	# list holds the ones it will actually get -- each with a way out.
	ok($dom->at('#ac-cs-add'), 'the panel can put a column in the card\'s list');
	my $list = $dom->at('#ac-cs-list');
	ok($list, 'and the columns the card will carry are listed');
	is($list->tag, 'ul', 'as a list, so a reader hears how many there are');
	is($list->attr('aria-labelledby'), 'ac-cs-list-title',
		'named by the heading above it');
	is($dom->at('#ac-cs-list-title')->all_text, 'Columns this card will carry',
		'which says what the list is for');
	like($dom->at('#ac-cs-empty')->all_text, qr/the column described above/,
		'an empty list says the fields are the one column, so one needs no second click');
	like($dom->at('.ac-cs-addrow .ac-note')->all_text, qr/apply to every column/,
		'and the panel says the order and partition cover the whole list');
};

subtest 'the canvas refuses a spec it cannot honour' => sub {
	$t->get_ok("/a/$id?cs=amount:running_total:rt")->status_is(400)
		->content_like(qr/needs order=/,
			'a stream function without order= is refused, naming the need');

	$t->get_ok("/a/$id?cs=missing:running_total:rt&order=day")->status_is(400)
		->content_like(qr/names the column "missing", which is not in this view/,
			'an unknown column is refused once, for the page');

	$t->get_ok("/a/$id?cs=amount:running_total:amount&order=day")->status_is(400)
		->content_like(qr/already a column of this view/,
			'an alias that would shadow a real column is refused');

	$t->get_ok("/a/$id?cs=amount:window_avg:ma3:3&by=region&order=day")->status_is(200)
		->content_like(qr/id="visual-0"/, 'a window over a partition still renders');
};

done_testing();
