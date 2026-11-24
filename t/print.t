#!/usr/bin/env perl
# Print: a heading naming the view's filters and range, Print shown, and a PDF
# made by the server for views too large for the browser.
use strict;
use warnings;
use Test::Most;
use Test::Mojo;
use File::Temp qw(tempdir);
use Mojo::JSON qw(decode_json);
use Database::BI::Pdf qw(table_pdf text_width);

# The text a PDF of ours shows: its content streams, inflated, joined.
sub pdf_text {
	my ($pdf) = @_;
	my $out = '';
	while ($pdf =~ /stream\n(.*?)\nendstream/gs) {
		my $s = $1;
		if (eval { require Compress::Zlib; 1 }) {
			my $u = Compress::Zlib::uncompress($s);
			$s = $u if defined $u;
		}
		$out .= $s;
	}
	return join '', $out =~ /\((.*?)(?<!\\)\) Tj/g;
}

subtest 'Database::Pdf' => sub {
	my $pdf = table_pdf(title => 'T', columns => [qw(a b)], rows => [ ['x', 'y'] ]);
	like $pdf, qr/\A%PDF-1\.4/, 'a PDF';
	like $pdf, qr/%%EOF\n\z/, 'ends properly';
	my $text = pdf_text($pdf);
	like $text, qr/Page 1 of 1/, 'with a page number';
	like $text, qr/\AT/, 'titled T';

	my @rows = map { [ "r$_", $_ ] } 1 .. 200;
	my $many = table_pdf(columns => [qw(name n)], rows => \@rows);
	my ($count) = $many =~ m{/Count (\d+)};
	cmp_ok $count, '>', 1, 'many rows take several pages';
	like pdf_text($many), qr/Page $count of $count/, 'the last page knows the total';
	like pdf_text($many), qr/r200/, 'the last row is there';

	my $odd = pdf_text(table_pdf(columns => ['c'], rows => [ ["(a) \\ caf\x{e9} \x{4e2d}"] ]));
	like $odd, qr/\\\(a\\\) \\\\ caf\xe9 \?/, 'brackets and backslashes escaped, Latin-1 kept, other text a ?';

	my $none = table_pdf(columns => ['c'], rows => []);
	my ($c0) = $none =~ m{/Count (\d+)};
	is $c0, 1, 'no rows: still a page, with the header';

	my $wide = pdf_text(table_pdf(columns => ['c'], rows => [ ['long ' x 200] ]));
	like $wide, qr/\.\.\./, 'a cell too wide for its column is cut short';
	ok text_width('iii') < text_width('WWW'), 'widths follow Helvetica';
	throws_ok { table_pdf(rows => []) } qr/columns/, 'no columns: refused';
};

my $dir = tempdir(CLEANUP => 1);
open my $fh, '>', "$dir/sales.csv" or die $!;
print {$fh} "id,region,amount,day\n";
print {$fh} join(',', $_, ($_ % 2 ? 'North' : 'South'), $_ * 10, sprintf('2025-01-%02d', $_)), "\n" for 1 .. 12;
close $fh;
my $t = Test::Mojo->new('Database::BI', { data_dir => $dir, model_dir => tempdir(CLEANUP => 1) });

subtest 'the heading' => sub {
	$t->get_ok('/view/sales')->status_is(200);
	my ($attr) = $t->tx->res->text =~ /data-heading="([^"]*)"/;
	ok defined $attr, 'the table carries a heading';
	$attr =~ s/&quot;/"/g; $attr =~ s/&gt;/>/g; $attr =~ s/&amp;/&/g;
	is_deeply(decode_json($attr), { title => 'Sales', lines => [] }, 'an unfiltered view: its name only');

	$t->get_ok('/view/sales?f=region:eq:North&f=amount:gt:20&f=id:between:2:9&f=region:notempty&d=1')->status_is(200);
	($attr) = $t->tx->res->text =~ /data-heading="([^"]*)"/;
	$attr =~ s/&quot;/"/g; $attr =~ s/&gt;/>/g; $attr =~ s/&amp;/&/g;
	is_deeply(decode_json($attr)->{lines}, [
		'Filters: region is North; amount > 20; id is between 2 and 9; region is not empty',
		'Duplicate rows removed' ], 'filters in words');

	$t->get_ok('/view/sales?range=last_year&rcol=day')->status_is(200);
	($attr) = $t->tx->res->text =~ /data-heading="([^"]*)"/;
	$attr =~ s/&quot;/"/g; $attr =~ s/&gt;/>/g; $attr =~ s/&amp;/&/g;
	like decode_json($attr)->{lines}[0], qr/\ATime range: .* on day \(\d{4}-\d\d-\d\d to \d{4}-\d\d-\d\d\)\z/, 'and the time range';

	$t->get_ok('/view/sales')->content_like(qr/id="btn-print-shown"/)->content_like(qr/id="btn-print-pdf"/)
		->content_like(qr/window\.biShownRows\s*=/)->content_like(qr/print-heading/);
};

subtest 'the PDF' => sub {
	$t->get_ok('/export?l=table:sales&format=pdf')->status_is(200)->content_type_is('application/pdf')
		->header_like('Content-Disposition' => qr/sales\.pdf/);
	my $pdf = $t->tx->res->body;
	like $pdf, qr/\A%PDF/, 'a PDF';
	my $text = pdf_text($pdf);
	like $text, qr/\Asales/i, 'titled';
	like $text, qr/12 rows, printed \d{4}-\d\d-\d\d/, 'with the row count';

	$t->get_ok('/export?l=table:sales&format=pdf&f=region:eq:North&xcol=amount&xcol=id&sort=amount&dir=desc')->status_is(200);
	$text = pdf_text($t->tx->res->body);
	like $text, qr/Filters: region is North/, 'the filters are named';
	like $text, qr/6 rows/, 'only the rows left';
	unlike $text, qr/South/, 'and no others';
	ok $text =~ /110.*90.*70.*50.*30.*10/s, 'sorted as asked, descending';
	like $text, qr/amountid/, 'in the columns asked for, in that order';
	unlike $text, qr/amountid.*region|regionamount/, 'and no others';

	my $small = Test::Mojo->new('Database::BI', { data_dir => $dir, model_dir => tempdir(CLEANUP => 1), print_pdf_max_rows => 5 });
	$small->get_ok('/export?l=table:sales&format=pdf')->status_is(413)->content_like(qr/12 rows, more than the 5/);
	$small->get_ok('/export?l=table:sales&format=csv')->status_is(200);
	$t->get_ok('/export?l=table:nothing&format=pdf')->status_is(404);
};

done_testing();
