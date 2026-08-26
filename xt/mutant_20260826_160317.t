#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-08-26 16:03:17
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

# --- SURVIVOR: BOOL_NEGATE_196_2 (MEDIUM) line 196 in _detect_platform() ---
# Source:  # Exit:    Returns a two-letter ISO 639-1 language code string.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_196_2 line 196 in _detect_platform()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 196 in _detect_platform() to detect the mutant
    fail('BOOL_NEGATE_196_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_437_2 (MEDIUM) line 437 in _dedup_records() ---
# Source:  #          a display label used for collision-prefix (not for SQL quoting).
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_437_2 line 437 in _dedup_records()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 437 in _dedup_records() to detect the mutant
    fail('BOOL_NEGATE_437_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_506_3 (MEDIUM) line 506 in _combine_tables() ---
# Source:  for my $src (@$sources) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_506_3 line 506 in _combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 506 in _combine_tables() to detect the mutant
    fail('COND_INV_506_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_748_3 (MEDIUM) line 748 in _render_sqlite() ---
# Source:  sub _render_sqlite :Protected ($self, $records, $columns, $name) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_748_3 line 748 in _render_sqlite()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 748 in _render_sqlite() to detect the mutant
    fail('BOOL_NEGATE_748_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_754_3 (MEDIUM) line 754 in _render_sqlite() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_754_3 line 754 in _render_sqlite()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 754 in _render_sqlite() to detect the mutant
    fail('BOOL_NEGATE_754_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_831_2 (MEDIUM) line 831 in index() ---
# Source:  (mixed).  A name that is valid but has no backing file returns 200 with
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_831_2 line 831 in index()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 831 in index() to detect the mutant
    fail('BOOL_NEGATE_831_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_952_2 (MEDIUM) line 952 in view() ---
# Source:  =head3 EXAMPLE
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_952_2 line 952 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 952 in view() to detect the mutant
    fail('BOOL_NEGATE_952_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_955_2 (MEDIUM) line 955 in view() ---
# Source:  GET /browse?path=/tmp                  -> 200, lists /tmp
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

# --- SURVIVOR: BOOL_NEGATE_968_3 (MEDIUM) line 968 in browse() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_968_3 line 968 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 968 in browse() to detect the mutant
    fail('BOOL_NEGATE_968_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1059_2 (MEDIUM) line 1059 in browse() ---
# Source:  path (used by the template to record the file in C<localStorage>).
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1059_2 line 1059 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1059 in browse() to detect the mutant
    fail('BOOL_NEGATE_1059_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1060_2 (MEDIUM) line 1060 in browse() ---
# Source:  On error re-renders C<home.html.tt> with C<error>, C<back_url>, C<back_label>.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1060_2 line 1060 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1060 in browse() to detect the mutant
    fail('BOOL_NEGATE_1060_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1062_2 (MEDIUM) line 1062 in browse() ---
# Source:  =head3 MESSAGES
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1062_2 line 1062 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1062 in browse() to detect the mutant
    fail('BOOL_NEGATE_1062_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1066_2 (MEDIUM) line 1066 in browse() ---
# Source:  =head3 FORMAL SPECIFICATION
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1066_2 line 1066 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1066 in browse() to detect the mutant
    fail('BOOL_NEGATE_1066_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1069_2 (MEDIUM) line 1069 in browse() ---
# Source:  let file = realpath(param('path')) in
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1069_2 line 1069 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1069 in browse() to detect the mutant
    fail('BOOL_NEGATE_1069_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1143_3 (MEDIUM) line 1143 in open_file() ---
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

# --- SURVIVOR: BOOL_NEGATE_1156_2 (MEDIUM) line 1156 in open_file() ---
# Source:  the page contains more than one table (default: 0).
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1156_2 line 1156 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1156 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1156_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1221_2 (MEDIUM) line 1221 in import_url() ---
# Source:  columns          => \@columns,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1221_2 line 1221 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1221 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1221_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1225_3 (MEDIUM) line 1225 in import_url() ---
# Source:  back_url         => '/',
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1225_3 line 1225 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1225 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1225_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1351_2 (MEDIUM) line 1351 in columns_api() ---
# Source:  =head3 EXAMPLE
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1351_2 line 1351 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1351 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1351_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1357_2 (MEDIUM) line 1357 in columns_api() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1357_2 line 1357 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1357 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1357_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1437_3 (MEDIUM) line 1437 in join_tables() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1437_3 line 1437 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1437 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1437_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1449_3 (MEDIUM) line 1449 in join_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1449_3 line 1449 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1449 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1449_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1456_2 (MEDIUM) line 1456 in join_tables() ---
# Source:  ?l=    string   (required) Left table spec: "table:name" or "path:/abs/path".
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1456_2 line 1456 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1456 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1456_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1461_3 (MEDIUM) line 1461 in join_tables() ---
# Source:  ?f=    string   (repeatable) Result filter: "col:op:val".
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1461_3 line 1461 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1461 in join_tables() to detect the mutant
    fail('COND_INV_1461_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1468_2 (MEDIUM) line 1468 in join_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1468_2 line 1468 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1468 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1468_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1519_2 (MEDIUM) line 1519 in combine_tables() ---
# Source:  my $crecs = eval { $csrc->fetch_all } // [];
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1519_2 line 1519 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1519 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1519_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1586_3 (MEDIUM) line 1586 in combine_tables() ---
# Source:  =item Invalid partitions (all fall back to CSV)
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1586_3 line 1586 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1586 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1586_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1595_2 (MEDIUM) line 1595 in combine_tables() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1595_2 line 1595 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1595 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1595_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1653_3 (MEDIUM) line 1653 in export_data() ---
# Source:  first via C<m{([^/\\]+)\z}> -- only the basename is kept, preventing
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1653_3 line 1653 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1653 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1653_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1665_3 (MEDIUM) line 1665 in export_data() ---
# Source:  C<report.txt>, C<report.json>, C<report> (no extension), empty string.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1665_3 line 1665 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1665 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1665_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1675_3 (MEDIUM) line 1675 in export_data() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1675_3 line 1675 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1675 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1675_3: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_196_2 line 196 in _detect_platform() ---
# Source:  # Exit:    Returns a two-letter ISO 639-1 language code string.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_196_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_437_2 line 437 in _dedup_records() ---
# Source:  #          a display label used for collision-prefix (not for SQL quoting).
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_437_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_748_3 line 748 in _render_sqlite() ---
# Source:  sub _render_sqlite :Protected ($self, $records, $columns, $name) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_748_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_754_3 line 754 in _render_sqlite() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_754_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_831_2 line 831 in index() ---
# Source:  (mixed).  A name that is valid but has no backing file returns 200 with
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_831_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_952_2 line 952 in view() ---
# Source:  =head3 EXAMPLE
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_952_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_955_2 line 955 in view() ---
# Source:  GET /browse?path=/tmp                  -> 200, lists /tmp
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_955_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_968_3 line 968 in browse() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_968_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1059_2 line 1059 in browse() ---
# Source:  path (used by the template to record the file in C<localStorage>).
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1059_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1060_2 line 1060 in browse() ---
# Source:  On error re-renders C<home.html.tt> with C<error>, C<back_url>, C<back_label>.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1060_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1062_2 line 1062 in browse() ---
# Source:  =head3 MESSAGES
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1062_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1066_2 line 1066 in browse() ---
# Source:  =head3 FORMAL SPECIFICATION
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1066_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1069_2 line 1069 in browse() ---
# Source:  let file = realpath(param('path')) in
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1069_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1143_3 line 1143 in open_file() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1143_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1156_2 line 1156 in open_file() ---
# Source:  the page contains more than one table (default: 0).
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1156_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1221_2 line 1221 in import_url() ---
# Source:  columns          => \@columns,
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1221_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1225_3 line 1225 in import_url() ---
# Source:  back_url         => '/',
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1225_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1351_2 line 1351 in columns_api() ---
# Source:  =head3 EXAMPLE
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1351_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1357_2 line 1357 in columns_api() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1357_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1437_3 line 1437 in join_tables() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1437_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1449_3 line 1449 in join_tables() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1449_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1456_2 line 1456 in join_tables() ---
# Source:  ?l=    string   (required) Left table spec: "table:name" or "path:/abs/path".
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1456_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1468_2 line 1468 in join_tables() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1468_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1519_2 line 1519 in combine_tables() ---
# Source:  my $crecs = eval { $csrc->fetch_all } // [];
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1519_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1586_3 line 1586 in combine_tables() ---
# Source:  =item Invalid partitions (all fall back to CSV)
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1586_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1595_2 line 1595 in combine_tables() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1595_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1653_3 line 1653 in export_data() ---
# Source:  first via C<m{([^/\\]+)\z}> -- only the basename is kept, preventing
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1653_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1665_3 line 1665 in export_data() ---
# Source:  C<report.txt>, C<report.json>, C<report> (no extension), empty string.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1665_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1675_3 line 1675 in export_data() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1675_3: add assertion here');

done_testing();
