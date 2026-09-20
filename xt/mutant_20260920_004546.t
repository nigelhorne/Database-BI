#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-09-20 00:45:46
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

# --- SURVIVOR: COND_INV_243_2 (MEDIUM) line 243 in _resolve_language() ---
# Source:  if ($lang ne $default) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_243_2 line 243 in _resolve_language()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 243 in _resolve_language() to detect the mutant
    fail('COND_INV_243_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_266_2 (MEDIUM) line 266 in _scan_data_dir() ---
# Source:  return $dir->list->map(sub {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_266_2 line 266 in _scan_data_dir()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 266 in _scan_data_dir() to detect the mutant
    fail('BOOL_NEGATE_266_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_862_3 (MEDIUM) line 862 in view() ---
# Source:  unless (defined $table && $table =~ $TABLE_NAME_RE) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_862_3 line 862 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 862 in view() to detect the mutant
    fail('BOOL_NEGATE_862_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_868_3 (MEDIUM) line 868 in view() ---
# Source:  if ($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_868_3 line 868 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 868 in view() to detect the mutant
    fail('BOOL_NEGATE_868_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_951_2 (MEDIUM) line 951 in browse() ---
# Source:  my $dir      = eval { Mojo::File->new($raw_path)->realpath };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_951_2 line 951 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 951 in browse() to detect the mutant
    fail('BOOL_NEGATE_951_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1072_2 (MEDIUM) line 1072 in open_file() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1072_2 line 1072 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1072 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1072_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1075_2 (MEDIUM) line 1075 in open_file() ---
# Source:  my $file = eval { Mojo::File->new($file_path)->realpath };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1075_2 line 1075 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1075 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1075_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1090_3 (MEDIUM) line 1090 in open_file() ---
# Source:  my $hint;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1090_3 line 1090 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1090 in open_file() to detect the mutant
    fail('COND_INV_1090_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1095_3 (MEDIUM) line 1095 in open_file() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1095_3 line 1095 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1095 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1095_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1195_2 (MEDIUM) line 1195 in import_url() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1195_2 line 1195 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1195 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1195_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1196_2 (MEDIUM) line 1196 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1196_2 line 1196 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1196 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1196_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1198_2 (MEDIUM) line 1198 in import_url() ---
# Source:  unless $url =~ m{\Ahttps?://}i;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1198_2 line 1198 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1198 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1198_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1202_2 (MEDIUM) line 1202 in import_url() ---
# Source:  my $source = eval { $self->open_table('', url => $url, html_table_index => $idx) };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1202_2 line 1202 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1202 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1202_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1205_2 (MEDIUM) line 1205 in import_url() ---
# Source:  my $records = eval { $source->fetch_all };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1205_2 line 1205 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1205 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1205_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1298_3 (MEDIUM) line 1298 in columns_api() ---
# Source:  my $data_dir = $self->app->home->child($self->app->config->{data_dir} // 'data');
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1298_3 line 1298 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1298 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1298_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1311_2 (MEDIUM) line 1311 in columns_api() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1311_2 line 1311 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1311 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1311_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1376_2 (MEDIUM) line 1376 in join_tables() ---
# Source:  my ($left_src, $left_label) = $self->_open_spec($left_spec);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1376_2 line 1376 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1376 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1376_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1411_3 (MEDIUM) line 1411 in join_tables() ---
# Source:  my $records = eval { $src->selectall_arrayref };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1411_3 line 1411 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1411 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1411_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1512_2 (MEDIUM) line 1512 in combine_tables() ---
# Source:  my $left_spec = $self->param('l') // '';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1512_2 line 1512 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1512 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1512_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1516_3 (MEDIUM) line 1516 in combine_tables() ---
# Source:  my $left_recs = eval { $left_src->fetch_all };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1516_3 line 1516 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1516 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1516_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1641_2 (MEDIUM) line 1641 in export_data() ---
# Source:  sub export_data ($self) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1641_2 line 1641 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1641 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1641_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1646_2 (MEDIUM) line 1646 in export_data() ---
# Source:  (my $safe_name = lc $left_label) =~ s/[^a-z0-9_]+/_/g;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1646_2 line 1646 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1646 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1646_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1726_3 (MEDIUM) line 1726 in export_write() ---
# Source:  my $filename = $self->param('filename') // '';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1726_3 line 1726 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1726 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1726_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1739_3 (MEDIUM) line 1739 in export_write() ---
# Source:  if    ($filename && $filename =~ /\.csv\z/i)  { $format = 'csv';    }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1739_3 line 1739 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1739 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1739_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1746_2 (MEDIUM) line 1746 in export_write() ---
# Source:  );
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1746_2 line 1746 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1746 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1746_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1761_2 (MEDIUM) line 1761 in export_write() ---
# Source:  else {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1761_2 line 1761 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1761 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1761_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1812_2 (MEDIUM) line 1812 in export_write() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1812_2 line 1812 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1812 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1812_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1879_3 (MEDIUM) line 1879 in dirs_api() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1879_3 line 1879 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1879 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_1879_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1888_2 (MEDIUM) line 1888 in stat_api() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1888_2 line 1888 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1888 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_1888_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1946_3 (MEDIUM) line 1946 in stat_api() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1946_3 line 1946 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1946 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_1946_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1958_3 (MEDIUM) line 1958 in upload_file() ---
# Source:  # limit fires (with req->is_limit_exceeded true and partial content in the
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1958_3 line 1958 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1958 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_1958_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1968_3 (MEDIUM) line 1968 in upload_file() ---
# Source:  # /s so .* matches \n; a percent-decoded newline inside a browser filename
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1968_3 line 1968 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1968 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_1968_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1993_2 (MEDIUM) line 1993 in upload_file() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1993_2 line 1993 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1993 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_1993_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2039_2 (MEDIUM) line 2039 in graph_view() ---
# Source:  my $x_col = $self->param('x') // '';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2039_2 line 2039 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2039 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2039_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2043_2 (MEDIUM) line 2043 in graph_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2043_2 line 2043 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2043 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2043_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2047_2 (MEDIUM) line 2047 in graph_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2047_2 line 2047 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2047 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2047_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2049_2 (MEDIUM) line 2049 in graph_view() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2049_2 line 2049 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2049 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2049_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2066_2 (MEDIUM) line 2066 in graph_view() ---
# Source:  my %extra = map { $_ => $row->{$_} } grep { $_ ne $x_col && $_ ne $y_col } @{$columns};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2066_2 line 2066 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2066 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2066_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2104_2 (MEDIUM) line 2104 in pie_view() ---
# Source:  my $donut       = $self->param('donut') ? 1 : 0;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2104_2 line 2104 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2104 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2104_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2108_2 (MEDIUM) line 2108 in pie_view() ---
# Source:  return $self->render(text => 'Missing cat or val column parameter', status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2108_2 line 2108 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2108 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2108_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2112_2 (MEDIUM) line 2112 in pie_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2112_2 line 2112 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2112 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2112_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2118_2 (MEDIUM) line 2118 in pie_view() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2118_2 line 2118 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2118 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2118_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2149_2 (MEDIUM) line 2149 in pie_view() ---
# Source:  $totals{$cat} += $v_num + 0;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2149_2 line 2149 in pie_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2149 in pie_view() to detect the mutant
    fail('BOOL_NEGATE_2149_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_266_2 line 266 in _scan_data_dir() ---
# Source:  return $dir->list->map(sub {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_266_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_862_3 line 862 in view() ---
# Source:  unless (defined $table && $table =~ $TABLE_NAME_RE) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_862_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_868_3 line 868 in view() ---
# Source:  if ($@) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_868_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_951_2 line 951 in browse() ---
# Source:  my $dir      = eval { Mojo::File->new($raw_path)->realpath };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_951_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1072_2 line 1072 in open_file() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1072_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1075_2 line 1075 in open_file() ---
# Source:  my $file = eval { Mojo::File->new($file_path)->realpath };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1075_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1095_3 line 1095 in open_file() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1095_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1195_2 line 1195 in import_url() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1195_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1196_2 line 1196 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1196_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1198_2 line 1198 in import_url() ---
# Source:  unless $url =~ m{\Ahttps?://}i;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1198_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1202_2 line 1202 in import_url() ---
# Source:  my $source = eval { $self->open_table('', url => $url, html_table_index => $idx) };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1202_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1205_2 line 1205 in import_url() ---
# Source:  my $records = eval { $source->fetch_all };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1205_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1298_3 line 1298 in columns_api() ---
# Source:  my $data_dir = $self->app->home->child($self->app->config->{data_dir} // 'data');
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1298_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1311_2 line 1311 in columns_api() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1311_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1376_2 line 1376 in join_tables() ---
# Source:  my ($left_src, $left_label) = $self->_open_spec($left_spec);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1376_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1411_3 line 1411 in join_tables() ---
# Source:  my $records = eval { $src->selectall_arrayref };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1411_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1512_2 line 1512 in combine_tables() ---
# Source:  my $left_spec = $self->param('l') // '';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1512_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1516_3 line 1516 in combine_tables() ---
# Source:  my $left_recs = eval { $left_src->fetch_all };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1516_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1641_2 line 1641 in export_data() ---
# Source:  sub export_data ($self) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1641_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1646_2 line 1646 in export_data() ---
# Source:  (my $safe_name = lc $left_label) =~ s/[^a-z0-9_]+/_/g;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1646_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1726_3 line 1726 in export_write() ---
# Source:  my $filename = $self->param('filename') // '';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1726_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1739_3 line 1739 in export_write() ---
# Source:  if    ($filename && $filename =~ /\.csv\z/i)  { $format = 'csv';    }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1739_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1746_2 line 1746 in export_write() ---
# Source:  );
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1746_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1761_2 line 1761 in export_write() ---
# Source:  else {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1761_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1812_2 line 1812 in export_write() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1812_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1879_3 line 1879 in dirs_api() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1879_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1888_2 line 1888 in stat_api() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1888_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1946_3 line 1946 in stat_api() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1946_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1958_3 line 1958 in upload_file() ---
# Source:  # limit fires (with req->is_limit_exceeded true and partial content in the
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1958_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1968_3 line 1968 in upload_file() ---
# Source:  # /s so .* matches \n; a percent-decoded newline inside a browser filename
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1968_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1993_2 line 1993 in upload_file() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1993_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2039_2 line 2039 in graph_view() ---
# Source:  my $x_col = $self->param('x') // '';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2039_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2043_2 line 2043 in graph_view() ---
# Source:  return $self->render(text => 'Missing x or y column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2043_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2047_2 line 2047 in graph_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2047_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2049_2 line 2049 in graph_view() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2049_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2066_2 line 2066 in graph_view() ---
# Source:  my %extra = map { $_ => $row->{$_} } grep { $_ ne $x_col && $_ ne $y_col } @{$columns};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2066_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2104_2 line 2104 in pie_view() ---
# Source:  my $donut       = $self->param('donut') ? 1 : 0;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2104_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2108_2 line 2108 in pie_view() ---
# Source:  return $self->render(text => 'Missing cat or val column parameter', status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2108_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2112_2 line 2112 in pie_view() ---
# Source:  return $self->render(text => 'Could not open data source', status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2112_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2118_2 line 2118 in pie_view() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2118_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2149_2 line 2149 in pie_view() ---
# Source:  $totals{$cat} += $v_num + 0;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2149_2: add assertion here');

################################################################
# FILE: lib/Database/BI/Model/DataSource.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: COND_INV_471_4 (MEDIUM) line 471 in _detect_file_info() ---
# Source:  # name does not match /\.xls$/i, so .xlsx is silently ignored).  Parse
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_471_4 line 471 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 471 in _detect_file_info() to detect the mutant
    fail('COND_INV_471_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_798_3 (MEDIUM) line 798 in _init_backend() ---
# Source:  unless $pkg->isa('Database::Abstraction');
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_798_3 line 798 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 798 in _init_backend() to detect the mutant
    fail('COND_INV_798_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_845_2 (MEDIUM) line 845 in _init_backend() ---
# Source:  $self->{_id_col}  = $id_col;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_845_2 line 845 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 845 in _init_backend() to detect the mutant
    fail('COND_INV_845_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_851_3 (MEDIUM) line 851 in _init_backend() ---
# Source:  # the DBI path used by XLSX, SQLite, and XML files — after construction
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_851_3 line 851 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 851 in _init_backend() to detect the mutant
    fail('COND_INV_851_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1102_3 (MEDIUM) line 1102 in selectall_arrayref() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1102_3 line 1102 in selectall_arrayref()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1102 in selectall_arrayref() to detect the mutant
    fail('COND_INV_1102_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1133_3 (MEDIUM) line 1133 in fetch_all() ---
# Source:  # underlying driver iterates rows) or a hashref keyed by primary key (when
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1133_3 line 1133 in fetch_all()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1133 in fetch_all() to detect the mutant
    fail('COND_INV_1133_3: replace with real assertion');
}

done_testing();
