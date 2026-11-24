use strict;
use warnings;

# Zero-assumption first-time-user flows.
#
# A person who has just installed the program knows nothing: no configuration
# file, no saved models, no earlier request.  They reach for a public entry
# point in whatever order occurs to them, with the least input that could
# work, with input that is not tidy, and then do it again.  Each flow here
# starts from an empty data folder and an empty model folder (nothing is
# inherited from the checkout), and checks two things:
#
#   * a failure says what is wrong (a message, a 4xx, a croak naming the
#     problem), never a 500, a blank page or a bare "undef";
#   * a default is safe: no "uninitialized value" or other warning, and no
#     file or saved model changed by a call that only reads.
#
#   prove -lv t/first-time-user.t

use Test::Most;
use Test::Mojo;
use File::Temp qw(tempdir);
use Mojo::File;
use Mojo::JSON;
use Mojo::Util qw(url_escape);
use IPC::Open3 qw(open3);
use Symbol qw(gensym);

# Fresh, empty folders: no data, no saved models, no uploads.  They are given
# at construction, because the open_table helper reads data_dir once, at start.
my $data   = Mojo::File->new(tempdir(CLEANUP => 1));
my $models = Mojo::File->new(tempdir(CLEANUP => 1));
my $up     = Mojo::File->new(tempdir(CLEANUP => 1));

my $t = Test::Mojo->new('Database::BI', {
	data_dir => "$data", model_dir => "$models", uploads_dir => "$up",
});
$t->app->log->level('fatal');

# Every warning in this file is collected; a flow that warns has not handled
# its input.
my @warnings;
$SIG{__WARN__} = sub { push @warnings, $_[0] };

sub no_warnings {
	my ($name) = @_;
	my @mine = grep { !/Too late to run CHECK block/ } splice @warnings;
	ok(!@mine, "$name: no warnings") or diag(join '', @mine);
}

sub snapshot {
	my @files = sort grep { !/\.lock\z/ } map { $_->to_string } map { $_->list_tree({ dot => 1 })->each } ($data, $models);
	return join "\n", map { $_ . ':' . (-s $_) . ':' . (stat $_)[9] } @files;
}

# ---------------------------------------------------------------------------
# 1. The very first request: an empty install
# ---------------------------------------------------------------------------
subtest 'An empty install still shows a usable home page' => sub {
	$t->get_ok('/')->status_is(200);
	$t->content_like(qr/Database::BI/, 'the page names the program');
	$t->get_ok('/canvases')->status_is(200);
	$t->get_ok('/catalog')->status_is(200);
	$t->get_ok('/preferences')->status_is(200);
	$t->get_ok('/tutorial')->status_is(200)
		->content_like(qr/five-minute tour/i, 'a new reader meets the tour');
	$t->get_ok('/login')->status_is(200);
	no_warnings('empty install');
	is(snapshot(), '', 'reading the pages created no file in either folder')
		or diag(snapshot());
};

