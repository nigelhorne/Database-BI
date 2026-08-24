package Database::BI::Model::DataSource;

use strict;
use warnings;
use autodie qw(:all);

use Carp		qw(croak carp);
use File::Spec		();
use Readonly;
use Scalar::Util	qw(blessed);
use Params::Validate::Strict qw(validate_strict);
use Params::Get		();

our $VERSION = '0.01';

# ---------------------------------------------------------------------------
# I18N message dictionary.
# All user-visible strings and exception messages are keyed here.
# To plug in a real i18n backend (e.g. Locale::Maketext), pass an object
# that responds to maketext($key, @args) as the "i18n" constructor argument;
# it will be called in preference to this table.
# ---------------------------------------------------------------------------

Readonly our %MESSAGES => (
	error_directory_required	=> 'DataSource: argument "directory" is required',
	error_table_required		=> 'DataSource: argument "table" is required',
	error_directory_missing		=> 'DataSource: directory "%s" does not exist or is not readable',
	error_table_name_invalid	=> 'DataSource: table name "%s" contains illegal characters (alphanumeric and underscore only)',
	error_backend_init		=> 'DataSource: failed to initialise database backend for table "%s": %s',
	error_fetch_failed		=> 'DataSource: fetch_all failed for table "%s": %s',
	warn_empty_result		=> 'DataSource: fetch_all returned no records for table "%s"',
	warn_data_normalised		=> 'DataSource: result from backend was a hashref; converted to arrayref for table "%s"',
);

# A table name is a bare SQL-safe identifier: starts with a letter or
# underscore, followed by zero or more alphanumeric/underscore characters.
Readonly my $TABLE_NAME_RE => qr/\A[A-Za-z_][A-Za-z0-9_]*\z/;

# ---------------------------------------------------------------------------
# Private helpers
# ---------------------------------------------------------------------------

# _fmt( $key [, @sprintf_args] ) -> $string
#
# Package-level (not a method) i18n formatter. Looks up $key in %MESSAGES and
# applies sprintf if positional arguments are supplied. This function is used
# in new() before the object exists; instance methods should use _msg() instead
# so that a caller-supplied i18n object can override the built-in strings.
sub _fmt {
	my ($key, @args) = @_;
	my $tmpl = $MESSAGES{$key} // "Internal error: unknown message key '$key'";
	return @args ? sprintf($tmpl, @args) : $tmpl;
}

# _msg( $self, $key [, @sprintf_args] ) -> $string
#
# Instance-level i18n formatter. Delegates to the caller-supplied i18n object
# (if any) before falling back to _fmt(). The i18n object must implement
# maketext($key, @args).
sub _msg {
	my ($self, $key, @args) = @_;
	if (my $i18n = $self->{_i18n}) {
		return $i18n->maketext($key, @args);
	}
	return _fmt($key, @args);
}

# ---------------------------------------------------------------------------
# Constructor
# ---------------------------------------------------------------------------

=head2 new

Creates and returns a new C<Database::BI::Model::DataSource> instance.

=head3 API SPECIFICATION

=head4 INPUT

	{
	    directory => SCALAR,           # required; path to the data directory
	    table     => SCALAR,           # required; bare table/file name (no extension)
	    i18n      => OBJECT | undef,   # optional; must implement maketext($key, @args)
	}

Accepts a flat key/value list, a hashref, or positional arguments via
C<Params::Get>.

=head4 OUTPUT

Returns C<$self> (a blessed hashref). Croaks on invalid arguments.

=head3 MESSAGES

  error_directory_required    -- "directory" argument was not supplied
  error_table_required        -- "table" argument was not supplied
  error_directory_missing     -- supplied directory does not exist / is unreadable
  error_table_name_invalid    -- table name fails the safe-identifier check
  error_backend_init          -- Database::Abstraction subclass could not be instantiated

=head3 FORMAL SPECIFICATION

  new == [directory : PATH; table : NAME; i18n? : I18N_OBJECT]
         pre  (directory in dom FILE_SYSTEM /\ is_dir directory)
              /\ table =~ TABLE_NAME_RE
         post result.class = DataSource
              /\ result._db.class = Database::Abstraction

=cut

sub new {
	# Strategy: normalise the argument list with Params::Get so callers may
	# pass a hashref or a flat list interchangeably, then validate strictly
	# with Params::Validate before touching any value.
	my $class = shift;
	my $raw   = Params::Get::get_params(undef, @_);

	my $args = validate_strict(
		schema => {
			directory => { type => 'scalar' },
			table     => { type => 'scalar' },
			i18n      => { type => 'object', optional => 1, default => undef },
		},
		input => $raw,
	);

	croak _fmt('error_directory_missing', $args->{directory})
		unless -d $args->{directory};

	croak _fmt('error_table_name_invalid', $args->{table})
		unless $args->{table} =~ $TABLE_NAME_RE;

	my $self = bless {
		_directory => $args->{directory},
		_table     => lc $args->{table},
		_i18n      => $args->{i18n},
		_db        => undef,
	}, $class;

	$self->_init_backend;
	return $self;
}

