#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-09-22 18:40:05
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

# --- SURVIVOR: COND_INV_253_2 (MEDIUM) line 253 in _resolve_language() ---
# Source:  if ($lang ne $default) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_253_2 line 253 in _resolve_language()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 253 in _resolve_language() to detect the mutant
    fail('COND_INV_253_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_276_2 (MEDIUM) line 276 in _scan_data_dir() ---
# Source:  return $dir->list->map(sub {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_276_2 line 276 in _scan_data_dir()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 276 in _scan_data_dir() to detect the mutant
    fail('BOOL_NEGATE_276_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_908_3 (MEDIUM) line 908 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_908_3 line 908 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 908 in view() to detect the mutant
    fail('BOOL_NEGATE_908_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_914_3 (MEDIUM) line 914 in view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_914_3 line 914 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 914 in view() to detect the mutant
    fail('BOOL_NEGATE_914_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_997_2 (MEDIUM) line 997 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_997_2 line 997 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 997 in browse() to detect the mutant
    fail('BOOL_NEGATE_997_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1118_2 (MEDIUM) line 1118 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1118_2 line 1118 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1118 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1118_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1125_3 (MEDIUM) line 1125 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1125_3 line 1125 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1125 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1125_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1131_4 (MEDIUM) line 1131 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1131_4 line 1131 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1131 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1131_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1146_3 (MEDIUM) line 1146 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1146_3 line 1146 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1146 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1146_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1172_2 (MEDIUM) line 1172 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1172_2 line 1172 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1172 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1172_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1187_3 (MEDIUM) line 1187 in open_file() ---
# Source:  if ($filename =~ /\.(?:sql|db)\z/i) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1187_3 line 1187 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1187 in open_file() to detect the mutant
    fail('COND_INV_1187_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1192_3 (MEDIUM) line 1192 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1192_3 line 1192 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1192 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1192_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1292_2 (MEDIUM) line 1292 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1292_2 line 1292 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1292 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1292_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1293_2 (MEDIUM) line 1293 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1293_2 line 1293 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1293 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1293_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1295_2 (MEDIUM) line 1295 in import_url() ---
# Source:  return $err_home->('error_url_ssrf', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1295_2 line 1295 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1295 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1295_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1299_2 (MEDIUM) line 1299 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1299_2 line 1299 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1299 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1299_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1302_2 (MEDIUM) line 1302 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1302_2 line 1302 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1302 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1302_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1395_3 (MEDIUM) line 1395 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1395_3 line 1395 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1395 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1395_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1418_2 (MEDIUM) line 1418 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404) unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1418_2 line 1418 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1418 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1418_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1483_2 (MEDIUM) line 1483 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1483_2 line 1483 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1483 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1483_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1521_3 (MEDIUM) line 1521 in join_tables() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1521_3 line 1521 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1521 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1521_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1622_2 (MEDIUM) line 1622 in combine_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1622_2 line 1622 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1622 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1622_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1626_3 (MEDIUM) line 1626 in combine_tables() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1626_3 line 1626 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1626 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1626_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1751_2 (MEDIUM) line 1751 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1751_2 line 1751 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1751 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1751_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1756_2 (MEDIUM) line 1756 in export_data() ---
# Source:  return $format eq 'sqlite' ? $self->_render_sqlite($records, $columns, $safe_name)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1756_2 line 1756 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1756 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1756_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1838_3 (MEDIUM) line 1838 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1838_3 line 1838 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1838 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1838_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1851_3 (MEDIUM) line 1851 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1851_3 line 1851 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1851 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1851_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1858_2 (MEDIUM) line 1858 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1858_2 line 1858 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1858 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1858_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1873_2 (MEDIUM) line 1873 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1873_2 line 1873 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1873 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1873_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1924_2 (MEDIUM) line 1924 in dirs_api() ---
# Source:  return $self->render(json => { error => 'Not a directory' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1924_2 line 1924 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1924 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_1924_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1991_3 (MEDIUM) line 1991 in stat_api() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1991_3 line 1991 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1991 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_1991_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2000_2 (MEDIUM) line 2000 in stat_api() ---
# Source:  return $self->render(json => { exists => \0, path => $path })
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2000_2 line 2000 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2000 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_2000_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2058_3 (MEDIUM) line 2058 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2058_3 line 2058 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2058 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2058_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2070_3 (MEDIUM) line 2070 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2070_3 line 2070 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2070 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2070_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2080_3 (MEDIUM) line 2080 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2080_3 line 2080 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2080 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2080_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2105_2 (MEDIUM) line 2105 in clear_uploads() ---
# Source:  return $self->render(json => { freed => 0, count => 0 })
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2105_2 line 2105 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2105 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_2105_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2151_2 (MEDIUM) line 2151 in graph_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2151_2 line 2151 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2151 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2151_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2155_2 (MEDIUM) line 2155 in graph_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2155_2 line 2155 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2155 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2155_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2159_2 (MEDIUM) line 2159 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2159_2 line 2159 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2159 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2159_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2161_2 (MEDIUM) line 2161 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2161_2 line 2161 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2161 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2161_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2178_2 (MEDIUM) line 2178 in graph_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2178_2 line 2178 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2178 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2178_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2220_2 (MEDIUM) line 2220 in pie_view() ---
# Source:  return $self->render(text => 'Missing cat or val column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2220_2 line 2220 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2220 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2220_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2224_2 (MEDIUM) line 2224 in pie_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2224_2 line 2224 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2224 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2224_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2228_2 (MEDIUM) line 2228 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2228_2 line 2228 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2228 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2228_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2234_2 (MEDIUM) line 2234 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2234_2 line 2234 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2234 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2234_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2265_2 (MEDIUM) line 2265 in pie_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2265_2 line 2265 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2265 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2265_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2311_2 (MEDIUM) line 2311 in heatmap_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2311_2 line 2311 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2311 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2311_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2315_2 (MEDIUM) line 2315 in heatmap_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2315_2 line 2315 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2315 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2315_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2319_2 (MEDIUM) line 2319 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2319_2 line 2319 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2319 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2319_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2321_2 (MEDIUM) line 2321 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2321_2 line 2321 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2321 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2321_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2323_2 (MEDIUM) line 2323 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2323_2 line 2323 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2323 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2323_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_2336_3 (MEDIUM) line 2336 in heatmap_view() ---
# Source:  if (length($val_col)) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_2336_3 line 2336 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2336 in heatmap_view() to detect the mutant
    fail('COND_INV_2336_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2350_2 (MEDIUM) line 2350 in heatmap_view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2350_2 line 2350 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2350 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2350_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_276_2 line 276 in _scan_data_dir() ---
# Source:  return $dir->list->map(sub {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_276_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_908_3 line 908 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_908_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_914_3 line 914 in view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_914_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_997_2 line 997 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_997_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1118_2 line 1118 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1118_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1125_3 line 1125 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1125_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1131_4 line 1131 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1131_4: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1146_3 line 1146 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1146_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1172_2 line 1172 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1172_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1192_3 line 1192 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1192_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1292_2 line 1292 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1292_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1293_2 line 1293 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1293_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1295_2 line 1295 in import_url() ---
# Source:  return $err_home->('error_url_ssrf', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1295_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1299_2 line 1299 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1299_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1302_2 line 1302 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1302_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1395_3 line 1395 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1395_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1418_2 line 1418 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404) unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1418_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1483_2 line 1483 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1483_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1521_3 line 1521 in join_tables() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1521_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1622_2 line 1622 in combine_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1622_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1626_3 line 1626 in combine_tables() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1626_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1751_2 line 1751 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1751_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1756_2 line 1756 in export_data() ---
# Source:  return $format eq 'sqlite' ? $self->_render_sqlite($records, $columns, $safe_name)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1756_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1838_3 line 1838 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1838_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1851_3 line 1851 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1851_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1858_2 line 1858 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1858_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1873_2 line 1873 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1873_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1924_2 line 1924 in dirs_api() ---
# Source:  return $self->render(json => { error => 'Not a directory' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1924_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1991_3 line 1991 in stat_api() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1991_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2000_2 line 2000 in stat_api() ---
# Source:  return $self->render(json => { exists => \0, path => $path })
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2000_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2058_3 line 2058 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2058_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2070_3 line 2070 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2070_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2080_3 line 2080 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2080_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2105_2 line 2105 in clear_uploads() ---
# Source:  return $self->render(json => { freed => 0, count => 0 })
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2105_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2151_2 line 2151 in graph_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2151_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2155_2 line 2155 in graph_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2155_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2159_2 line 2159 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2159_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2161_2 line 2161 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2161_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2178_2 line 2178 in graph_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2178_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2220_2 line 2220 in pie_view() ---
# Source:  return $self->render(text => 'Missing cat or val column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2220_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2224_2 line 2224 in pie_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2224_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2228_2 line 2228 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $cat_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2228_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2234_2 line 2234 in pie_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2234_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2265_2 line 2265 in pie_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2265_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2311_2 line 2311 in heatmap_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2311_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2315_2 line 2315 in heatmap_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2315_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2319_2 line 2319 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $x_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2319_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2321_2 line 2321 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2321_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2323_2 line 2323 in heatmap_view() ---
# Source:  return $self->render(text => "Column not found: $val_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2323_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2350_2 line 2350 in heatmap_view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2350_2: add assertion here');

################################################################
# FILE: lib/Database/BI/Model/DataSource.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: COND_INV_513_4 (MEDIUM) line 513 in _detect_file_info() ---
# Source:  if ($ok) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_513_4 line 513 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 513 in _detect_file_info() to detect the mutant
    fail('COND_INV_513_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_758_2 (MEDIUM) line 758 in _sniff_data_ext() ---
# Source:  return 'db'  if $header =~ /\ASQLite format/;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_758_2 line 758 in _sniff_data_ext()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 758 in _sniff_data_ext() to detect the mutant
    fail('BOOL_NEGATE_758_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_759_2 (MEDIUM) line 759 in _sniff_data_ext() ---
# Source:  return 'xml' if $header =~ /\A\s*<\?xml/i;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_759_2 line 759 in _sniff_data_ext()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 759 in _sniff_data_ext() to detect the mutant
    fail('BOOL_NEGATE_759_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_760_2 (MEDIUM) line 760 in _sniff_data_ext() ---
# Source:  return 'xml' if $header =~ /\A\s*</;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_760_2 line 760 in _sniff_data_ext()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 760 in _sniff_data_ext() to detect the mutant
    fail('BOOL_NEGATE_760_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_764_2 (MEDIUM) line 764 in _sniff_data_ext() ---
# Source:  return 'csv' unless defined $line;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_764_2 line 764 in _sniff_data_ext()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 764 in _sniff_data_ext() to detect the mutant
    fail('BOOL_NEGATE_764_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_765_2 (MEDIUM) line 765 in _sniff_data_ext() ---
# Source:  return 'tsv' if $line =~ /\t/;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_765_2 line 765 in _sniff_data_ext()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 765 in _sniff_data_ext() to detect the mutant
    fail('BOOL_NEGATE_765_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_766_2 (MEDIUM) line 766 in _sniff_data_ext() ---
# Source:  return 'psv' if $line =~ /\|/;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_766_2 line 766 in _sniff_data_ext()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 766 in _sniff_data_ext() to detect the mutant
    fail('BOOL_NEGATE_766_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_876_3 (MEDIUM) line 876 in _init_backend() ---
# Source:  if (defined $self->{_file_ext}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_876_3 line 876 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 876 in _init_backend() to detect the mutant
    fail('COND_INV_876_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_936_3 (MEDIUM) line 936 in _init_backend() ---
# Source:  if (-f $p) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_936_3 line 936 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 936 in _init_backend() to detect the mutant
    fail('COND_INV_936_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_991_2 (MEDIUM) line 991 in _init_backend() ---
# Source:  if ($raw_table ne $table) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_991_2 line 991 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 991 in _init_backend() to detect the mutant
    fail('COND_INV_991_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_997_3 (MEDIUM) line 997 in _init_backend() ---
# Source:  if (defined $safe_ext) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_997_3 line 997 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 997 in _init_backend() to detect the mutant
    fail('COND_INV_997_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1248_3 (MEDIUM) line 1248 in fetch_all() ---
# Source:  if (defined $key) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1248_3 line 1248 in fetch_all()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1248 in fetch_all() to detect the mutant
    fail('COND_INV_1248_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1279_3 (MEDIUM) line 1279 in fetch_all() ---
# Source:  if (defined $key) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1279_3 line 1279 in fetch_all()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1279 in fetch_all() to detect the mutant
    fail('COND_INV_1279_3: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_758_2 line 758 in _sniff_data_ext() ---
# Source:  return 'db'  if $header =~ /\ASQLite format/;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_758_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_759_2 line 759 in _sniff_data_ext() ---
# Source:  return 'xml' if $header =~ /\A\s*<\?xml/i;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_759_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_760_2 line 760 in _sniff_data_ext() ---
# Source:  return 'xml' if $header =~ /\A\s*</;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_760_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_764_2 line 764 in _sniff_data_ext() ---
# Source:  return 'csv' unless defined $line;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_764_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_765_2 line 765 in _sniff_data_ext() ---
# Source:  return 'tsv' if $line =~ /\t/;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_765_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_766_2 line 766 in _sniff_data_ext() ---
# Source:  return 'psv' if $line =~ /\|/;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_766_2: add assertion here');

done_testing();
