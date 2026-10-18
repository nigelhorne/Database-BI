#!/usr/bin/env perl

# The canvas Size menu in a real browser.
#
# t/model.t proves the template emits the menu, the presets and the PATCH
# call; that is a test of the page's source, not of the page.  This test opens
# the canvas in Firefox, focuses one card's Size menu, presses a key, and
# reads back what the browser actually did: the card's computed grid-column
# span, the announcement, the PATCH the page sent, and the layout the server
# stored.
#
# The PATCH is recorded by the app itself, in the server child, before the
# request reaches the controller.  The test makes no request between the page
# loading and the PATCH being counted - the only PATCH it sends is the setup
# layout, before Firefox starts - so a PATCH in the file after that point can
# only have come from the page under test, not from the test pretending to be
# the page.
#
# The app runs in a child process on an ephemeral port with a throwaway
# model_dir, so no analysis is left in the developer's .bi/ store.  Firefox
# runs headless in another child with a throwaway profile, and Marionette on
# an ephemeral port.  The proxy prefs point at a closed port so the page's CDN
# script fails at once instead of waiting on a network this test does not need.
#
#   prove -l t/browser-size.t
#   BI_FIREFOX=/path/to/firefox prove -l t/browser-size.t
#
# Skips when no Firefox is installed.  A Firefox that is installed but will
# not answer on its Marionette port fails the test, printing the browser's
# log, so a broken browser is not mistaken for a machine without one.
# BI_SKIP_BROWSER_TESTS=1 skips the test deliberately.

use strict;
use warnings;

use Test::Most;
use File::Spec ();
use File::Temp    qw(tempdir);
use IO::Select    ();
use IO::Socket::INET ();
use JSON::MaybeXS qw(encode_json decode_json);
use Mojo::Server::Daemon ();
use Mojo::UserAgent      ();
use POSIX qw(_exit WNOHANG);
use Time::HiRes qw(sleep);

plan skip_all => 'BI_SKIP_BROWSER_TESTS is set' if $ENV{BI_SKIP_BROWSER_TESTS};

my $SALES = File::Spec->rel2abs('data/sales.csv');
plan skip_all => 'data/sales.csv not found' unless -f $SALES;

# A Firefox on PATH, or the one BI_FIREFOX names.  firefox-esr is the Debian
# package name; both are the same --marionette browser this test needs.
sub find_firefox {
	return $ENV{BI_FIREFOX}
		if defined $ENV{BI_FIREFOX} && length $ENV{BI_FIREFOX} && -x $ENV{BI_FIREFOX};
	for my $dir (File::Spec->path) {
		next unless defined $dir && length $dir;
		for my $name (qw(firefox firefox-esr)) {
			my $path = File::Spec->catfile($dir, $name);
			return $path if -x $path && !-d $path;
		}
	}
	return undef;
}

my $FIREFOX = find_firefox();
plan skip_all => 'no Firefox found (set BI_FIREFOX to one)' unless $FIREFOX;

# ---------------------------------------------------------------------------
# Children and their cleanup.  The server and the browser outlive no test and
# no assertion: whatever way this file leaves - done, bailed out or skipped -
# both are asked to stop, and the browser first since nothing after it needs
# the app.
# ---------------------------------------------------------------------------
my ($SERVER_PID, $FIREFOX_PID, $CLIENT);

END {
	local $?;
	eval { $CLIENT->close } if $CLIENT;
	stop_process($FIREFOX_PID);
	stop_process($SERVER_PID);
}

sub stop_process {
	my ($pid) = @_;
	return unless defined $pid && $pid > 0;
	kill 'TERM', $pid or return;
	for (1 .. 50) {
		return if waitpid($pid, WNOHANG) == $pid;
		sleep 0.1;
	}
	kill 'KILL', $pid;
	waitpid($pid, 0);
}

sub read_text {
	my ($path) = @_;
	open my $fh, '<', $path or return "(no $path)";
	local $/;
	my $text = <$fh>;
	close $fh;
	$text = '' unless defined $text;
	$text = substr($text, -2000) if length $text > 2000;
	return $text;
}