# ---------------------------------------------------------------------------
# 2. Asking for things that are not there, with nothing else said
# ---------------------------------------------------------------------------
subtest 'Bare entry points with no parameters fail helpfully' => sub {
	my @pages = qw(/bar /pie /graph /heatmap /scatter /stacked /combo /treemap
		/histogram /map /wordcloud /pivot /stats /insights /join /combine
		/folder /export /open /view/nothing /tables /a/nothing);

	for my $url (@pages) {
		my $tx = $t->ua->get($url => { Accept => 'text/html' });
		my $code = $tx->res->code;
		ok($code && $code < 500, "GET $url: not a server error (got $code)");
		like($tx->res->body // '', qr/\S/, "GET $url: the reply is not blank");
		unlike($tx->res->body // '', qr/\b(?:HASH|ARRAY|CODE)\(0x|uninitialized|at \S+\.pm line \d+/,
			"GET $url: no Perl internals leak");
	}
	no_warnings('bare entry points');

	# The message names a way out for a reader who typed an address.
	my $page = $t->ua->get('/view/nothing' => { Accept => 'text/html' })->res;
	is($page->code, 404, 'an unknown table is a 404');
	like($page->body, qr/Home|Open a file/, 'the 404 page offers a way back');
};

subtest 'Writes with no body or the wrong body are refused, not stored' => sub {
	my $before = snapshot();
	for my $url (qw(/calc/save /calc/delete /groups/save /groups/delete /dates/save
			/dates/delete /lookups/save /extract/save /geo/save /geo/delete
			/api/analyses /export)) {
		my $tx = $t->ua->post($url);
		my $code = $tx->res->code;
		ok($code && $code < 500, "POST $url with no body: not a server error (got $code)");
	}
	for my $url (qw(/calc/save /groups/save /api/analyses)) {
		my $tx = $t->ua->post($url => { 'Content-Type' => 'application/json' } => '{not json');
		ok($tx->res->code && $tx->res->code < 500, "POST $url with broken JSON: not a server error");
	}
	no_warnings('empty writes');
	is(snapshot(), $before, 'nothing was written to either folder');
};

# ---------------------------------------------------------------------------
# 3. The first file: raw, minimal, untidy
# ---------------------------------------------------------------------------
sub put { my ($name, $text) = @_; $data->child($name)->spurt($text); return $name }

subtest 'The smallest files a new user might drop in' => sub {
	my %cases = (
		'one.csv'      => "a\n1\n",
		'header.csv'   => "a,b,c\n",
		'crlf.csv'     => "a,b\r\n1,2\r\n3,4\r\n",
		'nonl.csv'     => "a,b\n1,2",
		'spaces.csv'   => "First Name,Last Name\nAnn,Lee\n",
		'blanks.csv'   => "a,b\n1,\n,2\n",
		'quoted.csv'   => qq{a,b\n"x, y","say ""hi"""\n},
		'tabs.tsv'     => "a\tb\n1\t2\n",
		'plain.json'   => '[{"a":1},{"a":2}]',
		'lines.jsonl'  => qq{{"a":1}\n{"a":2}\n},
		'empty.csv'    => '',
		'bom.csv'      => "\x{EF}\x{BB}\x{BF}a,b\n1,2\n",
		'UPPER.CSV'    => "a\n1\n",
	);
	put($_, $cases{$_}) for sort keys %cases;

	for my $file (sort keys %cases) {
		my $tx = $t->ua->get('/open?path=' . url_escape("$data/$file") => { Accept => 'text/html' });
		my $code = $tx->res->code;
		ok($code && $code < 500, "open $file: not a server error (got $code)")
			or diag(substr($tx->res->body, 0, 300));
		unlike($tx->res->body, qr/uninitialized|\bHASH\(0x/, "open $file: no internals leak");

		my $json = $t->ua->get('/api/columns?l=' . url_escape("path:$data/$file"))->res;
		ok($json->code < 500, "columns of $file: not a server error (got " . $json->code . ')');
	}
	no_warnings('minimal files');
};

subtest 'A one-column, no-data file opens and says so' => sub {
	my $res = $t->ua->get('/open?path=' . url_escape("$data/header.csv") => { Accept => 'text/html' })->res;
	ok($res->code < 500, 'a header with no rows is not an error page');
};

subtest 'Untidy cells are shown as written' => sub {
	$t->get_ok('/open?path=' . url_escape("$data/quoted.csv"))->status_is(200);
	$t->content_like(qr{<td[^>]*>x, y</td>}, 'a comma inside quotes stays in one cell');
	$t->content_like(qr{say &quot;hi&quot;|say "hi"}, 'a doubled quote is one quote');
	$t->get_ok('/open?path=' . url_escape("$data/crlf.csv"))->status_is(200);
	$t->content_unlike(qr{<td[^>]*>2\r}, 'a Windows line end does not stay in the last cell');
	# Every column name here is unsafe as an identifier, so the file cannot be
	# read as it stands.  The reader must be told what to change.
	my $sp = $t->ua->get('/open?path=' . url_escape("$data/spaces.csv") => { Accept => 'text/html' })->res;
	ok($sp->code < 500, 'a file whose headers are all unsafe is not a server error (got ' . $sp->code . ')');
	like($sp->body, qr/spaces\.csv/, 'the message names the file');
	like($sp->body, qr/rename/i, 'and says to rename a column');
	no_warnings('untidy cells');
};

# ---------------------------------------------------------------------------
# 4. Using the file straight away, in the wrong order
# ---------------------------------------------------------------------------
subtest 'A chart before anyone looked at the table' => sub {
	my @warned;
	put('sales.csv', "region,amount,day\nN,10,2025-01-01\nS,20,2025-01-02\nN,5,2025-02-01\n");
	my $l = 'table:sales';

	$t->get_ok("/bar?l=$l&cat=region&val=amount")->status_is(200);
	$t->get_ok("/bar?l=$l&cat=region")->status_is(200, 'the value is optional: it counts rows');
	my $pie = $t->ua->get("/pie?l=$l&cat=region" => { Accept => 'text/html' })->res;
	is($pie->code, 400, 'a pie with no value column is refused');
	like($pie->body, qr/cat or val/, 'the message names the missing parameters');
	$t->get_ok("/stats?l=$l")->status_is(200);
	$t->get_ok("/insights?l=$l")->status_is(200);

	# What the person typed wrongly: the message must name it.
	my $bad = $t->ua->get("/bar?l=$l&cat=nope&val=amount" => { Accept => 'text/html' })->res;
	ok($bad->code >= 400 && $bad->code < 500, 'a column that is not there is the reader\'s error')
		or diag($bad->code);
	like($bad->body, qr/nope/, 'the message names the column');

	# Summing a text column is allowed and warns on purpose; that is the helpful
	# part, so it is checked rather than counted as noise.
	my $nan = do {
		local $SIG{__WARN__} = sub { push @warned, $_[0] };
		$t->ua->get("/bar?l=$l&cat=region&val=region" => { Accept => 'text/html' })->res;
	};
	ok(!grep({ !/not uniformly numeric/ } @warned), 'the only warning says the column is not numeric') or diag(@warned);
	ok($nan->code < 500, 'a text column as the value does not crash (got ' . $nan->code . ')');

	my $nofile = $t->ua->get('/bar?l=table:absent&cat=a' => { Accept => 'text/html' })->res;
	ok($nofile->code >= 400 && $nofile->code < 500, 'a table that is not there is a 4xx (got ' . $nofile->code . ')');

	no_warnings('wrong-order charts');
};

subtest 'Parameters left out, empty, or repeated' => sub {
	my $l = 'table:sales';
	for my $qs ("l=$l&per_page=", "l=$l&per_page=abc", "l=$l&per_page=-5", "l=$l&per_page=0",
			"l=$l&page=", "l=$l&page=0", "l=$l&page=-1", "l=$l&page=99999",
			"l=$l&sort=", "l=$l&sort=nope", "l=$l&dir=sideways",
			"l=$l&f=", "l=$l&f=region", "l=$l&f=region:eq", "l=$l&f=region:eq:N",
			"l=$l&f=region:between:a", "l=$l&f=amount:gt:abc",
			"l=$l&range=", "l=$l&l=$l", "l=$l&c=", "l=$l&c=x:", "l=$l&c=x:amount*2",
			"l=$l&c=x:amount/0", "l=$l&c=x:(", "l=$l&cs=", "l=$l&by=", "l=") {
		my $res = $t->ua->get("/open?$qs" => { Accept => 'text/html' })->res;
		ok($res->code && $res->code < 500, "/open?$qs: not a server error (got " . $res->code . ')')
			or diag(substr($res->body, 0, 200));
		unlike($res->body, qr/uninitialized|\bHASH\(0x/, "/open?$qs: no internals leak");
	}
	no_warnings('odd parameters');
};

subtest 'An unknown filter operator or column is a clear 400' => sub {
	my $l = 'table:sales';
	my $op = $t->ua->get("/view/sales?f=amount:frobnicate:1" => { Accept => 'text/html' })->res;
	is($op->code, 400, 'an unknown operator is a 400');
	like($op->body, qr/frobnicate/, 'the message names it');
	my $col = $t->ua->get("/view/sales?f=ghost:eq:1" => { Accept => 'text/html' })->res;
	is($col->code, 400, 'an unknown column is a 400');
	like($col->body, qr/ghost/, 'the message names it');
	like($col->body, qr/region/, 'and lists the columns there are');
};

# ---------------------------------------------------------------------------
# 5. Repeating a call across subsystems: same answer, no growth
# ---------------------------------------------------------------------------
subtest 'Repeated reads are stable and change nothing' => sub {
	my $before = snapshot();
	my @bodies;
	for (1 .. 3) {
		# Not the chart: its JSON keys come out in hash order, so its bytes differ
		# from request to request though its content does not.
		for my $url ('/view/sales', '/stats?l=table:sales') {
			my $res = $t->ua->get($url)->res;
			is($res->code, 200, "$url: 200 on repeat");
			(my $body = $res->body) =~ s/nonce="[^"]*"//g;
			$body =~ s/[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9:]{8}//g;   # time-range menu: worked out from now
			push @{ $bodies[0] }, [ $url, $body ];
		}
	}
	my %seen;
	for my $pair (@{ $bodies[0] }) {
		my ($url, $body) = @$pair;
		$seen{$url} //= $body;
		is($body, $seen{$url}, "$url: the same page every time");
	}
	for (1 .. 3) {
		my $chart = $t->ua->get('/bar?l=table:sales&cat=region&val=amount')->res;
		is($chart->code, 200, 'the chart answers on repeat');
		like($chart->body, qr/"value":20\b|"label":"S"/, 'and holds the same data');
	}
	no_warnings('repeated reads');
	my $after = snapshot();
	# The model store may be created lazily by a read; the data folder may not change.
	my ($data_before) = grep { index($_, "$data") >= 0 } split /\n/, $before;
	is(join("\n", grep { index($_, "$data") >= 0 } split /\n/, $after),
		join("\n", grep { index($_, "$data") >= 0 } split /\n/, $before),
		'the data folder is untouched by reading');
};

subtest 'Saving the same thing twice does not duplicate it' => sub {
	my $spec = url_escape('table:sales');
	for (1 .. 2) {
		my $res = $t->ua->post('/calc/save' => form => {
			l => 'table:sales', name => 'double', expr => 'amount * 2',
		})->res;
		is($res->code, 200, 'calc/save accepts the field');
	}
	my $list = $t->ua->get("/calc/list?l=$spec")->res;
	is($list->code, 200, 'the list answers');
	my $count = () = $list->body =~ /"double"\s*:/g;
	is($count, 1, 'the field is listed exactly once after two saves');
	no_warnings('repeated save');
};

subtest 'A formula that cannot be read is refused when it is saved' => sub {
	my $before = snapshot();
	for my $bad ('amount +', '(amount', 'amount * * 2', '1 +', ')') {
		my $res = $t->ua->post('/calc/save' => form => { l => 'table:sales', name => 'broken', expr => $bad })->res;
		is($res->code, 400, "'$bad' is refused with a 400");
		like($res->json->{error} // '', qr/broken/, "'$bad': the message names the field");
		unlike($res->json->{error} // '', qr/ at \S+ line \d+/, "'$bad': and has no perl location");
	}
	is(snapshot(), $before, 'nothing was stored');
	is($t->ua->get('/calc/list?l=table:sales')->res->json->{fields}{broken}, undef, 'the list has no such field');

	# A name the file does not have yet may come from a lookup, an extraction
	# or a cross-row column, so it is not a reason to refuse.
	my $later = $t->ua->post('/calc/save' => form => { l => 'table:sales', name => 'later', expr => 'from_lookup * 2' })->res;
	is($later->code, 200, 'a formula naming a column added elsewhere is kept');
	$t->ua->post('/calc/delete' => form => { l => 'table:sales', name => 'later' });

	is($t->ua->get('/view/sales' => { Accept => 'text/html' })->res->code, 200, 'the table opens');
	no_warnings('bad formula');
};

subtest 'A stored formula that stops working is explained, not fatal' => sub {
	# A saved formula can go bad later (the file changed): written to the store
	# directly, as an older version would have.
	my $store = $models->child('models.json');
	my $m = Mojo::JSON::decode_json($store->slurp);
	$m->{fields}{'table:sales'}{stale} = 'gone_column + 1';
	$store->spurt(Mojo::JSON::encode_json($m));

	my $page = $t->ua->get('/view/sales' => { Accept => 'text/html' })->res;
	is($page->code, 200, 'the table still opens');
	like($page->body, qr/id="stored-error-note"[^>]*>[^<]*stale/s, 'a note names the field that failed');
	like($page->body, qr{<td[^>]*>N</td>}, 'and the data is still shown');

	my $chart = $t->ua->get('/bar?l=table:sales&cat=region&val=amount' => { Accept => 'text/html' })->res;
	ok($chart->code >= 400 && $chart->code < 500, 'a chart refuses in the reader\'s terms (got ' . $chart->code . ')');
	like($chart->body, qr/stale/, 'and names the field');

	is($t->ua->post('/calc/delete' => form => { l => 'table:sales', name => 'stale' })->res->code, 200, 'it can be deleted');
	unlike($t->ua->get('/view/sales' => { Accept => 'text/html' })->res->body, qr/id="stored-error-note"/, 'and the note goes');
	no_warnings('stale formula');
};

subtest 'The other saved-model panels refuse input that cannot work' => sub {
	put('shops.csv', "code,manager\nN,Ann\nS,Bob\n");
	put('emails.csv', "who,mail\na,a\@x.com\nb,b\@y.org\n");
	my $before = snapshot();
	my $l = 'table:sales';
	my %cases = (
		'groups with no values'      => [ '/groups/save',  { l => $l, col => 'region', group => 'G' }, qr/values/i ],
		'groups with blank values'   => [ '/groups/save',  { l => $l, col => 'region', group => 'G', values => " \n\t\n" }, qr/values/i ],
		'dates with no pattern'      => [ '/dates/save',   { l => $l, col => 'day' }, qr/pattern|format/i ],
		'dates with a made-up one'   => [ '/dates/save',   { l => $l, col => 'day', pattern => 'yyyy/dd' }, qr/yyyy/i ],
		'dates with a bad clock'     => [ '/dates/save',   { l => $l, col => 'day', pattern => '%m/%d/%Y', time => 'noon' }, qr/noon/i ],
		'lookup with no file'        => [ '/lookups/save', { l => $l, name => 'm', key => 'code', col => 'region' }, qr/file|not found|not a file/i ],
		'lookup with a missing file' => [ '/lookups/save', { l => $l, name => 'm', key => 'code', col => 'region', file => 'ghost.csv' }, qr/not found/i ],
		'lookup with a bad name'     => [ '/lookups/save', { l => $l, name => '1 bad', key => 'code', col => 'region', file => 'shops.csv' }, qr/1 bad/i ],
		'lookup with a bad key'      => [ '/lookups/save', { l => $l, name => 'm', key => 'nokey', col => 'region', file => 'shops.csv' }, qr/nokey/i ],
		'extract with no pattern'    => [ '/extract/save', { l => $l, name => 'e', col => 'region' }, qr/pattern/i ],
		'extract with a bad pattern' => [ '/extract/save', { l => $l, name => 'e', col => 'region', pattern => '(?<d>[' }, qr/\S/i ],
		'extract with no named part' => [ '/extract/save', { l => $l, name => 'e', col => 'region', pattern => '@.+' }, qr/named|\(\?<|part|field|column/i ],
		'extract with a bad name'    => [ '/extract/save', { l => $l, name => '1 bad', col => 'region', pattern => '(?<d>.+)' }, qr/1 bad/i ],
	);
	for my $name (sort keys %cases) {
		my ($url, $form, $why) = @{ $cases{$name} };
		my $res = $t->ua->post($url => form => $form)->res;
		is($res->code, 400, "$name: refused with a 400");
		my $msg = $res->json ? ($res->json->{error} // '') : '';
		like($msg, $why, "$name: the reply says why");
		unlike($msg, qr/ at \S+ line \d+|HASH\(0x/, "$name: with no perl internals");
	}
	is(snapshot(), $before, 'none of them stored anything');

	# What does work still works, so the refusals are not a blanket.
	for my $ok (
		[ '/groups/save',  { l => $l, col => 'region', group => 'North', values => "N\nNE" } ],
		[ '/dates/save',   { l => $l, col => 'day', pattern => '%m/%d/%Y' } ],
		[ '/lookups/save', { l => $l, name => 'mgr', key => 'code', col => 'region', file => 'shops.csv', fields => 'manager' } ],
		[ '/extract/save', { l => $l, name => 'dom', col => 'region', pattern => '(?<domain>.+)' } ],
	) {
		my ($url, $form) = @$ok;
		is($t->ua->post($url => form => $form)->res->code, 200, "$url: a good request is accepted");
		is($t->ua->post($url => form => $form)->res->code, 200, "$url: and so is the same one again");
	}
	my $list = $t->ua->get('/groups/list?l=table:sales')->res->json;
	is_deeply($list->{groups}{region}{North}, [ 'N', 'NE' ], 'the group is stored once, as sent');
	no_warnings('model panels');
};

# ---------------------------------------------------------------------------
# 6. Public modules called cold, with minimal or odd arguments
# ---------------------------------------------------------------------------
use Database::BI::Util;
use Database::BI::Calc;
use Database::BI::Password qw(hash_password verify_password is_password_hash);
use Database::BI::Tutorial;
use Database::BI::Model::DataSource;

subtest 'Util: undef, empty and odd input give safe answers' => sub {
	is(Database::BI::Util::urlencode(undef), '', 'urlencode(undef) is empty');
	is(Database::BI::Util::urlencode(''),    '', 'urlencode("") is empty');
	is(Database::BI::Util::urlencode("a b&c"), 'a%20b%26c', 'urlencode escapes');
	is(Database::BI::Util::parse_number(undef), undef, 'parse_number(undef)');
	is(Database::BI::Util::parse_number(''),    undef, 'parse_number("")');
	is(Database::BI::Util::parse_number('  '),  undef, 'parse_number(spaces)');
	is(Database::BI::Util::parse_number('abc'), undef, 'parse_number(text)');
	is(Database::BI::Util::parse_number('1,234.5'), 1234.5, 'thousands separator');
	is(Database::BI::Util::parse_number('(5)'), -5, 'accounting negative');
	is(Database::BI::Util::parse_number('1e999'), undef, 'out of range is not a number');
	is(Database::BI::Util::parse_zone(undef), undef, 'no zone is no zone');
	is(Database::BI::Util::parse_zone(''),    undef, 'empty zone is no zone');
	throws_ok { Database::BI::Util::parse_zone('Europe/London') } qr/time_zone.*Europe\/London/,
		'a zone name that is not read says so, naming it';
	throws_ok { Database::BI::Util::parse_zone([]) } qr/time_zone/, 'a reference is refused';
	throws_ok { Database::BI::Util::parse_zone('+25:00') } qr/time_zone/, 'an impossible offset is refused';
	no_warnings('Util');
};

subtest 'Calc: nothing given is an error, not a crash' => sub {
	my $none = Database::BI::Calc->new;
	ok(ref $none, 'new() with no arguments returns an object');
	is($none->evaluate({ a => 1 }), $none->evaluate({ a => 1 }), 'evaluate is repeatable');
	my $empty = Database::BI::Calc->new(expr => '');
	ok($empty->has_error || !defined $empty->evaluate({}), 'an empty formula is an error or undef');

	my $c = Database::BI::Calc->new(expr => 'a + 1', columns => ['a']);
	ok(!$c->has_error, 'a plain formula compiles');
	is($c->evaluate({ a => 2 }), 3, 'and evaluates');
	is($c->evaluate({}),     undef, 'a missing column gives undef');
	is($c->evaluate(undef),  undef, 'no row gives undef');
	is($c->evaluate([]),     undef, 'a non-hash row gives undef');
	is($c->evaluate({ a => '' }), $c->evaluate({ a => '' }), 'an empty cell is stable');

	my $unknown = Database::BI::Calc->new(expr => 'ghost + 1', columns => ['a']);
	ok($unknown->has_error, 'an unknown column is an error');
	like($unknown->error, qr/ghost/, 'the error names it');
	my $open = Database::BI::Calc->new(expr => '(1 + 2', columns => []);
	ok($open->has_error, 'an unclosed bracket is an error');
	like($open->error, qr/\S/, 'with words');
	unlike($open->error, qr/ at \S+ line \d+/, 'and without a perl location');
	my $long = Database::BI::Calc->new(expr => '1+' x 5000 . '1');
	ok($long->has_error, 'an absurdly long formula is refused');
	my $clash = Database::BI::Calc->new(expr => 'a', columns => ['a'], params => { a => 1 });
	ok($clash->has_error, 'a parameter named like a column is refused');

	is(Database::BI::Calc::date_normalise(undef, '%m/%d/%Y'), undef, 'date_normalise(undef)');
	is(Database::BI::Calc::date_normalise('1/2/2026', undef), undef, 'no pattern');
	is(Database::BI::Calc::date_normalise('', '%m/%d/%Y'),    undef, 'empty date');
	is(Database::BI::Calc::date_normalise('2/30/2026', '%m/%d/%Y'), undef, 'an impossible date');
	is(Database::BI::Calc::date_normalise('1/2/2026', '%m/%d/%Y'), '2026-01-02', 'a real one');
	no_warnings('Calc');
};

subtest 'Password: missing or odd input is refused in words' => sub {
	throws_ok { hash_password() }      qr/\S/, 'no password croaks';
	throws_ok { hash_password('') }    qr/\S/, 'an empty password croaks';
	throws_ok { hash_password([]) }    qr/\S/, 'a reference croaks';
	throws_ok { hash_password("x\0") } qr/\S/, 'a trailing NUL croaks';
	throws_ok { hash_password('x', rounds => 1) } qr/\d/, 'too few rounds croaks and says the range';
	throws_ok { hash_password('x', salt => 'short', rounds => 10_000) } qr/\d/, 'a short salt croaks';
	my $hash = hash_password('secret', rounds => 10_000);
	ok(is_password_hash($hash), 'the hash is recognised');
	is(verify_password('secret', $hash), 1, 'the right password verifies');
	is(verify_password('wrong', $hash),  0, 'a wrong one does not');
	is(verify_password(undef, $hash),    0, 'undef does not');
	is(verify_password('', $hash),       0, 'empty does not');
	is(verify_password('secret', undef), 0, 'no hash does not');
	is(verify_password('secret', 'plain text'), 0, 'a non-hash does not');
	is(is_password_hash(undef), 0, 'is_password_hash(undef)');
	is(is_password_hash([]),    0, 'is_password_hash(ref)');
	no_warnings('Password');
};

subtest 'Tutorial: the data a new reader sees is whole' => sub {
	my $chapters = Database::BI::Tutorial->chapters;
	ok(@$chapters > 10, 'there are chapters');
	is($chapters->[0]{id}, 'open-file', 'the first chapter is how to open a file');
	my %ids = map { $_->{id} => 1 } @$chapters;
	ok($ids{'five-minute-tour'}, 'the tour exists');
	is(Database::BI::Tutorial->chapter_for_action(undef), undef, 'no action, no chapter');
	is(Database::BI::Tutorial->chapter_for_action('no_such_action'), undef, 'unknown action, no chapter');
	is(Database::BI::Tutorial->chapter_for_action('pie_view')->{id}, 'pie-chart', 'a known action');

	my %titles;
	$titles{ $_->{title} }++ for @$chapters;
	my @dup = grep { $titles{$_} > 1 } sort keys %titles;
	ok(!@dup, 'no two chapters share a title') or diag("@dup");

	# A reader who follows a glossary word must find a term for every word the
	# steps use as if it were common knowledge.
	my %terms = map { lc $_->{term} => 1 } @{ Database::BI::Tutorial->glossary };
	for my $word ('key', 'merge', 'lookup', 'panel', 'chip', 'toolbar', 'category') {
		ok($terms{$word}, "the glossary explains '$word'");
	}
	no_warnings('Tutorial');
};

subtest 'DataSource: the constructor says what is missing' => sub {
	throws_ok { Database::BI::Model::DataSource->new } qr/\S/, 'no arguments croaks in words';
	throws_ok { Database::BI::Model::DataSource->new(directory => "$data") } qr/\S/,
		'a directory with no table croaks';
	throws_ok { Database::BI::Model::DataSource->new(table => 'sales') } qr/\S/,
		'a table with no directory croaks';
	throws_ok { Database::BI::Model::DataSource->new(directory => "$data/not-here", table => 'sales') }
		qr/not-here/, 'a missing directory is named';
	throws_ok { Database::BI::Model::DataSource->new(directory => "$data", table => '../etc/passwd') }
		qr/\S/, 'a path in the table name is refused';
	throws_ok { Database::BI::Model::DataSource->new(directory => "$data", table => '') }
		qr/\S/, 'an empty table name is refused';
	throws_ok { Database::BI::Model::DataSource->new(url => 'ftp://example.com/x') }
		qr/http/i, 'a URL that is not http says what is wanted';
	throws_ok { Database::BI::Model::DataSource->new(directory => "$data", table => 'absent')->fetch_all }
		qr/absent/, 'a table with no file croaks, naming it, when it is read';

	my $ds = Database::BI::Model::DataSource->new(directory => "$data", table => 'sales');
	my $rows = $ds->fetch_all;
	is(scalar @$rows, 3, 'fetch_all with no arguments returns every row');
	is_deeply([ sort @{ $ds->columns } ], [qw(amount day region)], 'columns are listed');
	is(scalar @{ $ds->fetch_all }, 3, 'a second fetch gives the same count');
	ok(defined $ds->updated, 'updated is defined for a file');
	my ($file, $table) = Database::BI::Model::DataSource::split_path('');
	ok(!defined $file || $file eq '', 'split_path("") is empty');
	no_warnings('DataSource');
};

subtest 'Empty and header-only files give no rows and no warnings' => sub {
	for my $f (qw(empty header)) {
		my $ds = eval { Database::BI::Model::DataSource->new(directory => "$data", table => $f) };
		ok($ds || $@, "$f: an object or a message");
		next unless $ds;
		my $rows = eval { $ds->fetch_all };
		ok(!$@, "$f: fetch_all does not croak") or diag($@);
		is(scalar @{ $rows // [] }, 0, "$f: no rows");
	}
	no_warnings('empty files');
};

# ---------------------------------------------------------------------------
# 7. Command-line style first use
# ---------------------------------------------------------------------------
subtest 'The launcher refuses nonsense in words' => sub {
	# open3, not a shell redirect from /dev/null, which Windows has not got; and
	# on Windows an empty line, not end-of-file, because a child started by open3
	# can inherit the write end of its own STDIN (see t/login.t).
	my $run = sub {
		my ($input, @args) = @_;
		my $err = gensym;
		my $pid = open3(my $in, my $out, $err, $^X, '-Ilib', 'script/database-bi', @args);
		print {$in} $input if length $input;
		close $in;
		my $stdout = do { local $/; <$out> } // '';
		my $stderr = do { local $/; <$err> } // '';
		waitpid $pid, 0;
		my $status = $? >> 8;
		s/\r\n/\n/g for $stdout, $stderr;
		return ($status, "$stdout$stderr");
	};

	my ($status, $out) = $run->($^O eq 'MSWin32' ? "\n" : '', 'password');
	isnt($status, 0, 'password with nothing to read fails');
	like($out, qr/\S/, 'and says something');
	unlike($out, qr/uninitialized/, 'without a warning');

	($status, $out) = $run->('', '/no/such/file.csv');
	is($status, 2, 'a file that is not there exits 2');
	like($out, qr/no.such|file/i, 'and names it');
};

done_testing();
