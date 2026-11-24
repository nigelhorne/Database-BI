#!/usr/bin/env perl
# Encoding on upload: a file that is not UTF-8 is read as Windows-1252 (or
# UTF-16 with a BOM), saved as UTF-8, and the reader is told which.
use strict;
use warnings;
use Test::Most;
use Test::Mojo;
use File::Temp qw(tempdir);
use Mojo::File;
use Encode ();

my $t = Test::Mojo->new('Database::BI', {
	data_dir => tempdir(CLEANUP => 1), model_dir => tempdir(CLEANUP => 1), uploads_dir => tempdir(CLEANUP => 1),
});

sub up {
	my ($name, $bytes) = @_;
	$t->post_ok('/upload' => form => { file => { content => $bytes, filename => $name } })->status_is(200);
	return $t->tx->res->json;
}
sub saved { Mojo::File->new($_[0]->{path})->slurp }

subtest 'Windows-1252' => sub {
	my $r = up('sales.csv', "name,price\ncaf\xe9,\x801.50\n\x93quoted\x94,2\n");
	is $r->{encoding}, 'Windows-1252', 'named';
	like $r->{note}, qr/read as Windows-1252/, 'with a note';
	like $r->{url}, qr/&enc=Windows-1252\z/, 'and the page is told';
	is saved($r), Encode::encode('UTF-8', "name,price\ncaf\x{e9},\x{20ac}1.50\n\x{201c}quoted\x{201d},2\n"), 'saved as UTF-8, the 0x80-0x9F range as Windows reads it';
	$t->get_ok($r->{url})->status_is(200)->content_like(qr/id="encoding-note"[^>]*>[^<]*Windows-1252/)->content_like(qr/caf\x{c3}\x{a9}|caf&eacute;|caf\x{e9}/);
};

subtest 'UTF-8 is left alone' => sub {
	my $bytes = Encode::encode('UTF-8', "name\ncaf\x{e9}\n");
	my $r = up('u.csv', $bytes);
	is $r->{encoding}, 'UTF-8', 'named';
	ok !exists $r->{note}, 'no note';
	unlike $r->{url}, qr/enc=/, 'no parameter';
	is saved($r), $bytes, 'untouched';
	$r = up('bom.csv', "\xEF\xBB\xBFa,b\n1,2\n");
	is $r->{encoding}, 'UTF-8', 'a UTF-8 BOM is UTF-8';
	$r = up('ascii.csv', "a,b\n1,2\n");
	is $r->{encoding}, 'UTF-8', 'ASCII too';
	$r = up('empty.csv', '');
	is $r->{encoding}, 'UTF-8', 'an empty file';
};

subtest 'UTF-16 with a BOM' => sub {
	my $r = up('w.csv', "\xFF\xFE" . Encode::encode('UTF-16LE', "a,b\n\x{e9},2\n"));
	is $r->{encoding}, 'UTF-16LE', 'little-endian';
	is saved($r), Encode::encode('UTF-8', "a,b\n\x{e9},2\n"), 'converted';
	$r = up('x.tsv', "\xFE\xFF" . Encode::encode('UTF-16BE', "a\tb\n1\t2\n"));
	is $r->{encoding}, 'UTF-16BE', 'big-endian';
};

subtest 'other kinds are not converted' => sub {
	my $bytes = "a\xe9";
	my $r = up('f.xml', "<r><row><x>\xe9</x></row></r>");
	is $r->{encoding}, 'UTF-8', 'XML names its own';
	like saved($r), qr/\xe9/, 'untouched';
};

subtest 'the note cannot be forged' => sub {
	my $r = up('p.csv', "a,b\n1,2\n");
	$t->get_ok($r->{url} . '&enc=<script>x</script>')->status_is(200)->content_unlike(qr/encoding-note/);
	$t->get_ok($r->{url} . '&enc=UTF-16LE')->status_is(200)->content_like(qr/id="encoding-note"/);
};

done_testing();
