use strict;
use warnings;

use Test::More;
use Test::Mojo;
use Mojo::DOM  ();
use Mojo::File ();
use File::Temp ();
use Mojo::Util qw(url_escape);
use DBI ();

use Database::BI::Controller::Dashboard ();

# ---------------------------------------------------------------------------
# Cross-row pass -- Phase 7 item 7.2.
#
# cs=<column>:<function>:<alias>[:<parameter>] writes one row's value from many
# rows: a running total, a moving average, a rank, a share of the whole.  by=
# partitions and order= orders, because the streamstats family reads its rows in
# order and an unordered running total is not a number anybody can act on.
#
# The pass is stage 6 of BI-Phase-7.md's pipeline: after the filters (a window
# is over what the filters left) and before pagination (or page 2 would restart
# every running total).  The page-2 test below is the one that keeps it there.
# ---------------------------------------------------------------------------

# _controller($t, $url) -> a Dashboard controller for that request
#
# build_controller returns the Mojolicious::Controller base, and the pass calls
# helpers on itself, so the controller has to be the real class: construct it
# the way Mojo's own build_controller does.
# The controller holds the transaction weakly, so the test keeps it alive.
my @HOLD;

sub _controller {
	my ($t, $url) = @_;
	my $tx = $t->ua->build_tx(GET => $url);
	push @HOLD, $tx;
	return Database::BI::Controller::Dashboard->new(app => $t->app, tx => $tx);
}

# _pass($c, $records, \@columns) -> ($records, \@columns)
sub _pass {
	my ($c, $records, $columns) = @_;
	return $c->_apply_cross_row($records, $columns);
}

# _vals($fn, \@values, $arg) -> arrayref, the arithmetic of one spec
sub _vals {
	my ($fn, $v, $arg) = @_;
	return [ Database::BI::Controller::Dashboard::_cross_row_values($fn, $v, $arg) ];
}

# _is($got, $want, $name) -> float-tolerant comparison
sub _is {
	my ($got, $want, $name) = @_;
	my $ok = defined $got && defined $want && abs($got - $want) < 1e-9;
	ok($ok, $name) or diag("got " . (defined $got ? $got : 'undef') . ", wanted $want");
}

# --- the functions ---------------------------------------------------------

subtest 'running_total, running_count and running_pct' => sub {
	my @v = (10, 20, undef, 5);

	is_deeply(_vals('running_total', \@v, undef), [10, 30, undef, 35],
		'running_total sums what it has seen, and is undef where the cell is not numeric');
	is_deeply(_vals('running_count', \@v, undef), [1, 2, 3, 4],
		'running_count counts rows, not numbers');
	is_deeply(_vals('running_count', [], undef), [], 'and an empty partition has none');

	my $pct = _vals('running_pct', \@v, undef);
	_is($pct->[0], 10 / 35, 'running_pct is the running total over the partition total');
	_is($pct->[1], 30 / 35, 'at the second row');
	ok(!defined $pct->[2], 'undef where the cell is not numeric');
	_is($pct->[3], 1, 'and it ends at 1');
};

subtest 'window_sum and window_avg' => sub {
	my @v = (10, 20, undef, 5);

	is_deeply(_vals('window_sum', \@v, 2), [10, 30, 20, 5],
		'a window of two sums the last two numeric values, this row included');
	is_deeply(_vals('window_avg', \@v, 2), [10, 15, 20, 5], 'and averages them');

	# A window longer than the partition is the partition.
	is_deeply(_vals('window_avg', [10, 20], 5), [10, 15],
		'a window longer than the partition averages what there is');
	is_deeply(_vals('window_sum', [undef, 4], 3), [undef, 4],
		'and a window with no numeric value is undef');
};

