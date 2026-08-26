#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-08-26 00:19:29
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

# --- SURVIVOR: BOOL_NEGATE_196_2 (MEDIUM) line 196 in _scan_data_dir() ---
# Source:  my $dir = $self->app->home->child($self->app->config->{data_dir} // 'data');
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_196_2 line 196 in _scan_data_dir()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 196 in _scan_data_dir() to detect the mutant
    fail('BOOL_NEGATE_196_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_437_2 (MEDIUM) line 437 in _build_export_url() ---
# Source:  $u .= '&j=' . url_escape($_) for @$join_specs;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_437_2 line 437 in _build_export_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 437 in _build_export_url() to detect the mutant
    fail('BOOL_NEGATE_437_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_506_3 (MEDIUM) line 506 in _write_sqlite_db() ---
# Source:  my @quoted = map { (my $c = $_) =~ s/"/""/g; qq{"$c"} } @$columns;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_506_3 line 506 in _write_sqlite_db()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 506 in _write_sqlite_db() to detect the mutant
    fail('COND_INV_506_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_748_3 (MEDIUM) line 748 in view() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_748_3 line 748 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 748 in view() to detect the mutant
    fail('BOOL_NEGATE_748_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_754_3 (MEDIUM) line 754 in view() ---
# Source:  eval { $source = $self->open_table($table); $records = $source->fetch_all };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_754_3 line 754 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 754 in view() to detect the mutant
    fail('BOOL_NEGATE_754_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_831_2 (MEDIUM) line 831 in browse() ---
# Source:  my $raw_path = $self->param('path') // $ENV{HOME} // '/';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_831_2 line 831 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 831 in browse() to detect the mutant
    fail('BOOL_NEGATE_831_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_952_2 (MEDIUM) line 952 in open_file() ---
# Source:  my $file_path = $self->param('path');
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_952_2 line 952 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 952 in open_file() to detect the mutant
    fail('BOOL_NEGATE_952_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_955_2 (MEDIUM) line 955 in open_file() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_955_2 line 955 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 955 in open_file() to detect the mutant
    fail('BOOL_NEGATE_955_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_968_3 (MEDIUM) line 968 in open_file() ---
# Source:  eval { $source = $self->open_table($table, directory => $dir->to_string); $records = $source->fetch_all };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_968_3 line 968 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 968 in open_file() to detect the mutant
    fail('BOOL_NEGATE_968_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1059_2 (MEDIUM) line 1059 in import_url() ---
# Source:  };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1059_2 line 1059 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1059 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1059_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1060_2 (MEDIUM) line 1060 in import_url() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1060_2 line 1060 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1060 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1060_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1062_2 (MEDIUM) line 1062 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1062_2 line 1062 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1062 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1062_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1066_2 (MEDIUM) line 1066 in import_url() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1066_2 line 1066 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1066 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1066_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1069_2 (MEDIUM) line 1069 in import_url() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1069_2 line 1069 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1069 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1069_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1143_3 (MEDIUM) line 1143 in columns_api() ---
# Source:  if (defined $table_name && $table_name =~ $TABLE_NAME_RE) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1143_3 line 1143 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1143 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1143_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1156_2 (MEDIUM) line 1156 in columns_api() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1156_2 line 1156 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1156 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1156_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1221_2 (MEDIUM) line 1221 in join_tables() ---
# Source:  my $left_spec = $self->param('l') // '';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1221_2 line 1221 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1221 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1221_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1225_3 (MEDIUM) line 1225 in join_tables() ---
# Source:  my $left_recs = eval { $left_src->fetch_all };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1225_3 line 1225 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1225 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1225_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1351_2 (MEDIUM) line 1351 in export_data() ---
# Source:  sub export_data ($self) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1351_2 line 1351 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1351 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1351_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1357_2 (MEDIUM) line 1357 in export_data() ---
# Source:  (my $safe_name = lc $left_label) =~ s/[^a-z0-9_]+/_/g;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1357_2 line 1357 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1357 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1357_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1437_3 (MEDIUM) line 1437 in export_write() ---
# Source:  my $dest_dir = eval { Mojo::File->new($dir)->realpath };
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1437_3 line 1437 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1437 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1437_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1449_3 (MEDIUM) line 1449 in export_write() ---
# Source:  elsif ($filename && $filename =~ /\.sql\z/i) { $format = 'sqlite'; }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1449_3 line 1449 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1449 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1449_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1456_2 (MEDIUM) line 1456 in export_write() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1456_2 line 1456 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1456 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1456_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1461_3 (MEDIUM) line 1461 in export_write() ---
# Source:  my $dest = $dest_dir->child($filename);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1461_3 line 1461 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1461 in export_write() to detect the mutant
    fail('COND_INV_1461_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1468_2 (MEDIUM) line 1468 in export_write() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1468_2 line 1468 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1468 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1468_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1519_2 (MEDIUM) line 1519 in dirs_api() ---
# Source:  my $raw = $self->param('path') // $ENV{HOME} // '/';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1519_2 line 1519 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1519 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_1519_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1586_3 (MEDIUM) line 1586 in stat_api() ---
# Source:  my $path = $self->param('path');
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1586_3 line 1586 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1586 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_1586_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1595_2 (MEDIUM) line 1595 in stat_api() ---
# Source:  # Restrict to files with a supported data extension so stat_api cannot be
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1595_2 line 1595 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1595 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_1595_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1653_3 (MEDIUM) line 1653 in upload_file() ---
# Source:  my $upload = $self->req->upload('file');
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1653_3 line 1653 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1653 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_1653_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1665_3 (MEDIUM) line 1665 in upload_file() ---
# Source:  # size check as a belt-and-braces guard for any bytes that slipped through.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1665_3 line 1665 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1665 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_1665_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1675_3 (MEDIUM) line 1675 in upload_file() ---
# Source:  (my $filename = $upload->filename) =~ s{.*[/\\]}{}s;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1675_3 line 1675 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1675 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_1675_3: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_196_2 line 196 in _scan_data_dir() ---
# Source:  my $dir = $self->app->home->child($self->app->config->{data_dir} // 'data');
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_196_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_437_2 line 437 in _build_export_url() ---
# Source:  $u .= '&j=' . url_escape($_) for @$join_specs;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_437_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_748_3 line 748 in view() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_748_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_754_3 line 754 in view() ---
# Source:  eval { $source = $self->open_table($table); $records = $source->fetch_all };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_754_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_831_2 line 831 in browse() ---
# Source:  my $raw_path = $self->param('path') // $ENV{HOME} // '/';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_831_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_952_2 line 952 in open_file() ---
# Source:  my $file_path = $self->param('path');
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_952_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_955_2 line 955 in open_file() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_955_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_968_3 line 968 in open_file() ---
# Source:  eval { $source = $self->open_table($table, directory => $dir->to_string); $records = $source->fetch_all };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_968_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1059_2 line 1059 in import_url() ---
# Source:  };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1059_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1060_2 line 1060 in import_url() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1060_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1062_2 line 1062 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1062_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1066_2 line 1066 in import_url() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1066_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1069_2 line 1069 in import_url() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1069_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1143_3 line 1143 in columns_api() ---
# Source:  if (defined $table_name && $table_name =~ $TABLE_NAME_RE) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1143_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1156_2 line 1156 in columns_api() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1156_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1221_2 line 1221 in join_tables() ---
# Source:  my $left_spec = $self->param('l') // '';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1221_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1225_3 line 1225 in join_tables() ---
# Source:  my $left_recs = eval { $left_src->fetch_all };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1225_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1351_2 line 1351 in export_data() ---
# Source:  sub export_data ($self) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1351_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1357_2 line 1357 in export_data() ---
# Source:  (my $safe_name = lc $left_label) =~ s/[^a-z0-9_]+/_/g;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1357_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1437_3 line 1437 in export_write() ---
# Source:  my $dest_dir = eval { Mojo::File->new($dir)->realpath };
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1437_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1449_3 line 1449 in export_write() ---
# Source:  elsif ($filename && $filename =~ /\.sql\z/i) { $format = 'sqlite'; }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1449_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1456_2 line 1456 in export_write() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1456_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1468_2 line 1468 in export_write() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1468_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1519_2 line 1519 in dirs_api() ---
# Source:  my $raw = $self->param('path') // $ENV{HOME} // '/';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1519_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1586_3 line 1586 in stat_api() ---
# Source:  my $path = $self->param('path');
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1586_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1595_2 line 1595 in stat_api() ---
# Source:  # Restrict to files with a supported data extension so stat_api cannot be
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1595_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1653_3 line 1653 in upload_file() ---
# Source:  my $upload = $self->req->upload('file');
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1653_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1665_3 line 1665 in upload_file() ---
# Source:  # size check as a belt-and-braces guard for any bytes that slipped through.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1665_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1675_3 line 1675 in upload_file() ---
# Source:  (my $filename = $upload->filename) =~ s{.*[/\\]}{}s;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1675_3: add assertion here');

done_testing();
