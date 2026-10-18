#!/usr/bin/env perl

# The chart controls, driven from the keyboard, in a real browser.
#
# t/model.t and t/function.t prove the pages contain the panels, the export
# buttons and the handlers.  This test presses real keys and follows them all
# the way through: a chart is asked for from the table view's toolbar, chosen
# in the chart panel, submitted with the keyboard, resized with the arrow keys
# on its grip, and exported with Enter - and each step is read back from what
# the browser and the app actually did.
#
# The keys are WebDriver key actions, sent through Firefox's own input stack:
# the toolbar button's Enter is a click, the category select's letter is native
# typeahead and fires its change handler, Tab is the browser moving focus, and
# Enter on the chart's grip is the page's keydown handler.  No KeyboardEvent is
# constructed in the page, so a handler that is wired to the wrong element, or
# to no element, fails here rather than passing on a source-level check.
#
# The chart itself is drawn by D3 from a CDN, which the fixture's proxy prefs
# block: the SVG element is written by the server and is what the resize and
# export controls act on, and the test asserts the controls, not the drawing.
# That keeps the suite running with no network.
#
# The fixture (t/lib/BI/Test/Browser.pm) starts the app, Firefox and Marionette;
# the whole suite runs as
#   prove -l t/browser-*.t
# and skips when there is no Firefox, or when BI_SKIP_BROWSER_TESTS is set.

use strict;
use warnings;

use Test::Most;
use File::Spec ();
use FindBin qw($Bin);
use lib "$Bin/lib";
use JSON::MaybeXS qw(decode_json);

use BI::Test::Browser ();

BI::Test::Browser->plan_browser_tests(required_files => ['data/sales.csv']);

my $browser = BI::Test::Browser->new;
my $BASE    = $browser->base;

# ---------------------------------------------------------------------------
# The chart panel on the table view.  It is opened by the toolbar's own button,
# and the form only submits once a category has been chosen - so the keyboard
# has to reach the select, make a change that the page notices, and then reach
# the Plot button, which is enabled by that change.
# ---------------------------------------------------------------------------
$browser->navigate('/view/sales');
ok $browser->wait_for(sub { $browser->js("return !!document.getElementById('btn-bar');") }),
	'the table view loaded with its chart toolbar';

$browser->focus('#btn-bar');
is $browser->js("return document.activeElement.id;"), 'btn-bar',
	'the Bar chart button takes focus';

$browser->press('Enter');
is $browser->js("return document.getElementById('bar-panel').hidden;"), 0,
	'Enter on the button opened the Bar chart panel';
is $browser->js("return document.getElementById('btn-do-bar').disabled;"), 1,
	'the Plot button is disabled until a category is chosen';
is $browser->js("return document.activeElement.id;"), 'btn-bar',
	'focus stayed on the button that was pressed';

$browser->focus('#bar-cat-sel');
$browser->press('r');
my $category = $browser->wait_for(sub {
	my $value = $browser->js("return document.getElementById('bar-cat-sel').value;");
	return $value if defined $value && $value eq 'region';
	return undef;
}, timeout => 5);

is $category, 'region',
	'typing r chose region in the category select, by native typeahead';
is $browser->js("return document.getElementById('btn-do-bar').disabled;"), 0,
	'the change handler enabled Plot';

# The Tab order of the panel, pressed through the browser: the value select,
# then the sort and orientation selects, then the Top N field, then Plot.
$browser->press('Tab');
is $browser->js("return document.activeElement.id;"), 'bar-val-sel',
	'Tab moved focus to the value select';
$browser->press('Tab');
is $browser->js("return document.activeElement.id;"), 'bar-sort-sel',
	'and on to the sort select';
$browser->press('Tab');
is $browser->js("return document.activeElement.id;"), 'bar-orient-sel',
	'and on to the orientation select';
$browser->press('Tab');
is $browser->js("return document.activeElement.id;"), 'bar-topn-inp',
	'and on to the Top N field';
$browser->press('Tab');
is $browser->js("return document.activeElement.id;"), 'btn-do-bar',
	'and on to the Plot button';

$browser->press('Enter');
my $path = $browser->wait_for(sub {
	my $seen = $browser->js("return location.pathname;");
	return $seen if defined $seen && $seen eq '/bar';
	return undef;
}, timeout => 10);

is $path, '/bar', 'Enter on Plot opened the bar chart';
like $browser->js("return location.search;"), qr/[?&]cat=region(?:&|\z)/,
	'with the category the keyboard chose';
like $browser->js("return location.search;"), qr/[?&]l=table%3Asales(?:&|\z)/,
	'and the table it was asked about';

is $browser->js("return !!document.getElementById('bar_chart');"), 1,
	'the chart page has the SVG element the controls size and export';

