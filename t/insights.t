use strict;
use warnings;

# ---------------------------------------------------------------------------
# t/insights.t -- Tests for Phase 5.2 automatic insights.
#
# All tests are hermetic: no live LLM, no network calls.
# The fixture data/insights_fixture.csv has:
#   - A known outlier: West region 2025-07-01 amount=999 (IQR fence)
#   - Period-over-period changes between 2025-12 and 2026-01
#   - 13+ month-periods for seasonality detection
# ---------------------------------------------------------------------------

use Test::Most;
use Test::Mojo;
use File::Spec ();
use Mojo::Util qw(url_escape);
use Readonly;

# ---------------------------------------------------------------------------
# Bootstrap
# ---------------------------------------------------------------------------
my $t = Test::Mojo->new('Database::BI');

Readonly my $FIXTURE => File::Spec->rel2abs('data/insights_fixture.csv');
plan skip_all => 'data/insights_fixture.csv not found' unless -f $FIXTURE;

use_ok('Database::BI::Insights');

# ---------------------------------------------------------------------------
# Section 1: Unit tests for Database::BI::Insights::compute()
# ---------------------------------------------------------------------------

{
    # Build a minimal in-memory fixture replicating the CSV structure.
    my @rows;
    open my $fh, '<', $FIXTURE or die "Cannot open $FIXTURE: $!";
    my $header = <$fh>;
    chomp $header;
    my @cols = split /,/, $header;
    while (my $line = <$fh>) {
        chomp $line;
        my @vals = split /,/, $line;
        my %row;
        @row{@cols} = @vals;
        push @rows, \%row;
    }
    close $fh;

    my $insights = Database::BI::Insights::compute(
        records  => \@rows,
        columns  => \@cols,
        spec_key => 'path:' . $FIXTURE,
        base_url => '/insights?l=path:' . $FIXTURE,
    );

    ok(ref($insights) eq 'ARRAY', 'compute() returns an arrayref');
    ok(scalar(@$insights) > 0,    'at least one insight detected');

    # Every insight must have the required keys.
    for my $ins (@$insights) {
        ok(defined $ins->{kind},     "insight has kind ($ins->{kind})");
        ok(defined $ins->{headline}, "insight has headline");
        ok(defined $ins->{detail},   "insight has detail");
        ok(defined $ins->{view_url}, "insight has view_url");
        ok(defined $ins->{method},   "insight has method");
        ok(length($ins->{view_url}), 'view_url is non-empty');
        like($ins->{view_url}, qr{\A/}, 'view_url is root-relative');
    }

    # West 999 spike must be detected as an outlier.
    my @outliers = grep { $_->{kind} eq 'outlier' } @$insights;
    ok(scalar(@outliers) >= 1, 'at least one outlier detected');
    my ($spike_insight) = grep { $_->{headline} =~ /999/ } @outliers;
    ok(defined $spike_insight, 'outlier insight mentions the 999 spike value');

    # period_delta insight must exist (2025-12 vs 2026-01).
    my @pop = grep { $_->{kind} eq 'period_delta' } @$insights;
    ok(scalar(@pop) >= 1, 'at least one period_delta insight detected');
    like($pop[0]->{detail}, qr/2025-12/, 'period_delta mentions the prior period');
    like($pop[0]->{detail}, qr/2026-01/, 'period_delta mentions the current period');

    # top_mover insight must exist (South had bigger absolute jump than North or West).
    my @movers = grep { $_->{kind} eq 'top_mover' } @$insights;
    ok(scalar(@movers) >= 1, 'at least one top_mover insight detected');

    # Every insight view_url must not contain an unescaped space.
    for my $ins (@$insights) {
        unlike($ins->{view_url}, qr/ /, "view_url contains no raw spaces: $ins->{kind}");
    }
}

# ---------------------------------------------------------------------------
# Section 2: Insufficient data path
# ---------------------------------------------------------------------------

{
    # A dataset with one numeric column and only 1 row: nothing to report.
    my $insights = Database::BI::Insights::compute(
        records  => [{ amount => 100 }],
        columns  => ['amount'],
        spec_key => 'table:tiny',
    );
    ok(ref($insights) eq 'ARRAY', 'compute() returns arrayref for tiny input');
    is(scalar(@$insights), 0, 'no insights on a single-row dataset');
}

{
    # A dataset with only non-numeric columns: no outliers/movers.
    my $insights = Database::BI::Insights::compute(
        records  => [map { { name => "row$_", tag => 'x' } } 1..10],
        columns  => ['name', 'tag'],
        spec_key => 'table:nonnumeric',
    );
    is(scalar(@$insights), 0, 'no insights when no numeric columns');
}

{
    # Fewer than MIN_PERIODS_SEASON (8) periods: no seasonality insight.
    my @rows = map {
        { sale_date => sprintf('2025-%02d-01', $_), amount => 100 + $_ }
    } 1..5;
    my $insights = Database::BI::Insights::compute(
        records  => \@rows,
        columns  => [qw(sale_date amount)],
        spec_key => 'table:few_periods',
    );
    my @season = grep { $_->{kind} eq 'seasonality' } @$insights;
    is(scalar(@season), 0, 'no seasonality insight with fewer than 8 periods');
}

# ---------------------------------------------------------------------------
# Section 3: HTTP endpoint tests (GET /insights)
# ---------------------------------------------------------------------------

{
    my $enc = url_escape("path:$FIXTURE");

    # Basic smoke: 200, page renders, no crash.
    $t->get_ok("/insights?l=path:${\url_escape($FIXTURE)}")
      ->status_is(200)
      ->content_like(qr/Automatic insights/i, 'page title present')
      ->content_like(qr/insight-card/, 'at least one insight card rendered');

    # Outlier card present in HTML.
    $t->get_ok("/insights?l=path:${\url_escape($FIXTURE)}")
      ->content_like(qr/outlier/i, 'outlier kind shown in HTML');

    # Every view_url in the page must be a root-relative path.
    $t->get_ok("/insights?l=path:${\url_escape($FIXTURE)}")
      ->content_unlike(qr/view_url.*javascript:/i, 'no javascript: in any insight URL');

    # Missing l= returns 400.
    $t->get_ok('/insights')
      ->status_is(400);

    # Unknown table returns 404.
    $t->get_ok('/insights?l=table:does_not_exist_xyz')
      ->status_is(404);

    # f= filter is forwarded: filtering to North reduces data but still returns 200.
    $t->get_ok("/insights?l=path:${\url_escape($FIXTURE)}&f=region:eq:North")
      ->status_is(200);
}

# ---------------------------------------------------------------------------
# Section 4: method_note() returns non-empty strings for all known keys
# ---------------------------------------------------------------------------

{
    for my $key (qw(iqr_fence pop_delta top_mover autocorr)) {
        my $note = Database::BI::Insights::method_note($key);
        ok(defined $note && length $note, "method_note('$key') returns a string");
    }
}

done_testing;