subtest 'lag, delta and pct_change' => sub {
	my @v = (10, 20, undef, 5);

	is_deeply(_vals('lag', \@v, undef), [undef, 10, 20, undef],
		'lag is the previous row, and the first row has none');
	is_deeply(_vals('delta', \@v, undef), [undef, 10, undef, undef],
		'delta is this row less the previous one, undef where either is not numeric');
	is_deeply(_vals('pct_change', \@v, undef), [undef, 1, undef, undef],
		'pct_change is that difference over the previous value');

	my $zero = _vals('pct_change', [0, 5], undef);
	ok(!defined $zero->[1], 'and a previous value of zero has no percentage');
};

subtest 'pct_of_total, rank and zscore' => sub {
	my @v = (10, 20, undef, 5);
	my $share = _vals('pct_of_total', \@v, undef);
	_is($share->[0], 10 / 35, 'pct_of_total is the value over the total');
	ok(!defined $share->[2], 'undef where the cell is not numeric');

	my $sum = 0;
	$sum += $_ for grep { defined } @$share;
	_is($sum, 1, 'so the shares of a partition sum to 1');

	# Ties share a rank and the next rank skips: SQL RANK(), and the reason a
	# reader who knows RANK() will not be surprised by 1, 1, 3.
	is_deeply(_vals('rank', [30, 10, 30, 20], undef), [1, 4, 1, 3],
		'rank counts the values strictly greater, so ties share and skip');

	# mean 5, sample stdev 2.13809... for 2,4,4,4,5,5,7,9
	my $z = _vals('zscore', [2, 4, 4, 4, 5, 5, 7, 9], undef);
	_is($z->[0], (2 - 5) / sqrt(32 / 7), 'zscore standardises against the partition');
	is($z->[4], 0, 'a value at the mean has a z-score of zero');

	my $flat = _vals('zscore', [4, 4, 4], undef);
	ok(!defined $flat->[0], 'and a partition with no spread has no z-score');
	my $one = _vals('zscore', [4], undef);
	ok(!defined $one->[0], 'nor does a partition with one value');
};

# --- the pass itself -------------------------------------------------------

my $data_dir  = Mojo::File->new(File::Temp::tempdir(CLEANUP => 1))->to_string;
my $model_dir = Mojo::File->new(File::Temp::tempdir(CLEANUP => 1))->to_string;

# orders.csv: five orders, four North and ... no: three North, two South, with
# amounts that make every running total, partition total and rank different
# from every other.
my @orders = ('day,region,amount');
push @orders, '2026-01-01,North,10';
push @orders, '2026-01-02,North,20';
push @orders, '2026-01-03,South,30';
push @orders, '2026-01-04,North,40';
push @orders, '2026-01-05,South,50';
Mojo::File->new($data_dir)->child('orders.csv')->spew(join("\n", @orders) . "\n");

# ties.csv: two rows with the same amount, so a rank can be seen to share and
# then skip.
my @ties = ('id,amount');
push @ties, 'a,10';
push @ties, 'b,30';
push @ties, 'c,30';
push @ties, 'd,20';
Mojo::File->new($data_dir)->child('ties.csv')->spew(join("\n", @ties) . "\n");

my $t = Test::Mojo->new('Database::BI', {
	data_dir  => $data_dir,
	model_dir => $model_dir,
});

# _table($body) -> { headers => [...], rows => [[...], ...] }
sub _table {
	my $dom = Mojo::DOM->new($_[0]);
	my $tbl = $dom->at('#bi-table');
	return { headers => [], rows => [] } unless $tbl;
	my $head = $tbl->at('thead');
	my @headers = $head ? map { $_->text } @{ $head->find('th')->to_array } : ();
	my @rows = map {
		[ map { $_->text } @{ $_->find('td')->to_array } ]
	} @{ $tbl->at('tbody')->find('tr')->to_array };
	return { headers => \@headers, rows => \@rows };
}

# _col(\%table, $name) -> index of a column, or -1
sub _col {
	my ($table, $name) = @_;
	my @h = @{ $table->{headers} };
	for my $i (0 .. $#h) {
		return $i if $h[$i] eq $name;
	}
	return -1;
}