# The resize grip is added by the layout's script once the chart is there; the
# size it starts at is whatever the server wrote on the SVG.
my $resize_ready = $browser->wait_for(sub {
	$browser->js("return !!document.querySelector('.chart-resize-handle');") ? 1 : undef;
}, timeout => 10);
ok $resize_ready, 'the chart resize grip was created';

my $geometry = decode_json($browser->js(<<'JS'));
var s  = document.getElementById('bar_chart');
var g  = document.querySelector('.chart-resize-handle');
return JSON.stringify({
	w     : parseFloat(s.getAttribute('width'))  || 0,
	h     : parseFloat(s.getAttribute('height')) || 0,
	max   : Math.max(200, Math.round(document.documentElement.clientWidth)),
	now   : g.getAttribute('aria-valuenow'),
	text  : g.getAttribute('aria-valuetext'),
	min   : g.getAttribute('aria-valuemin'),
	role  : g.getAttribute('role'),
	label : g.getAttribute('aria-label'),
});
JS

is $geometry->{role},  'slider', 'the grip is a slider to a screen reader';
is $geometry->{min},   '200',    'with a minimum width of 200';
is $geometry->{now},   "$geometry->{w}", 'and its value is the width the chart is drawn at';
is $geometry->{text},  "$geometry->{w} pixels wide, $geometry->{h} pixels high",
	'and its value text names both dimensions';

sub grip {
	my $text = $browser->js("return document.querySelector('.chart-resize-handle').getAttribute('aria-valuetext');");
	return defined $text ? $text : '';
}

sub grip_width {
	my $now = $browser->js("return document.querySelector('.chart-resize-handle').getAttribute('aria-valuenow');");
	return defined $now ? $now + 0 : undef;
}

my $width  = $geometry->{w};
my $height = $geometry->{h};
my $max    = $geometry->{max};

$browser->focus('.chart-resize-handle');
is $browser->js("return document.activeElement.getAttribute('class') || '';"),
	'chart-resize-handle', 'the grip takes focus';

# Focusing a control below the fold scrolls it into view; what the arrow keys
# must not do is scroll it further.
my $scroll = $browser->js('return window.scrollY;');

$browser->press('ArrowLeft');
$width -= 10;
is $browser->wait_for(sub { my $w = grip_width(); $w == $width ? $w : undef }, timeout => 5),
	$width, 'ArrowLeft made the chart ten pixels narrower';
is grip(), "$width pixels wide, $height pixels high",
	'and the grip reports both dimensions at the new width';

$browser->press('ArrowLeft', shift => 1);
$width = $width - 50 < 200 ? 200 : $width - 50;
is $browser->wait_for(sub { my $w = grip_width(); $w == $width ? $w : undef }, timeout => 5),
	$width, 'Shift+ArrowLeft made it fifty pixels narrower';

$browser->press('Home');
$width = 200;
is $browser->wait_for(sub { my $w = grip_width(); $w == $width ? $w : undef }, timeout => 5),
	$width, 'Home took it to the narrowest a chart may be';

$browser->press('End');
$width = $max;
is $browser->wait_for(sub { my $w = grip_width(); $w == $width ? $w : undef }, timeout => 5),
	$width, 'End took it to the full width of the window';

$browser->press('ArrowDown');
$height += 10;
is $browser->wait_for(sub { grip() =~ /^\Q$width\E pixels wide, \Q$height\E pixels high$/ ? 1 : undef },
	timeout => 5),
	1, 'ArrowDown made it ten pixels taller, at the width End chose';

$browser->press('ArrowUp');
$height -= 10;
is $browser->wait_for(sub { grip() =~ /^\Q$width\E pixels wide, \Q$height\E pixels high$/ ? 1 : undef },
	timeout => 5),
	1, 'and ArrowUp took the height back';

# The arrow keys are the grip's own keys: with the grip focused they resize the
# chart and do not scroll the page out from under it.
is $browser->js('return window.scrollY;'), $scroll,
	'the arrow keys did not scroll the page while resizing';

# ---------------------------------------------------------------------------
# The export bar, reached with Tab and activated with Enter and Space.  The
# controls are the page's own: the test replaces the anchor click and the
# clipboard write, so nothing is downloaded or copied, and records what the
# page asked for.  What the page serializes is read back from the Blob.
# ---------------------------------------------------------------------------
$browser->navigate('/bar?l=table:sales&cat=region');
$browser->wait_for(sub { $browser->js("return !!document.getElementById('bar_chart');") }, timeout => 10);