# ---------------------------------------------------------------------------
# Private initialisation
# ---------------------------------------------------------------------------

# _detect_file_info( $dir, $table ) -> \%info
#
# Peek at the first header line of a CSV or PSV file and return a hashref:
#   sep_char => field separator character (',' or '|')
#   id       => first column name (used as Database::Abstraction's id key)
#   columns  => arrayref of all column names in file order
#
# Two non-obvious defaults in Database::Abstraction make this necessary:
#   1. sep_char defaults to '!' — so a plain CSV is read as one giant field
#      per row, producing a single comma-joined string instead of columns.
#   2. id defaults to 'entry' — the slurp filter greps on that column; if it
#      doesn't exist every row is silently discarded.
# Returns an empty hashref for non-CSV/PSV formats (SQLite, XML, etc.).
sub _detect_file_info {
	my ($dir, $table) = @_;
	for my $ext (qw(csv psv)) {
		my $path = File::Spec->catfile($dir, "$table.$ext");
		next unless -r $path;
		open my $fh, '<', $path or next;
		my $line = <$fh>;
		close $fh;
		next unless defined $line;
		chomp $line;

		my $sep;
		if ($ext eq 'psv') {
			$sep = '|';
		} else {
			# Sniff the separator: Database::Abstraction uses '!' natively and
			# sometimes stores those files with a .csv extension.  If splitting
			# on ',' yields a single field that itself contains '!', the real
			# separator is almost certainly '!'.
			my @probe = split /,/, $line, -1;
			$sep = (@probe == 1 && $line =~ /!/) ? '!' : ',';
		}

		my @cols = split /\Q$sep\E/, $line;
		for (@cols) { s/\A[\s"]+|[\s"]+\z//g }	# strip whitespace and quotes
		@cols = grep { length } @cols;
		return {
			sep_char => $sep,
			id       => (@cols ? $cols[0] : undef),
			columns  => \@cols,
		};
	}
	return {};
}

# _init_backend( $self ) -> void
#
# Strategy: Database::Abstraction is designed as a base class where the
# lowercased package name maps to the data file in the directory
# (e.g. "Database::BI::_DB::Sales" -> data/sales.csv or data/sales.db).
# We synthesise an ephemeral subclass at runtime so DataSource remains
# fully table-agnostic and callers never need to touch Database::Abstraction
# directly. In Phase 2, this method can be replaced with Database::Join
# instantiation without any change to the public API.
#
# no_entry => 1: a BI viewer wants every row; we do not need O(1) keyed
# lookups on a primary key.  This stores data as an arrayref instead of a
# hashref, which the fast-track path in selectall_arrayref returns directly.
sub _init_backend {
	my $self  = shift;
	my $table = $self->{_table};
	my $dir   = $self->{_directory};

	require Database::Abstraction;

	my $pkg = 'Database::BI::_DB::' . ucfirst($table);
	{
		no strict 'refs';
		push @{"${pkg}::ISA"}, 'Database::Abstraction'
			unless $pkg->isa('Database::Abstraction');
	}

	my $info   = _detect_file_info($dir, $table);
	my $id_col = $info->{id} // 'entry';
	$self->{_id_col}  = $id_col;
	$self->{_columns} = $info->{columns};	# undef for SQLite/XML

	my $db = eval {
		$pkg->new({
			directory => $dir,
			table     => $table,
			id        => $id_col,
			no_entry  => 1,
			defined($info->{sep_char}) ? (sep_char => $info->{sep_char}) : (),
		});
	};
	if ($@) {
		croak $self->_msg('error_backend_init', $table, $@);
	}

	$self->{_db} = $db;
	return;
}

# ---------------------------------------------------------------------------
# Public accessors
# ---------------------------------------------------------------------------

=head2 table_name

Returns the (lowercased) table name this instance was opened against.

=head3 API SPECIFICATION

=head4 INPUT

None.

=head4 OUTPUT

Returns a C<SCALAR> string.

=head3 MESSAGES

None.

=head3 FORMAL SPECIFICATION

  table_name == lambda self . self._table

=cut

sub table_name {
	my $self = shift;
	return $self->{_table};
}

=head2 columns

Returns an arrayref of column names in file order, or C<undef> when the
backend does not expose a fixed column order (e.g. SQLite, XML).

=cut

sub columns {
	my $self = shift;
	return $self->{_columns};
}

=head2 id_column

Returns the name of the column used as the primary key / slurp-filter anchor.

=cut

sub id_column {
	my $self = shift;
	return $self->{_id_col};
}

# ---------------------------------------------------------------------------
# Public data-access methods
# ---------------------------------------------------------------------------

=head2 fetch_all

Returns every record in the table as an arrayref of hashrefs.

=head3 API SPECIFICATION

=head4 INPUT

None. (Phase 2 will accept an optional C<$filter> argument compatible with
C<Database::BI::Model::Filter> without changing the return type.)

=head4 OUTPUT

	ARRAYREF of HASHREF   # one hashref per row, keys are column names
	                      # returns [] when the table exists but is empty

Croaks if the backend raises an exception. Carps (non-fatal) when the result
set is empty so the caller can distinguish "open succeeded, no rows" from a
silent failure.

=head3 MESSAGES

  error_fetch_failed     -- backend threw an exception during retrieval
  warn_empty_result      -- query succeeded but returned zero records
  warn_data_normalised   -- backend returned a hashref; converted to arrayref

=head3 FORMAL SPECIFICATION

  fetch_all == lambda self .
    let rows = self._db.selectall_hashref() in
    pre  self._db /= undef
    post result : seq HASHREF
         /\ #result >= 0

=cut

sub fetch_all {
	my $self  = shift;
	my $table = $self->{_table};

	my $data = eval { $self->{_db}->selectall_hashref() };
	if ($@) {
		croak $self->_msg('error_fetch_failed', $table, $@);
	}

	return [] unless defined $data;

	# Strategy: Database::Abstraction can return either an arrayref (when the
	# underlying driver iterates rows) or a hashref keyed by primary key (when
	# it mirrors DBI's selectall_hashref semantics). We normalise to arrayref
	# here so every caller above this layer sees a uniform structure.
	if (ref $data eq 'HASH') {
		carp $self->_msg('warn_data_normalised', $table);
		$data = [ values %{$data} ];
	}

	if (!@{$data}) {
		carp $self->_msg('warn_empty_result', $table);
	}

	return $data;
}

1;

__END__

=head1 NAME

Database::BI::Model::DataSource - Table-agnostic adapter around Database::Abstraction

=head1 VERSION

This document describes Database::BI::Model::DataSource version 0.01.

=head1 SYNOPSIS

    use Database::BI::Model::DataSource;

    my $source = Database::BI::Model::DataSource->new(
        directory => '/path/to/data',
        table     => 'sales',
    );

    my $records = $source->fetch_all;   # arrayref of hashrefs

    for my $row (@{$records}) {
        printf "%s: %s\n", $row->{product}, $row->{amount};
    }

    # With an i18n object (must implement maketext):
    my $source = Database::BI::Model::DataSource->new(
        directory => '/path/to/data',
        table     => 'sales',
        i18n      => My::I18N::Handle->new,
    );

=head1 DESCRIPTION

C<Database::BI::Model::DataSource> is a thin, table-agnostic adapter that
wraps L<Database::Abstraction> and exposes a single C<fetch_all> method
returning an arrayref of hashrefs.

L<Database::Abstraction> is a read-only ORM that discovers data files
(CSV, SQLite, XML, PSV, etc.) automatically from a directory based on the
calling class name.  C<DataSource> generates an ephemeral subclass at
construction time so that callers never interact with
L<Database::Abstraction> directly and so that the backend can be swapped
for L<Database::Join> in Phase 2 without any change to the controller.

All user-visible strings and exception messages are keyed through the
C<%MESSAGES> dictionary and routed via C<_msg()>, making every diagnostic
replaceable by an i18n object at instantiation time.

=head1 LIMITATIONS

=over 4

=item *

Only read operations are supported.  Write-back is not in scope.

=item *

One C<DataSource> instance corresponds to exactly one table.  Use
C<Database::Join> (Phase 2) to query across multiple tables.

=item *

The ephemeral backend class is generated into a package namespace
(C<Database::BI::_DB::*>) that persists for the lifetime of the process.
Instantiating two C<DataSource> objects for the same table name reuses
the same ephemeral class.

=item *

The C<i18n> object, if supplied, must implement C<maketext($key, @args)>
compatible with L<Locale::Maketext>.

=back

=head1 CONFIGURATION AND ENVIRONMENT

No environment variables are read.  All configuration is passed through
the constructor.

=head1 DEPENDENCIES

L<Carp>, L<Readonly>, L<Scalar::Util>, L<Params::Validate::Strict>, L<Params::Get>,
L<Database::Abstraction>.

=head1 INCOMPATIBILITIES

None known.

=head1 BUGS AND LIMITATIONS

Please report bugs via L<https://github.com/nigelhorne/Database-BI/issues>.

=head1 AUTHOR

Nigel Horne C<< <njh@nigelhorne.com> >>

=head1 LICENCE AND COPYRIGHT

Copyright 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.
If you use it,
please let me know.

=cut

1;
