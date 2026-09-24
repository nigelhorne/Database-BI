#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-09-24 20:47:33
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

# --- SURVIVOR: BOOL_NEGATE_737_2 (MEDIUM) line 737 in _decode_cell() ---
# Source:  return $s unless defined $s;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_737_2 line 737 in _decode_cell()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 737 in _decode_cell() to detect the mutant
    fail('BOOL_NEGATE_737_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_926_3 (MEDIUM) line 926 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_926_3 line 926 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 926 in view() to detect the mutant
    fail('BOOL_NEGATE_926_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_932_3 (MEDIUM) line 932 in view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_932_3 line 932 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 932 in view() to detect the mutant
    fail('BOOL_NEGATE_932_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1015_2 (MEDIUM) line 1015 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1015_2 line 1015 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1015 in browse() to detect the mutant
    fail('BOOL_NEGATE_1015_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1136_2 (MEDIUM) line 1136 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1136_2 line 1136 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1136 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1136_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1143_3 (MEDIUM) line 1143 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1143_3 line 1143 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1143 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1143_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1149_4 (MEDIUM) line 1149 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1149_4 line 1149 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1149 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1149_4: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1164_3 (MEDIUM) line 1164 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1164_3 line 1164 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1164 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1164_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1190_2 (MEDIUM) line 1190 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1190_2 line 1190 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1190 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1190_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1205_3 (MEDIUM) line 1205 in open_file() ---
# Source:  if ($filename =~ /\.(?:sql|db)\z/i) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1205_3 line 1205 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1205 in open_file() to detect the mutant
    fail('COND_INV_1205_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1210_3 (MEDIUM) line 1210 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1210_3 line 1210 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1210 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1210_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1310_2 (MEDIUM) line 1310 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1310_2 line 1310 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1310 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1310_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1311_2 (MEDIUM) line 1311 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1311_2 line 1311 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1311 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1311_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1313_2 (MEDIUM) line 1313 in import_url() ---
# Source:  return $err_home->('error_url_ssrf', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1313_2 line 1313 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1313 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1313_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1317_2 (MEDIUM) line 1317 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1317_2 line 1317 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1317 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1317_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1320_2 (MEDIUM) line 1320 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1320_2 line 1320 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1320 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1320_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1415_3 (MEDIUM) line 1415 in columns_api() ---
# Source:  my $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1415_3 line 1415 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1415 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1415_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1438_2 (MEDIUM) line 1438 in columns_api() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1438_2 line 1438 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1438 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1438_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1503_2 (MEDIUM) line 1503 in join_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1503_2 line 1503 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1503 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1503_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1541_3 (MEDIUM) line 1541 in join_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1541_3 line 1541 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1541 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1541_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1642_2 (MEDIUM) line 1642 in combine_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1642_2 line 1642 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1642 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1642_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1646_3 (MEDIUM) line 1646 in combine_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1646_3 line 1646 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1646 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1646_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1771_2 (MEDIUM) line 1771 in combine_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1771_2 line 1771 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1771 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1771_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1776_2 (MEDIUM) line 1776 in export_data() ---
# Source:  my $format = $self->param('format') // 'csv';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1776_2 line 1776 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1776 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1776_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1858_3 (MEDIUM) line 1858 in export_write() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1858_3 line 1858 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1858 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1858_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1871_3 (MEDIUM) line 1871 in export_write() ---
# Source:  elsif ($filename && $filename =~ /\.sql\z/i)  { $format = 'sqlite'; }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1871_3 line 1871 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1871 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1871_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1878_2 (MEDIUM) line 1878 in export_write() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1878_2 line 1878 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1878 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1878_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1893_2 (MEDIUM) line 1893 in export_write() ---
# Source:  $dest->spurt($self->_write_sqlite_db($records, $columns));
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1893_2 line 1893 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1893 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1893_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1944_2 (MEDIUM) line 1944 in dirs_api() ---
# Source:  sub dirs_api ($self) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1944_2 line 1944 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1944 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_1944_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2011_3 (MEDIUM) line 2011 in stat_api() ---
# Source:  sub stat_api ($self) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2011_3 line 2011 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2011 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_2011_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2020_2 (MEDIUM) line 2020 in stat_api() ---
# Source:  my $file = eval { Mojo::File->new($path)->realpath };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2020_2 line 2020 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2020 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_2020_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2078_3 (MEDIUM) line 2078 in upload_file() ---
# Source:  sub upload_file ($self) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2078_3 line 2078 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2078 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2078_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2090_3 (MEDIUM) line 2090 in upload_file() ---
# Source:  # upload asset).  Check is_limit_exceeded first; fall through to an asset
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2090_3 line 2090 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2090 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2090_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2100_3 (MEDIUM) line 2100 in upload_file() ---
# Source:  # must not silently truncate the directory-strip, leaving "dir\ncomponent" in.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2100_3 line 2100 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2100 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2100_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2125_2 (MEDIUM) line 2125 in clear_uploads() ---
# Source:  sub clear_uploads ($self) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2125_2 line 2125 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2125 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_2125_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2171_2 (MEDIUM) line 2171 in graph_view() ---
# Source:  my $y_col = $self->param('y') // '';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2171_2 line 2171 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2171 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2171_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2175_2 (MEDIUM) line 2175 in graph_view() ---
# Source:  unless length($x_col) && length($y_col);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2175_2 line 2175 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2175 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2175_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2179_2 (MEDIUM) line 2179 in graph_view() ---
# Source:  unless $records;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2179_2 line 2179 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2179 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2179_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2181_2 (MEDIUM) line 2181 in graph_view() ---
# Source:  my %col_set = map { $_ => 1 } @{$columns};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2181_2 line 2181 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2181 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2181_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2198_2 (MEDIUM) line 2198 in graph_view() ---
# Source:  push @pairs, [_decode_cell($x), $y_num + 0, \%extra];
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2198_2 line 2198 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2198 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2198_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2243_2 (MEDIUM) line 2243 in pie_view() ---
# Source:  my $back        = _safe_back_url($self->param('back')) // '/';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2243_2 line 2243 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2243 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2243_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2247_2 (MEDIUM) line 2247 in pie_view() ---
# Source:  unless length($cat_col) && length($val_col);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2247_2 line 2247 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2247 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2247_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2251_2 (MEDIUM) line 2251 in pie_view() ---
# Source:  unless $records;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2251_2 line 2251 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2251 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2251_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2257_2 (MEDIUM) line 2257 in pie_view() ---
# Source:  # '__count__' is the sentinel value sent when the user picks "Count (rows)".
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2257_2 line 2257 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2257 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2257_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2288_2 (MEDIUM) line 2288 in pie_view() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2288_2 line 2288 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2288 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2288_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2337_2 (MEDIUM) line 2337 in heatmap_view() ---
# Source:  my $show_v  = $self->param('show_val') ? 1 : 0;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2337_2 line 2337 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2337 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2337_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2341_2 (MEDIUM) line 2341 in heatmap_view() ---
# Source:  unless length($x_col) && length($y_col);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2341_2 line 2341 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2341 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2341_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2345_2 (MEDIUM) line 2345 in heatmap_view() ---
# Source:  unless $records;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2345_2 line 2345 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2345 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2345_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2347_2 (MEDIUM) line 2347 in heatmap_view() ---
# Source:  my %col_set = map { $_ => 1 } @{$columns};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2347_2 line 2347 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2347 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2347_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2349_2 (MEDIUM) line 2349 in heatmap_view() ---
# Source:  unless $col_set{$x_col};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2349_2 line 2349 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2349 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2349_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_2362_3 (MEDIUM) line 2362 in heatmap_view() ---
# Source:  next unless length($x) && length($y);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_2362_3 line 2362 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2362 in heatmap_view() to detect the mutant
    fail('COND_INV_2362_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2379_2 (MEDIUM) line 2379 in heatmap_view() ---
# Source:  map { [$xv, _decode_cell($_), $grid{$raw_x}{$_}] } @y_order
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2379_2 line 2379 in heatmap_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2379 in heatmap_view() to detect the mutant
    fail('BOOL_NEGATE_2379_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2424_2 (MEDIUM) line 2424 in bar_view() ---
# Source:  my $sort     = $self->param('sort')   // 'none';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2424_2 line 2424 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2424 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2424_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2428_2 (MEDIUM) line 2428 in bar_view() ---
# Source:  unless length($cat_col);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2428_2 line 2428 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2428 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2428_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2432_2 (MEDIUM) line 2432 in bar_view() ---
# Source:  unless $records;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2432_2 line 2432 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2432 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2432_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2437_2 (MEDIUM) line 2437 in bar_view() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2437_2 line 2437 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2437 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2437_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2457_2 (MEDIUM) line 2457 in bar_view() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2457_2 line 2457 in bar_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2457 in bar_view() to detect the mutant
    fail('BOOL_NEGATE_2457_2: replace with real assertion');
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

# --- LOW HINT: RETURN_UNDEF_737_2 line 737 in _decode_cell() ---
# Source:  return $s unless defined $s;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_737_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_926_3 line 926 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_926_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_932_3 line 932 in view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_932_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1015_2 line 1015 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1015_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1136_2 line 1136 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1136_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1143_3 line 1143 in open_file() ---
# Source:  return $self->reply->not_found unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1143_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1149_4 line 1149 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1149_4: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1164_3 line 1164 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1164_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1190_2 line 1190 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1190_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1210_3 line 1210 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1210_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1310_2 line 1310 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1310_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1311_2 line 1311 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1311_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1313_2 line 1313 in import_url() ---
# Source:  return $err_home->('error_url_ssrf', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1313_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1317_2 line 1317 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1317_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1320_2 line 1320 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1320_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1415_3 line 1415 in columns_api() ---
# Source:  my $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1415_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1438_2 line 1438 in columns_api() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1438_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1503_2 line 1503 in join_tables() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1503_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1541_3 line 1541 in join_tables() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1541_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1642_2 line 1642 in combine_tables() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1642_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1646_3 line 1646 in combine_tables() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1646_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1771_2 line 1771 in combine_tables() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1771_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1776_2 line 1776 in export_data() ---
# Source:  my $format = $self->param('format') // 'csv';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1776_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1858_3 line 1858 in export_write() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1858_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1871_3 line 1871 in export_write() ---
# Source:  elsif ($filename && $filename =~ /\.sql\z/i)  { $format = 'sqlite'; }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1871_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1878_2 line 1878 in export_write() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1878_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1893_2 line 1893 in export_write() ---
# Source:  $dest->spurt($self->_write_sqlite_db($records, $columns));
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1893_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1944_2 line 1944 in dirs_api() ---
# Source:  sub dirs_api ($self) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1944_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2011_3 line 2011 in stat_api() ---
# Source:  sub stat_api ($self) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2011_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2020_2 line 2020 in stat_api() ---
# Source:  my $file = eval { Mojo::File->new($path)->realpath };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2020_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2078_3 line 2078 in upload_file() ---
# Source:  sub upload_file ($self) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2078_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2090_3 line 2090 in upload_file() ---
# Source:  # upload asset).  Check is_limit_exceeded first; fall through to an asset
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2090_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2100_3 line 2100 in upload_file() ---
# Source:  # must not silently truncate the directory-strip, leaving "dir\ncomponent" in.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2100_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2125_2 line 2125 in clear_uploads() ---
# Source:  sub clear_uploads ($self) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2125_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2171_2 line 2171 in graph_view() ---
# Source:  my $y_col = $self->param('y') // '';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2171_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2175_2 line 2175 in graph_view() ---
# Source:  unless length($x_col) && length($y_col);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2175_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2179_2 line 2179 in graph_view() ---
# Source:  unless $records;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2179_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2181_2 line 2181 in graph_view() ---
# Source:  my %col_set = map { $_ => 1 } @{$columns};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2181_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2198_2 line 2198 in graph_view() ---
# Source:  push @pairs, [_decode_cell($x), $y_num + 0, \%extra];
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2198_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2243_2 line 2243 in pie_view() ---
# Source:  my $back        = _safe_back_url($self->param('back')) // '/';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2243_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2247_2 line 2247 in pie_view() ---
# Source:  unless length($cat_col) && length($val_col);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2247_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2251_2 line 2251 in pie_view() ---
# Source:  unless $records;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2251_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2257_2 line 2257 in pie_view() ---
# Source:  # '__count__' is the sentinel value sent when the user picks "Count (rows)".
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2257_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2288_2 line 2288 in pie_view() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2288_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2337_2 line 2337 in heatmap_view() ---
# Source:  my $show_v  = $self->param('show_val') ? 1 : 0;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2337_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2341_2 line 2341 in heatmap_view() ---
# Source:  unless length($x_col) && length($y_col);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2341_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2345_2 line 2345 in heatmap_view() ---
# Source:  unless $records;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2345_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2347_2 line 2347 in heatmap_view() ---
# Source:  my %col_set = map { $_ => 1 } @{$columns};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2347_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2349_2 line 2349 in heatmap_view() ---
# Source:  unless $col_set{$x_col};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2349_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2379_2 line 2379 in heatmap_view() ---
# Source:  map { [$xv, _decode_cell($_), $grid{$raw_x}{$_}] } @y_order
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2379_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2424_2 line 2424 in bar_view() ---
# Source:  my $sort     = $self->param('sort')   // 'none';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2424_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2428_2 line 2428 in bar_view() ---
# Source:  unless length($cat_col);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2428_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2432_2 line 2432 in bar_view() ---
# Source:  unless $records;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2432_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2437_2 line 2437 in bar_view() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2437_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2457_2 line 2457 in bar_view() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2457_2: add assertion here');

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