subtest 'the pass writes a column onto every row, and appends it to the list' => sub {
	my $c = _controller($t, '/view/orders?cs=amount:running_total:ytd&order=day:asc');

	my @records = map { { %$_ } } (
		{ day => '2026-01-01', region => 'North', amount => 10 },
		{ day => '2026-01-02', region => 'North', amount => 20 },
		{ day => '2026-01-03', region => 'South', amount => 30 },
	);

	my ($out, $cols) = _pass($c, \@records, [qw(day region amount)]);
	is_deeply([@$cols], [qw(day region amount ytd)], 'the produced column is appended to the list');
	is_deeply([map { $_->{ytd} } @$out], [10, 30, 60], 'and written onto every row in order');
	ok($c->stash('_virtual_columns')->{ytd},
		'and registered as virtual, so no backend is asked for a column it has never heard of');
	is_deeply([@{ $c->stash('_cross_row_columns') }], ['ytd'],
		'and named for the routes that ask for their columns after the slice');
};

subtest 'by= partitions, and each partition starts again' => sub {
	my $c = _controller($t,
		'/view/orders?cs=amount:running_total:sub&by=region&order=day:asc');

	my @records = map { { %$_ } } (
		{ day => '2026-01-01', region => 'North', amount => 10 },
		{ day => '2026-01-02', region => 'South', amount => 30 },
		{ day => '2026-01-03', region => 'North', amount => 20 },
	);
	my ($out) = _pass($c, \@records, [qw(day region amount)]);
	is_deeply([map { $_->{sub} } @$out], [10, 30, 30],
		'the North total after the first North row is 10, and the second North row continues it');

	# An empty partition key is a partition, not a row to drop: the pivot drops
	# such rows because a cell needs a label, but a windowed column has to cover
	# every displayed row, so the unlabelled rows add up together.
	my @blank = map { { %$_ } } (
		{ day => '2026-01-01', region => '', amount => 5 },
		{ day => '2026-01-02', region => 'North', amount => 10 },
		{ day => '2026-01-03', amount => 7 },
	);
	my ($blank_out) = _pass($c, \@blank, [qw(day region amount)]);
	is_deeply([map { $_->{sub} } @$blank_out], [5, 10, 12],
		'so the two rows with no region add up together, and neither is dropped');
};

subtest 'order= sorts stably, and numbers sort as numbers' => sub {
	my $c = _controller($t, '/view/orders?cs=amount:running_total:run&order=day:desc');

	my @records = map { { %$_ } } (
		{ day => '2026-01-02', amount => 20 },
		{ day => '2026-01-01', amount => 10 },
		{ day => '2026-01-03', amount => 30 },
	);
	my ($out) = _pass($c, \@records, [qw(day amount)]);
	is_deeply([map { $_->{day} } @$out], [qw(2026-01-02 2026-01-01 2026-01-03)],
		'order= decides the order the pass reads the rows in; it does not reorder the table');
	is_deeply([map { $_->{run} } @$out], [50, 60, 30],
		'so each row carries the total reading 30, then 20, then 10');
};

