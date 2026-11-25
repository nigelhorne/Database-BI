package Database::BI::Pdf;

use strict;
use warnings;

our $VERSION = '0.024.0';

use Carp qw(croak);
use Encode ();
use PDF::API2;
use Scalar::Util ();
use Exporter qw(import);
use Readonly;

# Why PDF::Table is not used: it was tried (1.007) and takes about 2 ms a row,
# five times what the layout below costs with PDF::API2 alone (2,000 rows 4 s,
# against 20,000 rows 8 s), so a 50,000-row PDF would take over a minute.  It
# also wraps long cells, which makes row heights and page counts unpredictable
# (this module cuts a cell short with "..." instead), and it has no "Page N of
# M", which needs the page count before any page is drawn.  The layout is about
# 60 lines; PDF::API2 does the rest.
our @EXPORT_OK = qw(table_pdf text_width);

=encoding utf8

=head1 NAME

Database::BI::Pdf - A table as a PDF

=head1 SYNOPSIS

    use Database::BI::Pdf qw(table_pdf);
    my $bytes = table_pdf(
        title   => 'sales',
        lines   => [ 'Filters: region is North' ],
        columns => [ 'region', 'amount' ],
        rows    => [ [ 'North', 10 ], [ 'North', 20 ] ],
    );

=head1 DESCRIPTION

Writes a PDF of a heading and a table for views too large for the browser to
lay out.  The PDF is made by L<PDF::API2>; this module only lays the table out.
It uses the PDF's own Helvetica, so no font is embedded.  Text is written in
Windows Latin-1 (WinAnsi): accents and the usual punctuation come out as
written, any other character as C<?>.  A cell wider than its column is cut short with C<...>; nothing wraps.
Each page repeats the header row and says "Page N of M".

=cut

Readonly my $FONT_SIZE  => 8;
Readonly my $ROW_HEIGHT => 12;
Readonly my $MARGIN     => 36;
Readonly my $PAD        => 3;
Readonly my $MIN_COL    => 24;
Readonly my $MAX_COL    => 240;
Readonly my $SAMPLE     => 500;	# rows read to size the columns
Readonly my @PAPER      => (595, 842);	# A4, points

=head1 FUNCTIONS

=head2 text_width

    text_width($text, $size)

The width in points of C<$text> in Helvetica at C<$size>.

=head3 API SPECIFICATION

=head4 INPUT

    $text : string
    $size : number, default 8

=head4 OUTPUT

A number.

=cut

my $measure;	# one Helvetica, to ask for widths
my %WIDTH_OF;	# its width of each string seen

