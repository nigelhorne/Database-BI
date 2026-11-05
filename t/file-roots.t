#!/usr/bin/env perl

# file_roots: the folders a reader may browse, open files in and export to.
# Unset, the whole filesystem (as before); set, every route that takes a local
# path keeps to them, and data_dir and uploads_dir are always among them.
#
#   prove -l t/file-roots.t

use strict;
use warnings;

use Test::Most;
use Test::Mojo;

use File::Temp qw(tempdir);
use Mojo::File;
use Mojo::Util qw(url_escape);

my $root  = Mojo::File->new(tempdir(CLEANUP => 1))->realpath;
my $out   = Mojo::File->new(tempdir(CLEANUP => 1))->realpath;
my $inner = $root->child('sub');
mkdir $inner->to_string or BAIL_OUT("cannot make $inner: $!");
Mojo::File->new('data/sales.csv')->copy_to($inner->child('in.csv'));
# What only the file outside holds, so a page that shows it is caught.
$out->child('out.csv')->spew("id,region,amount,secret\n1,North,5,TOPSECRET\n2,South,7,TOPSECRET\n");
my $HTML = { Accept => 'text/html' };
my $e    = sub { url_escape(shift) };

sub app_with {
	my (%config) = @_;
	return Test::Mojo->new('Database::BI', { model_dir => tempdir(CLEANUP => 1), %config });
}

my $t = app_with(file_roots => ["$root"]);

subtest 'unset: the whole filesystem, as before' => sub {
	my $u = app_with();
	$u->get_ok('/api/dirs?path=' . $e->("$out"))->status_is(200);
	$u->get_ok('/open?path=' . $e->("$out/out.csv"))->status_is(200);
	app_with(file_roots => [])->get_ok('/api/dirs?path=' . $e->("$out"))->status_is(200, '[] too');
};

