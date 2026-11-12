#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-11-12 02:07:10
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

use_ok('Database::BI::CacheDir');
use_ok('Database::BI::Extract');
use_ok('Database::BI::Insights');
use_ok('Database::BI::Model::Boundary');
use_ok('Database::BI::Model::DataSource');
use_ok('Database::BI::Model::Geocode');

################################################################
# FILE: lib/Database/BI/CacheDir.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: BOOL_NEGATE_130_2 (MEDIUM) line 130 in resolve() ---
# Source:  return $params->{cache_dir} if _set($params->{cache_dir});
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_130_2 line 130 in resolve()';
    # NOTE: resolve is a class method — call directly.
    my $result = Database::BI::CacheDir->resolve(...);
    # ok($result, 'BOOL_NEGATE_130_2: add assertion here');
    # TODO: exercise line 130 in resolve() to detect the mutant
    fail('BOOL_NEGATE_130_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_130_2 line 130 in resolve() ---
# Source:  return $params->{cache_dir} if _set($params->{cache_dir});
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: resolve is a class method — call directly.
# e.g. my $result = Database::BI::CacheDir->resolve(...);
# ok($result, 'RETURN_UNDEF_130_2: add assertion here');

################################################################
# FILE: lib/Database/BI/Extract.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: BOOL_NEGATE_101_2 (MEDIUM) line 101 in path() ---
# Source:  # Returns the path to the cached SQLite file when the fingerprint matches and
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_101_2 line 101 in path()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Extract requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Extract');
    # TODO: exercise line 101 in path() to detect the mutant
    fail('BOOL_NEGATE_101_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_105_3 (MEDIUM) line 105 in get() ---
# Source:  my $p = $self->path($spec, $mtime, $size);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_105_3 line 105 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Extract requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Extract');
    # TODO: exercise line 105 in get() to detect the mutant
    fail('COND_INV_105_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_109_2 (MEDIUM) line 109 in get() ---
# Source:  # put( $spec, $mtime, $size, $sqlite_bytes ) -> $path_string
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_109_2 line 109 in get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Extract requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Extract');
    # TODO: exercise line 109 in get() to detect the mutant
    fail('BOOL_NEGATE_109_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_101_2 line 101 in path() ---
# Source:  # Returns the path to the cached SQLite file when the fingerprint matches and
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Extract requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Extract');
# ok($obj->..., 'RETURN_UNDEF_101_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_109_2 line 109 in get() ---
# Source:  # put( $spec, $mtime, $size, $sqlite_bytes ) -> $path_string
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
# FILE: lib/Database/BI/Model/Boundary.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: NUM_BOUNDARY_300_16_< (HIGH) line 300 ---
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip <= to <
#   Numeric boundary flip <= to >
#   Numeric boundary flip <= to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_300_16_< line 300';
    # NOTE:  is a class method — call directly.
    my $result = Database::BI::Model::Boundary->(...);
    # ok($result, 'NUM_BOUNDARY_300_16_<: add assertion here');
    # TODO: exercise line 300 to detect the mutant
    fail('NUM_BOUNDARY_300_16_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_499_2 (MEDIUM) line 499 in levels() ---
# Source:  lon : number  -180 .. 180
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_499_2 line 499 in levels()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Boundary requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Boundary');
    # TODO: exercise line 499 in levels() to detect the mutant
    fail('BOOL_NEGATE_499_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_514_2 (MEDIUM) line 514 in point_key() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_514_2 line 514 in point_key()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Boundary requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Boundary');
    # TODO: exercise line 514 in point_key() to detect the mutant
    fail('BOOL_NEGATE_514_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_581_3 (MEDIUM) line 581 in outlines() ---
# Source:  ($osm, $status) = $self->_ask($key, $index);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_581_3 line 581 in outlines()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Boundary requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Boundary');
    # TODO: exercise line 581 in outlines() to detect the mutant
    fail('BOOL_NEGATE_581_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_692_2 (MEDIUM) line 692 in file_cache() ---
# Source:  require File::Spec;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_692_2 line 692 in file_cache()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Boundary requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Boundary');
    # TODO: exercise line 692 in file_cache() to detect the mutant
    fail('BOOL_NEGATE_692_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_727_52_> (HIGH) line 727 in _get() ---
# Source:  my ($self, $key) = @_;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_727_52_> line 727 in _get()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Boundary requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Boundary');
    # TODO: exercise line 727 in _get() to detect the mutant
    fail('NUM_BOUNDARY_727_52_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_733_12_> (HIGH) line 733 in _set() ---
# Source:  my ($self, $key, $value) = @_;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_733_12_> line 733 in _set()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Boundary requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Boundary');
    # TODO: exercise line 733 in _set() to detect the mutant
    fail('NUM_BOUNDARY_733_12_>: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_499_2 line 499 in levels() ---
# Source:  lon : number  -180 .. 180
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::Boundary requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::Boundary');
# ok($obj->..., 'RETURN_UNDEF_499_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_514_2 line 514 in point_key() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::Boundary requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::Boundary');
# ok($obj->..., 'RETURN_UNDEF_514_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_581_3 line 581 in outlines() ---
# Source:  ($osm, $status) = $self->_ask($key, $index);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::Boundary requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::Boundary');
# ok($obj->..., 'RETURN_UNDEF_581_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_692_2 line 692 in file_cache() ---
# Source:  require File::Spec;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::Boundary requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::Boundary');
# ok($obj->..., 'RETURN_UNDEF_692_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_727_2 line 727 in _get() ---
# Source:  my ($self, $key) = @_;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::Boundary requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::Boundary');
# ok($obj->..., 'RETURN_UNDEF_727_2: add assertion here');

################################################################
# FILE: lib/Database/BI/Model/DataSource.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: BOOL_NEGATE_458_2 (MEDIUM) line 458 in _msg() ---
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
# Source:  return $self;
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
# Source:  (my $safe_table = $raw_table) =~ s/[^A-Za-z0-9_]/_/g;
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

# --- SURVIVOR: COND_INV_927_3 (MEDIUM) line 927 in _best_id_column() ---
# Source:  #
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_927_3 line 927 in _best_id_column()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 927 in _best_id_column() to detect the mutant
    fail('COND_INV_927_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_929_27_!= (HIGH) line 929 in _best_id_column() ---
# Source:  #   sep_char => field separator character (',' or '|')
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_929_27_!= line 929 in _best_id_column()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 929 in _best_id_column() to detect the mutant
    fail('NUM_BOUNDARY_929_27_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_934_4 (MEDIUM) line 934 in _best_id_column() ---
# Source:  #   1. sep_char defaults to '!' -- so a plain CSV is read as one giant field
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition unless to if
TODO: {
    local $TODO = 'Complete: COND_INV_934_4 line 934 in _best_id_column()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 934 in _best_id_column() to detect the mutant
    fail('COND_INV_934_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_935_5 (MEDIUM) line 935 in _best_id_column() ---
# Source:  #      per row, producing a single comma-joined string instead of columns.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_935_5 line 935 in _best_id_column()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 935 in _best_id_column() to detect the mutant
    fail('COND_INV_935_5: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_937_29_!= (HIGH) line 937 in _best_id_column() ---
# Source:  #      doesn't exist every row is silently discarded.
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_937_29_!= line 937 in _best_id_column()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 937 in _best_id_column() to detect the mutant
    fail('NUM_BOUNDARY_937_29_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_945_3 (MEDIUM) line 945 in _detect_file_info() ---
# Source:  # order of the sheet.
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
# Source:  my ($rmin, $rmax) = $ws->row_range;
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
# Source:  }
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
# Source:  if defined $tables;
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

# --- SURVIVOR: COND_INV_1187_3 (MEDIUM) line 1187 in _detect_file_info() ---
# Source:  file_size => $fsize,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1187_3 line 1187 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1187 in _detect_file_info() to detect the mutant
    fail('COND_INV_1187_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1256_3 (MEDIUM) line 1256 in _json_list_keys() ---
# Source:  my @full = grep { @{ $data->{$_} } } @lists;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1256_3 line 1256 in _json_list_keys()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1256 in _json_list_keys() to detect the mutant
    fail('COND_INV_1256_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1531_3 (MEDIUM) line 1531 in _synthesize_col_names() ---
# Source:  #          copy with it too.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1531_3 line 1531 in _synthesize_col_names()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1531 in _synthesize_col_names() to detect the mutant
    fail('BOOL_NEGATE_1531_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1583_2 (MEDIUM) line 1583 in _copy_with_header() ---
# Source:  #          passively when the CHI driver reclaims memory.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1583_2 line 1583 in _copy_with_header()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1583 in _copy_with_header() to detect the mutant
    fail('BOOL_NEGATE_1583_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1584_2 (MEDIUM) line 1584 in _copy_with_header() ---
# Source:  # Entry:   $self->{_cache} must be defined (caller checks this before calling).
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1584_2 line 1584 in _copy_with_header()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1584 in _copy_with_header() to detect the mutant
    fail('BOOL_NEGATE_1584_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1585_2 (MEDIUM) line 1585 in _copy_with_header() ---
# Source:  # Exit:    Returns a non-empty string key, or undef when no key is derivable
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1585_2 line 1585 in _copy_with_header()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1585 in _copy_with_header() to detect the mutant
    fail('BOOL_NEGATE_1585_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1586_2 (MEDIUM) line 1586 in _copy_with_header() ---
# Source:  #          (no URL, no file path on disk).
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1586_2 line 1586 in _copy_with_header()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1586 in _copy_with_header() to detect the mutant
    fail('BOOL_NEGATE_1586_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1588_2 (MEDIUM) line 1588 in _cache_key() ---
# Source:  my $self = shift;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1588_2 line 1588 in _cache_key()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1588 in _cache_key() to detect the mutant
    fail('BOOL_NEGATE_1588_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1947_3 (MEDIUM) line 1947 in _init_backend() ---
# Source:  None.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1947_3 line 1947 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1947 in _init_backend() to detect the mutant
    fail('COND_INV_1947_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1978_3 (MEDIUM) line 1978 in table_name() ---
# Source:  =head4 INPUT
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1978_3 line 1978 in table_name()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1978 in table_name() to detect the mutant
    fail('COND_INV_1978_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2023_2 (MEDIUM) line 2023 in sqlite_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2023_2 line 2023 in sqlite_tables()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 2023 in sqlite_tables() to detect the mutant
    fail('BOOL_NEGATE_2023_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2024_2 (MEDIUM) line 2024 in sqlite_tables() ---
# Source:  ($file, $table)   $table undef when none is named; ('', undef) for undef
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2024_2 line 2024 in sqlite_tables()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 2024 in sqlite_tables() to detect the mutant
    fail('BOOL_NEGATE_2024_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2025_2 (MEDIUM) line 2025 in sqlite_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2025_2 line 2025 in sqlite_tables()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 2025 in sqlite_tables() to detect the mutant
    fail('BOOL_NEGATE_2025_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_458_2 line 458 in _msg() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_458_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_629_2 line 629 in _new_from_url() ---
# Source:  return $self;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: _new_from_url is a class method — call directly.
# e.g. my $result = Database::BI::Model::DataSource->_new_from_url(...);
# ok($result, 'RETURN_UNDEF_629_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_965_5 line 965 in _detect_file_info() ---
# Source:  my ($rmin, $rmax) = $ws->row_range;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_965_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1015_2 line 1015 in _detect_file_info() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1015_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1531_3 line 1531 in _synthesize_col_names() ---
# Source:  #          copy with it too.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1531_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1583_2 line 1583 in _copy_with_header() ---
# Source:  #          passively when the CHI driver reclaims memory.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1583_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1584_2 line 1584 in _copy_with_header() ---
# Source:  # Entry:   $self->{_cache} must be defined (caller checks this before calling).
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1584_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1585_2 line 1585 in _copy_with_header() ---
# Source:  # Exit:    Returns a non-empty string key, or undef when no key is derivable
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1585_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1586_2 line 1586 in _copy_with_header() ---
# Source:  #          (no URL, no file path on disk).
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1586_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1588_2 line 1588 in _cache_key() ---
# Source:  my $self = shift;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1588_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2023_2 line 2023 in sqlite_tables() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_2023_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2024_2 line 2024 in sqlite_tables() ---
# Source:  ($file, $table)   $table undef when none is named; ('', undef) for undef
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_2024_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2025_2 line 2025 in sqlite_tables() ---
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

# --- SURVIVOR: COND_INV_689_2 (MEDIUM) line 689 in _check_interface() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_689_2 line 689 in _check_interface()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 689 in _check_interface() to detect the mutant
    fail('COND_INV_689_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_690_3 (MEDIUM) line 690 in _check_interface() ---
# Source:  # _load_geocoder() -> geocoder object, or undef when there is not one to be had
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_690_3 line 690 in _check_interface()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 690 in _check_interface() to detect the mutant
    fail('COND_INV_690_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_717_2 (MEDIUM) line 717 in _load_geocoder() ---
# Source:  }
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

# --- SURVIVOR: COND_INV_739_2 (MEDIUM) line 739 in _load_geocoder() ---
# Source:  );
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_739_2 line 739 in _load_geocoder()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 739 in _load_geocoder() to detect the mutant
    fail('COND_INV_739_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_755_2 (MEDIUM) line 755 in _load_geocoder() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_755_2 line 755 in _load_geocoder()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 755 in _load_geocoder() to detect the mutant
    fail('BOOL_NEGATE_755_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1081_3 (MEDIUM) line 1081 in _resolve() ---
# Source:  };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1081_3 line 1081 in _resolve()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1081 in _resolve() to detect the mutant
    fail('COND_INV_1081_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_1126_56_> (HIGH) line 1126 in _resolve() ---
# Source:  'distinct'	=> $distinct,
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_1126_56_> line 1126 in _resolve()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1126 in _resolve() to detect the mutant
    fail('NUM_BOUNDARY_1126_56_>: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1140_3 (MEDIUM) line 1140 in _resolve() ---
# Source:  'messages'	=> \@messages,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1140_3 line 1140 in _resolve()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1140 in _resolve() to detect the mutant
    fail('COND_INV_1140_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1146_4 (MEDIUM) line 1146 in _resolve() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1146_4 line 1146 in _resolve()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1146 in _resolve() to detect the mutant
    fail('COND_INV_1146_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1158_3 (MEDIUM) line 1158 in _lookup_batch() ---
# Source:  $values,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1158_3 line 1158 in _lookup_batch()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1158 in _lookup_batch() to detect the mutant
    fail('COND_INV_1158_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1166_2 (MEDIUM) line 1166 in _lookup_batch() ---
# Source:  ? $batch->{'lookups'}
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1166_2 line 1166 in _lookup_batch()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1166 in _lookup_batch() to detect the mutant
    fail('COND_INV_1166_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1175_4 (MEDIUM) line 1175 in _lookup_batch() ---
# Source:  # Each place down the Geo::Coder::List that holds the local data alone, with
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1175_4 line 1175 in _lookup_batch()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::Geocode requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::Geocode');
    # TODO: exercise line 1175 in _lookup_batch() to detect the mutant
    fail('COND_INV_1175_4: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_717_2 line 717 in _load_geocoder() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::Geocode requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::Geocode');
# ok($obj->..., 'RETURN_UNDEF_717_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_755_2 line 755 in _load_geocoder() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::Geocode requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::Geocode');
# ok($obj->..., 'RETURN_UNDEF_755_2: add assertion here');

done_testing();