# From a fresh page, Tab walks the page's focusable controls in order and
# stops when it reaches Copy link, the last of the export bar.  The export
# buttons have no ids of their own, so they are identified by their labels.
my @focus;
for my $i (1 .. 8) {
	$browser->press('Tab');
	my $active = decode_json($browser->active());
	push @focus, $active;
	last if ($active->{id} // '') eq 'btn-copy-chart-link';
}

my ($svg_at) = grep { ($focus[$_]{text} // '') eq 'Export SVG' } 0 .. $#focus;
ok defined $svg_at, 'Tab reached the Export SVG button';
is $focus[$svg_at + 1]{text}, 'Export PNG', 'the next Tab is Export PNG';
is $focus[$svg_at + 2]{id}, 'btn-copy-chart-link', 'and the next is Copy link';

my $spies = $browser->js(<<'JS');
window.__downloads = [];
window.__copied = null;

/* Keep the Blob the page serialized the chart into, for the test to read. */
window.__blobs = [];
var createObjectURL = URL.createObjectURL;
URL.createObjectURL = function (blob) {
	window.__blobs.push(blob);
	return createObjectURL.call(URL, blob);
};

/* Record what a download would have been; the test does not want a file. */
HTMLAnchorElement.prototype.click = function () {
	window.__downloads.push({ download: this.download, href: this.href });
};

/* Record what the page copied.  The clipboard is not granted in a test, and
 * the question is what the button asked it to hold. */
var clipboard = navigator.clipboard;
var proto = clipboard ? Object.getPrototypeOf(clipboard) : null;
if (proto && proto.writeText) {
	proto.writeText = function (text) {
		window.__copied = String(text);
		return Promise.resolve();
	};
	return 'patched';
}
return 'no clipboard';
JS

is $spies, 'patched', 'the clipboard write can be observed';

$browser->focus('.graph-export-bar button:nth-of-type(1)');
is $browser->js("return document.activeElement.textContent.trim();"), 'Export SVG',
	'focus is on Export SVG';

$browser->press('Enter');
my $svg_download = $browser->wait_for(sub {
	my $json = $browser->js("return JSON.stringify(window.__downloads);");
	my $list = eval { decode_json($json) } || [];
	return $list->[0] if @$list;
	return undef;
}, timeout => 5) || {};

is $svg_download->{download}, 'bar_chart.svg',
	'Enter on Export SVG asked for the SVG download';

my $blob = decode_json($browser->js(<<'JS'));
var blob = window.__blobs && window.__blobs[0];
if (!blob) {
	var list = window.__downloads || [];
	return JSON.stringify({ type: '', head: '', href: list[0] ? list[0].href : '' });
}
return blob.text().then(function (text) {
	return JSON.stringify({ type: blob.type, head: text.slice(0, 60), length: text.length });
});
JS

# The Blob is only readable if the page kept it; the download's href is a blob
# URL, so the handler ran and created one.  Its text starts with the XML
# declaration and contains the chart's own SVG element.
is $blob->{type}, 'image/svg+xml;charset=utf-8',
	'the download is an SVG Blob';
like $blob->{head}, qr{\A<\?xml version="1\.0" encoding="UTF-8"\?>\n<svg },
	'whose text is the serialized chart';
like $svg_download->{href}, qr{\Ablob:}, 'served from a blob URL';

$browser->press('Tab');
is $browser->js("return document.activeElement.textContent.trim();"), 'Export PNG',
	'Tab moved focus to Export PNG';

$browser->press('Enter');
my $png_download = $browser->wait_for(sub {
	my $json = $browser->js("return JSON.stringify(window.__downloads);");
	my $list = eval { decode_json($json) } || [];
	return $list->[1] if @$list > 1;
	return undef;
}, timeout => 10) || {};

is $png_download->{download}, 'bar_chart.png',
	'Enter on Export PNG asked for the PNG download';
like $png_download->{href}, qr{\Adata:image/png;base64,[A-Za-z0-9+/=]+},
	'and the PNG was drawn to a data URL';

$browser->press('Tab');
is $browser->js("return document.activeElement.id;"), 'btn-copy-chart-link',
	'Tab moved focus to Copy link';

# Space, not Enter: a button is activated on keyup by Space and on keydown by
# Enter, and the keyboard has to reach it either way.
$browser->press('Space');
my $copied = $browser->wait_for(sub {
	my $text = $browser->js("return window.__copied;");
	return $text if defined $text && length $text;
	return undef;
}, timeout => 5);

is $copied, $browser->uri('/bar?l=table:sales&cat=region'),
	'Space on Copy link copied the chart page URL';

my $copied_label = $browser->wait_for(sub {
	my $text = $browser->js("return document.getElementById('btn-copy-chart-link').textContent.trim();");
	return $text if defined $text && $text eq 'Copied!';
	return undef;
}, timeout => 5);
is $copied_label, 'Copied!', 'and the button says so';

# ---------------------------------------------------------------------------
# The size outlives the visit.  The keyboard is used to make a size the server
# does not send, so a restored one cannot be the default being read again; then
# the page is opened afresh and the size is read back from the SVG and the grip.
# ---------------------------------------------------------------------------

sub chart_size {
	return decode_json($browser->js(<<'JS'));
var s = document.getElementById('bar_chart');
return JSON.stringify({
	w : parseFloat(s.getAttribute('width')),
	h : parseFloat(s.getAttribute('height')),
});
JS
}

$browser->focus('.chart-resize-handle');
$browser->press('End');
$browser->press('ArrowDown') for 1 .. 3;

my $left = chart_size();

my $stored = $browser->wait_for(sub {
	my $raw = $browser->js("return localStorage.getItem('bi:chart-size:/bar');");
	return undef unless defined $raw && length $raw;
	my $size = eval { decode_json($raw) };
	return undef unless $size && defined $size->{w} && defined $size->{h};
	return $size;
}, timeout => 5);

is_deeply $stored, { w => $left->{w}, h => $left->{h} },
	'the size the keyboard left the page at is written under its own key';
ok !defined $browser->js("return localStorage.getItem('bi:chart-size:/pie');"),
	'and no other kind of chart was given it';

# A fresh visit with a different query string: the size belongs to the kind of
# chart, so changing the filter does not lose it.
$browser->navigate('/bar?l=table:sales&cat=region&val=amount');
ok $browser->wait_for(sub {
	$browser->js("return !!document.querySelector('.chart-resize-handle');") ? 1 : undef;
}, timeout => 10), 'the fresh visit has its grip';

my $restored = decode_json($browser->js(<<'JS'));
var s = document.getElementById('bar_chart');
var g = document.querySelector('.chart-resize-handle');
return JSON.stringify({
	w    : parseFloat(s.getAttribute('width')),
	h    : parseFloat(s.getAttribute('height')),
	now  : g.getAttribute('aria-valuenow'),
	text : g.getAttribute('aria-valuetext'),
});
JS

is $restored->{w}, $left->{w}, 'a fresh visit opens at the width it was left at';
is $restored->{h}, $left->{h}, 'and at the height';
is $restored->{now}, "$left->{w}", 'the grip reports the restored width as its value';
is $restored->{text}, "$left->{w} pixels wide, $left->{h} pixels high",
	'and both restored dimensions are what a screen reader is told';

# ---------------------------------------------------------------------------
# The drag writes the same size.  Real pointer actions, through the browser:
# press on the grip, move it, let go - the page's own mousedown/mousemove/
# mouseup handlers do the rest, and the drop is what may write.
# ---------------------------------------------------------------------------

# Start at the narrowest width, so the grip is well inside the viewport: the
# chart is drawn from the left of its container, so a wide chart puts its own
# grip past the right edge and a pointer cannot be moved there.
$browser->focus('.chart-resize-handle');
$browser->press('Home');
my $before_drag = chart_size();
is $before_drag->{w}, 200, 'Home put the chart at the narrowest width';

my $grip_at = decode_json($browser->js(<<'JS'));
var r = document.querySelector('.chart-resize-handle').getBoundingClientRect();
return JSON.stringify({ x: Math.round(r.left + r.width / 2), y: Math.round(r.top + r.height / 2) });
JS

$browser->client->cmd('WebDriver:PerformActions' => {
	actions => [ {
		type       => 'pointer',
		id         => 'mouse',
		parameters => { pointerType => 'mouse' },
		actions    => [
			{ type => 'pointerMove', duration => 0,   x => $grip_at->{x},       y => $grip_at->{y},       origin => 'viewport' },
			{ type => 'pointerDown', button => 0 },
			{ type => 'pointerMove', duration => 100, x => $grip_at->{x} + 60,  y => $grip_at->{y} + 40,  origin => 'viewport' },
			{ type => 'pointerUp',   button => 0 },
		],
	} ],
});
$browser->client->cmd('WebDriver:ReleaseActions' => {});

my $dragged = chart_size();
is $dragged->{w}, $before_drag->{w} + 60, 'dragging the grip 60px right widened the chart';
is $dragged->{h}, $before_drag->{h} + 40, 'and 40px down made it taller';

my $drag_stored = $browser->wait_for(sub {
	my $raw = $browser->js("return localStorage.getItem('bi:chart-size:/bar');");
	return undef unless defined $raw && length $raw;
	return eval { decode_json($raw) };
}, timeout => 5);

is_deeply $drag_stored, { w => $dragged->{w}, h => $dragged->{h} },
	'letting go of the grip wrote the size it left';

$browser->navigate('/bar?l=table:sales&cat=region&val=amount');
ok $browser->wait_for(sub {
	$browser->js("return !!document.querySelector('.chart-resize-handle');") ? 1 : undef;
}, timeout => 10), 'the page reloads with its grip';

my $drag_back = chart_size();
is $drag_back->{w}, $dragged->{w}, 'and opens at the width the drag left';
is $drag_back->{h}, $dragged->{h}, 'and the height';

done_testing();
