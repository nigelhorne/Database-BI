#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-08-25 14:42:53
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

# --- SURVIVOR: BOOL_NEGATE_108_2 (MEDIUM) line 108 in _is_safe_url() ---
# Source:  return 0 unless $url =~ m{\Ahttps?://([^/:?\[\]#]+)}i;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_108_2 line 108 in _is_safe_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 108 in _is_safe_url() to detect the mutant
    fail('BOOL_NEGATE_108_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_125_32_!= (HIGH) line 125 in _is_safe_url() ---
# Source:  return 0 if ($n & 0xFF000000) == 0x0A000000;	# 10/8
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_125_32_!= line 125 in _is_safe_url()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 125 in _is_safe_url() to detect the mutant
    fail('NUM_BOUNDARY_125_32_!=: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_126_32_!= (HIGH) line 126 in _is_safe_url() ---
# Source:  return 0 if ($n & 0xFFF00000) == 0xAC100000;	# 172.16/12
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_126_32_!= line 126 in _is_safe_url()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 126 in _is_safe_url() to detect the mutant
    fail('NUM_BOUNDARY_126_32_!=: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_127_32_!= (HIGH) line 127 in _is_safe_url() ---
# Source:  return 0 if ($n & 0xFFFF0000) == 0xC0A80000;	# 192.168/16
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_127_32_!= line 127 in _is_safe_url()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 127 in _is_safe_url() to detect the mutant
    fail('NUM_BOUNDARY_127_32_!=: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_129_32_!= (HIGH) line 129 in _is_safe_url() ---
# Source:  return 0 if ($n & 0xFFC00000) == 0x64400000;	# 100.64/10 (CGNAT)
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (2 variants — one test should kill all):
#   Numeric boundary flip == to !=
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_129_32_!= line 129 in _is_safe_url()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 129 in _is_safe_url() to detect the mutant
    fail('NUM_BOUNDARY_129_32_!=: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_130_2 (MEDIUM) line 130 in _is_safe_url() ---
# Source:  return 1;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_130_2 line 130 in _is_safe_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 130 in _is_safe_url() to detect the mutant
    fail('BOOL_NEGATE_130_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_193_2 (MEDIUM) line 193 in _scan_data_dir() ---
# Source:  return $dir->list->map(sub {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_193_2 line 193 in _scan_data_dir()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 193 in _scan_data_dir() to detect the mutant
    fail('BOOL_NEGATE_193_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_244_2 (MEDIUM) line 244 in _spec_to_url() ---
# Source:  return "/view/$1"                         if $spec =~ /\Atable:([A-Za-z0-9_]+)\z/;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_244_2 line 244 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 244 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_244_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_245_2 (MEDIUM) line 245 in _spec_to_url() ---
# Source:  return '/open?path=' . url_escape($1)     if $spec =~ /\Apath:(.+)\z/;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_245_2 line 245 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 245 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_245_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_246_2 (MEDIUM) line 246 in _spec_to_url() ---
# Source:  return '/import?url=' . url_escape($1)    if $spec =~ $URL_SPEC_RE;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_246_2 line 246 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 246 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_246_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_247_2 (MEDIUM) line 247 in _spec_to_url() ---
# Source:  return '/';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_247_2 line 247 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 247 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_247_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_296_2 (MEDIUM) line 296 in _apply_filter_spec() ---
# Source:  return $records unless length($col // '') && defined $op && length $op;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_296_2 line 296 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 296 in _apply_filter_spec() to detect the mutant
    fail('BOOL_NEGATE_296_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_307_29_< (HIGH) line 307 in _apply_filter_spec() ---
# Source:  $op eq 'gt'       ? $cell >  $val                     :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_307_29_< line 307 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 307 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_307_29_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_308_29_> (HIGH) line 308 in _apply_filter_spec() ---
# Source:  $op eq 'ge'       ? $cell >= $val                     :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_308_29_> line 308 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 308 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_308_29_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_419_2 (MEDIUM) line 419 in _build_export_url() ---
# Source:  return $u;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_419_2 line 419 in _build_export_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 419 in _build_export_url() to detect the mutant
    fail('BOOL_NEGATE_419_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_479_2 (MEDIUM) line 479 in _write_sqlite_db() ---
# Source:  if (@$records) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_479_2 line 479 in _write_sqlite_db()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 479 in _write_sqlite_db() to detect the mutant
    fail('COND_INV_479_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_490_2 (MEDIUM) line 490 in _write_sqlite_db() ---
# Source:  return $data;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_490_2 line 490 in _write_sqlite_db()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 490 in _write_sqlite_db() to detect the mutant
    fail('BOOL_NEGATE_490_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_686_3 (MEDIUM) line 686 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_686_3 line 686 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 686 in view() to detect the mutant
    fail('BOOL_NEGATE_686_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_692_3 (MEDIUM) line 692 in view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_692_3 line 692 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 692 in view() to detect the mutant
    fail('BOOL_NEGATE_692_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_769_2 (MEDIUM) line 769 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_769_2 line 769 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 769 in browse() to detect the mutant
    fail('BOOL_NEGATE_769_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_857_2 (MEDIUM) line 857 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_857_2 line 857 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 857 in open_file() to detect the mutant
    fail('BOOL_NEGATE_857_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_860_2 (MEDIUM) line 860 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_860_2 line 860 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 860 in open_file() to detect the mutant
    fail('BOOL_NEGATE_860_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_873_3 (MEDIUM) line 873 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_873_3 line 873 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 873 in open_file() to detect the mutant
    fail('BOOL_NEGATE_873_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_964_2 (MEDIUM) line 964 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_964_2 line 964 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 964 in import_url() to detect the mutant
    fail('BOOL_NEGATE_964_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_965_2 (MEDIUM) line 965 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_965_2 line 965 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 965 in import_url() to detect the mutant
    fail('BOOL_NEGATE_965_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_967_2 (MEDIUM) line 967 in import_url() ---
# Source:  return $err_home->('error_url_ssrf', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_967_2 line 967 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 967 in import_url() to detect the mutant
    fail('BOOL_NEGATE_967_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_971_2 (MEDIUM) line 971 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_971_2 line 971 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 971 in import_url() to detect the mutant
    fail('BOOL_NEGATE_971_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_974_2 (MEDIUM) line 974 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_974_2 line 974 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 974 in import_url() to detect the mutant
    fail('BOOL_NEGATE_974_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1048_3 (MEDIUM) line 1048 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1048_3 line 1048 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1048 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1048_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1061_2 (MEDIUM) line 1061 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404) unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1061_2 line 1061 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1061 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1061_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1126_2 (MEDIUM) line 1126 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1126_2 line 1126 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1126 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1126_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1130_3 (MEDIUM) line 1130 in join_tables() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1130_3 line 1130 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1130 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1130_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1237_2 (MEDIUM) line 1237 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1237_2 line 1237 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1237 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1237_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1243_2 (MEDIUM) line 1243 in export_data() ---
# Source:  return $format eq 'sqlite'
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1243_2 line 1243 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1243 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1243_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1300_3 (MEDIUM) line 1300 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1300_3 line 1300 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1300 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1300_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1312_3 (MEDIUM) line 1312 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1312_3 line 1312 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1312 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1312_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1319_2 (MEDIUM) line 1319 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1319_2 line 1319 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1319 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1319_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1324_3 (MEDIUM) line 1324 in export_write() ---
# Source:  if ($format eq 'csv') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1324_3 line 1324 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1324 in export_write() to detect the mutant
    fail('COND_INV_1324_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1331_2 (MEDIUM) line 1331 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1331_2 line 1331 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1331 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1331_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1382_2 (MEDIUM) line 1382 in dirs_api() ---
# Source:  return $self->render(json => { error => 'Not a directory' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1382_2 line 1382 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1382 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_1382_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1449_3 (MEDIUM) line 1449 in stat_api() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1449_3 line 1449 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1449 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_1449_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1458_2 (MEDIUM) line 1458 in stat_api() ---
# Source:  return $self->render(json => { exists => \0, path => $path })
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1458_2 line 1458 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1458 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_1458_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1516_3 (MEDIUM) line 1516 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1516_3 line 1516 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1516 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_1516_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1528_3 (MEDIUM) line 1528 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1528_3 line 1528 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1528 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_1528_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1538_3 (MEDIUM) line 1538 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1538_3 line 1538 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1538 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_1538_3: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_108_2 line 108 in _is_safe_url() ---
# Source:  return 0 unless $url =~ m{\Ahttps?://([^/:?\[\]#]+)}i;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_108_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_125_2 line 125 in _is_safe_url() ---
# Source:  return 0 if ($n & 0xFF000000) == 0x0A000000;	# 10/8
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_125_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_126_2 line 126 in _is_safe_url() ---
# Source:  return 0 if ($n & 0xFFF00000) == 0xAC100000;	# 172.16/12
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_126_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_127_2 line 127 in _is_safe_url() ---
# Source:  return 0 if ($n & 0xFFFF0000) == 0xC0A80000;	# 192.168/16
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_127_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_129_2 line 129 in _is_safe_url() ---
# Source:  return 0 if ($n & 0xFFC00000) == 0x64400000;	# 100.64/10 (CGNAT)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_129_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_130_2 line 130 in _is_safe_url() ---
# Source:  return 1;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_130_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_193_2 line 193 in _scan_data_dir() ---
# Source:  return $dir->list->map(sub {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_193_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_244_2 line 244 in _spec_to_url() ---
# Source:  return "/view/$1"                         if $spec =~ /\Atable:([A-Za-z0-9_]+)\z/;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_244_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_245_2 line 245 in _spec_to_url() ---
# Source:  return '/open?path=' . url_escape($1)     if $spec =~ /\Apath:(.+)\z/;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_245_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_246_2 line 246 in _spec_to_url() ---
# Source:  return '/import?url=' . url_escape($1)    if $spec =~ $URL_SPEC_RE;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_246_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_247_2 line 247 in _spec_to_url() ---
# Source:  return '/';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_247_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_296_2 line 296 in _apply_filter_spec() ---
# Source:  return $records unless length($col // '') && defined $op && length $op;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_296_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_419_2 line 419 in _build_export_url() ---
# Source:  return $u;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_419_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_490_2 line 490 in _write_sqlite_db() ---
# Source:  return $data;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_490_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_686_3 line 686 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_686_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_692_3 line 692 in view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_692_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_769_2 line 769 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_769_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_857_2 line 857 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_857_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_860_2 line 860 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_860_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_873_3 line 873 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_873_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_964_2 line 964 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_964_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_965_2 line 965 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_965_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_967_2 line 967 in import_url() ---
# Source:  return $err_home->('error_url_ssrf', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_967_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_971_2 line 971 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_971_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_974_2 line 974 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_974_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1048_3 line 1048 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1048_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1061_2 line 1061 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404) unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1061_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1126_2 line 1126 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1126_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1130_3 line 1130 in join_tables() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1130_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1237_2 line 1237 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1237_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1243_2 line 1243 in export_data() ---
# Source:  return $format eq 'sqlite'
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1243_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1300_3 line 1300 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1300_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1312_3 line 1312 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1312_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1319_2 line 1319 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1319_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1331_2 line 1331 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1331_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1382_2 line 1382 in dirs_api() ---
# Source:  return $self->render(json => { error => 'Not a directory' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1382_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1449_3 line 1449 in stat_api() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1449_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1458_2 line 1458 in stat_api() ---
# Source:  return $self->render(json => { exists => \0, path => $path })
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1458_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1516_3 line 1516 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1516_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1528_3 line 1528 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1528_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1538_3 line 1538 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1538_3: add assertion here');

################################################################
# FILE: lib/Database/BI/Model/DataSource.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: COND_INV_60_2 (MEDIUM) line 60 in _url_label() ---
# Source:  $last =~ s/[^A-Za-z0-9_]/_/g;	# sanitize
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition unless to if
TODO: {
    local $TODO = 'Complete: COND_INV_60_2 line 60 in _url_label()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 60 in _url_label() to detect the mutant
    fail('COND_INV_60_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_65_2 (MEDIUM) line 65 in _url_label() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_65_2 line 65 in _url_label()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 65 in _url_label() to detect the mutant
    fail('BOOL_NEGATE_65_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_77_2 (MEDIUM) line 77 in _fmt() ---
# Source:  my $tmpl = $MESSAGES{$key} // "Internal error: unknown message key '$key'";
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_77_2 line 77 in _fmt()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 77 in _fmt() to detect the mutant
    fail('BOOL_NEGATE_77_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_87_2 (MEDIUM) line 87 in _msg() ---
# Source:  my ($self, $key, @args) = @_;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_87_2 line 87 in _msg()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 87 in _msg() to detect the mutant
    fail('COND_INV_87_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_88_3 (MEDIUM) line 88 in _msg() ---
# Source:  if (my $i18n = $self->{_i18n}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_88_3 line 88 in _msg()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 88 in _msg() to detect the mutant
    fail('BOOL_NEGATE_88_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_90_2 (MEDIUM) line 90 in _msg() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_90_2 line 90 in _msg()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 90 in _msg() to detect the mutant
    fail('BOOL_NEGATE_90_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_281_19_!= (HIGH) line 281 in _detect_file_info() ---
# Source:  # Sniff the separator: Database::Abstraction uses '!' natively and
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_281_19_!= line 281 in _detect_file_info()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 281 in _detect_file_info() to detect the mutant
    fail('NUM_BOUNDARY_281_19_!=: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_377_2 (MEDIUM) line 377 in _init_backend() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_377_2 line 377 in _init_backend()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 377 in _init_backend() to detect the mutant
    fail('BOOL_NEGATE_377_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_401_2 (MEDIUM) line 401 in columns() ---
# Source:  Returns the name of the column used as the primary key / slurp-filter anchor.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_401_2 line 401 in columns()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 401 in columns() to detect the mutant
    fail('BOOL_NEGATE_401_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_413_2 (MEDIUM) line 413 in id_column() ---
# Source:  Returns the source URL for URL/HTML-table-backed instances, or C<undef> for
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_413_2 line 413 in id_column()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 413 in id_column() to detect the mutant
    fail('BOOL_NEGATE_413_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_478_2 (MEDIUM) line 478 in fetch_all() ---
# Source:  # it mirrors DBI's selectall_hashref semantics). We normalise to arrayref
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_478_2 line 478 in fetch_all()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 478 in fetch_all() to detect the mutant
    fail('COND_INV_478_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_65_2 line 65 in _url_label() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_65_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_77_2 line 77 in _fmt() ---
# Source:  my $tmpl = $MESSAGES{$key} // "Internal error: unknown message key '$key'";
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_77_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_88_3 line 88 in _msg() ---
# Source:  if (my $i18n = $self->{_i18n}) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_88_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_90_2 line 90 in _msg() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_90_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_377_2 line 377 in _init_backend() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_377_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_401_2 line 401 in columns() ---
# Source:  Returns the name of the column used as the primary key / slurp-filter anchor.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_401_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_413_2 line 413 in id_column() ---
# Source:  Returns the source URL for URL/HTML-table-backed instances, or C<undef> for
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_413_2: add assertion here');

done_testing();
