package Database::BI::Model::DataSource;

# Thin adapter between the controller and Database::Abstraction (or a future
# Database::Join).  The controller only ever calls fetch_all(); everything
# else is an implementation detail of this class.

use strict;
use warnings;
use Carp 'croak';

our $VERSION = '0.01';

sub new {
    my ($class, %args) = @_;

    croak 'directory required' unless defined $args{directory};
    croak 'table required'     unless defined $args{table};

    require Database::Abstraction;

    # Database::Abstraction is a base class: the lowercased package name maps
    # to the table/file name in the data directory.  We generate an ephemeral
    # subclass so DataSource stays table-agnostic without forcing callers to
    # subclass Database::Abstraction themselves.
    my $table = lc $args{table};
    my $pkg   = 'Database::BI::_DB::' . ucfirst($table);
    {
        no strict 'refs';
        push @{"${pkg}::ISA"}, 'Database::Abstraction'
            unless $pkg->isa('Database::Abstraction');
    }

    my $db = $pkg->new({ directory => $args{directory} });

    return bless { _db => $db }, $class;
}

# Returns an arrayref of hashrefs, one per record.
# Phase 2: replace _db with a Database::Join instance — this method is unchanged.
sub fetch_all {
    my $self = shift;

    my $data = $self->{_db}->selectall_hashref();
    return [] unless defined $data;

    # Database::Abstraction may return an arrayref or a hashref keyed by PK.
    return ref $data eq 'ARRAY' ? $data : [ values %$data ];
}

1;

=head1 NAME

Database::BI::Model::DataSource - Adapter around Database::Abstraction

=head1 SYNOPSIS

    my $source = Database::BI::Model::DataSource->new(
        directory => '/path/to/data',
        table     => 'sales',
    );
    my $records = $source->fetch_all;   # arrayref of hashrefs

=head1 DESCRIPTION

Creates an ephemeral C<Database::Abstraction> subclass for the named table and
exposes a single C<fetch_all> method.  To switch to C<Database::Join> in Phase 2,
replace the C<_db> internals here; the controller requires no changes.

C<Database::Abstraction> discovers the data file automatically based on the class
name and extension: C<sales.csv>, C<sales.db>, C<sales.sqlite>, C<sales.xml>, etc.

=head1 AUTHOR

Nigel Horne C<< <njh@bandsman.co.uk> >>

=head1 LICENSE

GPL-2.0

=cut
