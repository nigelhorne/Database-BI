#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-11-07 03:28:53
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

use_ok('Database::BI::Extract');
use_ok('Database::BI::Insights');
use_ok('Database::BI::Model::DataSource');
use_ok('Database::BI::Model::Geocode');

################################################################
# FILE: lib/Database/BI/Extract.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: BOOL_NEGATE_101_2 (MEDIUM) line 101 in put() ---
# Source:  # Call it only when clearing the whole extract store is desired.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_101_2 line 101 in put()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Extract requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Extract');
    # TODO: exercise line 101 in put() to detect the mutant
    fail('BOOL_NEGATE_101_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_105_3 (MEDIUM) line 105 in evict() ---
# Source:  return 0 unless -d $dir;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_105_3 line 105 in evict()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Extract requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Extract');
    # TODO: exercise line 105 in evict() to detect the mutant
    fail('COND_INV_105_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_109_2 (MEDIUM) line 109 in evict() ---
# Source:  # brackets as a class, so the name of the directory could defeat it.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_109_2 line 109 in evict()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Extract requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Extract');
    # TODO: exercise line 109 in evict() to detect the mutant
    fail('BOOL_NEGATE_109_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_101_2 line 101 in put() ---
# Source:  # Call it only when clearing the whole extract store is desired.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Extract requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Extract');
# ok($obj->..., 'RETURN_UNDEF_101_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_109_2 line 109 in evict() ---
# Source:  # brackets as a class, so the name of the directory could defeat it.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Extract requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Extract');
# ok($obj->..., 'RETURN_UNDEF_109_2: add assertion here');

################################################################
# FILE: lib/Database/BI/Insights.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: BOOL_NEGATE_137_2 (MEDIUM) line 137 in _looks_like_date() ---
# Source:  my $v = shift;
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
# Source:  return 1 if $v =~ /\A\d{1,2}\/\d{1,2}\/\d{4}\z/;      # M/D/YYYY or D/M/YYYY
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
# Source:  my $vals = shift;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_146_17_< line 146 in _is_date_col()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 146 in _is_date_col() to detect the mutant
    fail('NUM_BOUNDARY_146_17_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_157_2 (MEDIUM) line 157 in _is_numeric_col() ---
# Source:  my $vals = shift;
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
# Source:  my $ok = 0;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_159_18_< line 159 in _is_numeric_col()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 159 in _is_numeric_col() to detect the mutant
    fail('NUM_BOUNDARY_159_18_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_161_3 (MEDIUM) line 161 in _is_numeric_col() ---
# Source:  for my $v (@{$vals}[0 .. $n - 1]) {
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
# Source:  return Database::BI::Util::parse_number($_[0]);
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
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_187_41_> line 187 in _quartiles()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 187 in _quartiles() to detect the mutant
    fail('NUM_BOUNDARY_187_41_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_202_2 (MEDIUM) line 202 in _median() ---
# Source:  # _find_outliers($records, $num_col, \@cat_cols, $spec_key, $base_url) -> @insights
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
# Source:  my $row = $o->{row};
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
# Source:  $group_label = join(', ', @parts);
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
# Source:  my $detail = sprintf(
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
# Source:  $view_url = "/stats?l=" . urlencode($spec_key);
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

# --- SURVIVOR: NUM_BOUNDARY_307_27_< (HIGH) line 307 in _find_outliers() ---
# Source:  if ($base_url) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_307_27_< line 307 in _find_outliers()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 307 in _find_outliers() to detect the mutant
    fail('NUM_BOUNDARY_307_27_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_308_27_< (HIGH) line 308 in _find_outliers() ---
# Source:  $drill_url .= '&back2=' . urlencode($base_url)
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_308_27_< line 308 in _find_outliers()';
    # Suggested boundary values to test: 1, 2, 3
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 308 in _find_outliers() to detect the mutant
    fail('NUM_BOUNDARY_308_27_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_335_14_< (HIGH) line 335 in _fence_distance() ---
# Source:  # _period_over_period($records, $date_col, $num_col, $spec_key, $base_url) -> @insights
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_335_14_< line 335 in _fence_distance()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 335 in _fence_distance() to detect the mutant
    fail('NUM_BOUNDARY_335_14_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_336_14_> (HIGH) line 336 in _fence_distance() ---
# Source:  #
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_336_14_> line 336 in _fence_distance()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 336 in _fence_distance() to detect the mutant
    fail('NUM_BOUNDARY_336_14_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_358_28_> (HIGH) line 358 in _period_over_period() ---
# Source:  my $prev_val = $period_totals{$prev};
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_358_28_> line 358 in _period_over_period()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 358 in _period_over_period() to detect the mutant
    fail('NUM_BOUNDARY_358_28_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_366_24_== (HIGH) line 366 in _period_over_period() ---
# Source:  my $headline = sprintf('%s is %s %s vs prior period (%s)',
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip != to ==
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_366_24_== line 366 in _period_over_period()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 366 in _period_over_period() to detect the mutant
    fail('NUM_BOUNDARY_366_24_==: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_368_20_> (HIGH) line 368 in _period_over_period() ---
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_368_20_> line 368 in _period_over_period()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 368 in _period_over_period() to detect the mutant
    fail('NUM_BOUNDARY_368_20_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_369_20_> (HIGH) line 369 in _period_over_period() ---
# Source:  my $detail = defined $pct
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_369_20_> line 369 in _period_over_period()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 369 in _period_over_period() to detect the mutant
    fail('NUM_BOUNDARY_369_20_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_433_28_> (HIGH) line 433 in _top_movers() ---
# Source:  my (@movers);
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_433_28_> line 433 in _top_movers()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 433 in _top_movers() to detect the mutant
    fail('NUM_BOUNDARY_433_28_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_451_45_< (HIGH) line 451 in _top_movers() ---
# Source:  my $enc_num  = urlencode($num_col);
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_451_45_< line 451 in _top_movers()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 451 in _top_movers() to detect the mutant
    fail('NUM_BOUNDARY_451_45_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_461_26_> (HIGH) line 461 in _top_movers() ---
# Source:  $prev, _fmt_num($m->{prev}), $cur, _fmt_num($m->{cur}));
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_461_26_> line 461 in _top_movers()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 461 in _top_movers() to detect the mutant
    fail('NUM_BOUNDARY_461_26_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_462_26_> (HIGH) line 462 in _top_movers() ---
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_462_26_> line 462 in _top_movers()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 462 in _top_movers() to detect the mutant
    fail('NUM_BOUNDARY_462_26_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_527_28_> (HIGH) line 527 in _seasonality() ---
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_527_28_> line 527 in _seasonality()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 527 in _seasonality() to detect the mutant
    fail('NUM_BOUNDARY_527_28_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_538_47_> (HIGH) line 538 in _seasonality() ---
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_538_47_> line 538 in _seasonality()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 538 in _seasonality() to detect the mutant
    fail('NUM_BOUNDARY_538_47_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_541_26_< (HIGH) line 541 in _seasonality() ---
# Source:  my $headline = sprintf('%s shows a repeating period-over-period pattern (r=%.2f)',
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_541_26_< line 541 in _seasonality()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 541 in _seasonality() to detect the mutant
    fail('NUM_BOUNDARY_541_26_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_544_22_> (HIGH) line 544 in _seasonality() ---
# Source:  'Lag-1 autocorrelation %.2f across %d periods (%s to %s)',
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_544_22_> line 544 in _seasonality()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 544 in _seasonality() to detect the mutant
    fail('NUM_BOUNDARY_544_22_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_571_2 (MEDIUM) line 571 in _fmt_num() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_571_2 line 571 in _fmt_num()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 571 in _fmt_num() to detect the mutant
    fail('BOOL_NEGATE_571_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_572_55_> (HIGH) line 572 in _fmt_num() ---
# Source:  # _spec_to_data_url($spec_key) -> $url_or_undef
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_572_55_> line 572 in _fmt_num()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 572 in _fmt_num() to detect the mutant
    fail('NUM_BOUNDARY_572_55_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_573_2 (MEDIUM) line 573 in _fmt_num() ---
# Source:  #
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_573_2 line 573 in _fmt_num()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 573 in _fmt_num() to detect the mutant
    fail('BOOL_NEGATE_573_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_598_2 (MEDIUM) line 598 in _spec_to_data_url() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_598_2 line 598 in _spec_to_data_url()';
    # NOTE: Database::BI::Insights has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Insights->method(...);
    # TODO: exercise line 598 in _spec_to_data_url() to detect the mutant
    fail('BOOL_NEGATE_598_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_137_2 line 137 in _looks_like_date() ---
# Source:  my $v = shift;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_137_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_140_2 line 140 in _looks_like_date() ---
# Source:  return 1 if $v =~ /\A\d{1,2}\/\d{1,2}\/\d{4}\z/;      # M/D/YYYY or D/M/YYYY
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_140_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_157_2 line 157 in _is_numeric_col() ---
# Source:  my $vals = shift;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_157_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_161_3 line 161 in _is_numeric_col() ---
# Source:  for my $v (@{$vals}[0 .. $n - 1]) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_161_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_171_2 line 171 in _to_num() ---
# Source:  return Database::BI::Util::parse_number($_[0]);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_171_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_202_2 line 202 in _median() ---
# Source:  # _find_outliers($records, $num_col, \@cat_cols, $spec_key, $base_url) -> @insights
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_202_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_335_2 line 335 in _fence_distance() ---
# Source:  # _period_over_period($records, $date_col, $num_col, $spec_key, $base_url) -> @insights
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_335_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_571_2 line 571 in _fmt_num() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_571_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_573_2 line 573 in _fmt_num() ---
# Source:  #
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_573_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_598_2 line 598 in _spec_to_data_url() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Insights has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Insights->method(...);
# ok($result, 'RETURN_UNDEF_598_2: add assertion here');

################################################################
# FILE: lib/Database/BI/Model/DataSource.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: BOOL_NEGATE_458_2 (MEDIUM) line 458 in _msg() ---
# Source:  Invalid partition: non-existent path, regular file path, empty string ""
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_458_2 line 458 in _msg()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 458 in _msg() to detect the mutant
    fail('BOOL_NEGATE_458_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_629_2 (MEDIUM) line 629 in _new_from_url() ---
# Source:  #          HTML::TableExtract, and stores all rows (including headers from row 0)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_629_2 line 629 in _new_from_url()';
    # NOTE: _new_from_url is a class method — call directly.
    my $result = Database::BI::Model::DataSource->_new_from_url(...);
    # ok($result, 'BOOL_NEGATE_629_2: add assertion here');
    # TODO: exercise line 629 in _new_from_url() to detect the mutant
    fail('BOOL_NEGATE_629_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_697_4 (MEDIUM) line 697 in _new_from_redis() ---
# Source:  _redis_url     => $redis_url,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_697_4 line 697 in _new_from_redis()';
    # NOTE: _new_from_redis is a class method — call directly.
    my $result = Database::BI::Model::DataSource->_new_from_redis(...);
    # ok($result, 'COND_INV_697_4: add assertion here');
    # TODO: exercise line 697 in _new_from_redis() to detect the mutant
    fail('COND_INV_697_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_927_3 (MEDIUM) line 927 in _detect_file_info() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_927_3 line 927 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 927 in _detect_file_info() to detect the mutant
    fail('COND_INV_927_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_929_27_!= (HIGH) line 929 in _detect_file_info() ---
# Source:  my ($cmin, $cmax) = $ws->col_range;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_929_27_!= line 929 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 929 in _detect_file_info() to detect the mutant
    fail('NUM_BOUNDARY_929_27_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_934_4 (MEDIUM) line 934 in _detect_file_info() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition unless to if
TODO: {
    local $TODO = 'Complete: COND_INV_934_4 line 934 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 934 in _detect_file_info() to detect the mutant
    fail('COND_INV_934_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_935_5 (MEDIUM) line 935 in _detect_file_info() ---
# Source:  # Row 0 = column headers, spelt as D::A will key the rows.  A
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_935_5 line 935 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 935 in _detect_file_info() to detect the mutant
    fail('COND_INV_935_5: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_937_29_!= (HIGH) line 937 in _detect_file_info() ---
# Source:  my @cols;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_937_29_!= line 937 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 937 in _detect_file_info() to detect the mutant
    fail('NUM_BOUNDARY_937_29_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_945_3 (MEDIUM) line 945 in _detect_file_info() ---
# Source:  return { _file_is_empty => 1, file_size => -s $path }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_945_3 line 945 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 945 in _detect_file_info() to detect the mutant
    fail('COND_INV_945_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_965_5 (MEDIUM) line 965 in _detect_file_info() ---
# Source:  # code.  Disable autodie for this open so a vanishing file (race between
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_965_5 line 965 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 965 in _detect_file_info() to detect the mutant
    fail('BOOL_NEGATE_965_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1015_2 (MEDIUM) line 1015 in _detect_file_info() ---
# Source:  return { _file_is_empty => 1, file_size => -s $path };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1015_2 line 1015 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1015 in _detect_file_info() to detect the mutant
    fail('BOOL_NEGATE_1015_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1127_3 (MEDIUM) line 1127 in _detect_file_info() ---
# Source:  # alarm() (XS I/O in libdb-5.x ignores SIGALRM via SA_RESTART).
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1127_3 line 1127 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1127 in _detect_file_info() to detect the mutant
    fail('COND_INV_1127_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1187_3 (MEDIUM) line 1187 in _json_read() ---
# Source:  my $text = do {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1187_3 line 1187 in _json_read()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1187 in _json_read() to detect the mutant
    fail('COND_INV_1187_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1256_3 (MEDIUM) line 1256 in _json_columns() ---
# Source:  #          read from the text: a parsed object has no order.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1256_3 line 1256 in _json_columns()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1256 in _json_columns() to detect the mutant
    fail('COND_INV_1256_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1531_3 (MEDIUM) line 1531 in _copy_with_header() ---
# Source:  croak $self->_msg('error_backend_init', $stem, "cannot parse $headerless->{path}: $why")
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1531_3 line 1531 in _copy_with_header()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1531 in _copy_with_header() to detect the mutant
    fail('BOOL_NEGATE_1531_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1583_2 (MEDIUM) line 1583 in _init_backend() ---
# Source:  my $table     = $self->{_table};     # sanitized: used for pkg name and D::A table param
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1583_2 line 1583 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1583 in _init_backend() to detect the mutant
    fail('BOOL_NEGATE_1583_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1584_2 (MEDIUM) line 1584 in _init_backend() ---
# Source:  my $raw_table = $self->{_raw_table} // $table;  # original: used for file lookup and dbname
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1584_2 line 1584 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1584 in _init_backend() to detect the mutant
    fail('BOOL_NEGATE_1584_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1585_2 (MEDIUM) line 1585 in _init_backend() ---
# Source:  my $dir       = $self->{_directory};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1585_2 line 1585 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1585 in _init_backend() to detect the mutant
    fail('BOOL_NEGATE_1585_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1586_2 (MEDIUM) line 1586 in _init_backend() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1586_2 line 1586 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1586 in _init_backend() to detect the mutant
    fail('BOOL_NEGATE_1586_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1588_2 (MEDIUM) line 1588 in _init_backend() ---
# Source:  # then proceed with normal local processing on the downloaded copy.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1588_2 line 1588 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1588 in _init_backend() to detect the mutant
    fail('BOOL_NEGATE_1588_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1947_3 (MEDIUM) line 1947 in table_name() ---
# Source:  undef                 # for CSV, TSV, PSV, XML, URL-backed, and a JSON list or keyed object
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1947_3 line 1947 in table_name()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1947 in table_name() to detect the mutant
    fail('COND_INV_1947_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1978_3 (MEDIUM) line 1978 in sqlite_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1978_3 line 1978 in sqlite_tables()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1978 in sqlite_tables() to detect the mutant
    fail('COND_INV_1978_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2023_2 (MEDIUM) line 2023 in split_path() ---
# Source:  =head3 API SPECIFICATION
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2023_2 line 2023 in split_path()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 2023 in split_path() to detect the mutant
    fail('BOOL_NEGATE_2023_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2024_2 (MEDIUM) line 2024 in split_path() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2024_2 line 2024 in split_path()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 2024 in split_path() to detect the mutant
    fail('BOOL_NEGATE_2024_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2025_2 (MEDIUM) line 2025 in split_path() ---
# Source:  =head4 INPUT
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2025_2 line 2025 in split_path()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 2025 in split_path() to detect the mutant
    fail('BOOL_NEGATE_2025_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_458_2 line 458 in _msg() ---
# Source:  Invalid partition: non-existent path, regular file path, empty string ""
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_458_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_629_2 line 629 in _new_from_url() ---
# Source:  #          HTML::TableExtract, and stores all rows (including headers from row 0)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: _new_from_url is a class method — call directly.
# e.g. my $result = Database::BI::Model::DataSource->_new_from_url(...);
# ok($result, 'RETURN_UNDEF_629_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_965_5 line 965 in _detect_file_info() ---
# Source:  # code.  Disable autodie for this open so a vanishing file (race between
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_965_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1015_2 line 1015 in _detect_file_info() ---
# Source:  return { _file_is_empty => 1, file_size => -s $path };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1015_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1531_3 line 1531 in _copy_with_header() ---
# Source:  croak $self->_msg('error_backend_init', $stem, "cannot parse $headerless->{path}: $why")
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1531_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1583_2 line 1583 in _init_backend() ---
# Source:  my $table     = $self->{_table};     # sanitized: used for pkg name and D::A table param
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1583_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1584_2 line 1584 in _init_backend() ---
# Source:  my $raw_table = $self->{_raw_table} // $table;  # original: used for file lookup and dbname
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1584_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1585_2 line 1585 in _init_backend() ---
# Source:  my $dir       = $self->{_directory};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1585_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1586_2 line 1586 in _init_backend() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1586_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1588_2 line 1588 in _init_backend() ---
# Source:  # then proceed with normal local processing on the downloaded copy.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1588_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2023_2 line 2023 in split_path() ---
# Source:  =head3 API SPECIFICATION
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_2023_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2024_2 line 2024 in split_path() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_2024_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2025_2 line 2025 in split_path() ---
# Source:  =head4 INPUT
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_2025_2: add assertion here');

################################################################
# FILE: lib/Database/BI/Model/Geocode.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: COND_INV_689_2 (MEDIUM) line 689 in _load_geocoder() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_689_2 line 689 in _load_geocoder()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 689 in _load_geocoder() to detect the mutant
    fail('COND_INV_689_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_690_3 (MEDIUM) line 690 in _load_geocoder() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_690_3 line 690 in _load_geocoder()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 690 in _load_geocoder() to detect the mutant
    fail('COND_INV_690_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_717_2 (MEDIUM) line 717 in _load_geocoder() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_717_2 line 717 in _load_geocoder()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 717 in _load_geocoder() to detect the mutant
    fail('BOOL_NEGATE_717_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_739_2 (MEDIUM) line 739 in _default_cache() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_739_2 line 739 in _default_cache()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 739 in _default_cache() to detect the mutant
    fail('COND_INV_739_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_755_2 (MEDIUM) line 755 in _online_geocoder() ---
# Source:  );
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_755_2 line 755 in _online_geocoder()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 755 in _online_geocoder() to detect the mutant
    fail('BOOL_NEGATE_755_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1081_3 (MEDIUM) line 1081 in _lookup_batch() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1081_3 line 1081 in _lookup_batch()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1081 in _lookup_batch() to detect the mutant
    fail('COND_INV_1081_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_1126_56_> (HIGH) line 1126 in _lookup_local() ---
# Source:  # lookups that went online are counted, and how a Nominatim that did not answer
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_1126_56_> line 1126 in _lookup_local()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1126 in _lookup_local() to detect the mutant
    fail('NUM_BOUNDARY_1126_56_>: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1140_3 (MEDIUM) line 1140 in _lookup_online() ---
# Source:  sub _lookup_online {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1140_3 line 1140 in _lookup_online()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1140 in _lookup_online() to detect the mutant
    fail('COND_INV_1140_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1146_4 (MEDIUM) line 1146 in _lookup_online() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1146_4 line 1146 in _lookup_online()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1146 in _lookup_online() to detect the mutant
    fail('COND_INV_1146_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1158_3 (MEDIUM) line 1158 in _lookup_online() ---
# Source:  $chain->flush();
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1158_3 line 1158 in _lookup_online()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1158 in _lookup_online() to detect the mutant
    fail('COND_INV_1158_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1166_2 (MEDIUM) line 1166 in _lookup_online() ---
# Source:  $asked++;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1166_2 line 1166 in _lookup_online()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1166 in _lookup_online() to detect the mutant
    fail('COND_INV_1166_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1175_4 (MEDIUM) line 1175 in _lookup_online() ---
# Source:  $failed = defined($thrown)		? 'an error in Geo::Coder::OSM'
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1175_4 line 1175 in _lookup_online()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1175 in _lookup_online() to detect the mutant
    fail('COND_INV_1175_4: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_717_2 line 717 in _load_geocoder() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::Geocode requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::Geocode');
# ok($obj->..., 'RETURN_UNDEF_717_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_755_2 line 755 in _online_geocoder() ---
# Source:  );
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::Geocode requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::Geocode');
# ok($obj->..., 'RETURN_UNDEF_755_2: add assertion here');

done_testing();