subtest 'page links join their query correctly, with or without one' => sub {
	my @warnings;
	local $SIG{__WARN__} = sub { push @warnings, @_ };
	$t->get_ok('/view/orders?per_page=2')->status_is(200)
	  ->content_like(qr{href="/view/orders\?page=2&amp;per_page=2"}, 'a bare URL starts its query with ?');
	$t->get_ok('/view/orders?order=day:asc&per_page=2')->status_is(200)
	  ->content_like(qr{href="/view/orders\?order=[^"]*&amp;page=2&amp;per_page=2"}, 'a URL with a query goes on with &');
	$t->get_ok('/view/orders?per_page=2&page=2')->status_is(200)
	  ->content_like(qr{href="/view/orders\?page=3&amp;per_page=2"}, 'and the next link can be followed');
	$t->get_ok('/view/orders?page=3&per_page=2')->status_is(200);
	is_deeply(\@warnings, [], 'no warning about a non-numeric argument');
};

subtest 'the functions reach /view, page after page' => sub {
	$t->get_ok('/view/orders?cs=amount:running_total:ytd&order=day:asc&per_page=2')
		->status_is(200);

	my $p1 = _table($t->tx->res->body);
	my $col = _col($p1, 'ytd');
	ok($col >= 0, 'the table shows the running total as a column of its own');
	is(scalar @{ $p1->{rows} }, 2, 'page one holds two rows');
	is_deeply([ map { $_->[$col] } @{ $p1->{rows} } ], [10, 30],
		'with the running total of the first two orders');

	# The whole point of stage 6 running before the slice: page 2 must carry on,
	# not start again.  A pass applied to the sliced page would show 10 and 40.
	$t->get_ok('/view/orders?cs=amount:running_total:ytd&order=day:asc&per_page=2&page=2')
		->status_is(200);
	my $p2 = _table($t->tx->res->body);
	my $c2 = _col($p2, 'ytd');
	is_deeply([ map { $_->[$c2] } @{ $p2->{rows} } ], [60, 100],
		'and page two continues it rather than restarting');

	$t->get_ok('/view/orders?cs=amount:running_total:ytd&order=day:asc&per_page=2&page=3')
		->status_is(200);
	my $p3 = _table($t->tx->res->body);
	my $c3 = _col($p3, 'ytd');
	is_deeply([ map { $_->[$c3] } @{ $p3->{rows} } ], [150], 'and page three ends at the total');

	# A window is over the rows the filters left, not over the file: the three
	# orders above 20 are 30, 40 and 50, so their running total ends at 120.
	$t->get_ok('/view/orders?f=amount:gt:20&cs=amount:running_total:ytd&order=day:asc')
		->status_is(200);
	my $filtered = _table($t->tx->res->body);
	my $fc = _col($filtered, 'ytd');
	is_deeply([ map { $_->[$fc] } @{ $filtered->{rows} } ], [30, 70, 120],
		'so a filter narrows the window as well as the rows');
};

subtest 'the export carries the same column and the same numbers' => sub {
	$t->get_ok('/export?l=' . url_escape('table:orders')
			. '&cs=' . url_escape('amount:running_total:ytd') . '&order=day:asc')
		->status_is(200)
		->content_type_like(qr/csv/);

	my @lines = split /\r?\n/, $t->tx->res->body;
	my @header = split /,/, $lines[0] // '';
	my ($at) = grep { $header[$_] eq 'ytd' } 0 .. $#header;
	ok(defined $at, 'the export has the running-total column');

	my @col = map { (split /,/, $_)[$at] } grep { length } @lines[1 .. $#lines];
	is_deeply(\@col, [10, 30, 60, 100, 150], 'with the numbers the page shows');
};

subtest 'pct_of_total and rank on the page' => sub {
	$t->get_ok('/view/orders?cs=amount:pct_of_total:share')->status_is(200);
	my $table = _table($t->tx->res->body);
	my $at = _col($table, 'share');
	ok($at >= 0, 'a share column appears without any order= (the eventstats family is order-free)');

	my $total = 0;
	$total += $_->[$at] for @{ $table->{rows} };
	_is($total, 1, 'and the shares of the whole set sum to 1');

	$t->get_ok('/view/ties?cs=amount:rank:place&order=amount:desc')->status_is(200);
	my $ranks = _table($t->tx->res->body);
	my $rcol = _col($ranks, 'place');
	my %rank = map { $_->[0] => $_->[$rcol] } @{ $ranks->{rows} };
	is($rank{b}, 1, 'the highest value ranks 1');
	is($rank{c}, 1, 'a tie shares that rank');
	is($rank{d}, 3, 'and the next rank skips the one the tie used');
	is($rank{a}, 4, 'so four rows give ranks 1, 1, 3, 4');
};

subtest 'a moving average' => sub {
	$t->get_ok('/view/orders?cs=amount:window_avg:ma2:2&order=day:asc')->status_is(200);
	my $table = _table($t->tx->res->body);
	my $at = _col($table, 'ma2');
	ok($at >= 0, 'the window column appears');
	my @got = map { $_->[$at] } @{ $table->{rows} };
	_is($got[0], 10, 'the first window holds one value');
	_is($got[1], 15, 'the second averages 10 and 20');
	_is($got[2], 25, 'and the third averages 20 and 30');
};

subtest 'a cross-row column can be aggregated' => sub {
	# North's running totals are 10, 30 and 70; South's are 30 and 80.  The
	# column is virtual, so the fold has to happen in Perl rather than being
	# pushed to a backend that has never heard of "ytd".
	$t->get_ok('/bar?l=' . url_escape('table:orders') . '&cat=region'
			. '&val=ytd&cs=' . url_escape('amount:running_total:ytd') . '&order=day:asc')
		->status_is(200);

	my $body = $t->tx->res->body;
	# The rows' running totals are 10, 30, 60, 100, 150; North's are the first,
	# second and fourth of those, and South's are the third and fifth.
	# The JSON encoder does not promise a key order, so ask for the pair.
	like($body, qr/(?:"value":140,"label":"North"|"label":"North","value":140)/,
		'North sums the running totals of its rows');
	like($body, qr/(?:"value":210,"label":"South"|"label":"South","value":210)/,
		'and so does South');
};

subtest 'what a run refuses, and with which status' => sub {
	my @cases = (
		[ 'cs=' . url_escape('amount:running_total:ytd'), 400,
			qr/needs order=/, 'the streamstats family without order=' ],
		[ 'cs=' . url_escape('amount:window_avg:ma'), 400,
			qr/takes a whole number/, 'a window function with no window' ],
		[ 'cs=' . url_escape('amount:window_avg:ma:x'), 400,
			qr/takes a whole number/, 'and with a window that is not a number' ],
		[ 'cs=' . url_escape('amount:rank:place:7'), 400,
			qr/takes no parameter/, 'a parameter on a function that takes none' ],
		[ 'cs=' . url_escape('nosuch:rank:place'), 400,
			qr/not in this view/, 'a column that is not in the view' ],
		[ 'cs=' . url_escape('amount:nosuch:place'), 400,
			qr/Unknown cross-row function/, 'an unknown function' ],
		[ 'cs=' . url_escape('amount:rank:amount'), 400,
			qr/already a column/, 'an alias that is already a column' ],
		[ 'cs=' . url_escape('amount:rank:place') . '&by=nosuch', 400,
			qr/by=nosuch names "nosuch"/, 'a partition column that is not in the view' ],
		[ 'cs=' . url_escape('amount:running_total:ytd') . '&order=nosuch', 400,
			qr/order=nosuch names "nosuch"/, 'an order column that is not in the view' ],
		[ 'cs=' . url_escape('amount:running_total:ytd') . '&order=day:sideways', 400,
			qr/must be <column>/, 'a direction that is neither asc nor desc' ],
	);

	for my $case (@cases) {
		my ($query, $status, $pattern, $name) = @$case;
		$t->get_ok("/view/orders?$query")->status_is($status, "$name is a $status")
			->content_like($pattern, "$name says so");
	}

	$t->get_ok('/bar?l=' . url_escape('table:orders') . '&cat=region&val=amount'
			. '&cs=' . url_escape('amount:running_total:ytd'))
		->status_is(400)
		->content_like(qr/needs order=/, 'and an aggregating route refuses it too');

	# The export answers a missing table with a 404, so it has to know that the
	# 400 it has already rendered is the answer, not an empty table.
	$t->get_ok('/export?l=' . url_escape('table:orders')
			. '&cs=' . url_escape('amount:window_avg:x'))
		->status_is(400)
		->content_like(qr/takes a whole number/, 'and the export keeps its 400 rather than turning it into a 404');
};

# --- stage 7: a calculated field over a cross-row column ---------------------

# _csv($body) -> list of { column => value } rows
sub _csv {
	my @lines = split /\r?\n/, $_[0];
	my @names = split /,/, shift(@lines) // '';
	return map { my %r; @r{@names} = split /,/, $_, -1; \%r } @lines;
}

# The running totals, in day order, are 10, 30, 60, 100, 150.
my $YTD = 'cs=' . url_escape('amount:running_total:ytd') . '&order=day:asc';
my $ORDERS = 'l=' . url_escape('table:orders');

subtest 'a calculated field can read a cross-row column' => sub {
	my $half = 'c=' . url_escape('half:ytd/2');
	$t->get_ok("/export?$ORDERS&format=csv&$YTD&$half")->status_is(200);
	is_deeply [ map { $_->{half} } _csv($t->tx->res->body) ], [ 5, 15, 30, 50, 75 ],
		'half of each running total';

	my $quarter = 'c=' . url_escape('quarter_of:half/2');
	$t->get_ok("/export?$ORDERS&format=csv&$YTD&$half&$quarter")->status_is(200);
	is_deeply [ map { $_->{quarter_of} } _csv($t->tx->res->body) ], [ 2.5, 7.5, 15, 25, 37.5 ],
		'and one field can build on another that had to wait';

	$t->get_ok("/export?$ORDERS&format=csv&$YTD&$half&f=" . url_escape('region:eq:North'))->status_is(200);
	is_deeply [ map { $_->{half} } _csv($t->tx->res->body) ], [ 5, 15, 35 ],
		'over the rows the filters left: 10, 30 and 70 halved';

	# North's halves are 5, 15, 50 and South's 30, 75.
	$t->get_ok("/bar?$ORDERS&cat=region&val=half&$YTD&$half")->status_is(200);
	my $body = $t->tx->res->body;
	like $body, qr/(?:"value":70,"label":"North"|"label":"North","value":70)/, 'a chart can plot it';
	like $body, qr/(?:"value":105,"label":"South"|"label":"South","value":105)/, 'for each group';

	$t->get_ok("/pivot?$ORDERS&rows=region&m=" . url_escape('half:sum:total') . "&$YTD&$half")->status_is(200)
		->content_like(qr{<td[^>]*>\s*105\s*</td>}, 'and a pivot can total it');

	$t->get_ok("/view/orders?$YTD&$half&per_page=2&page=2")->status_is(200);
	my $page = _table($t->tx->res->body);
	is_deeply [ map { $_->[ _col($page, 'half') ] } @{ $page->{rows} } ], [ 30, 50 ],
		'the second page of the table goes on from the first';
};

subtest 'holding a field back does not hide a mistake' => sub {
	$t->get_ok("/export?$ORDERS&format=csv&c=" . url_escape('half:ytd/2'))->status_is(400)
		->content_like(qr/Unknown column 'ytd'/, 'with no cs= it is the error it always was');
	$t->get_ok("/export?$ORDERS&format=csv&$YTD&c=" . url_escape('half:ytdd/2'))->status_is(400)
		->content_like(qr/Unknown column 'ytdd'/, 'a mistyped name is still an error with cs=');
	$t->get_ok("/export?$ORDERS&format=csv&$YTD&c=" . url_escape('half:ytd/'))->status_is(400)
		->content_like(qr/Calculated field "half"/, 'and so is a syntax error');
	$t->get_ok("/export?$ORDERS&format=csv&$YTD&c=" . url_escape('half:nosuch(ytd)'))->status_is(400)
		->content_like(qr/Calculated field "half"/, 'and an unknown function');
};

subtest 'nothing is held without a reason' => sub {
	my $c = _controller($t, '/export?c=' . url_escape('twice:amount*2'));
	my $rows = [ { day => '2026-01-01', amount => 10 } ];
	$c->_apply_calc_fields($rows, [qw(day amount)]);
	is_deeply $c->stash('_held_calc_fields'), [], 'no cs=, nothing held';
	is $rows->[0]{twice}, 20, 'and the field ran at once';

	$c = _controller($t, "/export?$YTD&c=" . url_escape('twice:amount*2') . '&c=' . url_escape('half:ytd/2'));
	$rows = [ { day => '2026-01-01', amount => 10 } ];
	$c->_apply_calc_fields($rows, [qw(day amount)]);
	is_deeply [ map { $_->{name} } @{ $c->stash('_held_calc_fields') } ], ['half'],
		'with cs=, only the field that needs its column waits';
	is $rows->[0]{twice}, 20, 'and the other still runs at stage 4';
	ok !exists $rows->[0]{half}, 'the held one has not run';
};

subtest 'on the table page, a cross-row column can read a calculated column' => sub {
	$t->get_ok('/view/orders?cs=' . url_escape('twice:rank:place') . '&c=' . url_escape('twice:amount*2'))
		->status_is(200);
	my $page = _table($t->tx->res->body);
	is_deeply [ map { $_->[ _col($page, 'place') ] } @{ $page->{rows} } ], [ 5, 4, 3, 2, 1 ],
		'a rank of the doubled amounts';
	is_deeply [ map { $_->[ _col($page, 'twice') ] } @{ $page->{rows} } ], [ 20, 40, 60, 80, 100 ],
		'and the column it read';

	$t->get_ok('/view/orders?cs=' . url_escape('twice:rank:place') . '&c=' . url_escape('twice:nosuch*2'))
		->status_is(400)->content_like(qr/Unknown column 'nosuch'/, 'a field that cannot run says so');
	$t->get_ok('/view/orders?span=1x&tcol=day&cs=' . url_escape('amount:rank:place'))
		->status_is(400)->content_unlike(qr/<table/, 'and so does a bucket');
};

# --- the monthly-revenue example, worked by hand ------------------------------
#
#   id  at          product amount  month       ytd  share  rank
#   1   2026-02-03  A       30      2026-02-01   60  1/2    1
#   2   2026-01-20  A       20      2026-01-01   20  1/3    2
#   3   2026-01-05  A       10      2026-01-01   30  1/6    3
#   4   2026-03-01  B       15      2026-03-01   20  3/4    1
#   5   2026-01-10  B        5      2026-01-01    5  1/4    2
#
# The window is read in month order, so product A's February row closes its
# total though it comes first in the file; rows 2 and 3 tie on the month and
# keep file order, which is why 20 is added before 10.
subtest 'the monthly revenue example' => sub {
	Mojo::File->new($data_dir)->child('revenue.csv')->spew(join("\n",
		'id,at,product,amount',
		'1,2026-02-03,A,30',
		'2,2026-01-20,A,20',
		'3,2026-01-05,A,10',
		'4,2026-03-01,B,15',
		'5,2026-01-10,B,5',
	) . "\n");
	my $plan = 'span=1mon&tcol=at&by=product&order=at_span:asc'
		. '&cs=' . url_escape('amount:running_total:ytd')
		. '&cs=' . url_escape('amount:pct_of_total:share')
		. '&cs=' . url_escape('amount:rank:place');
	my %want = (
		at_span => [ qw(2026-02-01 2026-01-01 2026-01-01 2026-03-01 2026-01-01) ],
		ytd     => [ 60, 20, 30, 20, 5 ],
		place   => [ 1, 2, 3, 1, 2 ],
	);
	my @shares = (1/2, 1/3, 1/6, 3/4, 1/4);

	$t->get_ok('/export?l=' . url_escape('table:revenue') . "&format=csv&$plan")->status_is(200);
	my @rows = _csv($t->tx->res->body);
	for my $name (sort keys %want) {
		is_deeply [ map { $_->{$name} } @rows ], $want{$name}, "export: $name";
	}
	_is($rows[$_]{share}, $shares[$_], "export: share of row $_") for 0 .. $#shares;

	$t->get_ok("/view/revenue?$plan")->status_is(200);
	my $page = _table($t->tx->res->body);
	for my $name (sort keys %want) {
		is_deeply [ map { $_->[ _col($page, $name) ] } @{ $page->{rows} } ], $want{$name},
			"table page: $name, the same as the export";
	}
};

# --- a SQL backend ------------------------------------------------------------

subtest 'on a SQLite source, a cross-row column folds in Perl' => sub {
	plan skip_all => 'DBD::SQLite is not available' unless eval { require DBD::SQLite; 1 };
	my $dbh = DBI->connect('dbi:SQLite:dbname=' . Mojo::File->new($data_dir)->child('ledger.sqlite'),
		'', '', { RaiseError => 1, PrintError => 0 });
	$dbh->do('CREATE TABLE ledger (id INTEGER PRIMARY KEY, day TEXT, region TEXT, amount REAL)');
	$dbh->do('INSERT INTO ledger VALUES (?,?,?,?)', undef, @$_) for
		[ 1, '2026-01-01', 'North', 10 ], [ 2, '2026-01-02', 'North', 20 ],
		[ 3, '2026-01-03', 'South', 30 ], [ 4, '2026-01-04', 'North', 40 ],
		[ 5, '2026-01-05', 'South', 50 ];
	$dbh->disconnect;

	my $l = 'l=' . url_escape('table:ledger');
	my $cells = sub {
		my ($url) = @_;
		$t->get_ok($url)->status_is(200);
		return [ map { $_->all_text =~ s/\s+//gr }
			@{ Mojo::DOM->new($t->tx->res->body)->find('table tbody td')->to_array } ];
	};

	# Count what reaches the backend's aggregate, so "never pushed" is observed.
	require Database::BI::Model::DataSource;
	my $pushed = 0;
	my $real = \&Database::BI::Model::DataSource::aggregate;
	no warnings 'redefine';
	local *Database::BI::Model::DataSource::aggregate = sub { $pushed++; return $real->(@_) };

	$cells->("/pivot?$l&rows=region&m=" . url_escape('amount:sum:total'));
	cmp_ok $pushed, '>', 0, 'a source column is pushed, so the count can see a push';

	for my $case (
		[ 'a window column as the measure', "rows=region&m=" . url_escape('ytd:sum:total') ],
		[ 'a window column as the group',   "rows=ytd&m=" . url_escape('amount:sum:total') ],
		[ 'a field over a window column',   "rows=region&m=" . url_escape('half:sum:total') . '&c=' . url_escape('half:ytd/2') ],
	) {
		my ($name, $query) = @$case;
		$pushed = 0;
		my $page = $cells->("/pivot?$l&$query&$YTD");
		is $pushed, 0, "$name never reaches aggregate()";
		ok scalar(@$page), "$name gives a table";
		local $ENV{BI_FORCE_PERL_AGG} = 1;
		is_deeply $cells->("/pivot?$l&$query&$YTD"), $page, "$name: the same with the fold forced";
	}

	$t->get_ok("/export?$l&format=csv&$YTD&c=" . url_escape('half:ytd/2'))->status_is(200);
	is_deeply [ map { $_->{half} } _csv($t->tx->res->body) ], [ 5, 15, 30, 50, 75 ],
		'and the locked rows of a SQL source take the new columns';

	$t->get_ok("/view/ledger?$YTD&per_page=2&page=2&cs=" . url_escape('amount:rank:place') . '&c=' . url_escape('twice:amount*2'))
		->status_is(200);
	my $page = _table($t->tx->res->body);
	is_deeply [ map { $_->[ _col($page, 'ytd') ] } @{ $page->{rows} } ], [ 60, 100 ],
		'the table page works from them too';
};

done_testing;
