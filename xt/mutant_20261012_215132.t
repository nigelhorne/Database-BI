#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-10-12 21:51:32
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

# --- SURVIVOR: NUM_BOUNDARY_108_41_< (HIGH) line 108 in _pagination() ---
# Source:  $per_page = $MAX_PER_PAGE if $per_page > $MAX_PER_PAGE;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_108_41_< line 108 in _pagination()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 108 in _pagination() to detect the mutant
    fail('NUM_BOUNDARY_108_41_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_110_21_> (HIGH) line 110 in _pagination() ---
# Source:  $page = 1 if $page < 1;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_110_21_> line 110 in _pagination()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 110 in _pagination() to detect the mutant
    fail('NUM_BOUNDARY_110_21_>: replace with real assertion');
}

# --- SURVIVOR: COND_INV_281_2 (MEDIUM) line 281 in _resolve_language() ---
# Source:  if ($lang ne $default) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_281_2 line 281 in _resolve_language()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 281 in _resolve_language() to detect the mutant
    fail('COND_INV_281_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_374_2 (MEDIUM) line 374 in _spec_to_url() ---
# Source:  return '/' if $spec =~ $REDIS_SPEC_RE;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_374_2 line 374 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 374 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_374_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_780_2 (MEDIUM) line 780 in _decode_cell() ---
# Source:  return $s unless defined $s;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_780_2 line 780 in _decode_cell()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 780 in _decode_cell() to detect the mutant
    fail('BOOL_NEGATE_780_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_982_3 (MEDIUM) line 982 in view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_982_3 line 982 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 982 in view() to detect the mutant
    fail('BOOL_NEGATE_982_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1212_3 (MEDIUM) line 1212 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1212_3 line 1212 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1212 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1212_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1218_3 (MEDIUM) line 1218 in open_file() ---
# Source:  if ($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1218_3 line 1218 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1218 in open_file() to detect the mutant
    fail('COND_INV_1218_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1219_4 (MEDIUM) line 1219 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1219_4 line 1219 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1219 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1219_4: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_1231_29_< (HIGH) line 1231 in open_file() ---
# Source:  my $has_next = (@$records > $per_page) ? 1 : 0;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_1231_29_< line 1231 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1231 in open_file() to detect the mutant
    fail('NUM_BOUNDARY_1231_29_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1239_3 (MEDIUM) line 1239 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1239_3 line 1239 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1239 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1239_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1273_3 (MEDIUM) line 1273 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1273_3 line 1273 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1273 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1273_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1281_4 (MEDIUM) line 1281 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1281_4 line 1281 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1281 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1281_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1301_3 (MEDIUM) line 1301 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1301_3 line 1301 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1301 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1301_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1331_2 (MEDIUM) line 1331 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1331_2 line 1331 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1331 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1331_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1359_3 (MEDIUM) line 1359 in open_file() ---
# Source:  if ($filename =~ /\.(?:sql|db)\z/i) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1359_3 line 1359 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1359 in open_file() to detect the mutant
    fail('COND_INV_1359_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1364_3 (MEDIUM) line 1364 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1364_3 line 1364 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1364 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1364_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1482_2 (MEDIUM) line 1482 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1482_2 line 1482 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1482 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1482_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1483_2 (MEDIUM) line 1483 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1483_2 line 1483 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1483 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1483_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1492_2 (MEDIUM) line 1492 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1492_2 line 1492 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1492 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1492_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1590_3 (MEDIUM) line 1590 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1590_3 line 1590 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1590 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1590_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1613_2 (MEDIUM) line 1613 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404) unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1613_2 line 1613 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1613 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1613_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1823_2 (MEDIUM) line 1823 in combine_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1823_2 line 1823 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1823 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1823_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1827_3 (MEDIUM) line 1827 in combine_tables() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1827_3 line 1827 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1827 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1827_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1952_2 (MEDIUM) line 1952 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1952_2 line 1952 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1952 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1952_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1957_2 (MEDIUM) line 1957 in export_data() ---
# Source:  return $format eq 'sqlite' ? $self->_render_sqlite($records, $columns, $safe_name)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1957_2 line 1957 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1957 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1957_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2039_3 (MEDIUM) line 2039 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2039_3 line 2039 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2039 in export_write() to detect the mutant
    fail('BOOL_NEGATE_2039_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2052_3 (MEDIUM) line 2052 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2052_3 line 2052 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2052 in export_write() to detect the mutant
    fail('BOOL_NEGATE_2052_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2059_2 (MEDIUM) line 2059 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2059_2 line 2059 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2059 in export_write() to detect the mutant
    fail('BOOL_NEGATE_2059_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2074_2 (MEDIUM) line 2074 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2074_2 line 2074 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2074 in export_write() to detect the mutant
    fail('BOOL_NEGATE_2074_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2298_3 (MEDIUM) line 2298 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2298_3 line 2298 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2298 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2298_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2310_3 (MEDIUM) line 2310 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2310_3 line 2310 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2310 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2310_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2359_2 (MEDIUM) line 2359 in clear_uploads() ---
# Source:  return $self->render(json => { freed => 0, count => 0 })
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2359_2 line 2359 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2359 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_2359_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2407_2 (MEDIUM) line 2407 in graph_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2407_2 line 2407 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2407 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2407_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2411_2 (MEDIUM) line 2411 in graph_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2411_2 line 2411 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2411 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2411_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2415_2 (MEDIUM) line 2415 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2415_2 line 2415 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2415 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2415_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2417_2 (MEDIUM) line 2417 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2417_2 line 2417 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2417 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2417_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2434_2 (MEDIUM) line 2434 in graph_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2434_2 line 2434 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2434 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2434_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2482_2 (MEDIUM) line 2482 in pie_view() ---
# Source:  return $self->render(text => 'Missing cat or val column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2482_2 line 2482 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2482 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2482_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2496_2 (MEDIUM) line 2496 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2496_2 line 2496 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2496 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2496_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2642_2 (MEDIUM) line 2642 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2642_2 line 2642 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2642 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2642_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2644_2 (MEDIUM) line 2644 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2644_2 line 2644 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2644 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2644_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_2659_3 (MEDIUM) line 2659 in heatmap_view() ---
# Source:  if (length($val_col)) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_2659_3 line 2659 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2659 in heatmap_view() to detect the mutant
    fail('COND_INV_2659_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2676_2 (MEDIUM) line 2676 in heatmap_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2676_2 line 2676 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2676 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2676_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2779_2 (MEDIUM) line 2779 in bar_view() ---
# Source:  return $self->render(text => 'Missing cat column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2779_2 line 2779 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2779 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2779_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2783_2 (MEDIUM) line 2783 in bar_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2783_2 line 2783 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2783 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2783_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2792_2 (MEDIUM) line 2792 in bar_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2792_2 line 2792 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2792 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2792_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2812_2 (MEDIUM) line 2812 in bar_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2812_2 line 2812 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2812 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2812_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_2836_15_< (HIGH) line 2836 in bar_view() ---
# Source:  ($max_bars > 0 ? (max_bars => $max_bars) : ()),
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_2836_15_< line 2836 in bar_view()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2836 in bar_view() to detect the mutant
    fail('NUM_BOUNDARY_2836_15_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2926_2 (MEDIUM) line 2926 in folder_view() ---
# Source:  return $self->render(text => 'Missing l= parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2926_2 line 2926 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2926 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_2926_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2931_2 (MEDIUM) line 2931 in folder_view() ---
# Source:  return $self->render(text => 'Prefix too long', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2931_2 line 2931 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2931 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_2931_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2940_2 (MEDIUM) line 2940 in folder_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2940_2 line 2940 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2940 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_2940_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_2946_33_> (HIGH) line 2946 in folder_view() ---
# Source:  my $sample_end = $#{$records} < 9 ? $#{$records} : 9;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_2946_33_> line 2946 in folder_view()';
    # Suggested boundary values to test: 8, 9, 10
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2946 in folder_view() to detect the mutant
    fail('NUM_BOUNDARY_2946_33_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_2976_23_< (HIGH) line 2976 in folder_view() ---
# Source:  next if length($p) <= $len;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip <= to <
#   Numeric boundary flip <= to >
#   Numeric boundary flip <= to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_2976_23_< line 2976 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2976 in folder_view() to detect the mutant
    fail('NUM_BOUNDARY_2976_23_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2991_3 (MEDIUM) line 2991 in folder_view() ---
# Source:  return $n;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2991_3 line 2991 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2991 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_2991_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3098_2 (MEDIUM) line 3098 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $spec && length $spec;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3098_2 line 3098 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3098 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3098_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3113_3 (MEDIUM) line 3113 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3113_3 line 3113 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3113 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3113_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3120_3 (MEDIUM) line 3120 in tables_view() ---
# Source:  return $self->reply->not_found
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3120_3 line 3120 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3120 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3120_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3127_3 (MEDIUM) line 3127 in tables_view() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3127_3 line 3127 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3127 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3127_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3157_2 (MEDIUM) line 3157 in tables_view() ---
# Source:  return $self->reply->not_found if $@;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3157_2 line 3157 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3157 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3157_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_374_2 line 374 in _spec_to_url() ---
# Source:  return '/' if $spec =~ $REDIS_SPEC_RE;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_374_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_780_2 line 780 in _decode_cell() ---
# Source:  return $s unless defined $s;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_780_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_982_3 line 982 in view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_982_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1212_3 line 1212 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1212_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1219_4 line 1219 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1219_4: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1239_3 line 1239 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1239_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1273_3 line 1273 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1273_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1281_4 line 1281 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1281_4: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1301_3 line 1301 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1301_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1331_2 line 1331 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1331_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1364_3 line 1364 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1364_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1482_2 line 1482 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1482_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1483_2 line 1483 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1483_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1492_2 line 1492 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1492_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1590_3 line 1590 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1590_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1613_2 line 1613 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404) unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1613_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1823_2 line 1823 in combine_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1823_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1827_3 line 1827 in combine_tables() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1827_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1952_2 line 1952 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1952_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1957_2 line 1957 in export_data() ---
# Source:  return $format eq 'sqlite' ? $self->_render_sqlite($records, $columns, $safe_name)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1957_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2039_3 line 2039 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2039_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2052_3 line 2052 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2052_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2059_2 line 2059 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2059_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2074_2 line 2074 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2074_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2298_3 line 2298 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2298_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2310_3 line 2310 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2310_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2359_2 line 2359 in clear_uploads() ---
# Source:  return $self->render(json => { freed => 0, count => 0 })
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2359_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2407_2 line 2407 in graph_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2407_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2411_2 line 2411 in graph_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2411_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2415_2 line 2415 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2415_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2417_2 line 2417 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2417_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2434_2 line 2434 in graph_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2434_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2482_2 line 2482 in pie_view() ---
# Source:  return $self->render(text => 'Missing cat or val column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2482_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2496_2 line 2496 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2496_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2642_2 line 2642 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2642_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2644_2 line 2644 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2644_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2676_2 line 2676 in heatmap_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2676_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2779_2 line 2779 in bar_view() ---
# Source:  return $self->render(text => 'Missing cat column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2779_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2783_2 line 2783 in bar_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2783_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2792_2 line 2792 in bar_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2792_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2812_2 line 2812 in bar_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2812_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2926_2 line 2926 in folder_view() ---
# Source:  return $self->render(text => 'Missing l= parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2926_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2931_2 line 2931 in folder_view() ---
# Source:  return $self->render(text => 'Prefix too long', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2931_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2940_2 line 2940 in folder_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2940_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2991_3 line 2991 in folder_view() ---
# Source:  return $n;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2991_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3098_2 line 3098 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $spec && length $spec;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3098_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3113_3 line 3113 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3113_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3120_3 line 3120 in tables_view() ---
# Source:  return $self->reply->not_found
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3120_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3127_3 line 3127 in tables_view() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3127_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3157_2 line 3157 in tables_view() ---
# Source:  return $self->reply->not_found if $@;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3157_2: add assertion here');

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
