#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-09-15 14:18:20
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

# --- SURVIVOR: COND_INV_223_2 (MEDIUM) line 223 in _resolve_language() ---
# Source:  if ($lang ne $default) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_223_2 line 223 in _resolve_language()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 223 in _resolve_language() to detect the mutant
    fail('COND_INV_223_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_246_2 (MEDIUM) line 246 in _scan_data_dir() ---
# Source:  return $dir->list->map(sub {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_246_2 line 246 in _scan_data_dir()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 246 in _scan_data_dir() to detect the mutant
    fail('BOOL_NEGATE_246_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_890_3 (MEDIUM) line 890 in view() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_890_3 line 890 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 890 in view() to detect the mutant
    fail('BOOL_NEGATE_890_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_896_3 (MEDIUM) line 896 in view() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_896_3 line 896 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 896 in view() to detect the mutant
    fail('BOOL_NEGATE_896_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_977_2 (MEDIUM) line 977 in browse() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_977_2 line 977 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 977 in browse() to detect the mutant
    fail('BOOL_NEGATE_977_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1098_2 (MEDIUM) line 1098 in open_file() ---
# Source:  available_tables => $self->_scan_data_dir,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1098_2 line 1098 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1098 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1098_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1101_2 (MEDIUM) line 1101 in open_file() ---
# Source:  filters_json     => $filters_json,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1101_2 line 1101 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1101 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1101_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1113_3 (MEDIUM) line 1113 in open_file() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1113_3 line 1113 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1113 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1113_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1208_2 (MEDIUM) line 1208 in import_url() ---
# Source:  Used by the join UI to populate the right-key dropdown without a page reload.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1208_2 line 1208 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1208 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1208_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1209_2 (MEDIUM) line 1209 in import_url() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1209_2 line 1209 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1209 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1209_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1211_2 (MEDIUM) line 1211 in import_url() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1211_2 line 1211 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1211 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1211_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1215_2 (MEDIUM) line 1215 in import_url() ---
# Source:  ?path=   string   Absolute path to a data file.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1215_2 line 1215 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1215 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1215_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1218_2 (MEDIUM) line 1218 in import_url() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1218_2 line 1218 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1218 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1218_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1311_3 (MEDIUM) line 1311 in columns_api() ---
# Source:  join_tables == lambda self .
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1311_3 line 1311 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1311 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1311_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1324_2 (MEDIUM) line 1324 in columns_api() ---
# Source:  c. Open right table; skip step on any error.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1324_2 line 1324 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1324 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1324_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1389_2 (MEDIUM) line 1389 in join_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1389_2 line 1389 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1389 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1389_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1393_3 (MEDIUM) line 1393 in join_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1393_3 line 1393 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1393 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1393_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1521_2 (MEDIUM) line 1521 in combine_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1521_2 line 1521 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1521 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1521_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1525_3 (MEDIUM) line 1525 in combine_tables() ---
# Source:  format           => 'html',
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1525_3 line 1525 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1525 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1525_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1648_2 (MEDIUM) line 1648 in export_data() ---
# Source:  C<report.txt>, C<report.json>, C<report> (no extension), empty string.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1648_2 line 1648 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1648 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1648_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1653_2 (MEDIUM) line 1653 in export_data() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1653_2 line 1653 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1653 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1653_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1733_3 (MEDIUM) line 1733 in export_write() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1733_3 line 1733 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1733 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1733_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1746_3 (MEDIUM) line 1746 in export_write() ---
# Source:  200 application/json
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1746_3 line 1746 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1746 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1746_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1753_2 (MEDIUM) line 1753 in export_write() ---
# Source:  404 application/json   { "error": "Not a directory" }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1753_2 line 1753 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1753 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1753_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1768_2 (MEDIUM) line 1768 in export_write() ---
# Source:  GET /api/dirs?path=/home/user  -> {"path":"/home/user","parent":"/home","dirs":[...]}
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1768_2 line 1768 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1768 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1768_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1819_2 (MEDIUM) line 1819 in dirs_api() ---
# Source:  =head3 FORMAL SPECIFICATION
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1819_2 line 1819 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1819 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_1819_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1886_3 (MEDIUM) line 1886 in stat_api() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1886_3 line 1886 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1886 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_1886_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1895_2 (MEDIUM) line 1895 in stat_api() ---
# Source:  let dest = home/.uploads/<random>/<filename> in
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1895_2 line 1895 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1895 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_1895_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1953_3 (MEDIUM) line 1953 in clear_uploads() ---
# Source:  sub clear_uploads ($self) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1953_3 line 1953 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1953 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_1953_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1965_3 (MEDIUM) line 1965 in clear_uploads() ---
# Source:  if (-d $entry) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1965_3 line 1965 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1965 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_1965_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1975_3 (MEDIUM) line 1975 in clear_uploads() ---
# Source:  $count++;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1975_3 line 1975 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1975 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_1975_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2000_2 (MEDIUM) line 2000 in graph_view() ---
# Source:  my $back  = $self->param('back') // '/';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2000_2 line 2000 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2000 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2000_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2046_2 (MEDIUM) line 2046 in graph_view() ---
# Source:  handler      => 'tt',
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2046_2 line 2046 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2046 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2046_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2050_2 (MEDIUM) line 2050 in graph_view() ---
# Source:  graph_html   => $snippet->{html},
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2050_2 line 2050 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2050 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2050_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2054_2 (MEDIUM) line 2054 in graph_view() ---
# Source:  ref_min_y    => $min_y,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2054_2 line 2054 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2054 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2054_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2056_2 (MEDIUM) line 2056 in graph_view() ---
# Source:  ref_avg_y    => sprintf('%.4g', $avg_y),
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2056_2 line 2056 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2056 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2056_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2073_2 (MEDIUM) line 2073 in graph_view() ---
# Source:  automatically.  The examples below show browser URLs and their curl
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2073_2 line 2073 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2073 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2073_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_246_2 line 246 in _scan_data_dir() ---
# Source:  return $dir->list->map(sub {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_246_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_890_3 line 890 in view() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_890_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_896_3 line 896 in view() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_896_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_977_2 line 977 in browse() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_977_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1098_2 line 1098 in open_file() ---
# Source:  available_tables => $self->_scan_data_dir,
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1098_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1101_2 line 1101 in open_file() ---
# Source:  filters_json     => $filters_json,
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1101_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1113_3 line 1113 in open_file() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1113_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1208_2 line 1208 in import_url() ---
# Source:  Used by the join UI to populate the right-key dropdown without a page reload.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1208_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1209_2 line 1209 in import_url() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1209_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1211_2 line 1211 in import_url() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1211_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1215_2 line 1215 in import_url() ---
# Source:  ?path=   string   Absolute path to a data file.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1215_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1218_2 line 1218 in import_url() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1218_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1311_3 line 1311 in columns_api() ---
# Source:  join_tables == lambda self .
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1311_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1324_2 line 1324 in columns_api() ---
# Source:  c. Open right table; skip step on any error.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1324_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1389_2 line 1389 in join_tables() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1389_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1393_3 line 1393 in join_tables() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1393_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1521_2 line 1521 in combine_tables() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1521_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1525_3 line 1525 in combine_tables() ---
# Source:  format           => 'html',
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1525_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1648_2 line 1648 in export_data() ---
# Source:  C<report.txt>, C<report.json>, C<report> (no extension), empty string.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1648_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1653_2 line 1653 in export_data() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1653_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1733_3 line 1733 in export_write() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1733_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1746_3 line 1746 in export_write() ---
# Source:  200 application/json
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1746_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1753_2 line 1753 in export_write() ---
# Source:  404 application/json   { "error": "Not a directory" }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1753_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1768_2 line 1768 in export_write() ---
# Source:  GET /api/dirs?path=/home/user  -> {"path":"/home/user","parent":"/home","dirs":[...]}
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1768_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1819_2 line 1819 in dirs_api() ---
# Source:  =head3 FORMAL SPECIFICATION
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1819_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1886_3 line 1886 in stat_api() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1886_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1895_2 line 1895 in stat_api() ---
# Source:  let dest = home/.uploads/<random>/<filename> in
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1895_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1953_3 line 1953 in clear_uploads() ---
# Source:  sub clear_uploads ($self) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1953_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1965_3 line 1965 in clear_uploads() ---
# Source:  if (-d $entry) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1965_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1975_3 line 1975 in clear_uploads() ---
# Source:  $count++;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1975_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2000_2 line 2000 in graph_view() ---
# Source:  my $back  = $self->param('back') // '/';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2000_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2046_2 line 2046 in graph_view() ---
# Source:  handler      => 'tt',
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2046_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2050_2 line 2050 in graph_view() ---
# Source:  graph_html   => $snippet->{html},
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2050_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2054_2 line 2054 in graph_view() ---
# Source:  ref_min_y    => $min_y,
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2054_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2056_2 line 2056 in graph_view() ---
# Source:  ref_avg_y    => sprintf('%.4g', $avg_y),
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2056_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2073_2 line 2073 in graph_view() ---
# Source:  automatically.  The examples below show browser URLs and their curl
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2073_2: add assertion here');

done_testing();
