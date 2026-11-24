package Database::BI::Pdf;

use strict;
use warnings;

our $VERSION = '0.024.0';

use Carp qw(croak);
use Encode ();
use Exporter qw(import);
use Readonly;

our @EXPORT_OK = qw(table_pdf text_width);

=encoding utf8

=head1 NAME

Database::BI::Pdf - A table as a PDF, with no PDF library

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
lay out.  It uses the PDF's own Helvetica, so nothing is embedded and no module
beyond core Perl is needed.  Text is written in Windows Latin-1 (WinAnsi):
accents and the usual punctuation come out as written, any other character as
C<?>.  A cell wider than its column is cut short with C<...>; nothing wraps.
Each page repeats the header row and says "Page N of M".

=cut

# Helvetica's advance widths (1/1000 em) for ASCII 32..126, from its AFM.
Readonly my @WIDTH => (
	278, 278, 355, 556, 556, 889, 667, 191, 333, 333, 389, 584, 278, 333, 278, 278,
	556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 278, 278, 584, 584, 584, 556,
	1015, 667, 667, 722, 722, 667, 611, 778, 722, 278, 500, 667, 556, 833, 722, 778,
	667, 778, 722, 667, 611, 722, 667, 944, 667, 667, 611, 278, 278, 278, 469, 556,
	333, 556, 556, 500, 556, 556, 278, 556, 556, 222, 222, 500, 222, 833, 556, 556,
	556, 556, 333, 500, 278, 556, 500, 722, 500, 500, 500, 334, 260, 334, 584,
);
Readonly my $OTHER_WIDTH => 556;	# any character past ASCII

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

sub text_width {
	my ($text, $size) = @_;
	$size //= $FONT_SIZE;
	return 0 unless defined $text;
	my $w = 0;
	for my $c (unpack 'U*', $text) {
		$w += ($c >= 32 && $c <= 126) ? $WIDTH[$c - 32] : $OTHER_WIDTH;
	}
	return $w * $size / 1000;
}

# Latin-1 bytes for a PDF string, escaped.
sub _pdf_text {
	my ($text) = @_;
	$text = '' unless defined $text;
	$text =~ s/[\x00-\x1f\x7f]+/ /g;
	my $bytes = Encode::encode('cp1252', $text, sub { '?' });
	$bytes =~ s{([\\()])}{\\$1}g;
	$bytes =~ s{([\x80-\xff])}{sprintf '\\%03o', ord $1}ge;
	return $bytes;
}

# $text cut to fit $width points, with "..." when it was cut.
sub _fit {
	my ($text, $width) = @_;
	$text = '' unless defined $text;
	$text =~ s/[\x00-\x1f\x7f]+/ /g;
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

	my $deflate = eval { require Compress::Zlib; 1 };
	my @obj;	# 1-based object bodies
	$obj[1] = '<< /Type /Catalog /Pages 2 0 R >>';
	$obj[3] = '<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica /Encoding /WinAnsiEncoding >>';
	$obj[4] = '<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica-Bold /Encoding /WinAnsiEncoding >>';
	my @kids;
	my $n = 5;

	for my $p (0 .. $#pages) {
		my ($lo, $hi) = @{ $pages[$p] };
		my $c = '';
		my $y = $body_top;
		if ($p == 0) {
			if (defined $title && length $title) {
				$y -= 14;
				$c .= sprintf "BT /F2 14 Tf 1 0 0 1 %d %.2f Tm (%s) Tj ET\n", $MARGIN, $y, _pdf_text(_fit($title, $usable * 1.2 / 1.4));
				$y -= 6;
			}
			for my $l (@lines) {
				$y -= 12;
				$c .= sprintf "BT /F1 9 Tf 1 0 0 1 %d %.2f Tm (%s) Tj ET\n", $MARGIN, $y, _pdf_text(_fit($l, $usable * 8 / 9));
			}
			$y -= 6 if $head_h;
		}
		# The header row: grey band, bold names.
		$c .= sprintf "0.88 g %d %.2f %.2f %d re f 0 g\n", $MARGIN, $y - $ROW_HEIGHT, $right - $MARGIN, $ROW_HEIGHT;
		$y -= $ROW_HEIGHT;
		for my $i (0 .. $#columns) {
			$c .= sprintf "BT /F2 %d Tf 1 0 0 1 %.2f %.2f Tm (%s) Tj ET\n", $FONT_SIZE, $x[$i] + $PAD, $y + 3.5,
				_pdf_text(_fit($columns[$i], $want[$i] - 2 * $PAD));
		}
		$c .= "0.5 w\n";
		for my $ri ($lo .. $hi) {
			last if $ri > $#rows;
			my $row = $rows[$ri];
			$y -= $ROW_HEIGHT;
			for my $i (0 .. $#columns) {
				my $v = $row->[$i];
				next unless defined $v && length $v;
				$c .= sprintf "BT /F1 %d Tf 1 0 0 1 %.2f %.2f Tm (%s) Tj ET\n", $FONT_SIZE, $x[$i] + $PAD, $y + 3.5,
					_pdf_text(_fit($v, $want[$i] - 2 * $PAD));
			}
			$c .= sprintf "0.8 G %d %.2f m %.2f %.2f l S 0 G\n", $MARGIN, $y, $right, $y;
		}
		$c .= sprintf "BT /F1 7 Tf 1 0 0 1 %d %d Tm (%s) Tj ET\n", $MARGIN, $MARGIN - 4, _pdf_text($footer);
		my $pn = sprintf 'Page %d of %d', $p + 1, $count;
		$c .= sprintf "BT /F1 7 Tf 1 0 0 1 %.2f %d Tm (%s) Tj ET\n", $right - text_width($pn, 7), $MARGIN - 4, $pn;

		my $page_id    = $n++;
		my $content_id = $n++;
		push @kids, "$page_id 0 R";
		$obj[$page_id] = sprintf '<< /Type /Page /Parent 2 0 R /MediaBox [0 0 %d %d] '
			. '/Resources << /Font << /F1 3 0 R /F2 4 0 R >> >> /Contents %d 0 R >>', $pw, $ph, $content_id;
		if ($deflate) {
			my $z = Compress::Zlib::compress($c);
			$obj[$content_id] = [ sprintf("<< /Length %d /Filter /FlateDecode >>", length $z), $z ];
		} else {
			$obj[$content_id] = [ sprintf('<< /Length %d >>', length $c), $c ];
		}
	}
	$obj[2] = sprintf '<< /Type /Pages /Kids [%s] /Count %d >>', join(' ', @kids), scalar @kids;

	my $out = "%PDF-1.4\n%\xE2\xE3\xCF\xD3\n";
	my @offset;
	for my $i (1 .. $#obj) {
		$offset[$i] = length $out;
		my $b = $obj[$i];
		if (ref $b) {
			$out .= "$i 0 obj\n$b->[0]\nstream\n$b->[1]\nendstream\nendobj\n";
		} else {
			$out .= "$i 0 obj\n$b\nendobj\n";
		}
	}
	my $xref = length $out;
	$out .= sprintf "xref\n0 %d\n0000000000 65535 f \n", scalar @obj;
	$out .= sprintf "%010d 00000 n \n", $offset[$_] for 1 .. $#obj;
	$out .= sprintf "trailer\n<< /Size %d /Root 1 0 R >>\nstartxref\n%d\n%%%%EOF\n", scalar @obj, $xref;
	return $out;
}

=head1 AUTHOR

Nigel Horne C<< <njh@nigelhorne.com> >>

=head1 LICENCE AND COPYRIGHT

Copyright 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.

=cut

1;
