#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-09-22 17:17:04
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

# --- SURVIVOR: COND_INV_244_2 (MEDIUM) line 244 in _resolve_language() ---
# Source:  my $lingua = CGI::Lingua->new(supported => \@supported);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_244_2 line 244 in _resolve_language()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 244 in _resolve_language() to detect the mutant
    fail('COND_INV_244_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_267_2 (MEDIUM) line 267 in _resolve_language() ---
# Source:  # basename() only once per entry (the original chain called it twice: once in
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_267_2 line 267 in _resolve_language()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 267 in _resolve_language() to detect the mutant
    fail('BOOL_NEGATE_267_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_866_3 (MEDIUM) line 866 in index() ---
# Source:  =item Boundary values
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_866_3 line 866 in index()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 866 in index() to detect the mutant
    fail('BOOL_NEGATE_866_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_872_3 (MEDIUM) line 872 in index() ---
# Source:  =back
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_872_3 line 872 in index()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 872 in index() to detect the mutant
    fail('BOOL_NEGATE_872_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_955_2 (MEDIUM) line 955 in view() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_955_2 line 955 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 955 in view() to detect the mutant
    fail('BOOL_NEGATE_955_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1076_2 (MEDIUM) line 1076 in browse() ---
# Source:  A file like C<file.php.csv> passes C<EXT_RE> (last segment is C<.csv>)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1076_2 line 1076 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1076 in browse() to detect the mutant
    fail('BOOL_NEGATE_1076_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1079_2 (MEDIUM) line 1079 in browse() ---
# Source:  croak is caught and the action returns 200 with a friendly error, not
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1079_2 line 1079 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1079 in browse() to detect the mutant
    fail('BOOL_NEGATE_1079_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1094_3 (MEDIUM) line 1094 in browse() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1094_3 line 1094 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1094 in browse() to detect the mutant
    fail('COND_INV_1094_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1099_3 (MEDIUM) line 1099 in browse() ---
# Source:  pre  is_file(file) /\ basename(file) =~ EXT_RE
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1099_3 line 1099 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1099 in browse() to detect the mutant
    fail('BOOL_NEGATE_1099_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1199_2 (MEDIUM) line 1199 in open_file() ---
# Source:  back2_url  => _safe_back_url($self->param('back2')),
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1199_2 line 1199 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1199 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1199_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1200_2 (MEDIUM) line 1200 in open_file() ---
# Source:  back2_label => $self->param('back2_label') // 'Back',
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1200_2 line 1200 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1200 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1200_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1202_2 (MEDIUM) line 1202 in open_file() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1202_2 line 1202 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1202 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1202_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1206_2 (MEDIUM) line 1206 in open_file() ---
# Source:  my $dedup = $self->param('d') ? 1 : 0;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1206_2 line 1206 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1206 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1206_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1209_2 (MEDIUM) line 1209 in open_file() ---
# Source:  $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1209_2 line 1209 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1209 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1209_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1302_3 (MEDIUM) line 1302 in import_url() ---
# Source:  my $lspec   = "url:$url";
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1302_3 line 1302 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1302 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1302_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1315_2 (MEDIUM) line 1315 in import_url() ---
# Source:  title            => $label,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1315_2 line 1315 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1315 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1315_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1380_2 (MEDIUM) line 1380 in columns_api() ---
# Source:  if (!defined($table_name) && !defined($path)) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1380_2 line 1380 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1380 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1380_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1418_3 (MEDIUM) line 1418 in columns_api() ---
# Source:  my $recs = ($source->columns ? [] : eval { $source->fetch_all } // []);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1418_3 line 1418 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1418 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1418_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1519_2 (MEDIUM) line 1519 in join_tables() ---
# Source:  template => "$platform/$language/home",
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1519_2 line 1519 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1519 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1519_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1523_3 (MEDIUM) line 1523 in join_tables() ---
# Source:  title    => 'Error',
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1523_3 line 1523 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1523 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1523_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1648_2 (MEDIUM) line 1648 in combine_tables() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1648_2 line 1648 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1648 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1648_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1653_2 (MEDIUM) line 1653 in combine_tables() ---
# Source:  my @columns = @$cols_ref;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1653_2 line 1653 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1653 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1653_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1735_3 (MEDIUM) line 1735 in combine_tables() ---
# Source:  else if format = 'json' then render_json(recs, cols)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1735_3 line 1735 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1735 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1735_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1748_3 (MEDIUM) line 1748 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1748_3 line 1748 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1748 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1748_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1755_2 (MEDIUM) line 1755 in export_data() ---
# Source:  :                       $self->_render_csv($records, $columns, $safe_name);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1755_2 line 1755 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1755 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1755_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1770_2 (MEDIUM) line 1770 in export_data() ---
# Source:  filename=  string   Output filename including extension.  Extension determines
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1770_2 line 1770 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1770 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1770_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1821_2 (MEDIUM) line 1821 in export_data() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1821_2 line 1821 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1821 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1821_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1888_3 (MEDIUM) line 1888 in export_write() ---
# Source:  excluded.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1888_3 line 1888 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1888 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1888_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1897_2 (MEDIUM) line 1897 in export_write() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1897_2 line 1897 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1897 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1897_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1955_3 (MEDIUM) line 1955 in dirs_api() ---
# Source:  400 application/json   { "error": "\"path\" parameter is required" }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1955_3 line 1955 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1955 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_1955_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1967_3 (MEDIUM) line 1967 in dirs_api() ---
# Source:  stat_api == lambda self .
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1967_3 line 1967 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1967 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_1967_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1977_3 (MEDIUM) line 1977 in dirs_api() ---
# Source:  GET /api/stat?path=/data/sales.csv
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1977_3 line 1977 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1977 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_1977_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2002_2 (MEDIUM) line 2002 in stat_api() ---
# Source:  exists => \1,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2002_2 line 2002 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2002 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_2002_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2048_2 (MEDIUM) line 2048 in stat_api() ---
# Source:  -> { "url": "/open?path=%2F...%2Fsales.csv", "path": "/.../.uploads/abc123/sales.csv" }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2048_2 line 2048 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2048 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_2048_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2052_2 (MEDIUM) line 2052 in upload_file() ---
# Source:  sub upload_file ($self) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2052_2 line 2052 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2052 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2052_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2056_2 (MEDIUM) line 2056 in upload_file() ---
# Source:  json   => { error => $self->_i18n('error_upload_none') },
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2056_2 line 2056 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2056 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2056_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2058_2 (MEDIUM) line 2058 in upload_file() ---
# Source:  );
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2058_2 line 2058 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2058 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2058_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2075_2 (MEDIUM) line 2075 in upload_file() ---
# Source:  (my $filename = $upload->filename) =~ s{.*[/\\]}{}s;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2075_2 line 2075 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2075 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_2075_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2113_2 (MEDIUM) line 2113 in clear_uploads() ---
# Source:  my ($file) = @_;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2113_2 line 2113 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2113 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_2113_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2117_2 (MEDIUM) line 2117 in clear_uploads() ---
# Source:  });
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2117_2 line 2117 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2117 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_2117_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2121_2 (MEDIUM) line 2121 in clear_uploads() ---
# Source:  $count++;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2121_2 line 2121 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2121 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_2121_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2127_2 (MEDIUM) line 2127 in clear_uploads() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2127_2 line 2127 in clear_uploads()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2127 in clear_uploads() to detect the mutant
    fail('BOOL_NEGATE_2127_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_2158_2 (MEDIUM) line 2158 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_2158_2 line 2158 in graph_view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 2158 in graph_view() to detect the mutant
    fail('BOOL_NEGATE_2158_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_267_2 line 267 in _resolve_language() ---
# Source:  # basename() only once per entry (the original chain called it twice: once in
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_267_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_866_3 line 866 in index() ---
# Source:  =item Boundary values
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_866_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_872_3 line 872 in index() ---
# Source:  =back
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_872_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_955_2 line 955 in view() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_955_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1076_2 line 1076 in browse() ---
# Source:  A file like C<file.php.csv> passes C<EXT_RE> (last segment is C<.csv>)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1076_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1079_2 line 1079 in browse() ---
# Source:  croak is caught and the action returns 200 with a friendly error, not
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1079_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1099_3 line 1099 in browse() ---
# Source:  pre  is_file(file) /\ basename(file) =~ EXT_RE
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1099_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1199_2 line 1199 in open_file() ---
# Source:  back2_url  => _safe_back_url($self->param('back2')),
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1199_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1200_2 line 1200 in open_file() ---
# Source:  back2_label => $self->param('back2_label') // 'Back',
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1200_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1202_2 line 1202 in open_file() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1202_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1206_2 line 1206 in open_file() ---
# Source:  my $dedup = $self->param('d') ? 1 : 0;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1206_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1209_2 line 1209 in open_file() ---
# Source:  $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1209_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1302_3 line 1302 in import_url() ---
# Source:  my $lspec   = "url:$url";
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1302_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1315_2 line 1315 in import_url() ---
# Source:  title            => $label,
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1315_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1380_2 line 1380 in columns_api() ---
# Source:  if (!defined($table_name) && !defined($path)) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1380_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1418_3 line 1418 in columns_api() ---
# Source:  my $recs = ($source->columns ? [] : eval { $source->fetch_all } // []);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1418_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1519_2 line 1519 in join_tables() ---
# Source:  template => "$platform/$language/home",
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1519_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1523_3 line 1523 in join_tables() ---
# Source:  title    => 'Error',
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1523_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1648_2 line 1648 in combine_tables() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1648_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1653_2 line 1653 in combine_tables() ---
# Source:  my @columns = @$cols_ref;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1653_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1735_3 line 1735 in combine_tables() ---
# Source:  else if format = 'json' then render_json(recs, cols)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1735_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1748_3 line 1748 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1748_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1755_2 line 1755 in export_data() ---
# Source:  :                       $self->_render_csv($records, $columns, $safe_name);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1755_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1770_2 line 1770 in export_data() ---
# Source:  filename=  string   Output filename including extension.  Extension determines
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1770_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1821_2 line 1821 in export_data() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1821_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1888_3 line 1888 in export_write() ---
# Source:  excluded.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1888_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1897_2 line 1897 in export_write() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1897_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1955_3 line 1955 in dirs_api() ---
# Source:  400 application/json   { "error": "\"path\" parameter is required" }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1955_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1967_3 line 1967 in dirs_api() ---
# Source:  stat_api == lambda self .
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1967_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1977_3 line 1977 in dirs_api() ---
# Source:  GET /api/stat?path=/data/sales.csv
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1977_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2002_2 line 2002 in stat_api() ---
# Source:  exists => \1,
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2002_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2048_2 line 2048 in stat_api() ---
# Source:  -> { "url": "/open?path=%2F...%2Fsales.csv", "path": "/.../.uploads/abc123/sales.csv" }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2048_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2052_2 line 2052 in upload_file() ---
# Source:  sub upload_file ($self) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2052_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2056_2 line 2056 in upload_file() ---
# Source:  json   => { error => $self->_i18n('error_upload_none') },
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2056_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2058_2 line 2058 in upload_file() ---
# Source:  );
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2058_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2075_2 line 2075 in upload_file() ---
# Source:  (my $filename = $upload->filename) =~ s{.*[/\\]}{}s;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2075_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2113_2 line 2113 in clear_uploads() ---
# Source:  my ($file) = @_;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2113_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2117_2 line 2117 in clear_uploads() ---
# Source:  });
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2117_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2121_2 line 2121 in clear_uploads() ---
# Source:  $count++;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2121_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2127_2 line 2127 in clear_uploads() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2127_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_2158_2 line 2158 in graph_view() ---
# Source:  return $self->render(text => "Column not found: $y_col", status => 400)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_2158_2: add assertion here');

################################################################
# FILE: lib/Database/BI/Model/DataSource.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: COND_INV_478_4 (MEDIUM) line 478 in _detect_file_info() ---
# Source:  # directly with Spreadsheet::ParseXLSX and return pre-loaded row data so
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_478_4 line 478 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 478 in _detect_file_info() to detect the mutant
    fail('COND_INV_478_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_808_3 (MEDIUM) line 808 in _cache_key() ---
# Source:  : undef;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_808_3 line 808 in _cache_key()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 808 in _cache_key() to detect the mutant
    fail('COND_INV_808_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_863_2 (MEDIUM) line 863 in _init_backend() ---
# Source:  $sftp->get($remote_path, $local_file);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_863_2 line 863 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 863 in _init_backend() to detect the mutant
    fail('COND_INV_863_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_869_3 (MEDIUM) line 869 in _init_backend() ---
# Source:  croak $self->_msg('error_backend_init', $table,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_869_3 line 869 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 869 in _init_backend() to detect the mutant
    fail('COND_INV_869_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1120_3 (MEDIUM) line 1120 in id_column() ---
# Source:  Returns the source URL for URL/HTML-table-backed instances, or C<undef> for
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1120_3 line 1120 in id_column()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1120 in id_column() to detect the mutant
    fail('COND_INV_1120_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1151_3 (MEDIUM) line 1151 in source_url() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1151_3 line 1151 in source_url()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 1151 in source_url() to detect the mutant
    fail('COND_INV_1151_3: replace with real assertion');
}

done_testing();