my $TMP        = tempdir(CLEANUP => 1);
my $MODEL_DIR  = File::Spec->catdir($TMP, 'models');
my $RECORD     = File::Spec->catfile($TMP, 'patches.log');
my $PORT_FILE  = File::Spec->catfile($TMP, 'server.port');
my $SERVER_LOG = File::Spec->catfile($TMP, 'server.log');

# ---------------------------------------------------------------------------
# The app, in a child.  It is the same application the user runs, started the
# same way (Mojo::Server::Daemon), not a Test::Mojo mock: the point of this
# test is the HTTP conversation between a browser and the real routes.
# ---------------------------------------------------------------------------
$SERVER_PID = fork;
die "fork: $!" unless defined $SERVER_PID;

if (!$SERVER_PID) {
	open STDOUT, '>', $SERVER_LOG or _exit(1);
	open STDERR, '>&', \*STDOUT      or _exit(1);

	require Database::BI;
	my $app = Database::BI->new(
		data_dir  => File::Spec->rel2abs('data'),
		model_dir => $MODEL_DIR,
		platform  => 'web',
		language  => 'en',
	);

	# Every layout PATCH, body and all, recorded before the controller can
	# reject or store it.  This is the test's only view of what the page sent;
	# the page's own claim is not evidence.
	$app->hook(before_dispatch => sub {
		my $c = shift;
		return unless $c->req->method eq 'PATCH';
		my $path = $c->req->url->path->to_string;
		return unless $path =~ m{^/api/analyses/};
		open my $fh, '>>', $RECORD or return;
		print {$fh} encode_json({ path => $path, body => $c->req->body // '' }), "\n";
		close $fh;
	});

	my $daemon = Mojo::Server::Daemon->new(
		app    => $app,
		listen => ['http://127.0.0.1:0'],
		silent => 1,
	);
	$daemon->start;
	open my $pfh, '>', $PORT_FILE or _exit(1);
	print {$pfh} $daemon->ports->[0], "\n";
	close $pfh;
	$daemon->run;
	_exit(0);
}

# The daemon binds port 0 and writes the port it was given: asking for a free
# port and then binding it would leave a window in which something else takes
# it, and a test that fails when the machine is busy is not testing the app.
my $BASE;
for (1 .. 200) {
	if (-s $PORT_FILE) {
		open my $pfh, '<', $PORT_FILE or last;
		chomp(my $port = <$pfh>);
		close $pfh;
		$BASE = "http://127.0.0.1:$port" if defined $port && $port =~ /^\d+$/;
		last if $BASE;
	}
	last if waitpid($SERVER_PID, WNOHANG) == $SERVER_PID;
	sleep 0.1;
}

unless ($BASE) {
	diag 'server log: ' . read_text($SERVER_LOG);
	BAIL_OUT('the app did not start on a loopback port');
}

my $ua = Mojo::UserAgent->new;
$ua->request_timeout(10);

my $home_ok;
for (1 .. 100) {
	my $tx = $ua->get("$BASE/");
	if (($tx->res->code // 0) == 200) { $home_ok = 1; last }
	sleep 0.1;
}

unless ($home_ok) {
	diag 'server log: ' . read_text($SERVER_LOG);
	BAIL_OUT('the app did not answer HTTP');
}

# ---------------------------------------------------------------------------
# The canvas: two table visuals, the first half width in row 1, so a single
# step down the Width group is a width the card does not already have.
# ---------------------------------------------------------------------------
my $created = $ua->post(
	"$BASE/api/analyses" => { 'Content-Type' => 'application/json' } => encode_json({
		name     => 'BrowserSize',
		datasets => [ { spec => "path:$SALES", alias => 'left' } ],
		visuals  => [
			{ kind => 'table', encode => {}, title => 'Left'  },
			{ kind => 'table', encode => {}, title => 'Right' },
		],
	})
);
is $created->res->code, 201, 'analysis created for the browser';
my $cid = $created->res->json->{id};
ok $cid, 'analysis has an id' or BAIL_OUT('no analysis id');

my $setup = $ua->patch(
	"$BASE/api/analyses/$cid" => { 'Content-Type' => 'application/json' } => encode_json({
		layout => [
			{ visual => 0, x => 1, y => 1, w => 6, h => 1 },
			{ visual => 1, x => 1, y => 2, w => 6, h => 1 },
		],
	})
);
is $setup->res->code, 200, 'initial half-width layout stored';

# The setup PATCH is the baseline.  Anything in the record after this line was
# sent by the browser.
my @patches = read_patches($RECORD);
is scalar @patches, 1, 'one PATCH recorded before the browser starts';

# ---------------------------------------------------------------------------
# A headless Firefox with its own profile, and Marionette on a port the
# browser is told about in user.js.  Port 0 is not available in a preference,
# so a listener is opened and closed to ask the kernel for one.
# ---------------------------------------------------------------------------
my $marionette = IO::Socket::INET->new(
	LocalAddr => '127.0.0.1',
	LocalPort => 0,
	Listen    => 5,
	Proto     => 'tcp',
	ReuseAddr => 1,
) or BAIL_OUT("could not reserve a Marionette port: $!");
my $MARIONETTE_PORT = $marionette->sockport;
close $marionette;

my $PROFILE = File::Spec->catdir($TMP, 'profile');
mkdir $PROFILE or BAIL_OUT("mkdir $PROFILE: $!");

my $FIREFOX_LOG = File::Spec->catfile($TMP, 'firefox.log');
open my $userjs, '>', File::Spec->catfile($PROFILE, 'user.js')
	or BAIL_OUT("could not write the Firefox profile: $!");
print {$userjs} <<"PREFS";
user_pref("marionette.port", $MARIONETTE_PORT);
user_pref("browser.shell.checkDefaultBrowser", false);
user_pref("browser.startup.page", 0);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("browser.startup.homepage_override.mstone", "ignore");
user_pref("network.proxy.type", 1);
user_pref("network.proxy.http", "127.0.0.1");
user_pref("network.proxy.http_port", 1);
user_pref("network.proxy.ssl", "127.0.0.1");
user_pref("network.proxy.ssl_port", 1);
user_pref("network.proxy.no_proxies_on", "localhost, 127.0.0.1");
PREFS
close $userjs;

$FIREFOX_PID = fork;
die "fork: $!" unless defined $FIREFOX_PID;

if (!$FIREFOX_PID) {
	open STDOUT, '>', $FIREFOX_LOG or _exit(1);
	open STDERR, '>&', \*STDOUT     or _exit(1);
	exec($FIREFOX, '--headless', '--no-remote', '--profile', $PROFILE, '--marionette')
		or _exit(127);
}

for (1 .. 160) {
	$CLIENT = eval { BI::Test::Marionette->new(port => $MARIONETTE_PORT) };
	last if $CLIENT;
	last if waitpid($FIREFOX_PID, WNOHANG) == $FIREFOX_PID;
	sleep 0.25;
}

unless ($CLIENT) {
	diag 'firefox log: ' . read_text($FIREFOX_LOG);
	BAIL_OUT('Firefox did not answer on its Marionette port');
}

my $session = $CLIENT->cmd('WebDriver:NewSession', {});
ok $session->{sessionId}, 'Firefox started a WebDriver session';

$CLIENT->cmd('WebDriver:Navigate', { url => "$BASE/a/$cid" });

my $READY = <<'JS';
var s = document.getElementById('visual-size-0');
return s ? (s.options[s.selectedIndex].textContent || '') : '';
JS

my $ready;
for (1 .. 100) {
	$ready = eval { js_value($READY) };
	last if defined $ready && length $ready;
	sleep 0.1;
}
is $ready, 'Half width, 1 row high',
	'the menu shows the size the card was saved at';

like js_value('return navigator.userAgent;'), qr/Firefox/,
	'the page is running in a real Firefox';

# The page's own view of the card: the span the browser laid out, and the
# option the menu is showing.  The browser resolves the saved style attribute
# and the auto-placement, so this is what the user sees, not what the
# template wrote.
my $STATE = <<'JS';
var card = document.getElementById('visual-0');
var sel  = document.getElementById('visual-size-0');
var cs   = getComputedStyle(card);
return JSON.stringify({
	colStart : cs.gridColumnStart,
	colEnd   : cs.gridColumnEnd,
	rowStart : cs.gridRowStart,
	value    : sel.value,
	summary  : sel.options[sel.selectedIndex].textContent,
	focused  : document.activeElement ? document.activeElement.id : '',
});
JS

my $before = decode_json(js_value($STATE));
is $before->{colEnd},   'span 6',               'card starts half width in the grid';
is $before->{summary},  'Half width, 1 row high', 'the summary describes that span';
is $before->{value},    '',                     'the summary option is the one selected';

# The setup PATCH is still the only one: nothing the page does on load writes
# a layout, so the next PATCH can only come from the choice below.
is scalar(read_patches($RECORD)), 1, 'loading the canvas did not PATCH anything';

# ---------------------------------------------------------------------------
# The one user action: focus the menu and press ArrowDown, which in a closed
# native select moves to the next option and fires change.  One step from
# "Half width" is "Full width", a span the card does not have yet.
# ---------------------------------------------------------------------------
my $element = $CLIENT->cmd(
	'WebDriver:FindElement' => { using => 'css selector', value => '#visual-size-0' }
);
my $eid = $element->{value}{'element-6066-11e4-a52e-4f735466cecf'};
ok $eid, 'Firefox found the Size menu' or BAIL_OUT('could not address the Size menu');

$CLIENT->cmd('WebDriver:ElementSendKeys' => { id => $eid, text => "\x{E015}" });

my $after;
for (1 .. 100) {
	$after = eval { decode_json(js_value($STATE)) };
	last if $after && ($after->{colEnd} // '') eq 'span 12';
	sleep 0.05;
}

$after ||= {};
is $after->{colEnd},   'span 12',  'choosing Full width changed the computed grid-column span';
is $after->{value},    '12',       'the menu stayed on the preset that was chosen';
is $after->{summary},  'Full width', 'the menu reads as the preset';
is $after->{focused},  'visual-size-0', 'focus stayed on the menu';

my $live = js_value("return document.getElementById('canvas-live').textContent;");
like $live, qr/\QLeft is now full width, 1 row high in column 1\E/,
	'the new size is announced as it is made';

# ---------------------------------------------------------------------------
# The write.  saveLayout() debounces by 400ms, so the PATCH is waited for
# rather than assumed; the file is the app's record, written before routing.
# ---------------------------------------------------------------------------
my @sent;
for (1 .. 100) {
	@sent = read_patches($RECORD);
	last if @sent > 1;
	sleep 0.1;
}

is scalar @sent, 2, 'the page sent exactly one PATCH after the choice'
	or diag 'record: ' . read_text($RECORD);

my $patch = $sent[1] || {};
is $patch->{path} // '', "/api/analyses/$cid", 'the PATCH went to this canvas';

my $body = defined $patch->{body} ? eval { decode_json($patch->{body}) } : undef;
ok ref $body eq 'HASH' && ref $body->{layout} eq 'ARRAY',
	'the PATCH body is a layout' or BAIL_OUT('the recorded body is not a layout');

my ($v0) = grep { ($_->{visual} // '') eq '0' } @{ $body->{layout} };
ok $v0, 'the PATCHed layout includes the card that was resized' or BAIL_OUT('card missing');
is $v0->{w}, 12, 'the PATCHed layout has the card full width';
is $v0->{h}, 1,  'the PATCHed layout kept the row height';

# ---------------------------------------------------------------------------
# And the server accepted it: the stored layout, then a reload, which renders
# the size server-side with no JavaScript involved.
# ---------------------------------------------------------------------------
my $stored = $ua->get("$BASE/api/analyses/$cid")->res->json->{layout} || [];
my ($stored_v0) = grep { ($_->{visual} // '') eq '0' } @$stored;
$stored_v0 ||= {};
is $stored_v0->{w}, 12, 'the server stored the width the browser chose';
is $stored_v0->{h}, 1,  'the server stored the row height unchanged';

$CLIENT->cmd('WebDriver:Navigate', { url => "$BASE/a/$cid" });

my $reloaded;
for (1 .. 100) {
	$reloaded = eval { decode_json(js_value($STATE)) };
	last if $reloaded && ($reloaded->{colEnd} // '') eq 'span 12';
	sleep 0.1;
}

$reloaded ||= {};
is $reloaded->{colEnd},  'span 12',               'a reload renders the saved width';
is $reloaded->{summary}, 'Full width, 1 row high', 'a reload reads the saved size back';

is scalar(read_patches($RECORD)), 2,
	'rendering the saved layout does not PATCH it back';

done_testing();

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

sub js_value {
	my ($script) = @_;
	my $result = $CLIENT->js($script);
	return $result ? $result->{value} : undef;
}

sub read_patches {
	return () unless -s $RECORD;
	open my $fh, '<', $RECORD or return ();
	my @rows;
	while (my $line = <$fh>) {
		chomp $line;
		next unless length $line;
		my $row = eval { decode_json($line) };
		push @rows, $row if $row;
	}
	close $fh;
	return @rows;
}

# ---------------------------------------------------------------------------
# The Marionette client: Firefox's own automation protocol, spoken over TCP in
# its length-prefixed JSON framing.  A test of a page in a browser needs a
# browser, and this is the one already on the machine, with no driver binary
# to install and no non-core Perl module to add.
# ---------------------------------------------------------------------------
package BI::Test::Marionette;

use strict;
use warnings;
use JSON::MaybeXS ();

sub new {
	my ($class, %arg) = @_;
	my $sock = IO::Socket::INET->new(
		PeerAddr => '127.0.0.1',
		PeerPort => $arg{port},
		Proto    => 'tcp',
		Timeout  => 10,
	) or die "connect to 127.0.0.1:$arg{port}: $!\n";

	my $self = bless {
		sock => $sock,
		buf  => '',
		id   => 0,
		sel  => IO::Select->new($sock),
	}, $class;

	my $hello = $self->_read;
	die "unexpected Marionette greeting\n" unless ref $hello eq 'HASH';
	$self->{hello} = $hello;
	return $self;
}

sub _read {
	my ($self) = @_;

	while ($self->{buf} !~ /:/) {
		$self->{buf} .= $self->_recv;
	}

	my ($length, $rest) = split /:/, $self->{buf}, 2;
	die "bad Marionette frame length\n" unless defined $length && $length =~ /^\d+$/;

	while (length $rest < $length) {
		$rest .= $self->_recv;
	}

	$self->{buf} = substr($rest, $length);
	return JSON::MaybeXS::decode_json(substr($rest, 0, $length));
}

sub _recv {
	my ($self) = @_;
	unless ($self->{sel}->can_read(60)) {
		die "timed out waiting for Marionette\n";
	}
	my $chunk = '';
	my $n = sysread($self->{sock}, $chunk, 65536);
	die "Marionette connection closed\n" unless defined $n && $n > 0;
	return $chunk;
}

sub cmd {
	my ($self, $name, $params) = @_;
	$params //= {};

	my $id   = ++$self->{id};
	my $json = JSON::MaybeXS::encode_json([0, $id, $name, $params]);
	my $frame = length($json) . ':' . $json;

	my $off = 0;
	while ($off < length $frame) {
		my $wrote = syswrite($self->{sock}, $frame, length($frame) - $off, $off);
		die "Marionette write: $!\n" unless defined $wrote;
		$off += $wrote;
	}

	while (1) {
		my $msg = $self->_read;
		next unless ref $msg eq 'ARRAY'
			&& ($msg->[0] // '') eq '1'
			&& ($msg->[1] // '') eq $id;

		die "$name: " . JSON::MaybeXS::encode_json($msg->[2]) . "\n" if $msg->[2];
		return $msg->[3];
	}
}

sub js {
	my ($self, $script) = @_;
	return $self->cmd('WebDriver:ExecuteScript' => {
		script => $script,
		args   => [],
	});
}

sub close {
	my ($self) = @_;
	return unless $self->{sock};
	close delete $self->{sock};
	$self->{sel} = undef;
	return;
}
