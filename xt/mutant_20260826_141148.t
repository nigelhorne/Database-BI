#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-08-26 14:11:48
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

# --- SURVIVOR: BOOL_NEGATE_437_2 (MEDIUM) line 437 in _combine_tables() ---
# Source:  push @all_cols, $col unless $seen{$col}++;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_437_2 line 437 in _combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 437 in _combine_tables() to detect the mutant
    fail('BOOL_NEGATE_437_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_506_3 (MEDIUM) line 506 in _list_dir() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_506_3 line 506 in _list_dir()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 506 in _list_dir() to detect the mutant
    fail('COND_INV_506_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_748_3 (MEDIUM) line 748 in index() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_748_3 line 748 in index()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 748 in index() to detect the mutant
    fail('BOOL_NEGATE_748_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_754_3 (MEDIUM) line 754 in index() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_754_3 line 754 in index()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 754 in index() to detect the mutant
    fail('BOOL_NEGATE_754_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_831_2 (MEDIUM) line 831 in view() ---
# Source:  template         => "$platform/$language/dashboard",
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_831_2 line 831 in view()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 831 in view() to detect the mutant
    fail('BOOL_NEGATE_831_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_952_2 (MEDIUM) line 952 in browse() ---
# Source:  =head4 DOMAIN CONSTRAINTS: ?path=
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_952_2 line 952 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 952 in browse() to detect the mutant
    fail('BOOL_NEGATE_952_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_955_2 (MEDIUM) line 955 in browse() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_955_2 line 955 in browse()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 955 in browse() to detect the mutant
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

# --- SURVIVOR: BOOL_NEGATE_1059_2 (MEDIUM) line 1059 in open_file() ---
# Source:  combine_specs    => [],
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1059_2 line 1059 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1059 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1059_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1060_2 (MEDIUM) line 1060 in open_file() ---
# Source:  current_joins    => [],
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1060_2 line 1060 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1060 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1060_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1062_2 (MEDIUM) line 1062 in open_file() ---
# Source:  join_summaries   => [],
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1062_2 line 1062 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1062 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1062_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1066_2 (MEDIUM) line 1066 in open_file() ---
# Source:  );
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1066_2 line 1066 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1066 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1066_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1069_2 (MEDIUM) line 1069 in open_file() ---
# Source:  =head2 import_url
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1069_2 line 1069 in open_file()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1069 in open_file() to detect the mutant
    fail('BOOL_NEGATE_1069_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1143_3 (MEDIUM) line 1143 in import_url() ---
# Source:  handler          => 'tt',
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1143_3 line 1143 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1143 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1143_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1156_2 (MEDIUM) line 1156 in import_url() ---
# Source:  join_summaries   => [],
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1156_2 line 1156 in import_url()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1156 in import_url() to detect the mutant
    fail('BOOL_NEGATE_1156_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1221_2 (MEDIUM) line 1221 in columns_api() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1221_2 line 1221 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1221 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1221_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1225_3 (MEDIUM) line 1225 in columns_api() ---
# Source:  my $recs = ($source->columns ? [] : eval { $source->fetch_all } // []);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1225_3 line 1225 in columns_api()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1225 in columns_api() to detect the mutant
    fail('BOOL_NEGATE_1225_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1351_2 (MEDIUM) line 1351 in join_tables() ---
# Source:  current_joins    => \@join_specs,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1351_2 line 1351 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1351 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1351_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1357_2 (MEDIUM) line 1357 in join_tables() ---
# Source:  );
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1357_2 line 1357 in join_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1357 in join_tables() to detect the mutant
    fail('BOOL_NEGATE_1357_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1437_3 (MEDIUM) line 1437 in combine_tables() ---
# Source:  for my $cspec (@combine_specs) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1437_3 line 1437 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1437 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1437_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1449_3 (MEDIUM) line 1449 in combine_tables() ---
# Source:  : ($left_recs, \@left_cols);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1449_3 line 1449 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1449 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1449_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1456_2 (MEDIUM) line 1456 in combine_tables() ---
# Source:  my $table_key = 'combine:' . lc($left_label);
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1456_2 line 1456 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1456 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1456_2: replace with real assertion');
}

# --- SURVIVOR: COND_INV_1461_3 (MEDIUM) line 1461 in combine_tables() ---
# Source:  handler          => 'tt',
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_1461_3 line 1461 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1461 in combine_tables() to detect the mutant
    fail('COND_INV_1461_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1468_2 (MEDIUM) line 1468 in combine_tables() ---
# Source:  back_label       => "Back to $left_label",
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1468_2 line 1468 in combine_tables()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1468 in combine_tables() to detect the mutant
    fail('BOOL_NEGATE_1468_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1519_2 (MEDIUM) line 1519 in combine_tables() ---
# Source:  None beyond the 404 response.
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

# --- SURVIVOR: BOOL_NEGATE_1586_3 (MEDIUM) line 1586 in export_data() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1586_3 line 1586 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1586 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1586_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1595_2 (MEDIUM) line 1595 in export_data() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1595_2 line 1595 in export_data()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1595 in export_data() to detect the mutant
    fail('BOOL_NEGATE_1595_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1653_3 (MEDIUM) line 1653 in export_write() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1653_3 line 1653 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1653 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1653_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1665_3 (MEDIUM) line 1665 in export_write() ---
# Source:  C<GET /api/dirs> -- Return a JSON directory listing for the export panel.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1665_3 line 1665 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1665 in export_write() to detect the mutant
    fail('BOOL_NEGATE_1665_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_1675_3 (MEDIUM) line 1675 in export_write() ---
# Source:  =head4 OUTPUT
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_1675_3 line 1675 in export_write()';
    # NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
    # e.g. my $result = Database::BI::Controller::Dashboard->method(...);
    # TODO: exercise line 1675 in export_write() to detect the mutant
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

# --- LOW HINT: RETURN_UNDEF_437_2 line 437 in _combine_tables() ---
# Source:  push @all_cols, $col unless $seen{$col}++;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_437_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_748_3 line 748 in index() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_748_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_754_3 line 754 in index() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_754_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_831_2 line 831 in view() ---
# Source:  template         => "$platform/$language/dashboard",
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_831_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_952_2 line 952 in browse() ---
# Source:  =head4 DOMAIN CONSTRAINTS: ?path=
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_952_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_955_2 line 955 in browse() ---
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

# --- LOW HINT: RETURN_UNDEF_1059_2 line 1059 in open_file() ---
# Source:  combine_specs    => [],
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1059_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1060_2 line 1060 in open_file() ---
# Source:  current_joins    => [],
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1060_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1062_2 line 1062 in open_file() ---
# Source:  join_summaries   => [],
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1062_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1066_2 line 1066 in open_file() ---
# Source:  );
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1066_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1069_2 line 1069 in open_file() ---
# Source:  =head2 import_url
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1069_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1143_3 line 1143 in import_url() ---
# Source:  handler          => 'tt',
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1143_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1156_2 line 1156 in import_url() ---
# Source:  join_summaries   => [],
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1156_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1221_2 line 1221 in columns_api() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1221_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1225_3 line 1225 in columns_api() ---
# Source:  my $recs = ($source->columns ? [] : eval { $source->fetch_all } // []);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1225_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1351_2 line 1351 in join_tables() ---
# Source:  current_joins    => \@join_specs,
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1351_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1357_2 line 1357 in join_tables() ---
# Source:  );
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1357_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1437_3 line 1437 in combine_tables() ---
# Source:  for my $cspec (@combine_specs) {
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1437_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1449_3 line 1449 in combine_tables() ---
# Source:  : ($left_recs, \@left_cols);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1449_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1456_2 line 1456 in combine_tables() ---
# Source:  my $table_key = 'combine:' . lc($left_label);
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1456_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1468_2 line 1468 in combine_tables() ---
# Source:  back_label       => "Back to $left_label",
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1468_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1519_2 line 1519 in combine_tables() ---
# Source:  None beyond the 404 response.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1519_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1586_3 line 1586 in export_data() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1586_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1595_2 line 1595 in export_data() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1595_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1653_3 line 1653 in export_write() ---
# Source:  }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1653_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1665_3 line 1665 in export_write() ---
# Source:  C<GET /api/dirs> -- Return a JSON directory listing for the export panel.
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1665_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_1675_3 line 1675 in export_write() ---
# Source:  =head4 OUTPUT
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: Database::BI::Controller::Dashboard has no constructor — call class methods directly.
# e.g. my $result = Database::BI::Controller::Dashboard->method(...);
# ok($result, 'RETURN_UNDEF_1675_3: add assertion here');

done_testing();