subtest 'the folder picker' => sub {
	$t->get_ok('/api/dirs')->status_is(200)->json_is('/path' => "$root", 'with no path=, the first root')
		->json_is('/parent' => undef, 'and no way above it')->json_is('/dirs/0/name' => 'sub');
	$t->get_ok('/api/dirs?path=' . $e->("$inner"))->status_is(200)->json_is('/parent' => "$root");
	for my $path ('/etc', "$out", '/no/such/folder', "$inner/../..", "$root/../" . $out->basename) {
		$t->get_ok('/api/dirs?path=' . $e->($path))->status_is(403, "not $path")
			->json_like('/error' => qr/outside the folders this server may use \(file_roots/);
	}
	$t->get_ok('/api/dirs?path=' . $e->("$root/no/such"))->status_is(404, 'inside, what is not there is not found');
	is $t->get_ok('/api/dirs?path=' . $e->('/no/such/folder'))->tx->res->code,
		$t->get_ok('/api/dirs?path=' . $e->('/etc'))->tx->res->code,
		'something that is not there is refused as something that is, so nothing is learnt';
};

subtest 'browsing' => sub {
	$t->get_ok('/browse', $HTML)->status_is(200)->text_like('title' => qr/Browse/);
	$t->get_ok('/browse?path=' . $e->("$inner"), $HTML)->status_is(200);
	my @up = map { $_->attr('href') } $t->tx->res->dom->find('a[href^="/browse?path="]')->each;
	ok @up, 'links up the tree';
	ok !(grep { my ($p) = m{path=(.*)}; Mojo::Util::url_unescape($p) !~ /\A\Q$root\E/ } @up),
		'none above the root' or diag explain \@up;
	$t->get_ok('/browse?path=/etc', $HTML)->status_is(403)->text_like('h1' => qr/not available here/)
		->text_like('.not-found-msg' => qr{"/etc" is outside});
	$t->get_ok('/browse?path=%3Cb%3Ex%3C%2Fb%3E', $HTML)->status_is(403)->content_unlike(qr/<b>x<\/b>/,
		'the path is shown escaped');
};

subtest 'opening files' => sub {
	$t->get_ok('/open?path=' . $e->("$inner/in.csv"), $HTML)->status_is(200, 'inside');
	$t->get_ok('/open?path=' . $e->("$out/out.csv"), $HTML)->status_is(403, 'outside');
	$t->get_ok('/open?path=' . $e->("$out/out.csv"))->status_is(403)->content_type_like(qr{text/plain}, 'as text to a script');
	$t->get_ok('/view/sales')->status_is(200, 'data_dir is always a root');
	$t->get_ok('/bar?l=' . $e->("path:$inner/in.csv") . '&cat=region&val=amount')->status_is(200, 'a chart of a file inside');
	$t->get_ok('/bar?l=' . $e->("path:$out/out.csv") . '&cat=secret&val=amount')->status_is(404, 'one outside is not found')
		->content_unlike(qr/TOPSECRET/);
	$t->get_ok('/join?l=' . $e->("path:$inner/in.csv") . '&j=' . $e->("path:$out/out.csv|id|id"));
	unlike $t->tx->res->body, qr/TOPSECRET/, 'nor can it be merged in (the step is skipped, as for a missing file)';
	app_with()->get_ok('/join?l=' . $e->("path:$inner/in.csv") . '&j=' . $e->("path:$out/out.csv|id|id"))
		->content_like(qr/TOPSECRET/, '... which without file_roots it can');
	$t->get_ok('/api/columns?spec=' . $e->("path:$out/out.csv"))->status_is(403);
	$t->get_ok('/api/columns?spec=' . $e->("path:$inner/in.csv"))->status_is(200);
	$t->get_ok('/api/stat?path=' . $e->("$out/out.csv"))->status_is(200)->json_is('/exists' => 0, 'stat says nothing');
	$t->get_ok('/api/stat?path=' . $e->("$inner/in.csv"))->json_is('/exists' => 1);
	$t->get_ok('/tables?l=' . $e->('path:/no/such.db'), $HTML)->status_is(403);

	SKIP: {
		skip 'no symlinks here', 2 unless eval { symlink("$out/out.csv", "$root/link.csv") };
		$t->get_ok('/open?path=' . $e->("$root/link.csv"))->status_is(403, 'a link inside to a file outside is outside');
	}
};

subtest 'saving' => sub {
	$t->post_ok('/export' => form => { l => "path:$inner/in.csv", dir => "$out", filename => 'x.csv' })
		->status_is(403)->json_like('/error' => qr/outside the folders/);
	ok !-e "$out/x.csv", 'nothing written outside';
	$t->post_ok('/export' => form => { l => "path:$inner/in.csv", dir => "$inner", filename => 'x.csv' })->status_is(200);
	ok -e "$inner/x.csv", 'written inside';
};

subtest 'a canvas' => sub {
	$t->post_ok('/api/analyses' => json => {
		name     => 'Outside',
		datasets => [ { spec => "path:$out/out.csv" } ],
		visuals  => [ { kind => 'bar', encode => { cat => 'region', value => 'amount' } } ],
	});
	my $id = $t->tx->res->json->{id};
	SKIP: {
		skip 'the canvas was refused when saved', 1 unless $id;
		$t->get_ok("/a/$id", $HTML);
		unlike $t->tx->res->body, qr/TOPSECRET|North|South/, 'a card over a file outside draws none of its data';
	}
};

subtest 'startup' => sub {
	for my $bad ('/srv', { x => 1 }, [undef], [''], [[]], ['/no/such/folder'], ["$inner/in.csv"]) {
		throws_ok { app_with(file_roots => $bad) } qr/file_roots/, 'refuses ' . Mojo::JSON::encode_json($bad);
	}
	lives_ok { app_with(file_roots => ['data', "$root"]) } 'a folder under the application home, and an absolute one';
};

done_testing();
