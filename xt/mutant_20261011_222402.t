#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-10-11 22:24:02
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

# --- SURVIVOR: NUM_BOUNDARY_102_41_< (HIGH) line 102 in _pagination() ---
# Source:  $per_page = $MAX_PER_PAGE if $per_page > $MAX_PER_PAGE;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_102_41_< line 102 in _pagination()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 102 in _pagination() to detect the mutant
    fail('NUM_BOUNDARY_102_41_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_104_21_> (HIGH) line 104 in _pagination() ---
# Source:  $page = 1 if $page < 1;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_104_21_> line 104 in _pagination()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 104 in _pagination() to detect the mutant
    fail('NUM_BOUNDARY_104_21_>: replace with real assertion');
}

# --- SURVIVOR: COND_INV_275_2 (MEDIUM) line 275 in _resolve_language() ---
# Source:  if ($lang ne $default) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_275_2 line 275 in _resolve_language()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 275 in _resolve_language() to detect the mutant
    fail('COND_INV_275_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_769_2 (MEDIUM) line 769 in _decode_cell() ---
# Source:  return $s unless defined $s;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_769_2 line 769 in _decode_cell()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 769 in _decode_cell() to detect the mutant
    fail('BOOL_NEGATE_769_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_958_3 (MEDIUM) line 958 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_958_3 line 958 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 958 in view() to detect the mutant
    fail('BOOL_NEGATE_958_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_971_3 (MEDIUM) line 971 in view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_971_3 line 971 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 971 in view() to detect the mutant
    fail('BOOL_NEGATE_971_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_983_71_< (HIGH) line 983 in view() ---
# Source:  if ($source && $source->sqlite_tables && @{ $source->sqlite_tables } > 1) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_983_71_< line 983 in view()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 983 in view() to detect the mutant
    fail('NUM_BOUNDARY_983_71_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_984_3 (MEDIUM) line 984 in view() ---
# Source:  return $self->redirect_to('/tables?l=' . url_escape("table:$table"));
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_984_3 line 984 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 984 in view() to detect the mutant
    fail('BOOL_NEGATE_984_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1072_2 (MEDIUM) line 1072 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1072_2 line 1072 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1072 in browse() to detect the mutant
    fail('BOOL_NEGATE_1072_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1193_2 (MEDIUM) line 1193 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1193_2 line 1193 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1193 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1193_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1202_3 (MEDIUM) line 1202 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1202_3 line 1202 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1202 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1202_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1210_4 (MEDIUM) line 1210 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1210_4 line 1210 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1210 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1210_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1230_3 (MEDIUM) line 1230 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1230_3 line 1230 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1230 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1230_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1260_2 (MEDIUM) line 1260 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1260_2 line 1260 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1260 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1260_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1288_3 (MEDIUM) line 1288 in open_file() ---
# Source:  if ($filename =~ /\.(?:sql|db)\z/i) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1288_3 line 1288 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1288 in open_file() to detect the mutant
    fail('COND_INV_1288_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1293_3 (MEDIUM) line 1293 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1293_3 line 1293 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1293 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1293_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_1311_35_< (HIGH) line 1311 in open_file() ---
# Source:  && @{ $source->sqlite_tables } > 1) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_1311_35_< line 1311 in open_file()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1311 in open_file() to detect the mutant
    fail('NUM_BOUNDARY_1311_35_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1312_3 (MEDIUM) line 1312 in open_file() ---
# Source:  return $self->redirect_to('/tables?l=' . url_escape("path:${\$file->to_string}"));
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1312_3 line 1312 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1312 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1312_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1411_2 (MEDIUM) line 1411 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1411_2 line 1411 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1411 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1411_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1412_2 (MEDIUM) line 1412 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1412_2 line 1412 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1412 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1412_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1414_2 (MEDIUM) line 1414 in import_url() ---
# Source:  return $err_home->('error_url_ssrf', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1414_2 line 1414 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1414 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1414_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1418_2 (MEDIUM) line 1418 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1418_2 line 1418 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1418 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1418_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1421_2 (MEDIUM) line 1421 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1421_2 line 1421 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1421 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1421_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1519_3 (MEDIUM) line 1519 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1519_3 line 1519 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1519 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1519_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1542_2 (MEDIUM) line 1542 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404) unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1542_2 line 1542 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1542 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1542_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1607_2 (MEDIUM) line 1607 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1607_2 line 1607 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1607 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1607_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1650_3 (MEDIUM) line 1650 in join_tables() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1650_3 line 1650 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1650 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1650_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1752_2 (MEDIUM) line 1752 in combine_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1752_2 line 1752 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1752 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1752_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1756_3 (MEDIUM) line 1756 in combine_tables() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1756_3 line 1756 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1756 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1756_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1881_2 (MEDIUM) line 1881 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1881_2 line 1881 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1881 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1881_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1886_2 (MEDIUM) line 1886 in export_data() ---
# Source:  return $format eq 'sqlite' ? $self->_render_sqlite($records, $columns, $safe_name)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1886_2 line 1886 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1886 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1886_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1968_3 (MEDIUM) line 1968 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1968_3 line 1968 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1968 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1968_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1981_3 (MEDIUM) line 1981 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1981_3 line 1981 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1981 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1981_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1988_2 (MEDIUM) line 1988 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1988_2 line 1988 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1988 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1988_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2003_2 (MEDIUM) line 2003 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2003_2 line 2003 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2003 in export_write() to detect the mutant
    fail('BOOL_NEGATE_2003_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2054_2 (MEDIUM) line 2054 in dirs_api() ---
# Source:  return $self->render(json => { error => 'Not a directory' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2054_2 line 2054 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2054 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_2054_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2121_3 (MEDIUM) line 2121 in stat_api() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2121_3 line 2121 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2121 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_2121_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2130_2 (MEDIUM) line 2130 in stat_api() ---
# Source:  return $self->render(json => { exists => \0, path => $path })
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2130_2 line 2130 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2130 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_2130_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2205_3 (MEDIUM) line 2205 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2205_3 line 2205 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2205 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2205_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2217_3 (MEDIUM) line 2217 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2217_3 line 2217 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2217 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2217_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2227_3 (MEDIUM) line 2227 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2227_3 line 2227 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2227 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2227_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2251_3 (MEDIUM) line 2251 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2251_3 line 2251 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2251 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2251_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2266_2 (MEDIUM) line 2266 in clear_uploads() ---
# Source:  return $self->render(json => { freed => 0, count => 0 })
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2266_2 line 2266 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2266 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_2266_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2312_2 (MEDIUM) line 2312 in graph_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2312_2 line 2312 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2312 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2312_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2316_2 (MEDIUM) line 2316 in graph_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2316_2 line 2316 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2316 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2316_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2320_2 (MEDIUM) line 2320 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2320_2 line 2320 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2320 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2320_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2322_2 (MEDIUM) line 2322 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2322_2 line 2322 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2322 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2322_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2339_2 (MEDIUM) line 2339 in graph_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2339_2 line 2339 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2339 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2339_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2384_2 (MEDIUM) line 2384 in pie_view() ---
# Source:  return $self->render(text => 'Missing cat or val column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2384_2 line 2384 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2384 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2384_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2388_2 (MEDIUM) line 2388 in pie_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2388_2 line 2388 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2388 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2388_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2392_2 (MEDIUM) line 2392 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2392_2 line 2392 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2392 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2392_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2398_2 (MEDIUM) line 2398 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2398_2 line 2398 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2398 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2398_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2429_2 (MEDIUM) line 2429 in pie_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2429_2 line 2429 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2429 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2429_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2533_2 (MEDIUM) line 2533 in heatmap_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2533_2 line 2533 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2533 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2533_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2537_2 (MEDIUM) line 2537 in heatmap_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2537_2 line 2537 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2537 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2537_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2541_2 (MEDIUM) line 2541 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2541_2 line 2541 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2541 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2541_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2543_2 (MEDIUM) line 2543 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2543_2 line 2543 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2543 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2543_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2545_2 (MEDIUM) line 2545 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2545_2 line 2545 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2545 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2545_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_2558_3 (MEDIUM) line 2558 in heatmap_view() ---
# Source:  if (length($val_col)) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_2558_3 line 2558 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2558 in heatmap_view() to detect the mutant
    fail('COND_INV_2558_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2575_2 (MEDIUM) line 2575 in heatmap_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2575_2 line 2575 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2575 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2575_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2675_2 (MEDIUM) line 2675 in bar_view() ---
# Source:  return $self->render(text => 'Missing cat column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2675_2 line 2675 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2675 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2675_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2679_2 (MEDIUM) line 2679 in bar_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2679_2 line 2679 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2679 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2679_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2683_2 (MEDIUM) line 2683 in bar_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2683_2 line 2683 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2683 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2683_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2688_2 (MEDIUM) line 2688 in bar_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2688_2 line 2688 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2688 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2688_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2708_2 (MEDIUM) line 2708 in bar_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2708_2 line 2708 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2708 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2708_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_2732_15_< (HIGH) line 2732 in bar_view() ---
# Source:  ($max_bars > 0 ? (max_bars => $max_bars) : ()),
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_2732_15_< line 2732 in bar_view()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2732 in bar_view() to detect the mutant
    fail('NUM_BOUNDARY_2732_15_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2821_2 (MEDIUM) line 2821 in folder_view() ---
# Source:  return $self->render(text => 'Missing l= parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2821_2 line 2821 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2821 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_2821_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2826_2 (MEDIUM) line 2826 in folder_view() ---
# Source:  return $self->render(text => 'Prefix too long', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2826_2 line 2826 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2826 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_2826_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2835_2 (MEDIUM) line 2835 in folder_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2835_2 line 2835 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2835 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_2835_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_2841_33_> (HIGH) line 2841 in folder_view() ---
# Source:  my $sample_end = $#{$records} < 9 ? $#{$records} : 9;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_2841_33_> line 2841 in folder_view()';
    # Suggested boundary values to test: 8, 9, 10
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2841 in folder_view() to detect the mutant
    fail('NUM_BOUNDARY_2841_33_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_2871_23_< (HIGH) line 2871 in folder_view() ---
# Source:  next if length($p) <= $len;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip <= to <
#   Numeric boundary flip <= to >
#   Numeric boundary flip <= to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_2871_23_< line 2871 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2871 in folder_view() to detect the mutant
    fail('NUM_BOUNDARY_2871_23_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2886_3 (MEDIUM) line 2886 in folder_view() ---
# Source:  return $n;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2886_3 line 2886 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2886 in folder_view() to detect the mutant
    fail('BOOL_NEGATE_2886_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_2918_17_> (HIGH) line 2918 in folder_view() ---
# Source:  href => ($i < length($prefix))
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_2918_17_> line 2918 in folder_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2918 in folder_view() to detect the mutant
    fail('NUM_BOUNDARY_2918_17_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2993_2 (MEDIUM) line 2993 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $spec && length $spec;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2993_2 line 2993 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2993 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_2993_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_2997_2 (MEDIUM) line 2997 in tables_view() ---
# Source:  if ($spec =~ /\Atable:([A-Za-z0-9_]+)\z/) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_2997_2 line 2997 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2997 in tables_view() to detect the mutant
    fail('COND_INV_2997_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3003_4 (MEDIUM) line 3003 in tables_view() ---
# Source:  if (-f $p) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3003_4 line 3003 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3003 in tables_view() to detect the mutant
    fail('COND_INV_3003_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3008_3 (MEDIUM) line 3008 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3008_3 line 3008 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3008 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3008_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3015_3 (MEDIUM) line 3015 in tables_view() ---
# Source:  return $self->reply->not_found
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3015_3 line 3015 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3015 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3015_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3022_3 (MEDIUM) line 3022 in tables_view() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3022_3 line 3022 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3022 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3022_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3038_4 (MEDIUM) line 3038 in tables_view() ---
# Source:  if ($sth) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3038_4 line 3038 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3038 in tables_view() to detect the mutant
    fail('COND_INV_3038_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_3052_2 (MEDIUM) line 3052 in tables_view() ---
# Source:  return $self->reply->not_found if $@;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_3052_2 line 3052 in tables_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 3052 in tables_view() to detect the mutant
    fail('BOOL_NEGATE_3052_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_769_2 line 769 in _decode_cell() ---
# Source:  return $s unless defined $s;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_769_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_958_3 line 958 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_958_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_971_3 line 971 in view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_971_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_984_3 line 984 in view() ---
# Source:  return $self->redirect_to('/tables?l=' . url_escape("table:$table"));
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_984_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1072_2 line 1072 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1072_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1193_2 line 1193 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1193_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1202_3 line 1202 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1202_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1210_4 line 1210 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1210_4: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1230_3 line 1230 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1230_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1260_2 line 1260 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1260_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1293_3 line 1293 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1293_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1312_3 line 1312 in open_file() ---
# Source:  return $self->redirect_to('/tables?l=' . url_escape("path:${\$file->to_string}"));
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1312_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1411_2 line 1411 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1411_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1412_2 line 1412 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1412_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1414_2 line 1414 in import_url() ---
# Source:  return $err_home->('error_url_ssrf', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1414_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1418_2 line 1418 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1418_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1421_2 line 1421 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1421_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1519_3 line 1519 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1519_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1542_2 line 1542 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404) unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1542_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1607_2 line 1607 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1607_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1650_3 line 1650 in join_tables() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1650_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1752_2 line 1752 in combine_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1752_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1756_3 line 1756 in combine_tables() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1756_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1881_2 line 1881 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1881_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1886_2 line 1886 in export_data() ---
# Source:  return $format eq 'sqlite' ? $self->_render_sqlite($records, $columns, $safe_name)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1886_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1968_3 line 1968 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1968_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1981_3 line 1981 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1981_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1988_2 line 1988 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1988_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2003_2 line 2003 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2003_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2054_2 line 2054 in dirs_api() ---
# Source:  return $self->render(json => { error => 'Not a directory' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2054_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2121_3 line 2121 in stat_api() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2121_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2130_2 line 2130 in stat_api() ---
# Source:  return $self->render(json => { exists => \0, path => $path })
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2130_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2205_3 line 2205 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2205_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2217_3 line 2217 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2217_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2227_3 line 2227 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2227_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2251_3 line 2251 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2251_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2266_2 line 2266 in clear_uploads() ---
# Source:  return $self->render(json => { freed => 0, count => 0 })
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2266_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2312_2 line 2312 in graph_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2312_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2316_2 line 2316 in graph_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2316_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2320_2 line 2320 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2320_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2322_2 line 2322 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2322_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2339_2 line 2339 in graph_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2339_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2384_2 line 2384 in pie_view() ---
# Source:  return $self->render(text => 'Missing cat or val column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2384_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2388_2 line 2388 in pie_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2388_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2392_2 line 2392 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2392_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2398_2 line 2398 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2398_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2429_2 line 2429 in pie_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2429_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2533_2 line 2533 in heatmap_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2533_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2537_2 line 2537 in heatmap_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2537_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2541_2 line 2541 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2541_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2543_2 line 2543 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2543_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2545_2 line 2545 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2545_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2575_2 line 2575 in heatmap_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2575_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2675_2 line 2675 in bar_view() ---
# Source:  return $self->render(text => 'Missing cat column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2675_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2679_2 line 2679 in bar_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2679_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2683_2 line 2683 in bar_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2683_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2688_2 line 2688 in bar_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2688_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2708_2 line 2708 in bar_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2708_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2821_2 line 2821 in folder_view() ---
# Source:  return $self->render(text => 'Missing l= parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2821_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2826_2 line 2826 in folder_view() ---
# Source:  return $self->render(text => 'Prefix too long', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2826_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2835_2 line 2835 in folder_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2835_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2886_3 line 2886 in folder_view() ---
# Source:  return $n;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2886_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2993_2 line 2993 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $spec && length $spec;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2993_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3008_3 line 3008 in tables_view() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3008_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3015_3 line 3015 in tables_view() ---
# Source:  return $self->reply->not_found
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3015_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3022_3 line 3022 in tables_view() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3022_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_3052_2 line 3052 in tables_view() ---
# Source:  return $self->reply->not_found if $@;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_3052_2: add assertion here');

################################################################
# FILE: lib/Database/BI/Model/DataSource.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: COND_INV_519_4 (MEDIUM) line 519 in _detect_file_info() ---
# Source:  if ($ok) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_519_4 line 519 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 519 in _detect_file_info() to detect the mutant
    fail('COND_INV_519_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_751_3 (MEDIUM) line 751 in _detect_file_info() ---
# Source:  if (open(my $fh, '<:raw', $non_sqlite_db)) {
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
# Source:  if (read($fh, $buf, 4) == 4) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_753_27_!= line 753 in _detect_file_info()';
    # Suggested boundary values to test: 3, 4, 5
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 753 in _detect_file_info() to detect the mutant
    fail('NUM_BOUNDARY_753_27_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_758_4 (MEDIUM) line 758 in _detect_file_info() ---
# Source:  unless ($magic_ok) {
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
# Source:  if (seek $fh, 12, 0) {
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
# Source:  if (read($fh, $b12, 4) == 4) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_761_29_!= line 761 in _detect_file_info()';
    # Suggested boundary values to test: 3, 4, 5
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 761 in _detect_file_info() to detect the mutant
    fail('NUM_BOUNDARY_761_29_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_769_3 (MEDIUM) line 769 in _detect_file_info() ---
# Source:  if ($magic_ok) {
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
# Source:  if (defined $fsize && $fsize > $BDB_MAX_BYTES) {
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
# Source:  return undef unless $db_obj;
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
# Source:  if (defined $data) {
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

# --- SURVIVOR: BOOL_NEGATE_839_2 (MEDIUM) line 839 in _sniff_data_ext() ---
# Source:  return 'csv' unless defined $line;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_839_2 line 839 in _sniff_data_ext()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 839 in _sniff_data_ext() to detect the mutant
    fail('BOOL_NEGATE_839_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_951_3 (MEDIUM) line 951 in _init_backend() ---
# Source:  if (defined $self->{_file_ext}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_951_3 line 951 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 951 in _init_backend() to detect the mutant
    fail('COND_INV_951_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1011_3 (MEDIUM) line 1011 in _init_backend() ---
# Source:  if (-f $p) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1011_3 line 1011 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1011 in _init_backend() to detect the mutant
    fail('COND_INV_1011_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1080_3 (MEDIUM) line 1080 in _init_backend() ---
# Source:  if (defined $safe_ext) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1080_3 line 1080 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1080 in _init_backend() to detect the mutant
    fail('COND_INV_1080_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1383_3 (MEDIUM) line 1383 in fetch_all() ---
# Source:  if (defined $key) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1383_3 line 1383 in fetch_all()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1383 in fetch_all() to detect the mutant
    fail('COND_INV_1383_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1414_3 (MEDIUM) line 1414 in fetch_all() ---
# Source:  if (defined $key) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1414_3 line 1414 in fetch_all()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1414 in fetch_all() to detect the mutant
    fail('COND_INV_1414_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1445_2 (MEDIUM) line 1445 in count() ---
# Source:  return 0 if $self->{_file_is_empty};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1445_2 line 1445 in count()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1445 in count() to detect the mutant
    fail('BOOL_NEGATE_1445_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1446_2 (MEDIUM) line 1446 in count() ---
# Source:  return scalar @{ $self->{_file_data} } if $self->{_file_data};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1446_2 line 1446 in count()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1446 in count() to detect the mutant
    fail('BOOL_NEGATE_1446_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1447_2 (MEDIUM) line 1447 in count() ---
# Source:  return $self->{_db}->count();
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1447_2 line 1447 in count()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1447 in count() to detect the mutant
    fail('BOOL_NEGATE_1447_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_789_5 line 789 in _detect_file_info() ---
# Source:  return undef unless $db_obj;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_789_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_839_2 line 839 in _sniff_data_ext() ---
# Source:  return 'csv' unless defined $line;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_839_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1445_2 line 1445 in count() ---
# Source:  return 0 if $self->{_file_is_empty};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1445_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1446_2 line 1446 in count() ---
# Source:  return scalar @{ $self->{_file_data} } if $self->{_file_data};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1446_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1447_2 line 1447 in count() ---
# Source:  return $self->{_db}->count();
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_1447_2: add assertion here');

done_testing();
