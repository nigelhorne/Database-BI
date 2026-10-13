#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-10-13 13:58:18
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

use_ok('Database::BI::Controller::Dashboard');
use_ok('Database::BI::Model::DataSource');

################################################################
# FILE: lib/Database/BI/Controller/Dashboard.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: NUM_BOUNDARY_124_41_< (HIGH) line 124 in _pagination() ---
# Source:  $per_page = $MAX_PER_PAGE if $per_page > $MAX_PER_PAGE;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_124_41_< line 124 in _pagination()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 124 in _pagination() to detect the mutant
    fail('NUM_BOUNDARY_124_41_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_126_21_> (HIGH) line 126 in _pagination() ---
# Source:  $page = 1 if $page < 1;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_126_21_> line 126 in _pagination()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 126 in _pagination() to detect the mutant
    fail('NUM_BOUNDARY_126_21_>: replace with real assertion');
}

# --- SURVIVOR: COND_INV_297_2 (MEDIUM) line 297 in _resolve_language() ---
# Source:  if ($lang ne $default) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_297_2 line 297 in _resolve_language()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 297 in _resolve_language() to detect the mutant
    fail('COND_INV_297_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_390_2 (MEDIUM) line 390 in _spec_to_url() ---
# Source:  return '/' if $spec =~ $REDIS_SPEC_RE;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_390_2 line 390 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 390 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_390_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_603_2 (MEDIUM) line 603 in _measure_pushable() ---
# Source:  return 0 unless $source && $source->can('aggregate');
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_603_2 line 603 in _measure_pushable()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 603 in _measure_pushable() to detect the mutant
    fail('BOOL_NEGATE_603_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_604_2 (MEDIUM) line 604 in _measure_pushable() ---
# Source:  return 1 if $fn eq 'count' || $fn eq 'count_distinct';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_604_2 line 604 in _measure_pushable()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 604 in _measure_pushable() to detect the mutant
    fail('BOOL_NEGATE_604_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_605_2 (MEDIUM) line 605 in _measure_pushable() ---
# Source:  return 0 unless defined $col;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_605_2 line 605 in _measure_pushable()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 605 in _measure_pushable() to detect the mutant
    fail('BOOL_NEGATE_605_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_634_2 (MEDIUM) line 634 in _parse_measure_param() ---
# Source:  return undef unless defined $str && length($str);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_634_2 line 634 in _parse_measure_param()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 634 in _parse_measure_param() to detect the mutant
    fail('BOOL_NEGATE_634_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_636_2 (MEDIUM) line 636 in _parse_measure_param() ---
# Source:  return undef unless defined $fn && defined $as && length($fn) && length($as);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_636_2 line 636 in _parse_measure_param()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 636 in _parse_measure_param() to detect the mutant
    fail('BOOL_NEGATE_636_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_638_2 (MEDIUM) line 638 in _parse_measure_param() ---
# Source:  return undef unless $MEASURE_FN_OK{$fn};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_638_2 line 638 in _parse_measure_param()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 638 in _parse_measure_param() to detect the mutant
    fail('BOOL_NEGATE_638_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_696_5 (MEDIUM) line 696 in _grouped_totals() ---
# Source:  if (!defined($v) || !length($v)) { $found = 1; last KEY_SCAN; }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_696_5 line 696 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 696 in _grouped_totals() to detect the mutant
    fail('COND_INV_696_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_715_3 (MEDIUM) line 715 in _grouped_totals() ---
# Source:  unless ($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition unless to if
TODO: {
    local $TODO = 'Complete: COND_INV_715_3 line 715 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 715 in _grouped_totals() to detect the mutant
    fail('COND_INV_715_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_742_5 (MEDIUM) line 742 in _grouped_totals() ---
# Source:  unless ($seen_warned{"$fn\x01" . ($val_col // '')}++) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition unless to if
TODO: {
    local $TODO = 'Complete: COND_INV_742_5 line 742 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 742 in _grouped_totals() to detect the mutant
    fail('COND_INV_742_5: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_750_74_> (HIGH) line 750 in _grouped_totals() ---
# Source:  elsif ($fn eq 'min') { $totals{$key}   = (!exists $totals{$key} || $n < $totals{$key}) ? $n : $totals{$key} }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_750_74_> line 750 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 750 in _grouped_totals() to detect the mutant
    fail('NUM_BOUNDARY_750_74_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_751_74_< (HIGH) line 751 in _grouped_totals() ---
# Source:  elsif ($fn eq 'max') { $totals{$key}   = (!exists $totals{$key} || $n > $totals{$key}) ? $n : $totals{$key} }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_751_74_< line 751 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 751 in _grouped_totals() to detect the mutant
    fail('NUM_BOUNDARY_751_74_<: replace with real assertion');
}

# --- SURVIVOR: COND_INV_755_2 (MEDIUM) line 755 in _grouped_totals() ---
# Source:  if ($fn eq 'avg') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_755_2 line 755 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 755 in _grouped_totals() to detect the mutant
    fail('COND_INV_755_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_838_25_< (HIGH) line 838 in _fetch_page() ---
# Source:  my $has_next = ($total > $offset + $per_page) ? 1 : 0;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_838_25_< line 838 in _fetch_page()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 838 in _fetch_page() to detect the mutant
    fail('NUM_BOUNDARY_838_25_<: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1105_2 (MEDIUM) line 1105 in _run_export_pipeline() ---
# Source:  if (defined $self->param('page') || defined $self->param('per_page')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1105_2 line 1105 in _run_export_pipeline()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1105 in _run_export_pipeline() to detect the mutant
    fail('COND_INV_1105_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_1108_26_< (HIGH) line 1108 in _run_export_pipeline() ---
# Source:  my $has_next = ($total > $offset + $per_page) ? 1 : 0;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_1108_26_< line 1108 in _run_export_pipeline()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1108 in _run_export_pipeline() to detect the mutant
    fail('NUM_BOUNDARY_1108_26_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1130_2 (MEDIUM) line 1130 in _decode_cell() ---
# Source:  return $s unless defined $s;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1130_2 line 1130 in _decode_cell()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1130 in _decode_cell() to detect the mutant
    fail('BOOL_NEGATE_1130_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1319_3 (MEDIUM) line 1319 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1319_3 line 1319 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1319 in view() to detect the mutant
    fail('BOOL_NEGATE_1319_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1339_3 (MEDIUM) line 1339 in view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1339_3 line 1339 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1339 in view() to detect the mutant
    fail('BOOL_NEGATE_1339_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1350_3 (MEDIUM) line 1350 in view() ---
# Source:  return $self->redirect_to('/tables?l=' . url_escape("table:$table"));
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1350_3 line 1350 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1350 in view() to detect the mutant
    fail('BOOL_NEGATE_1350_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1435_2 (MEDIUM) line 1435 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1435_2 line 1435 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1435 in browse() to detect the mutant
    fail('BOOL_NEGATE_1435_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1556_2 (MEDIUM) line 1556 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1556_2 line 1556 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1556 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1556_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1562_3 (MEDIUM) line 1562 in open_file() ---
# Source:  return $self->redirect_to('/tables?l=' . url_escape($file_path));
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1562_3 line 1562 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1562 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1562_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1569_3 (MEDIUM) line 1569 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1569_3 line 1569 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1569 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1569_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1577_3 (MEDIUM) line 1577 in open_file() ---
# Source:  if ($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1577_3 line 1577 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1577 in open_file() to detect the mutant
    fail('COND_INV_1577_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1578_4 (MEDIUM) line 1578 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1578_4 line 1578 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1578 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1578_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1594_3 (MEDIUM) line 1594 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1594_3 line 1594 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1594 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1594_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1628_3 (MEDIUM) line 1628 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1628_3 line 1628 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1628 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1628_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1638_4 (MEDIUM) line 1638 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1638_4 line 1638 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1638 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1638_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1654_3 (MEDIUM) line 1654 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1654_3 line 1654 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1654 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1654_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1684_2 (MEDIUM) line 1684 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1684_2 line 1684 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1684 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1684_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1720_3 (MEDIUM) line 1720 in open_file() ---
# Source:  if ($filename =~ /\.(?:sql|db)\z/i) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1720_3 line 1720 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1720 in open_file() to detect the mutant
    fail('COND_INV_1720_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1725_3 (MEDIUM) line 1725 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1725_3 line 1725 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1725 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1725_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1741_3 (MEDIUM) line 1741 in open_file() ---
# Source:  return $self->redirect_to('/tables?l=' . url_escape("path:${\$file->to_string}"));
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1741_3 line 1741 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1741 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1741_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1835_2 (MEDIUM) line 1835 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1835_2 line 1835 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1835 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1835_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1836_2 (MEDIUM) line 1836 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1836_2 line 1836 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1836 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1836_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1838_2 (MEDIUM) line 1838 in import_url() ---
# Source:  return $err_home->('error_url_ssrf', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1838_2 line 1838 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1838 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1838_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1842_2 (MEDIUM) line 1842 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1842_2 line 1842 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1842 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1842_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1845_2 (MEDIUM) line 1845 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1845_2 line 1845 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1845 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1845_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1943_3 (MEDIUM) line 1943 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1943_3 line 1943 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1943 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1943_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1966_2 (MEDIUM) line 1966 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404) unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1966_2 line 1966 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1966 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1966_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2031_2 (MEDIUM) line 2031 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2031_2 line 2031 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2031 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_2031_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2083_3 (MEDIUM) line 2083 in join_tables() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2083_3 line 2083 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2083 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_2083_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_2096_2 (MEDIUM) line 2096 in join_tables() ---
# Source:  if (defined $sort && grep { $_ eq $sort } @columns) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_2096_2 line 2096 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2096 in join_tables() to detect the mutant
    fail('COND_INV_2096_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2199_2 (MEDIUM) line 2199 in combine_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2199_2 line 2199 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2199 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_2199_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2203_3 (MEDIUM) line 2203 in combine_tables() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2203_3 line 2203 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2203 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_2203_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_2245_2 (MEDIUM) line 2245 in combine_tables() ---
# Source:  if (defined $sort && grep { $_ eq $sort } @columns) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_2245_2 line 2245 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2245 in combine_tables() to detect the mutant
    fail('COND_INV_2245_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_2256_25_< (HIGH) line 2256 in combine_tables() ---
# Source:  my $has_next = ($total > $offset + $per_page) ? 1 : 0;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_2256_25_< line 2256 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2256 in combine_tables() to detect the mutant
    fail('NUM_BOUNDARY_2256_25_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2358_2 (MEDIUM) line 2358 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2358_2 line 2358 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2358 in export_data() to detect the mutant
    fail('BOOL_NEGATE_2358_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_2364_2 (MEDIUM) line 2364 in export_data() ---
# Source:  if (@$warnings) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_2364_2 line 2364 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2364 in export_data() to detect the mutant
    fail('COND_INV_2364_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2372_2 (MEDIUM) line 2372 in export_data() ---
# Source:  return $format eq 'sqlite' ? $self->_render_sqlite($records, $columns, $safe_name)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2372_2 line 2372 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2372 in export_data() to detect the mutant
    fail('BOOL_NEGATE_2372_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2454_3 (MEDIUM) line 2454 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2454_3 line 2454 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2454 in export_write() to detect the mutant
    fail('BOOL_NEGATE_2454_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2467_3 (MEDIUM) line 2467 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2467_3 line 2467 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2467 in export_write() to detect the mutant
    fail('BOOL_NEGATE_2467_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2474_2 (MEDIUM) line 2474 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2474_2 line 2474 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2474 in export_write() to detect the mutant
    fail('BOOL_NEGATE_2474_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2489_2 (MEDIUM) line 2489 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2489_2 line 2489 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2489 in export_write() to detect the mutant
    fail('BOOL_NEGATE_2489_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2540_2 (MEDIUM) line 2540 in dirs_api() ---
# Source:  return $self->render(json => { error => 'Not a directory' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2540_2 line 2540 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2540 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_2540_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2607_3 (MEDIUM) line 2607 in stat_api() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2607_3 line 2607 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2607 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_2607_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2616_2 (MEDIUM) line 2616 in stat_api() ---
# Source:  return $self->render(json => { exists => \0, path => $path })
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2616_2 line 2616 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2616 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_2616_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2713_3 (MEDIUM) line 2713 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2713_3 line 2713 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2713 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2713_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2725_3 (MEDIUM) line 2725 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2725_3 line 2725 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2725 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2725_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2735_3 (MEDIUM) line 2735 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2735_3 line 2735 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2735 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2735_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2759_3 (MEDIUM) line 2759 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2759_3 line 2759 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2759 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2759_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2774_2 (MEDIUM) line 2774 in clear_uploads() ---
# Source:  return $self->render(json => { freed => 0, count => 0 })
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2774_2 line 2774 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2774 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_2774_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2822_2 (MEDIUM) line 2822 in graph_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2822_2 line 2822 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2822 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2822_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2826_2 (MEDIUM) line 2826 in graph_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2826_2 line 2826 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2826 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2826_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2835_2 (MEDIUM) line 2835 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2835_2 line 2835 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2835 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2835_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2837_2 (MEDIUM) line 2837 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2837_2 line 2837 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2837 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2837_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2852_2 (MEDIUM) line 2852 in graph_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2852_2 line 2852 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2852 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2852_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_2877_3 (MEDIUM) line 2877 in graph_view() ---
# Source:  if (!$@ && $ref && @$ref) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_2877_3 line 2877 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2877 in graph_view() to detect the mutant
    fail('COND_INV_2877_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2927_2 (MEDIUM) line 2927 in pie_view() ---
# Source:  return $self->render(text => 'Missing cat or val column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2927_2 line 2927 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2927 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2927_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2931_2 (MEDIUM) line 2931 in pie_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2931_2 line 2931 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2931 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2931_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2940_2 (MEDIUM) line 2940 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2940_2 line 2940 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2940 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2940_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2945_2 (MEDIUM) line 2945 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2945_2 line 2945 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2945 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2945_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2974_2 (MEDIUM) line 2974 in pie_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2974_2 line 2974 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2974 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2974_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3081_2 (MEDIUM) line 3081 in heatmap_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3081_2 line 3081 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3081 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_3081_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3085_2 (MEDIUM) line 3085 in heatmap_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3085_2 line 3085 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3085 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_3085_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3094_2 (MEDIUM) line 3094 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3094_2 line 3094 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3094 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_3094_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3096_2 (MEDIUM) line 3096 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3096_2 line 3096 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3096 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_3096_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3098_2 (MEDIUM) line 3098 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3098_2 line 3098 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3098 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_3098_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3136_2 (MEDIUM) line 3136 in heatmap_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3136_2 line 3136 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3136 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_3136_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3239_2 (MEDIUM) line 3239 in bar_view() ---
# Source:  return $self->render(text => 'Missing cat column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3239_2 line 3239 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3239 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_3239_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3243_2 (MEDIUM) line 3243 in bar_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3243_2 line 3243 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3243 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_3243_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3252_2 (MEDIUM) line 3252 in bar_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3252_2 line 3252 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3252 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_3252_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3257_2 (MEDIUM) line 3257 in bar_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3257_2 line 3257 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3257 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_3257_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3271_2 (MEDIUM) line 3271 in bar_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3271_2 line 3271 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3271 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_3271_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3295_15_< (HIGH) line 3295 in bar_view() ---
# Source:  ($max_bars > 0 ? (max_bars => $max_bars) : ()),
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3295_15_< line 3295 in bar_view()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3295 in bar_view() to detect the mutant
    fail('NUM_BOUNDARY_3295_15_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3385_2 (MEDIUM) line 3385 in folder_view() ---
# Source:  return $self->render(text => 'Missing l= parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3385_2 line 3385 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3385 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_3385_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3390_2 (MEDIUM) line 3390 in folder_view() ---
# Source:  return $self->render(text => 'Prefix too long', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3390_2 line 3390 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3390 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_3390_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3399_2 (MEDIUM) line 3399 in folder_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3399_2 line 3399 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3399 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_3399_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3405_33_> (HIGH) line 3405 in folder_view() ---
# Source:  my $sample_end = $#{$records} < 9 ? $#{$records} : 9;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3405_33_> line 3405 in folder_view()';
    # Suggested boundary values to test: 8, 9, 10
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3405 in folder_view() to detect the mutant
    fail('NUM_BOUNDARY_3405_33_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3435_23_< (HIGH) line 3435 in folder_view() ---
# Source:  next if length($p) <= $len;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip <= to <
#   Numeric boundary flip <= to >
#   Numeric boundary flip <= to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3435_23_< line 3435 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3435 in folder_view() to detect the mutant
    fail('NUM_BOUNDARY_3435_23_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3450_3 (MEDIUM) line 3450 in folder_view() ---
# Source:  return $n;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3450_3 line 3450 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3450 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_3450_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3482_17_> (HIGH) line 3482 in folder_view() ---
# Source:  href => ($i < length($prefix))
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3482_17_> line 3482 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3482 in folder_view() to detect the mutant
    fail('NUM_BOUNDARY_3482_17_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3557_2 (MEDIUM) line 3557 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $spec && length $spec;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3557_2 line 3557 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3557 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3557_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3573_3 (MEDIUM) line 3573 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3573_3 line 3573 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3573 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3573_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3580_3 (MEDIUM) line 3580 in tables_view() ---
# Source:  return $self->reply->not_found
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3580_3 line 3580 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3580 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3580_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3590_3 (MEDIUM) line 3590 in tables_view() ---
# Source:  if ($spec =~ m{\Aredis://(?::([^@]*)@)?([^/]+)(?:/(\d+))?\z}i) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3590_3 line 3590 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3590 in tables_view() to detect the mutant
    fail('COND_INV_3590_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3605_5 (MEDIUM) line 3605 in tables_view() ---
# Source:  if (eval { require "$file.pm"; 1 }) { $pkg = $mod; last }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3605_5 line 3605 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3605 in tables_view() to detect the mutant
    fail('COND_INV_3605_5: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3625_41_> (HIGH) line 3625 in tables_view() ---
# Source:  } while ($cursor ne '0' && @all_keys < 200);
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3625_41_> line 3625 in tables_view()';
    # Suggested boundary values to test: 199, 200, 201
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3625 in tables_view() to detect the mutant
    fail('NUM_BOUNDARY_3625_41_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3635_3 (MEDIUM) line 3635 in tables_view() ---
# Source:  return $self->reply->not_found if $@;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3635_3 line 3635 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3635 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3635_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3637_3 (MEDIUM) line 3637 in tables_view() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3637_3 line 3637 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3637 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3637_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3665_5 (MEDIUM) line 3665 in tables_view() ---
# Source:  }; return $self->reply->not_found if $@; }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3665_5 line 3665 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3665 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3665_5: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_390_2 line 390 in _spec_to_url() ---
# Source:  return '/' if $spec =~ $REDIS_SPEC_RE;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_390_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_603_2 line 603 in _measure_pushable() ---
# Source:  return 0 unless $source && $source->can('aggregate');
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_603_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_604_2 line 604 in _measure_pushable() ---
# Source:  return 1 if $fn eq 'count' || $fn eq 'count_distinct';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_604_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_605_2 line 605 in _measure_pushable() ---
# Source:  return 0 unless defined $col;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_605_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_634_2 line 634 in _parse_measure_param() ---
# Source:  return undef unless defined $str && length($str);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_634_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_636_2 line 636 in _parse_measure_param() ---
# Source:  return undef unless defined $fn && defined $as && length($fn) && length($as);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_636_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_638_2 line 638 in _parse_measure_param() ---
# Source:  return undef unless $MEASURE_FN_OK{$fn};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_638_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1130_2 line 1130 in _decode_cell() ---
# Source:  return $s unless defined $s;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1130_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1319_3 line 1319 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1319_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1339_3 line 1339 in view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1339_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1350_3 line 1350 in view() ---
# Source:  return $self->redirect_to('/tables?l=' . url_escape("table:$table"));
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1350_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1435_2 line 1435 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1435_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1556_2 line 1556 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1556_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1562_3 line 1562 in open_file() ---
# Source:  return $self->redirect_to('/tables?l=' . url_escape($file_path));
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1562_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1569_3 line 1569 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1569_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1578_4 line 1578 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1578_4: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1594_3 line 1594 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1594_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1628_3 line 1628 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1628_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1638_4 line 1638 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1638_4: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1654_3 line 1654 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1654_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1684_2 line 1684 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1684_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1725_3 line 1725 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1725_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1741_3 line 1741 in open_file() ---
# Source:  return $self->redirect_to('/tables?l=' . url_escape("path:${\$file->to_string}"));
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1741_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1835_2 line 1835 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1835_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1836_2 line 1836 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1836_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1838_2 line 1838 in import_url() ---
# Source:  return $err_home->('error_url_ssrf', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1838_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1842_2 line 1842 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1842_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1845_2 line 1845 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1845_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1943_3 line 1943 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1943_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1966_2 line 1966 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404) unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1966_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2031_2 line 2031 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2031_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2083_3 line 2083 in join_tables() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2083_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2199_2 line 2199 in combine_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2199_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2203_3 line 2203 in combine_tables() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2203_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2358_2 line 2358 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2358_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2372_2 line 2372 in export_data() ---
# Source:  return $format eq 'sqlite' ? $self->_render_sqlite($records, $columns, $safe_name)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2372_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2454_3 line 2454 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2454_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2467_3 line 2467 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2467_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2474_2 line 2474 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2474_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2489_2 line 2489 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2489_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2540_2 line 2540 in dirs_api() ---
# Source:  return $self->render(json => { error => 'Not a directory' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2540_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2607_3 line 2607 in stat_api() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2607_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2616_2 line 2616 in stat_api() ---
# Source:  return $self->render(json => { exists => \0, path => $path })
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2616_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2713_3 line 2713 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2713_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2725_3 line 2725 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2725_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2735_3 line 2735 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2735_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2759_3 line 2759 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2759_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2774_2 line 2774 in clear_uploads() ---
# Source:  return $self->render(json => { freed => 0, count => 0 })
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2774_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2822_2 line 2822 in graph_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2822_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2826_2 line 2826 in graph_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2826_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2835_2 line 2835 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2835_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2837_2 line 2837 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2837_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2852_2 line 2852 in graph_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2852_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2927_2 line 2927 in pie_view() ---
# Source:  return $self->render(text => 'Missing cat or val column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2927_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2931_2 line 2931 in pie_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2931_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2940_2 line 2940 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2940_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2945_2 line 2945 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2945_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2974_2 line 2974 in pie_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2974_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3081_2 line 3081 in heatmap_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3081_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3085_2 line 3085 in heatmap_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3085_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3094_2 line 3094 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3094_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3096_2 line 3096 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3096_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3098_2 line 3098 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3098_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3136_2 line 3136 in heatmap_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3136_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3239_2 line 3239 in bar_view() ---
# Source:  return $self->render(text => 'Missing cat column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3239_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3243_2 line 3243 in bar_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3243_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3252_2 line 3252 in bar_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3252_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3257_2 line 3257 in bar_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3257_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3271_2 line 3271 in bar_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3271_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3385_2 line 3385 in folder_view() ---
# Source:  return $self->render(text => 'Missing l= parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3385_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3390_2 line 3390 in folder_view() ---
# Source:  return $self->render(text => 'Prefix too long', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3390_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3399_2 line 3399 in folder_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3399_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3450_3 line 3450 in folder_view() ---
# Source:  return $n;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3450_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3557_2 line 3557 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $spec && length $spec;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3557_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3573_3 line 3573 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3573_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3580_3 line 3580 in tables_view() ---
# Source:  return $self->reply->not_found
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3580_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3635_3 line 3635 in tables_view() ---
# Source:  return $self->reply->not_found if $@;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3635_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3637_3 line 3637 in tables_view() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3637_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3665_5 line 3665 in tables_view() ---
# Source:  }; return $self->reply->not_found if $@; }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3665_5: add assertion here');

################################################################
# FILE: lib/Database/BI/Model/DataSource.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: COND_INV_519_4 (MEDIUM) line 519 in _new_from_url() ---
# Source:  _table            => _url_label($url),
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_519_4 line 519 in _new_from_url()';
    # NOTE: _new_from_url is a class method — call directly.
    my $result = Database::BI::Model::DataSource->_new_from_url(...);
    # ok($result, 'COND_INV_519_4: add assertion here');
    # TODO: exercise line 519 in _new_from_url() to detect the mutant
    fail('COND_INV_519_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_751_3 (MEDIUM) line 751 in _detect_file_info() ---
# Source:  } elsif($ext eq 'tsv') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_751_3 line 751 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 751 in _detect_file_info() to detect the mutant
    fail('COND_INV_751_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_753_27_!= (HIGH) line 753 in _detect_file_info() ---
# Source:  } else {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_753_27_!= line 753 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 753 in _detect_file_info() to detect the mutant
    fail('NUM_BOUNDARY_753_27_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_758_4 (MEDIUM) line 758 in _detect_file_info() ---
# Source:  my @probe = split /,/, $line, -1;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition unless to if
TODO: {
    local $TODO = 'Complete: COND_INV_758_4 line 758 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 758 in _detect_file_info() to detect the mutant
    fail('COND_INV_758_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_759_5 (MEDIUM) line 759 in _detect_file_info() ---
# Source:  $sep = (@probe == 1 && $line =~ /!/) ? '!' : ',';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_759_5 line 759 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 759 in _detect_file_info() to detect the mutant
    fail('COND_INV_759_5: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_761_29_!= (HIGH) line 761 in _detect_file_info() ---
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_761_29_!= line 761 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 761 in _detect_file_info() to detect the mutant
    fail('NUM_BOUNDARY_761_29_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_769_3 (MEDIUM) line 769 in _detect_file_info() ---
# Source:  # empty column list.  Treat that the same as a 0-byte file: return the
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_769_3 line 769 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 769 in _detect_file_info() to detect the mutant
    fail('COND_INV_769_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_778_33_< (HIGH) line 778 in _detect_file_info() ---
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_778_33_< line 778 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 778 in _detect_file_info() to detect the mutant
    fail('NUM_BOUNDARY_778_33_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_789_5 (MEDIUM) line 789 in _detect_file_info() ---
# Source:  # whether a given index position is blank -- sufficient for id selection.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_789_5 line 789 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 789 in _detect_file_info() to detect the mutant
    fail('BOOL_NEGATE_789_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_795_4 (MEDIUM) line 795 in _detect_file_info() ---
# Source:  my $data_line;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_795_4 line 795 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 795 in _detect_file_info() to detect the mutant
    fail('COND_INV_795_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_839_2 (MEDIUM) line 839 in _detect_file_info() ---
# Source:  return {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_839_2 line 839 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 839 in _detect_file_info() to detect the mutant
    fail('BOOL_NEGATE_839_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_951_3 (MEDIUM) line 951 in _detect_file_info() ---
# Source:  columns          => ['entry', 'value'],
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_951_3 line 951 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 951 in _detect_file_info() to detect the mutant
    fail('COND_INV_951_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1011_3 (MEDIUM) line 1011 in _values_are_data_like() ---
# Source:  return 1 if $v =~ /\A\(\d+(?:\.\d+)?\)\z/;		# accounting negative (e.g. (75.13))
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1011_3 line 1011 in _values_are_data_like()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1011 in _values_are_data_like() to detect the mutant
    fail('COND_INV_1011_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1080_3 (MEDIUM) line 1080 in _cache_key() ---
# Source:  #
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1080_3 line 1080 in _cache_key()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1080 in _cache_key() to detect the mutant
    fail('COND_INV_1080_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1383_3 (MEDIUM) line 1383 in table_name() ---
# Source:  Example:
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1383_3 line 1383 in table_name()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1383 in table_name() to detect the mutant
    fail('COND_INV_1383_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1414_3 (MEDIUM) line 1414 in sqlite_tables() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1414_3 line 1414 in sqlite_tables()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1414 in sqlite_tables() to detect the mutant
    fail('COND_INV_1414_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1445_2 (MEDIUM) line 1445 in sqlite_tables() ---
# Source:  Delegates to the underlying C<Database::Abstraction> C<columns()>, which
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1445_2 line 1445 in sqlite_tables()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1445 in sqlite_tables() to detect the mutant
    fail('BOOL_NEGATE_1445_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1446_2 (MEDIUM) line 1446 in sqlite_tables() ---
# Source:  triggers a lazy open of the Redis connection on first call and returns the
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1446_2 line 1446 in sqlite_tables()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1446 in sqlite_tables() to detect the mutant
    fail('BOOL_NEGATE_1446_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1447_2 (MEDIUM) line 1447 in sqlite_tables() ---
# Source:  column names derived from the first stored row (alphabetical order, includes
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1447_2 line 1447 in sqlite_tables()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1447 in sqlite_tables() to detect the mutant
    fail('BOOL_NEGATE_1447_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_789_5 line 789 in _detect_file_info() ---
# Source:  # whether a given index position is blank -- sufficient for id selection.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_789_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_839_2 line 839 in _detect_file_info() ---
# Source:  return {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_839_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1445_2 line 1445 in sqlite_tables() ---
# Source:  Delegates to the underlying C<Database::Abstraction> C<columns()>, which
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1445_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1446_2 line 1446 in sqlite_tables() ---
# Source:  triggers a lazy open of the Redis connection on first call and returns the
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1446_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1447_2 line 1447 in sqlite_tables() ---
# Source:  column names derived from the first stored row (alphabetical order, includes
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1447_2: add assertion here');

done_testing();
