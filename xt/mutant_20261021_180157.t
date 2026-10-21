#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-10-21 18:01:57
# Generator: scripts/test-generator-index
#
# DO NOT COMMIT without completing the TODO sections.
#
# HIGH/MEDIUM difficulty survivors have TODO stubs — these need real tests.
# LOW difficulty survivors appear as comment hints — worth improving.
#
# Stubs call new() for modules with a constructor, or show a class method
# placeholder for modules without one. Add arguments as needed.

use strict;
use warnings;
use Test::More;

use_ok('Database::BI::Insights');

################################################################
# FILE: lib/Database/BI/Insights.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: BOOL_NEGATE_137_2 (MEDIUM) line 137 in _looks_like_date() ---
# Source:  return 0 unless defined $v && length $v;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_137_2 line 137 in _looks_like_date()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 137 in _looks_like_date() to detect the mutant
    fail('BOOL_NEGATE_137_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_140_2 (MEDIUM) line 140 in _looks_like_date() ---
# Source:  return 1 if $v =~ /\A\d{1,2}-[A-Za-z]{3}-\d{4}\z/;    # DD-Mon-YYYY
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_140_2 line 140 in _looks_like_date()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 140 in _looks_like_date() to detect the mutant
    fail('BOOL_NEGATE_140_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_146_17_< (HIGH) line 146 in _is_date_col() ---
# Source:  my $n = @$vals > 20 ? 20 : scalar @$vals;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_146_17_< line 146 in _is_date_col()';
    # Suggested boundary values to test: 19, 20, 21
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 146 in _is_date_col() to detect the mutant
    fail('NUM_BOUNDARY_146_17_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_157_2 (MEDIUM) line 157 in _is_numeric_col() ---
# Source:  return 0 unless @$vals;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_157_2 line 157 in _is_numeric_col()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 157 in _is_numeric_col() to detect the mutant
    fail('BOOL_NEGATE_157_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_159_18_< (HIGH) line 159 in _is_numeric_col() ---
# Source:  my $n  = @$vals > 20 ? 20 : scalar @$vals;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_159_18_< line 159 in _is_numeric_col()';
    # Suggested boundary values to test: 19, 20, 21
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 159 in _is_numeric_col() to detect the mutant
    fail('NUM_BOUNDARY_159_18_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_161_3 (MEDIUM) line 161 in _is_numeric_col() ---
# Source:  return 0 if _looks_like_date($v);   # date values are not numeric measures
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_161_3 line 161 in _is_numeric_col()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 161 in _is_numeric_col() to detect the mutant
    fail('BOOL_NEGATE_161_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_171_2 (MEDIUM) line 171 in _to_num() ---
# Source:  return undef unless defined $v && length $v;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_171_2 line 171 in _to_num()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 171 in _to_num() to detect the mutant
    fail('BOOL_NEGATE_171_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_187_41_> (HIGH) line 187 in _quartiles() ---
# Source:  return (undef, undef, undef) unless $n >= 4;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_187_41_> line 187 in _quartiles()';
    # Suggested boundary values to test: 3, 4, 5
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 187 in _quartiles() to detect the mutant
    fail('NUM_BOUNDARY_187_41_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_202_2 (MEDIUM) line 202 in _median() ---
# Source:  return undef unless $n;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_202_2 line 202 in _median()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 202 in _median() to detect the mutant
    fail('BOOL_NEGATE_202_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_256_64_< (HIGH) line 256 in _find_outliers() ---
# Source:  splice @outlier_rows, $MAX_OUTLIERS_PER_COL if @outlier_rows > $MAX_OUTLIERS_PER_COL;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_256_64_< line 256 in _find_outliers()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 256 in _find_outliers() to detect the mutant
    fail('NUM_BOUNDARY_256_64_<: replace with real assertion');
}

# --- SURVIVOR: COND_INV_265_4 (MEDIUM) line 265 in _find_outliers() ---
# Source:  if (@$cat_cols) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_265_4 line 265 in _find_outliers()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 265 in _find_outliers() to detect the mutant
    fail('COND_INV_265_4: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_273_19_< (HIGH) line 273 in _find_outliers() ---
# Source:  my $dir = $val > $hi_fence ? 'high' : 'low';
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_273_19_< line 273 in _find_outliers()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 273 in _find_outliers() to detect the mutant
    fail('NUM_BOUNDARY_273_19_<: replace with real assertion');
}

# --- SURVIVOR: COND_INV_285_4 (MEDIUM) line 285 in _find_outliers() ---
# Source:  if (@$cat_cols) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_285_4 line 285 in _find_outliers()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 285 in _find_outliers() to detect the mutant
    fail('COND_INV_285_4: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_327_14_< (HIGH) line 327 in _fence_distance() ---
# Source:  return $val > $hi ? $val - $hi
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_327_14_< line 327 in _fence_distance()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 327 in _fence_distance() to detect the mutant
    fail('NUM_BOUNDARY_327_14_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_328_14_> (HIGH) line 328 in _fence_distance() ---
# Source:  : $val < $lo ? $lo - $val
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_328_14_> line 328 in _fence_distance()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 328 in _fence_distance() to detect the mutant
    fail('NUM_BOUNDARY_328_14_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_350_28_> (HIGH) line 350 in _period_over_period() ---
# Source:  return () unless @periods >= $MIN_PERIODS_POP;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_350_28_> line 350 in _period_over_period()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 350 in _period_over_period() to detect the mutant
    fail('NUM_BOUNDARY_350_28_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_358_24_== (HIGH) line 358 in _period_over_period() ---
# Source:  my $pct   = $prev_val != 0 ? $delta / abs($prev_val) * 100 : undef;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip != to ==
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_358_24_== line 358 in _period_over_period()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 358 in _period_over_period() to detect the mutant
    fail('NUM_BOUNDARY_358_24_==: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_360_20_> (HIGH) line 360 in _period_over_period() ---
# Source:  my $dir  = $delta >= 0 ? 'up' : 'down';
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_360_20_> line 360 in _period_over_period()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 360 in _period_over_period() to detect the mutant
    fail('NUM_BOUNDARY_360_20_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_361_20_> (HIGH) line 361 in _period_over_period() ---
# Source:  my $sign = $delta >= 0 ? '+' : '';
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_361_20_> line 361 in _period_over_period()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 361 in _period_over_period() to detect the mutant
    fail('NUM_BOUNDARY_361_20_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_425_28_> (HIGH) line 425 in _top_movers() ---
# Source:  return () unless @periods >= $MIN_PERIODS_POP;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_425_28_> line 425 in _top_movers()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 425 in _top_movers() to detect the mutant
    fail('NUM_BOUNDARY_425_28_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_443_45_< (HIGH) line 443 in _top_movers() ---
# Source:  splice @movers, $MAX_TOP_MOVERS if @movers > $MAX_TOP_MOVERS;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_443_45_< line 443 in _top_movers()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 443 in _top_movers() to detect the mutant
    fail('NUM_BOUNDARY_443_45_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_453_26_> (HIGH) line 453 in _top_movers() ---
# Source:  my $dir  = $m->{delta} >= 0 ? 'up' : 'down';
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_453_26_> line 453 in _top_movers()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 453 in _top_movers() to detect the mutant
    fail('NUM_BOUNDARY_453_26_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_454_26_> (HIGH) line 454 in _top_movers() ---
# Source:  my $sign = $m->{delta} >= 0 ? '+' : '';
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_454_26_> line 454 in _top_movers()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 454 in _top_movers() to detect the mutant
    fail('NUM_BOUNDARY_454_26_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_519_28_> (HIGH) line 519 in _seasonality() ---
# Source:  return () unless @periods >= $MIN_PERIODS_SEASON;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_519_28_> line 519 in _seasonality()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 519 in _seasonality() to detect the mutant
    fail('NUM_BOUNDARY_519_28_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_530_47_> (HIGH) line 530 in _seasonality() ---
# Source:  $num   += $dev * ($y[$i + 1] - $ybar) if $i < $n - 1;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_530_47_> line 530 in _seasonality()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 530 in _seasonality() to detect the mutant
    fail('NUM_BOUNDARY_530_47_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_533_26_< (HIGH) line 533 in _seasonality() ---
# Source:  return () unless $denom > 0;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_533_26_< line 533 in _seasonality()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 533 in _seasonality() to detect the mutant
    fail('NUM_BOUNDARY_533_26_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_536_22_> (HIGH) line 536 in _seasonality() ---
# Source:  return () unless $r >= $SEASON_R_THRESHOLD;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_536_22_> line 536 in _seasonality()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 536 in _seasonality() to detect the mutant
    fail('NUM_BOUNDARY_536_22_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_563_2 (MEDIUM) line 563 in _fmt_num() ---
# Source:  return 'N/A' unless defined $n;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_563_2 line 563 in _fmt_num()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 563 in _fmt_num() to detect the mutant
    fail('BOOL_NEGATE_563_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_564_33_!= (HIGH) line 564 in _fmt_num() ---
# Source:  return sprintf('%s', $n) if $n == int($n) && abs($n) < 1e12;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_564_33_!= line 564 in _fmt_num()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 564 in _fmt_num() to detect the mutant
    fail('NUM_BOUNDARY_564_33_!=: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_565_2 (MEDIUM) line 565 in _fmt_num() ---
# Source:  return sprintf('%s', 0 + sprintf('%.4g', $n));
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_565_2 line 565 in _fmt_num()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 565 in _fmt_num() to detect the mutant
    fail('BOOL_NEGATE_565_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_590_2 (MEDIUM) line 590 in _spec_to_data_url() ---
# Source:  return undef;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_590_2 line 590 in _spec_to_data_url()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 590 in _spec_to_data_url() to detect the mutant
    fail('BOOL_NEGATE_590_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_137_2 line 137 in _looks_like_date() ---
# Source:  return 0 unless defined $v && length $v;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_137_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_140_2 line 140 in _looks_like_date() ---
# Source:  return 1 if $v =~ /\A\d{1,2}-[A-Za-z]{3}-\d{4}\z/;    # DD-Mon-YYYY
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_140_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_157_2 line 157 in _is_numeric_col() ---
# Source:  return 0 unless @$vals;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_157_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_161_3 line 161 in _is_numeric_col() ---
# Source:  return 0 if _looks_like_date($v);   # date values are not numeric measures
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_161_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_171_2 line 171 in _to_num() ---
# Source:  return undef unless defined $v && length $v;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_171_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_202_2 line 202 in _median() ---
# Source:  return undef unless $n;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_202_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_327_2 line 327 in _fence_distance() ---
# Source:  return $val > $hi ? $val - $hi
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_327_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_563_2 line 563 in _fmt_num() ---
# Source:  return 'N/A' unless defined $n;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_563_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_565_2 line 565 in _fmt_num() ---
# Source:  return sprintf('%s', 0 + sprintf('%.4g', $n));
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_565_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_590_2 line 590 in _spec_to_data_url() ---
# Source:  return undef;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_590_2: add assertion here');

done_testing();
