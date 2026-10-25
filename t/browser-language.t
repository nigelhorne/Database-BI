#!/usr/bin/env perl

# The language config key, in a running application.
#
# t/browser-config.t proves the app holds the value it was given, and
# t/browser-fixture.t proves the fixture writes it into the config file.  Neither
# answers the question an operator asks when they set language => 'fr': does the
# application serve pages in it?
#
# Setting the key is not enough to serve a language, which is why this needed the
# fixture to do more than write a value.  The controller resolves a language code
# and then renders templates/<platform>/<code>/, so a code with no directory
# behind it is a page that cannot be found, not a translation, and the
# distribution ships templates/web/en only.  BI::Test::Browser therefore gives the
# app a home for a non-default language: a copy of the templates, with the
# default language copied as the named one, whose pages say which directory they
# came from.
#
# The browser is told to ask for a language the deployment does not ship ('de').
# Accept-Language is tried first and the configured language is what answers when
# the browser names nothing available, so 'fr' on the page can only have come
# from the config key - asking for 'fr' would prove nothing, because the header
# alone would produce it.
#
# The control is the same page with the default language: it must say 'en' and
# carry no marker, or the assertions above would be true of any page at all.
#
#   AUTHOR_TESTING=1 prove -l t/browser-language.t
#
# It skips without AUTHOR_TESTING or without Firefox, like the other
# t/browser-*.t files.

use strict;
use warnings;

use Test::Most;
use File::Spec ();
use File::Temp qw(tempdir);
use JSON::MaybeXS qw(encode_json decode_json);
use Mojo::File qw(path);
use lib 't/lib';
use BI::Test::Browser ();

BI::Test::Browser->plan_browser_tests(required_files => ['templates/web/en/layouts/default.html.tt']);

my $dir = tempdir(CLEANUP => 1);
path(File::Spec->catfile($dir, 'probe_table.csv'))->spurt("id,name\n1,Alpha\n");

# What the app in the child ended up with, read back below.  The home is
# reported because the templates for 'fr' have to be in it for the page to
# render at all - the checkout has no such directory.
my $dump_file = File::Spec->catfile(tempdir(CLEANUP => 1), 'config.json');

my $browser = BI::Test::Browser->new(
	data_dir  => $dir,
	language  => 'fr',
	prefs     => { 'intl.accept_languages' => 'de' },
	app_setup => sub {
		my $app = shift;
		path($dump_file)->spurt(encode_json({
			language => $app->config->{language},
			home     => $app->home->to_string,
			has_templates => (-d $app->home->child('templates/web/fr')->to_string ? 1 : 0),
		}));
	},
);

subtest 'the app runs in the language the test named' => sub {
	ok -f $dump_file, 'the app was built (it wrote its configuration down)';
	my $config = decode_json(path($dump_file)->slurp);

	is $config->{language}, 'fr', 'the app holds the language from its config';
	is $config->{has_templates}, 1,
		'and has a template directory for it, without which every page would be a missing template';
	like $config->{home}, qr{/home\z},
		'from a home the fixture built for it rather than the checkout';

	ok !-d 'templates/web/fr',
		'and nothing was written into the checkout to get there';
};

subtest 'a page is rendered from that language, not the default one' => sub {
	$browser->navigate('/');

	ok $browser->wait_for(sub { $browser->find('.db-card .db-name') }, timeout => 10),
		'the home page renders';

	is $browser->js('return document.documentElement.getAttribute("data-language-dir");'),
		'fr', 'and comes from the fr template directory';

	like $browser->js(
		'return Array.prototype.map.call('
		. 'document.querySelectorAll(".db-card .db-name"),'
		. 'function (n) { return n.textContent.trim(); }).join("|");'
	) // '', qr/probe_table/,
		'with the tables of the directory the test named, so the page is a real one';
};

subtest 'the language the controller resolved is the page\'s language' => sub {
	$browser->navigate('/tutorial');

	ok $browser->wait_for(sub { $browser->find('.tutorial') }, timeout => 10),
		'the tutorial renders';

	# The layout writes the resolved language into <html lang>, and this is the
	# page that passes it: an empty attribute would mean the controller
	# resolved nothing and the template said so.
	is $browser->js('return document.documentElement.lang;'), 'fr',
		'<html lang> is the configured language';

	is $browser->js('return document.documentElement.getAttribute("data-language-dir");'),
		'fr', 'and the page again came from the fr directory';
};

$browser->stop;

# ---------------------------------------------------------------------------
# The control: the same pages with the language the distribution ships.
# ---------------------------------------------------------------------------
my $default = BI::Test::Browser->new(data_dir => $dir);

$default->navigate('/tutorial');
ok $default->wait_for(sub { $default->find('.tutorial') }, timeout => 10),
	'control: the tutorial renders in the default language';

is $default->js('return document.documentElement.lang;'), 'en',
	'control: <html lang> is en, so the assertion above is about the config value';
is $default->js('return document.documentElement.getAttribute("data-language-dir");'),
	undef, 'control: and the marker is only on the fixture\'s copy, so its presence means something';

done_testing();
