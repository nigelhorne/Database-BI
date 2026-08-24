#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-08-24 19:26:18
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

# --- SURVIVOR: COND_INV_47_9 (MEDIUM) line 47 in _open_spec() ---
# Source:  if (defined $file && -f $file && $file->basename =~ $EXT_RE) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_47_9 line 47 in _open_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 47 in _open_spec() to detect the mutant
    fail('COND_INV_47_9: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_59_5 (MEDIUM) line 59 in _spec_to_url() ---
# Source:  return "/view/$1"                               if $spec =~ /\Atable:([A-Za-z0-9_]+)\z/;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_59_5 line 59 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 59 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_59_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_60_5 (MEDIUM) line 60 in _spec_to_url() ---
# Source:  return '/open?path=' . url_escape($1)           if $spec =~ /\Apath:(.+)\z/;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_60_5 line 60 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 60 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_60_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_61_5 (MEDIUM) line 61 in _spec_to_url() ---
# Source:  return '/';
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_61_5 line 61 in _spec_to_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 61 in _spec_to_url() to detect the mutant
    fail('BOOL_NEGATE_61_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_68_5 (MEDIUM) line 68 in _get_columns() ---
# Source:  if ($source->columns) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_68_5 line 68 in _get_columns()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 68 in _get_columns() to detect the mutant
    fail('COND_INV_68_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_85_5 (MEDIUM) line 85 in _apply_filter_spec() ---
# Source:  return $records unless defined $col && length $col
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_85_5 line 85 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 85 in _apply_filter_spec() to detect the mutant
    fail('BOOL_NEGATE_85_5: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_92_56_== (HIGH) line 92 in _apply_filter_spec() ---
# Source:  $op eq 'contains' ? index(lc($cell), lc($val)) != -1 :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip != to ==
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_92_56_== line 92 in _apply_filter_spec()';
    # Suggested boundary values to test: -2, -1, 0
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 92 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_92_56_==: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_93_56_!= (HIGH) line 93 in _apply_filter_spec() ---
# Source:  $op eq 'starts'   ? index(lc($cell), lc($val)) == 0  :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_93_56_!= line 93 in _apply_filter_spec()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 93 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_93_56_!=: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_94_35_> (HIGH) line 94 in _apply_filter_spec() ---
# Source:  $op eq 'lt'       ? $cell <  $val                    :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_94_35_> line 94 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 94 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_94_35_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_95_35_< (HIGH) line 95 in _apply_filter_spec() ---
# Source:  $op eq 'le'       ? $cell <= $val                    :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip <= to <
#   Numeric boundary flip <= to >
#   Numeric boundary flip <= to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_95_35_< line 95 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 95 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_95_35_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_96_35_< (HIGH) line 96 in _apply_filter_spec() ---
# Source:  $op eq 'gt'       ? $cell >  $val                    :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_96_35_< line 96 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 96 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_96_35_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_97_35_> (HIGH) line 97 in _apply_filter_spec() ---
# Source:  $op eq 'ge'       ? $cell >= $val                    :
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_97_35_> line 97 in _apply_filter_spec()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 97 in _apply_filter_spec() to detect the mutant
    fail('NUM_BOUNDARY_97_35_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_174_5 (MEDIUM) line 174 in _build_export_url() ---
# Source:  return $u;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_174_5 line 174 in _build_export_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 174 in _build_export_url() to detect the mutant
    fail('BOOL_NEGATE_174_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_189_5 (MEDIUM) line 189 in index() ---
# Source:  if (-d $dir_path) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_189_5 line 189 in index()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 189 in index() to detect the mutant
    fail('COND_INV_189_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_216_9 (MEDIUM) line 216 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_216_9 line 216 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 216 in view() to detect the mutant
    fail('BOOL_NEGATE_216_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_234_5 (MEDIUM) line 234 in view() ---
# Source:  if ($source->columns) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_234_5 line 234 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 234 in view() to detect the mutant
    fail('COND_INV_234_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_273_9 (MEDIUM) line 273 in browse() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_273_9 line 273 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 273 in browse() to detect the mutant
    fail('BOOL_NEGATE_273_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_277_5 (MEDIUM) line 277 in browse() ---
# Source:  if (opendir my $dh, $dir->to_string) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_277_5 line 277 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 277 in browse() to detect the mutant
    fail('COND_INV_277_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_282_13 (MEDIUM) line 282 in browse() ---
# Source:  if (-d $f) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_282_13 line 282 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 282 in browse() to detect the mutant
    fail('COND_INV_282_13: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_342_9 (MEDIUM) line 342 in open_file() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_342_9 line 342 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 342 in open_file() to detect the mutant
    fail('BOOL_NEGATE_342_9: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_347_9 (MEDIUM) line 347 in open_file() ---
# Source:  return $self->reply->not_found;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_347_9 line 347 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 347 in open_file() to detect the mutant
    fail('BOOL_NEGATE_347_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_358_5 (MEDIUM) line 358 in open_file() ---
# Source:  if ($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_358_5 line 358 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 358 in open_file() to detect the mutant
    fail('COND_INV_358_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_373_5 (MEDIUM) line 373 in open_file() ---
# Source:  if ($source->columns) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_373_5 line 373 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 373 in open_file() to detect the mutant
    fail('COND_INV_373_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_416_9 (MEDIUM) line 416 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_416_9 line 416 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 416 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_416_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_422_9 (MEDIUM) line 422 in columns_api() ---
# Source:  if (defined $file && -f $file && $file->basename =~ $EXT_RE) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_422_9 line 422 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 422 in columns_api() to detect the mutant
    fail('COND_INV_422_9: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_430_9 (MEDIUM) line 430 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_430_9 line 430 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 430 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_430_9: replace with real assertion');
}

# --- SURVIVOR: COND_INV_434_5 (MEDIUM) line 434 in columns_api() ---
# Source:  if ($source->columns) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_434_5 line 434 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 434 in columns_api() to detect the mutant
    fail('COND_INV_434_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_460_5 (MEDIUM) line 460 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_460_5 line 460 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 460 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_460_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_464_9 (MEDIUM) line 464 in join_tables() ---
# Source:  return $self->render(
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_464_9 line 464 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 464 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_464_9: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_539_5 (MEDIUM) line 539 in export_data() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_539_5 line 539 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 539 in export_data() to detect the mutant
    fail('BOOL_NEGATE_539_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_542_5 (MEDIUM) line 542 in export_data() ---
# Source:  return $self->reply->not_found if $@;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_542_5 line 542 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 542 in export_data() to detect the mutant
    fail('BOOL_NEGATE_542_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_572_9 (MEDIUM) line 572 in export_data() ---
# Source:  return $self->_render_sqlite($records, \@columns, $safe_name);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_572_9 line 572 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 572 in export_data() to detect the mutant
    fail('BOOL_NEGATE_572_9: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_574_5 (MEDIUM) line 574 in export_data() ---
# Source:  return $self->_render_csv($records, \@columns, $safe_name);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_574_5 line 574 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 574 in export_data() to detect the mutant
    fail('BOOL_NEGATE_574_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_601_5 (MEDIUM) line 601 in _render_sqlite() ---
# Source:  if (@$records) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_601_5 line 601 in _render_sqlite()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 601 in _render_sqlite() to detect the mutant
    fail('COND_INV_601_5: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_59_5 line 59 in _spec_to_url() ---
# Source:  return "/view/$1"                               if $spec =~ /\Atable:([A-Za-z0-9_]+)\z/;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_59_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_60_5 line 60 in _spec_to_url() ---
# Source:  return '/open?path=' . url_escape($1)           if $spec =~ /\Apath:(.+)\z/;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_60_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_61_5 line 61 in _spec_to_url() ---
# Source:  return '/';
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_61_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_85_5 line 85 in _apply_filter_spec() ---
# Source:  return $records unless defined $col && length $col
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_85_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_174_5 line 174 in _build_export_url() ---
# Source:  return $u;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_174_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_216_9 line 216 in view() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_216_9: add assertion here');

# --- LOW HINT: RETURN_UNDEF_273_9 line 273 in browse() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_273_9: add assertion here');

# --- LOW HINT: RETURN_UNDEF_342_9 line 342 in open_file() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_342_9: add assertion here');

# --- LOW HINT: RETURN_UNDEF_347_9 line 347 in open_file() ---
# Source:  return $self->reply->not_found;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_347_9: add assertion here');

# --- LOW HINT: RETURN_UNDEF_416_9 line 416 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_416_9: add assertion here');

# --- LOW HINT: RETURN_UNDEF_430_9 line 430 in columns_api() ---
# Source:  return $self->render(json => { error => 'not found' }, status => 404);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_430_9: add assertion here');

# --- LOW HINT: RETURN_UNDEF_460_5 line 460 in join_tables() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_460_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_464_9 line 464 in join_tables() ---
# Source:  return $self->render(
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_464_9: add assertion here');

# --- LOW HINT: RETURN_UNDEF_539_5 line 539 in export_data() ---
# Source:  return $self->reply->not_found unless $left_src;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_539_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_542_5 line 542 in export_data() ---
# Source:  return $self->reply->not_found if $@;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_542_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_572_9 line 572 in export_data() ---
# Source:  return $self->_render_sqlite($records, \@columns, $safe_name);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_572_9: add assertion here');

# --- LOW HINT: RETURN_UNDEF_574_5 line 574 in export_data() ---
# Source:  return $self->_render_csv($records, \@columns, $safe_name);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_574_5: add assertion here');

################################################################
# FILE: lib/Database/BI/Model/DataSource.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: BOOL_NEGATE_63_3 (MEDIUM) line 63 in _msg() ---
# Source:  return $i18n->maketext($key, @args);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_63_3 line 63 in _msg()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 63 in _msg() to detect the mutant
    fail('BOOL_NEGATE_63_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_179_19_!= (HIGH) line 179 in _detect_file_info() ---
# Source:  $sep = (@probe == 1 && $line =~ /!/) ? '!' : ',';
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_179_19_!= line 179 in _detect_file_info()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 179 in _detect_file_info() to detect the mutant
    fail('NUM_BOUNDARY_179_19_!=: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_273_2 (MEDIUM) line 273 in table_name() ---
# Source:  return $self->{_table};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_273_2 line 273 in table_name()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 273 in table_name() to detect the mutant
    fail('BOOL_NEGATE_273_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_285_2 (MEDIUM) line 285 in columns() ---
# Source:  return $self->{_columns};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_285_2 line 285 in columns()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 285 in columns() to detect the mutant
    fail('BOOL_NEGATE_285_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_296_2 (MEDIUM) line 296 in id_column() ---
# Source:  return $self->{_id_col};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_296_2 line 296 in id_column()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 296 in id_column() to detect the mutant
    fail('BOOL_NEGATE_296_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_344_2 (MEDIUM) line 344 in fetch_all() ---
# Source:  if ($@) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_344_2 line 344 in fetch_all()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 344 in fetch_all() to detect the mutant
    fail('COND_INV_344_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_354_2 (MEDIUM) line 354 in fetch_all() ---
# Source:  if (ref $data eq 'HASH') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_354_2 line 354 in fetch_all()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 354 in fetch_all() to detect the mutant
    fail('COND_INV_354_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_359_2 (MEDIUM) line 359 in fetch_all() ---
# Source:  if (!@{$data}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_359_2 line 359 in fetch_all()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 359 in fetch_all() to detect the mutant
    fail('COND_INV_359_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_363_2 (MEDIUM) line 363 in fetch_all() ---
# Source:  return $data;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_363_2 line 363 in fetch_all()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::BI::Model::DataSource requires constructor arguments, add them here.
    my $obj = new_ok('Database::BI::Model::DataSource');
    # TODO: exercise line 363 in fetch_all() to detect the mutant
    fail('BOOL_NEGATE_363_2: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_63_3 line 63 in _msg() ---
# Source:  return $i18n->maketext($key, @args);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_63_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_273_2 line 273 in table_name() ---
# Source:  return $self->{_table};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_273_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_285_2 line 285 in columns() ---
# Source:  return $self->{_columns};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_285_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_296_2 line 296 in id_column() ---
# Source:  return $self->{_id_col};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_296_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_363_2 line 363 in fetch_all() ---
# Source:  return $data;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::BI::Model::DataSource requires constructor arguments, add them here.
# my $obj = new_ok('Database::BI::Model::DataSource');
# ok($obj->..., 'RETURN_UNDEF_363_2: add assertion here');

done_testing();