sub text_width {
	my ($text, $size) = @_;
	$size //= $FONT_SIZE;
	return 0 unless defined $text;
	$measure //= PDF::API2->new->font('Helvetica');
	%WIDTH_OF = () if keys %WIDTH_OF > 20_000;
	return ($WIDTH_OF{$text} //= $measure->width(_clean($text))) * $size;
}

# Text with control characters turned to spaces and anything WinAnsi lacks to "?".
sub _clean {
	my ($text) = @_;
	$text = '' unless defined $text;
	$text =~ s/[\x00-\x1f\x7f]+/ /g;
	return Encode::decode('cp1252', Encode::encode('cp1252', $text, sub { '?' }));
}

# $text cut to fit $width points, with "..." when it was cut.
sub _fit {
	my ($text, $width) = @_;
	$text = _clean($text);
	return $text if text_width($text) <= $width;
	my $dots = text_width('...');
	return '' if $width <= $dots;
	my $out = '';
	my $used = 0;
	for my $ch (split //, $text) {
		my $w = text_width($ch);
		last if $used + $w + $dots > $width;
		$out .= $ch;
		$used += $w;
	}
	return $out . '...';
}

=head2 table_pdf

    my $bytes = table_pdf(title => ..., lines => [...], columns => [...], rows => [[...], ...]);

=head3 API SPECIFICATION

=head4 INPUT

    title   : string, optional; large text on the first page
    lines   : arrayref of strings, optional; under the title
    columns : arrayref of names (at least one)
    rows    : arrayref of arrayrefs, one cell per column; may be empty
    footer  : string, optional; bottom left of every page

=head4 OUTPUT

The PDF as bytes.  A table of more than five columns is on landscape A4,
otherwise portrait.  Croaks without columns.

=cut

sub table_pdf {
	my %a = @_;
	my @columns = @{ $a{columns} // [] };
	croak 'table_pdf: columns are needed' unless @columns;
	my @rows   = @{ $a{rows}  // [] };
	my @lines  = @{ $a{lines} // [] };
	my $title  = $a{title};
	my $footer = $a{footer} // 'Database::BI';

	my ($pw, $ph) = @columns > 5 ? @PAPER[1, 0] : @PAPER;
	my $usable = $pw - 2 * $MARGIN;

	# Column widths: what the header and the first rows need, shrunk to fit.
	my @want = map { text_width($_, $FONT_SIZE) * 1.1 + 2 * $PAD } @columns;
	for my $r (@rows[0 .. ($#rows < $SAMPLE ? $#rows : $SAMPLE - 1)]) {
		for my $i (0 .. $#columns) {
			my $w = text_width($r->[$i], $FONT_SIZE) + 2 * $PAD;
			$want[$i] = $w if $w > $want[$i];
		}
	}
	for (@want) { $_ = $MAX_COL if $_ > $MAX_COL; $_ = $MIN_COL if $_ < $MIN_COL }
	my $total = 0;
	$total += $_ for @want;
	if ($total > $usable) {
		my $scale = $usable / $total;
		@want = map { my $w = $_ * $scale; $w < 8 ? 8 : $w } @want;
	}
	my @x = ($MARGIN);
	push @x, $x[-1] + $want[$_] for 0 .. $#want - 1;
	my $right = $x[-1] + $want[-1];

	# How many rows each page holds.
	my $head_h = 0;
	$head_h += 20 if defined $title && length $title;
	$head_h += 12 * @lines;
	$head_h += 6 if $head_h;
	my $body_top = $ph - $MARGIN;
	my $bottom   = $MARGIN + 14;
	my $first_cap = int(($body_top - $head_h - $bottom) / $ROW_HEIGHT) - 1;	# minus the header row
	my $later_cap = int(($body_top - $bottom) / $ROW_HEIGHT) - 1;
	$first_cap = 1 if $first_cap < 1;
	$later_cap = 1 if $later_cap < 1;

	my @pages;	# [ first row index, last row index ]
	my $at = 0;
	my $cap = $first_cap;
	do {
		my $last = $at + $cap - 1;
		$last = $#rows if $last > $#rows;
		push @pages, [ $at, $last ];
		$at = $last + 1;
		$cap = $later_cap;
	} while ($at <= $#rows);
	my $count = @pages;

	my $pdf = PDF::API2->new;
	$pdf->title($title) if defined $title && length $title;
	my $reg  = $pdf->font('Helvetica');
	my $bold = $pdf->font('Helvetica-Bold');
	# One text object a page for each font and size, not one a cell: far faster.
	my %on;
	my $text = sub {
		my ($page, $font, $size, $x, $y, $str) = @_;
		my $t = $on{ join ',', $size, Scalar::Util::refaddr($font) } //= do {
			my $o = $page->text;
			$o->font($font, $size);
			$o;
		};
		$t->matrix(1, 0, 0, 1, $x, $y);
		$t->text(_clean($str));
	};

	for my $p (0 .. $#pages) {
		my ($lo, $hi) = @{ $pages[$p] };
		my $page = $pdf->page;
		%on = ();
		$page->mediabox(0, 0, $pw, $ph);
		my $y = $body_top;
		if ($p == 0) {
			if (defined $title && length $title) {
				$y -= 14;
				$text->($page, $bold, 14, $MARGIN, $y, _fit($title, $usable * 1.2 / 1.4));
				$y -= 6;
			}
			for my $l (@lines) {
				$y -= 12;
				$text->($page, $reg, 9, $MARGIN, $y, _fit($l, $usable * 8 / 9));
			}
			$y -= 6 if $head_h;
		}
		# The header row: grey band, bold names.
		my $g = $page->graphics;
		$g->fill_color('#e0e0e0');
		$g->rectangle($MARGIN, $y - $ROW_HEIGHT, $right, $y);
		$g->fill;
		$y -= $ROW_HEIGHT;
		for my $i (0 .. $#columns) {
			$text->($page, $bold, $FONT_SIZE, $x[$i] + $PAD, $y + 3.5, _fit($columns[$i], $want[$i] - 2 * $PAD));
		}
		my $rules = $page->graphics;
		$rules->stroke_color('#cccccc');
		$rules->line_width(0.5);
		for my $ri ($lo .. $hi) {
			last if $ri > $#rows;
			my $row = $rows[$ri];
			$y -= $ROW_HEIGHT;
			for my $i (0 .. $#columns) {
				my $v = $row->[$i];
				next unless defined $v && length $v;
				$text->($page, $reg, $FONT_SIZE, $x[$i] + $PAD, $y + 3.5, _fit($v, $want[$i] - 2 * $PAD));
			}
			$rules->move($MARGIN, $y);
			$rules->line($right, $y);
		}
		$rules->stroke;
		$text->($page, $reg, 7, $MARGIN, $MARGIN - 4, $footer);
		my $pn = sprintf 'Page %d of %d', $p + 1, $count;
		$text->($page, $reg, 7, $right - text_width($pn, 7), $MARGIN - 4, $pn);
	}
	return $pdf->to_string;
}

=head1 AUTHOR

Nigel Horne C<< <njh@nigelhorne.com> >>

=head1 LICENCE AND COPYRIGHT

Copyright 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.

=cut

1;
