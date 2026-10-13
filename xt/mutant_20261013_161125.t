#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-10-13 16:11:25
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

################################################################
# FILE: lib/Database/BI/Controller/Dashboard.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: NUM_BOUNDARY_129_41_< (HIGH) line 129 in _pagination() ---
# Source:  $per_page = $MAX_PER_PAGE if $per_page > $MAX_PER_PAGE;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_129_41_< line 129 in _pagination()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 129 in _pagination() to detect the mutant
    fail('NUM_BOUNDARY_129_41_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_131_21_> (HIGH) line 131 in _pagination() ---
# Source:  $page = 1 if $page < 1;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_131_21_> line 131 in _pagination()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 131 in _pagination() to detect the mutant
    fail('NUM_BOUNDARY_131_21_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_395_2 (MEDIUM) line 395 in _spec_to_url() ---
# Source:  return '/' if $spec =~ $REDIS_SPEC_RE;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_395_2 line 395 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 395 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_395_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_608_2 (MEDIUM) line 608 in _measure_pushable() ---
# Source:  return 0 unless $source && $source->can('aggregate');
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_608_2 line 608 in _measure_pushable()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 608 in _measure_pushable() to detect the mutant
    fail('BOOL_NEGATE_608_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_609_2 (MEDIUM) line 609 in _measure_pushable() ---
# Source:  return 1 if $fn eq 'count' || $fn eq 'count_distinct';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_609_2 line 609 in _measure_pushable()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 609 in _measure_pushable() to detect the mutant
    fail('BOOL_NEGATE_609_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_610_2 (MEDIUM) line 610 in _measure_pushable() ---
# Source:  return 0 unless defined $col;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_610_2 line 610 in _measure_pushable()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 610 in _measure_pushable() to detect the mutant
    fail('BOOL_NEGATE_610_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_639_2 (MEDIUM) line 639 in _parse_measure_param() ---
# Source:  return undef unless defined $str && length($str);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_639_2 line 639 in _parse_measure_param()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 639 in _parse_measure_param() to detect the mutant
    fail('BOOL_NEGATE_639_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_641_2 (MEDIUM) line 641 in _parse_measure_param() ---
# Source:  return undef unless defined $fn && defined $as && length($fn) && length($as);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_641_2 line 641 in _parse_measure_param()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 641 in _parse_measure_param() to detect the mutant
    fail('BOOL_NEGATE_641_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_701_5 (MEDIUM) line 701 in _grouped_totals() ---
# Source:  if (!defined($v) || !length($v)) { $found = 1; last KEY_SCAN; }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_701_5 line 701 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 701 in _grouped_totals() to detect the mutant
    fail('COND_INV_701_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_720_3 (MEDIUM) line 720 in _grouped_totals() ---
# Source:  unless ($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition unless to if
TODO: {
    local $TODO = 'Complete: COND_INV_720_3 line 720 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 720 in _grouped_totals() to detect the mutant
    fail('COND_INV_720_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_747_5 (MEDIUM) line 747 in _grouped_totals() ---
# Source:  unless ($seen_warned{"$fn\x01" . ($val_col // '')}++) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition unless to if
TODO: {
    local $TODO = 'Complete: COND_INV_747_5 line 747 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 747 in _grouped_totals() to detect the mutant
    fail('COND_INV_747_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_753_4 (MEDIUM) line 753 in _grouped_totals() ---
# Source:  if    ($fn eq 'sum') { $totals{$key}  += $n                                                             }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_753_4 line 753 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 753 in _grouped_totals() to detect the mutant
    fail('COND_INV_753_4: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_755_74_> (HIGH) line 755 in _grouped_totals() ---
# Source:  elsif ($fn eq 'min') { $totals{$key}   = (!exists $totals{$key} || $n < $totals{$key}) ? $n : $totals{$key} }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_755_74_> line 755 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 755 in _grouped_totals() to detect the mutant
    fail('NUM_BOUNDARY_755_74_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_756_74_< (HIGH) line 756 in _grouped_totals() ---
# Source:  elsif ($fn eq 'max') { $totals{$key}   = (!exists $totals{$key} || $n > $totals{$key}) ? $n : $totals{$key} }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_756_74_< line 756 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 756 in _grouped_totals() to detect the mutant
    fail('NUM_BOUNDARY_756_74_<: replace with real assertion');
}

# --- SURVIVOR: COND_INV_760_2 (MEDIUM) line 760 in _grouped_totals() ---
# Source:  if ($fn eq 'avg') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_760_2 line 760 in _grouped_totals()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 760 in _grouped_totals() to detect the mutant
    fail('COND_INV_760_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1110_2 (MEDIUM) line 1110 in _run_export_pipeline() ---
# Source:  if (defined $self->param('page') || defined $self->param('per_page')) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1110_2 line 1110 in _run_export_pipeline()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1110 in _run_export_pipeline() to detect the mutant
    fail('COND_INV_1110_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1135_2 (MEDIUM) line 1135 in _decode_cell() ---
# Source:  return $s unless defined $s;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1135_2 line 1135 in _decode_cell()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1135 in _decode_cell() to detect the mutant
    fail('BOOL_NEGATE_1135_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1324_3 (MEDIUM) line 1324 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1324_3 line 1324 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1324 in view() to detect the mutant
    fail('BOOL_NEGATE_1324_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1440_2 (MEDIUM) line 1440 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1440_2 line 1440 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1440 in browse() to detect the mutant
    fail('BOOL_NEGATE_1440_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1561_2 (MEDIUM) line 1561 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1561_2 line 1561 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1561 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1561_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1567_3 (MEDIUM) line 1567 in open_file() ---
# Source:  return $self->redirect_to('/tables?l=' . url_escape($file_path));
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1567_3 line 1567 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1567 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1567_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1583_4 (MEDIUM) line 1583 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1583_4 line 1583 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1583 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1583_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1599_3 (MEDIUM) line 1599 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1599_3 line 1599 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1599 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1599_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1633_3 (MEDIUM) line 1633 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1633_3 line 1633 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1633 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1633_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1643_4 (MEDIUM) line 1643 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1643_4 line 1643 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1643 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1643_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1659_3 (MEDIUM) line 1659 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1659_3 line 1659 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1659 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1659_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1689_2 (MEDIUM) line 1689 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1689_2 line 1689 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1689 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1689_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1725_3 (MEDIUM) line 1725 in open_file() ---
# Source:  if ($filename =~ /\.(?:sql|db)\z/i) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1725_3 line 1725 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1725 in open_file() to detect the mutant
    fail('COND_INV_1725_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1730_3 (MEDIUM) line 1730 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1730_3 line 1730 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1730 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1730_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1840_2 (MEDIUM) line 1840 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1840_2 line 1840 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1840 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1840_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1841_2 (MEDIUM) line 1841 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1841_2 line 1841 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1841 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1841_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1843_2 (MEDIUM) line 1843 in import_url() ---
# Source:  return $err_home->('error_url_ssrf', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1843_2 line 1843 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1843 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1843_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1847_2 (MEDIUM) line 1847 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1847_2 line 1847 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1847 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1847_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1850_2 (MEDIUM) line 1850 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1850_2 line 1850 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1850 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1850_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1948_3 (MEDIUM) line 1948 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1948_3 line 1948 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1948 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1948_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2036_2 (MEDIUM) line 2036 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2036_2 line 2036 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2036 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_2036_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2088_3 (MEDIUM) line 2088 in join_tables() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2088_3 line 2088 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2088 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_2088_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2204_2 (MEDIUM) line 2204 in combine_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2204_2 line 2204 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2204 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_2204_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2363_2 (MEDIUM) line 2363 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2363_2 line 2363 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2363 in export_data() to detect the mutant
    fail('BOOL_NEGATE_2363_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_2369_2 (MEDIUM) line 2369 in export_data() ---
# Source:  if (@$warnings) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_2369_2 line 2369 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2369 in export_data() to detect the mutant
    fail('COND_INV_2369_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2377_2 (MEDIUM) line 2377 in export_data() ---
# Source:  return $format eq 'sqlite' ? $self->_render_sqlite($records, $columns, $safe_name)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2377_2 line 2377 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2377 in export_data() to detect the mutant
    fail('BOOL_NEGATE_2377_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2459_3 (MEDIUM) line 2459 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2459_3 line 2459 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2459 in export_write() to detect the mutant
    fail('BOOL_NEGATE_2459_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2479_2 (MEDIUM) line 2479 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2479_2 line 2479 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2479 in export_write() to detect the mutant
    fail('BOOL_NEGATE_2479_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2494_2 (MEDIUM) line 2494 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2494_2 line 2494 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2494 in export_write() to detect the mutant
    fail('BOOL_NEGATE_2494_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2545_2 (MEDIUM) line 2545 in dirs_api() ---
# Source:  return $self->render(json => { error => 'Not a directory' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2545_2 line 2545 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2545 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_2545_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2612_3 (MEDIUM) line 2612 in stat_api() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2612_3 line 2612 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2612 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_2612_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2621_2 (MEDIUM) line 2621 in stat_api() ---
# Source:  return $self->render(json => { exists => \0, path => $path })
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2621_2 line 2621 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2621 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_2621_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_2630_2 (MEDIUM) line 2630 in stat_api() ---
# Source:  if ($file->basename =~ /\.(?:sql|sqlite|sqlite3|db)\z/i) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_2630_2 line 2630 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2630 in stat_api() to detect the mutant
    fail('COND_INV_2630_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2730_3 (MEDIUM) line 2730 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2730_3 line 2730 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2730 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2730_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2764_3 (MEDIUM) line 2764 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2764_3 line 2764 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2764 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2764_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2779_2 (MEDIUM) line 2779 in clear_uploads() ---
# Source:  return $self->render(json => { freed => 0, count => 0 })
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2779_2 line 2779 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2779 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_2779_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2827_2 (MEDIUM) line 2827 in graph_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2827_2 line 2827 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2827 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2827_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2831_2 (MEDIUM) line 2831 in graph_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2831_2 line 2831 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2831 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2831_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2842_2 (MEDIUM) line 2842 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2842_2 line 2842 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2842 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2842_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2932_2 (MEDIUM) line 2932 in pie_view() ---
# Source:  return $self->render(text => 'Missing cat or val column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2932_2 line 2932 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2932 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2932_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2936_2 (MEDIUM) line 2936 in pie_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2936_2 line 2936 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2936 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2936_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2945_2 (MEDIUM) line 2945 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
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

# --- SURVIVOR: BOOL_NEGATE_2979_2 (MEDIUM) line 2979 in pie_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2979_2 line 2979 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2979 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2979_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3086_2 (MEDIUM) line 3086 in heatmap_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3086_2 line 3086 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3086 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_3086_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3090_2 (MEDIUM) line 3090 in heatmap_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3090_2 line 3090 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3090 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_3090_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3099_2 (MEDIUM) line 3099 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3099_2 line 3099 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3099 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_3099_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3101_2 (MEDIUM) line 3101 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3101_2 line 3101 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3101 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_3101_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3103_2 (MEDIUM) line 3103 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3103_2 line 3103 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3103 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_3103_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3244_2 (MEDIUM) line 3244 in bar_view() ---
# Source:  return $self->render(text => 'Missing cat column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3244_2 line 3244 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3244 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_3244_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3257_2 (MEDIUM) line 3257 in bar_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
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

# --- SURVIVOR: BOOL_NEGATE_3276_2 (MEDIUM) line 3276 in bar_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3276_2 line 3276 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3276 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_3276_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3390_2 (MEDIUM) line 3390 in folder_view() ---
# Source:  return $self->render(text => 'Missing l= parameter', status => 400)
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

# --- SURVIVOR: BOOL_NEGATE_3395_2 (MEDIUM) line 3395 in folder_view() ---
# Source:  return $self->render(text => 'Prefix too long', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3395_2 line 3395 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3395 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_3395_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3440_23_< (HIGH) line 3440 in folder_view() ---
# Source:  next if length($p) <= $len;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip <= to <
#   Numeric boundary flip <= to >
#   Numeric boundary flip <= to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3440_23_< line 3440 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3440 in folder_view() to detect the mutant
    fail('NUM_BOUNDARY_3440_23_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3455_3 (MEDIUM) line 3455 in folder_view() ---
# Source:  return $n;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3455_3 line 3455 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3455 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_3455_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3487_17_> (HIGH) line 3487 in folder_view() ---
# Source:  href => ($i < length($prefix))
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3487_17_> line 3487 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3487 in folder_view() to detect the mutant
    fail('NUM_BOUNDARY_3487_17_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3562_2 (MEDIUM) line 3562 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $spec && length $spec;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3562_2 line 3562 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3562 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3562_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3585_3 (MEDIUM) line 3585 in tables_view() ---
# Source:  return $self->reply->not_found
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3585_3 line 3585 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3585 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3585_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3595_3 (MEDIUM) line 3595 in tables_view() ---
# Source:  if ($spec =~ m{\Aredis://(?::([^@]*)@)?([^/]+)(?:/(\d+))?\z}i) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3595_3 line 3595 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3595 in tables_view() to detect the mutant
    fail('COND_INV_3595_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3610_5 (MEDIUM) line 3610 in tables_view() ---
# Source:  if (eval { require "$file.pm"; 1 }) { $pkg = $mod; last }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3610_5 line 3610 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3610 in tables_view() to detect the mutant
    fail('COND_INV_3610_5: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3621_68_< (HIGH) line 3621 in tables_view() ---
# Source:  $redis->select(int($db_idx)) if defined $db_idx && int($db_idx) > 0;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3621_68_< line 3621 in tables_view()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3621 in tables_view() to detect the mutant
    fail('NUM_BOUNDARY_3621_68_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3630_41_> (HIGH) line 3630 in tables_view() ---
# Source:  } while ($cursor ne '0' && @all_keys < 200);
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3630_41_> line 3630 in tables_view()';
    # Suggested boundary values to test: 199, 200, 201
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3630 in tables_view() to detect the mutant
    fail('NUM_BOUNDARY_3630_41_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3642_3 (MEDIUM) line 3642 in tables_view() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3642_3 line 3642 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3642 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3642_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3670_5 (MEDIUM) line 3670 in tables_view() ---
# Source:  }; return $self->reply->not_found if $@; }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3670_5 line 3670 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3670 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3670_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3713_2 (MEDIUM) line 3713 in pivot_view() ---
# Source:  return $self->render(text => $self->_i18n('error_pivot_measure_req'), status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3713_2 line 3713 in pivot_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3713 in pivot_view() to detect the mutant
    fail('BOOL_NEGATE_3713_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3739_2 (MEDIUM) line 3739 in pivot_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3739_2 line 3739 in pivot_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3739 in pivot_view() to detect the mutant
    fail('BOOL_NEGATE_3739_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3784_4 (MEDIUM) line 3784 in pivot_view() ---
# Source:  unless ($row_seen{$rkey}++) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition unless to if
TODO: {
    local $TODO = 'Complete: COND_INV_3784_4 line 3784 in pivot_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3784 in pivot_view() to detect the mutant
    fail('COND_INV_3784_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3788_4 (MEDIUM) line 3788 in pivot_view() ---
# Source:  unless ($col_seen{$ckey}++) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition unless to if
TODO: {
    local $TODO = 'Complete: COND_INV_3788_4 line 3788 in pivot_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3788 in pivot_view() to detect the mutant
    fail('COND_INV_3788_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3801_2 (MEDIUM) line 3801 in pivot_view() ---
# Source:  if (@h_specs) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3801_2 line 3801 in pivot_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3801 in pivot_view() to detect the mutant
    fail('COND_INV_3801_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3879_2 (MEDIUM) line 3879 in pivot_view() ---
# Source:  if ($max_cols_n > 0 && @col_key_order > $max_cols_n) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3879_2 line 3879 in pivot_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3879 in pivot_view() to detect the mutant
    fail('COND_INV_3879_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3894_3 (MEDIUM) line 3894 in pivot_view() ---
# Source:  if (@rest_ckeys) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3894_3 line 3894 in pivot_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3894 in pivot_view() to detect the mutant
    fail('COND_INV_3894_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3902_7 (MEDIUM) line 3902 in pivot_view() ---
# Source:  if (defined $cv) { $v += $cv; $have = 1 }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3902_7 line 3902 in pivot_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3902 in pivot_view() to detect the mutant
    fail('COND_INV_3902_7: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3928_3 (MEDIUM) line 3928 in pivot_view() ---
# Source:  return $self->_render_csv(\@grid_records, \@export_cols, 'pivot')
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3928_3 line 3928 in pivot_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3928 in pivot_view() to detect the mutant
    fail('BOOL_NEGATE_3928_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3930_3 (MEDIUM) line 3930 in pivot_view() ---
# Source:  return $self->_render_sqlite(\@grid_records, \@export_cols, 'pivot')
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3930_3 line 3930 in pivot_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3930 in pivot_view() to detect the mutant
    fail('BOOL_NEGATE_3930_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3932_3 (MEDIUM) line 3932 in pivot_view() ---
# Source:  return $self->_render_json(\@grid_records, \@export_cols, 'pivot')
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3932_3 line 3932 in pivot_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3932 in pivot_view() to detect the mutant
    fail('BOOL_NEGATE_3932_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4000_2 (MEDIUM) line 4000 in stats_view() ---
# Source:  return $self->render(text => 'Missing l= parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4000_2 line 4000 in stats_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 4000 in stats_view() to detect the mutant
    fail('BOOL_NEGATE_4000_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4004_2 (MEDIUM) line 4004 in stats_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4004_2 line 4004 in stats_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 4004 in stats_view() to detect the mutant
    fail('BOOL_NEGATE_4004_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_395_2 line 395 in _spec_to_url() ---
# Source:  return '/' if $spec =~ $REDIS_SPEC_RE;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_395_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_608_2 line 608 in _measure_pushable() ---
# Source:  return 0 unless $source && $source->can('aggregate');
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_608_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_609_2 line 609 in _measure_pushable() ---
# Source:  return 1 if $fn eq 'count' || $fn eq 'count_distinct';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_609_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_610_2 line 610 in _measure_pushable() ---
# Source:  return 0 unless defined $col;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_610_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_639_2 line 639 in _parse_measure_param() ---
# Source:  return undef unless defined $str && length($str);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_639_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_641_2 line 641 in _parse_measure_param() ---
# Source:  return undef unless defined $fn && defined $as && length($fn) && length($as);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_641_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1135_2 line 1135 in _decode_cell() ---
# Source:  return $s unless defined $s;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1135_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1324_3 line 1324 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1324_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1440_2 line 1440 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1440_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1561_2 line 1561 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1561_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1567_3 line 1567 in open_file() ---
# Source:  return $self->redirect_to('/tables?l=' . url_escape($file_path));
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1567_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1583_4 line 1583 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1583_4: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1599_3 line 1599 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1599_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1633_3 line 1633 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1633_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1643_4 line 1643 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1643_4: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1659_3 line 1659 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1659_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1689_2 line 1689 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1689_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1730_3 line 1730 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1730_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1840_2 line 1840 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1840_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1841_2 line 1841 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1841_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1843_2 line 1843 in import_url() ---
# Source:  return $err_home->('error_url_ssrf', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1843_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1847_2 line 1847 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1847_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1850_2 line 1850 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1850_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1948_3 line 1948 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1948_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2036_2 line 2036 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2036_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2088_3 line 2088 in join_tables() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2088_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2204_2 line 2204 in combine_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2204_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2363_2 line 2363 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2363_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2377_2 line 2377 in export_data() ---
# Source:  return $format eq 'sqlite' ? $self->_render_sqlite($records, $columns, $safe_name)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2377_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2459_3 line 2459 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2459_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2479_2 line 2479 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2479_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2494_2 line 2494 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2494_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2545_2 line 2545 in dirs_api() ---
# Source:  return $self->render(json => { error => 'Not a directory' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2545_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2612_3 line 2612 in stat_api() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2612_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2621_2 line 2621 in stat_api() ---
# Source:  return $self->render(json => { exists => \0, path => $path })
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2621_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2730_3 line 2730 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2730_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2764_3 line 2764 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2764_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2779_2 line 2779 in clear_uploads() ---
# Source:  return $self->render(json => { freed => 0, count => 0 })
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2779_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2827_2 line 2827 in graph_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2827_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2831_2 line 2831 in graph_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2831_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2842_2 line 2842 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2842_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2932_2 line 2932 in pie_view() ---
# Source:  return $self->render(text => 'Missing cat or val column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2932_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2936_2 line 2936 in pie_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2936_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2945_2 line 2945 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2945_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2979_2 line 2979 in pie_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2979_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3086_2 line 3086 in heatmap_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3086_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3090_2 line 3090 in heatmap_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3090_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3099_2 line 3099 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3099_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3101_2 line 3101 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3101_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3103_2 line 3103 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3103_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3244_2 line 3244 in bar_view() ---
# Source:  return $self->render(text => 'Missing cat column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3244_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3257_2 line 3257 in bar_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3257_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3276_2 line 3276 in bar_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3276_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3390_2 line 3390 in folder_view() ---
# Source:  return $self->render(text => 'Missing l= parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3390_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3395_2 line 3395 in folder_view() ---
# Source:  return $self->render(text => 'Prefix too long', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3395_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3455_3 line 3455 in folder_view() ---
# Source:  return $n;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3455_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3562_2 line 3562 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $spec && length $spec;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3562_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3585_3 line 3585 in tables_view() ---
# Source:  return $self->reply->not_found
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3585_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3642_3 line 3642 in tables_view() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3642_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3670_5 line 3670 in tables_view() ---
# Source:  }; return $self->reply->not_found if $@; }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3670_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3713_2 line 3713 in pivot_view() ---
# Source:  return $self->render(text => $self->_i18n('error_pivot_measure_req'), status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3713_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3739_2 line 3739 in pivot_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3739_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3928_3 line 3928 in pivot_view() ---
# Source:  return $self->_render_csv(\@grid_records, \@export_cols, 'pivot')
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3928_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3930_3 line 3930 in pivot_view() ---
# Source:  return $self->_render_sqlite(\@grid_records, \@export_cols, 'pivot')
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3930_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3932_3 line 3932 in pivot_view() ---
# Source:  return $self->_render_json(\@grid_records, \@export_cols, 'pivot')
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3932_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4000_2 line 4000 in stats_view() ---
# Source:  return $self->render(text => 'Missing l= parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_4000_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4004_2 line 4004 in stats_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_4004_2: add assertion here');

done_testing();
