#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-08-25 00:06:52
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

# --- SURVIVOR: BOOL_NEGATE_170_2 (MEDIUM) line 170 in _spec_to_url() ---
# Source:  return "/view/$1"                         if $spec =~ /\Atable:([A-Za-z0-9_]+)\z/;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_170_2 line 170 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 170 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_170_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_171_2 (MEDIUM) line 171 in _spec_to_url() ---
# Source:  return '/open?path=' . url_escape($1)     if $spec =~ /\Apath:(.+)\z/;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_171_2 line 171 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 171 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_171_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_172_2 (MEDIUM) line 172 in _spec_to_url() ---
# Source:  return '/import?url=' . url_escape($1)    if $spec =~ /\Aurl:(https?:\/\/.+)\z/i;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_172_2 line 172 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 172 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_172_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_173_2 (MEDIUM) line 173 in _spec_to_url() ---
# Source:  return '/';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_173_2 line 173 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 173 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_173_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_209_2 (MEDIUM) line 209 in _apply_filter_spec() ---
# Source:  return $records unless defined $col && length $col
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_209_2 line 209 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 209 in _apply_filter_spec() to detect the mutant
    fail('BOOL_NEGATE_209_2: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_216_50_== (HIGH) line 216 in _apply_filter_spec() ---
# Source:  $op eq 'contains' ? index(lc($cell), lc($val)) != -1 :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip != to ==
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_216_50_== line 216 in _apply_filter_spec()';
    # Suggested boundary values to test: -2, -1, 0
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 216 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_216_50_==: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_217_50_!= (HIGH) line 217 in _apply_filter_spec() ---
# Source:  $op eq 'starts'   ? index(lc($cell), lc($val)) == 0  :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_217_50_!= line 217 in _apply_filter_spec()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 217 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_217_50_!=: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_218_29_> (HIGH) line 218 in _apply_filter_spec() ---
# Source:  $op eq 'lt'       ? $cell <  $val                    :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_218_29_> line 218 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 218 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_218_29_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_219_29_< (HIGH) line 219 in _apply_filter_spec() ---
# Source:  $op eq 'le'       ? $cell <= $val                    :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip <= to <
#   Numeric boundary flip <= to >
#   Numeric boundary flip <= to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_219_29_< line 219 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 219 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_219_29_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_220_29_< (HIGH) line 220 in _apply_filter_spec() ---
# Source:  $op eq 'gt'       ? $cell >  $val                    :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_220_29_< line 220 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 220 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_220_29_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_221_29_> (HIGH) line 221 in _apply_filter_spec() ---
# Source:  $op eq 'ge'       ? $cell >= $val                    :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_221_29_> line 221 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 221 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_221_29_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_326_2 (MEDIUM) line 326 in _build_export_url() ---
# Source:  return $u;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_326_2 line 326 in _build_export_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 326 in _build_export_url() to detect the mutant
    fail('BOOL_NEGATE_326_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_385_2 (MEDIUM) line 385 in _write_sqlite_db() ---
# Source:  if (@$records) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_385_2 line 385 in _write_sqlite_db()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 385 in _write_sqlite_db() to detect the mutant
    fail('COND_INV_385_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_396_2 (MEDIUM) line 396 in _write_sqlite_db() ---
# Source:  return $data;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_396_2 line 396 in _write_sqlite_db()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 396 in _write_sqlite_db() to detect the mutant
    fail('BOOL_NEGATE_396_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_569_3 (MEDIUM) line 569 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_569_3 line 569 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 569 in view() to detect the mutant
    fail('BOOL_NEGATE_569_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_575_3 (MEDIUM) line 575 in view() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_575_3 line 575 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 575 in view() to detect the mutant
    fail('BOOL_NEGATE_575_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_652_2 (MEDIUM) line 652 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_652_2 line 652 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 652 in browse() to detect the mutant
    fail('BOOL_NEGATE_652_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_740_2 (MEDIUM) line 740 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_740_2 line 740 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 740 in open_file() to detect the mutant
    fail('BOOL_NEGATE_740_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_743_2 (MEDIUM) line 743 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_743_2 line 743 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 743 in open_file() to detect the mutant
    fail('BOOL_NEGATE_743_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_756_3 (MEDIUM) line 756 in open_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_756_3 line 756 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 756 in open_file() to detect the mutant
    fail('BOOL_NEGATE_756_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_847_2 (MEDIUM) line 847 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_847_2 line 847 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 847 in import_url() to detect the mutant
    fail('BOOL_NEGATE_847_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_848_2 (MEDIUM) line 848 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_848_2 line 848 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 848 in import_url() to detect the mutant
    fail('BOOL_NEGATE_848_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_852_2 (MEDIUM) line 852 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_852_2 line 852 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 852 in import_url() to detect the mutant
    fail('BOOL_NEGATE_852_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_855_2 (MEDIUM) line 855 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_855_2 line 855 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 855 in import_url() to detect the mutant
    fail('BOOL_NEGATE_855_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_929_3 (MEDIUM) line 929 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_929_3 line 929 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 929 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_929_3: replace with real assertion');
}

# --- SURVIVOR: COND_INV_935_3 (MEDIUM) line 935 in columns_api() ---
# Source:  if (defined $file && -f $file && $file->basename =~ $EXT_RE) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_935_3 line 935 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 935 in columns_api() to detect the mutant
    fail('COND_INV_935_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_942_2 (MEDIUM) line 942 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404) unless $source;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_942_2 line 942 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 942 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_942_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1007_2 (MEDIUM) line 1007 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1007_2 line 1007 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1007 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1007_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1011_3 (MEDIUM) line 1011 in join_tables() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1011_3 line 1011 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1011 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1011_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1114_2 (MEDIUM) line 1114 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1114_2 line 1114 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1114 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1114_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1120_2 (MEDIUM) line 1120 in export_data() ---
# Source:  return $format eq 'sqlite'
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1120_2 line 1120 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1120 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1120_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1177_3 (MEDIUM) line 1177 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1177_3 line 1177 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1177 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1177_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1189_3 (MEDIUM) line 1189 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1189_3 line 1189 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1189 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1189_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1196_2 (MEDIUM) line 1196 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1196_2 line 1196 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1196 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1196_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1201_3 (MEDIUM) line 1201 in export_write() ---
# Source:  if ($format eq 'csv') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1201_3 line 1201 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1201 in export_write() to detect the mutant
    fail('COND_INV_1201_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1212_2 (MEDIUM) line 1212 in export_write() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1212_2 line 1212 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1212 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1212_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1263_2 (MEDIUM) line 1263 in dirs_api() ---
# Source:  return $self->render(json => { error => 'Not a directory' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1263_2 line 1263 in dirs_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1263 in dirs_api() to detect the mutant
    fail('BOOL_NEGATE_1263_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1330_3 (MEDIUM) line 1330 in stat_api() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1330_3 line 1330 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1330 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_1330_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1337_2 (MEDIUM) line 1337 in stat_api() ---
# Source:  return $self->render(json => { exists => \0, path => $path })
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1337_2 line 1337 in stat_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1337 in stat_api() to detect the mutant
    fail('BOOL_NEGATE_1337_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1395_3 (MEDIUM) line 1395 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1395_3 line 1395 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1395 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_1395_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1403_3 (MEDIUM) line 1403 in upload_file() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1403_3 line 1403 in upload_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1403 in upload_file() to detect the mutant
    fail('BOOL_NEGATE_1403_3: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_170_2 line 170 in _spec_to_url() ---
# Source:  return "/view/$1"                         if $spec =~ /\Atable:([A-Za-z0-9_]+)\z/;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_170_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_171_2 line 171 in _spec_to_url() ---
# Source:  return '/open?path=' . url_escape($1)     if $spec =~ /\Apath:(.+)\z/;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_171_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_172_2 line 172 in _spec_to_url() ---
# Source:  return '/import?url=' . url_escape($1)    if $spec =~ /\Aurl:(https?:\/\/.+)\z/i;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_172_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_173_2 line 173 in _spec_to_url() ---
# Source:  return '/';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_173_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_209_2 line 209 in _apply_filter_spec() ---
# Source:  return $records unless defined $col && length $col
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_209_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_326_2 line 326 in _build_export_url() ---
# Source:  return $u;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_326_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_396_2 line 396 in _write_sqlite_db() ---
# Source:  return $data;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_396_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_569_3 line 569 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_569_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_575_3 line 575 in view() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_575_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_652_2 line 652 in browse() ---
# Source:  return $self->reply->not_found unless defined $dir && -d $dir;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_652_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_740_2 line 740 in open_file() ---
# Source:  return $self->reply->not_found unless defined $file_path;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_740_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_743_2 line 743 in open_file() ---
# Source:  return $self->reply->not_found
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_743_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_756_3 line 756 in open_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_756_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_847_2 line 847 in import_url() ---
# Source:  return $err_home->('error_url_required') unless length $url;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_847_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_848_2 line 848 in import_url() ---
# Source:  return $err_home->('error_url_invalid', $url)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_848_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_852_2 line 852 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'unknown error') if $@ || !$source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_852_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_855_2 line 855 in import_url() ---
# Source:  return $err_home->('error_url_fetch', $url, $@ // 'empty result') if $@;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_855_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_929_3 line 929 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_929_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_942_2 line 942 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404) unless $source;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_942_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1007_2 line 1007 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1007_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1011_3 line 1011 in join_tables() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1011_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1114_2 line 1114 in export_data() ---
# Source:  return $self->reply->not_found unless $records;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1114_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1120_2 line 1120 in export_data() ---
# Source:  return $format eq 'sqlite'
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1120_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1177_3 line 1177 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1177_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1189_3 line 1189 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1189_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1196_2 line 1196 in export_write() ---
# Source:  return $self->render(json => { error => 'Table not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1196_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1212_2 line 1212 in export_write() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1212_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1263_2 line 1263 in dirs_api() ---
# Source:  return $self->render(json => { error => 'Not a directory' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1263_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1330_3 line 1330 in stat_api() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1330_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1337_2 line 1337 in stat_api() ---
# Source:  return $self->render(json => { exists => \0, path => $path })
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1337_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1395_3 line 1395 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1395_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1403_3 line 1403 in upload_file() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1403_3: add assertion here');

################################################################
# FILE: lib/Database/BI/Model/DataSource.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: COND_INV_60_2 (MEDIUM) line 60 in _url_label() ---
# Source:  unless (length $last && $last =~ /\A[A-Za-z_]/) {
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
# Source:  return lc($last || 'html_table');
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
# Source:  return @args ? sprintf($tmpl, @args) : $tmpl;
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
# Source:  if (my $i18n = $self->{_i18n}) {
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
# Source:  return $i18n->maketext($key, @args);
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
# Source:  return _fmt($key, @args);
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
# Source:  $sep = (@probe == 1 && $line =~ /!/) ? '!' : ',';
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_281_19_!= line 281 in _detect_file_info()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 281 in _detect_file_info() to detect the mutant
    fail('NUM_BOUNDARY_281_19_!=: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_377_2 (MEDIUM) line 377 in table_name() ---
# Source:  return $self->{_table};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_377_2 line 377 in table_name()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 377 in table_name() to detect the mutant
    fail('BOOL_NEGATE_377_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_401_2 (MEDIUM) line 401 in id_column() ---
# Source:  return $self->{_id_col};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_401_2 line 401 in id_column()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 401 in id_column() to detect the mutant
    fail('BOOL_NEGATE_401_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_413_2 (MEDIUM) line 413 in source_url() ---
# Source:  return $self->{_url};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_413_2 line 413 in source_url()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 413 in source_url() to detect the mutant
    fail('BOOL_NEGATE_413_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_478_2 (MEDIUM) line 478 in fetch_all() ---
# Source:  if (!@{$data}) {
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
# Source:  return lc($last || 'html_table');
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_65_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_77_2 line 77 in _fmt() ---
# Source:  return @args ? sprintf($tmpl, @args) : $tmpl;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_77_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_88_3 line 88 in _msg() ---
# Source:  return $i18n->maketext($key, @args);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_88_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_90_2 line 90 in _msg() ---
# Source:  return _fmt($key, @args);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_90_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_377_2 line 377 in table_name() ---
# Source:  return $self->{_table};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_377_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_401_2 line 401 in id_column() ---
# Source:  return $self->{_id_col};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_401_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_413_2 line 413 in source_url() ---
# Source:  return $self->{_url};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_413_2: add assertion here');

done_testing();
