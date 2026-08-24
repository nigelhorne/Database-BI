package Database::BI::Model::DataSource;

use strict;
use warnings;
use autodie qw(:all);

use Carp		qw(croak carp);
use File::Spec		();
use Readonly;
use Scalar::Util	qw(blessed);
use Sub::Private;
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
sub _fmt :Private {
	my ($key, @args) = @_;
	my $tmpl = $MESSAGES{$key} // "Internal error: unknown message key '$key'";
	return @args ? sprintf($tmpl, @args) : $tmpl;
}

# _msg( $self, $key [, @sprintf_args] ) -> $string
#
# Instance-level i18n formatter. Delegates to the caller-supplied i18n object
# (if any) before falling back to _fmt(). The i18n object must implement
# maketext($key, @args).
sub _msg :Private {
	my ($self, $key, @args) = @_;
	if (my $i18n = $self->{_i18n}) {
		return $i18n->maketext($key, @args);
	}
	return _fmt($key, @args);
}

# ---------------------------------------------------------------------------
# Constructor
# ---------------------------------------------------------------------------

=head1 CONSTRUCTOR

=head2 new

Creates and returns a new C<Database::BI::Model::DataSource> instance.

=head3 API SPECIFICATION

=head4 INPUT

	{
	    directory => 'string',           # required; path to the data directory
	    table     => 'string',           # required; bare table/file name (no extension)
	    i18n      => { type => 'object', optional => 1, can => 'maketext' } # must implement maketext($key, @args)
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
	my $args = validate_strict(
		schema => {
			directory => { type => 'string' },
			table     => { type => 'string' },
			i18n      => { type => 'object', optional => 1, default => undef, can => 'maketext' },
		},
		input => Params::Get::get_params(undef, \@_) // {}
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
sub _detect_file_info :Private {
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
sub _init_backend :Private {
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

=head1 ACCESSORS

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

=head1 METHODS

=head2 fetch_all

Returns every record in the table as an arrayref of hashrefs.

=head3 API SPECIFICATION

=head4 INPUT

None.  Filtering is performed at the controller layer (C<Dashboard::_apply_filter_spec>)
after C<fetch_all> returns, not inside C<DataSource>.

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

B<Read all rows from a CSV file:>

    use Database::BI::Model::DataSource;

    my $source = Database::BI::Model::DataSource->new(
        directory => '/path/to/data',
        table     => 'sales',           # looks for data/sales.csv, .psv, .sql, .xml, etc.
    );

    my $records = $source->fetch_all;   # arrayref of hashrefs -- one hashref per row

    for my $row (@{$records}) {
        printf "Product: %s, Amount: %s\n", $row->{product}, $row->{amount};
    }

B<Get column names in the original file order (CSV/PSV only):>

    my $cols = $source->columns;        # returns undef for SQLite and XML
    if ($cols) {
        print join(', ', @{$cols}), "\n";
    }

B<Find out which column is the primary key:>

    print "Primary key column: ", $source->id_column, "\n";

B<Open a SQLite file (.sql extension):>

    my $source = Database::BI::Model::DataSource->new(
        directory => '/var/data',
        table     => 'inventory',       # looks for /var/data/inventory.sql
    );

B<Open a pipe-separated file (.psv extension):>

    my $source = Database::BI::Model::DataSource->new(
        directory => '/var/data',
        table     => 'products',        # looks for /var/data/products.psv
    );

B<Use a custom i18n object to translate error messages:>

    # The i18n object must have a maketext($key, @args) method.
    my $source = Database::BI::Model::DataSource->new(
        directory => '/path/to/data',
        table     => 'sales',
        i18n      => My::I18N::Handle->new,
    );

B<Handle errors gracefully:>

    my $source = eval {
        Database::BI::Model::DataSource->new(
            directory => $dir,
            table     => $table,
        );
    };
    if ($@) {
        warn "Could not open table: $@";
        # $@ contains a translated message from %MESSAGES
    }

    my $records = eval { $source->fetch_all };
    if ($@) {
        warn "Could not read records: $@";
    }

=head1 DESCRIPTION

C<Database::BI::Model::DataSource> is a thin, table-agnostic adapter that
wraps L<Database::Abstraction> and exposes three accessors (C<fetch_all>,
C<columns>, C<id_column>) used by the controller.

L<Database::Abstraction> is a read-only ORM that discovers data files
(CSV, PSV, SQLite, XML, etc.) automatically from a directory based on the
calling class name.  C<DataSource> generates an ephemeral subclass at
construction time so callers never interact with L<Database::Abstraction>
directly.  To swap the backend for L<Database::Join> in Phase 2, only the
C<open_table> helper in C<Database::BI> needs to change; the controller and
C<DataSource> are untouched.

C<_detect_file_info> peeks at the first header line of CSV/PSV files to
extract the correct separator character, the primary-key column name, and
the full ordered column list.  Without this, two silent L<Database::Abstraction>
defaults corrupt every result: C<sep_char> defaults to C<'!'> (turning a
comma-separated file into a single-field table) and C<id> defaults to
C<'entry'> (causing every row to be discarded when no C<entry> column
exists).

Result filtering (C<eq>, C<contains>, C<gt>, etc.) is performed at the
controller layer by C<Dashboard::_apply_filter_spec> after C<fetch_all>
returns.  C<DataSource> itself is filter-unaware.

All user-visible strings and exception messages are keyed through the
C<%MESSAGES> dictionary and routed via C<_msg()>, making every diagnostic
replaceable by an i18n object at instantiation time.

=head1 COMMON PITFALLS

These are the most common mistakes when using C<DataSource>.

=over 4

=item B<SQLite databases must use .sql as their file extension>

C<Database::Abstraction> looks for SQLite databases with the C<.sql> extension.
It does B<not> recognise C<.sqlite>, C<.sqlite3>, or C<.db3>.  If you have a
file called C<inventory.sqlite>, rename it to C<inventory.sql> before passing
it to C<DataSource>.

=item B<The table name is always lowercased>

The constructor lowercases the C<table> argument before using it.  Passing
C<table =E<gt> 'Sales'> and C<table =E<gt> 'sales'> both look for
C<sales.csv> (or C<sales.sql>, etc.).  The matching is case-insensitive on the
table name but B<case-sensitive on the directory path>.

=item B<CSV files with the wrong separator appear as one giant field per row>

C<Database::Abstraction> defaults to C<!> (exclamation mark) as its field
separator.  A standard comma-separated CSV file will look like one big field
per row (for example, C<1,Widget A,North,100>) because the library never sees
the commas as separators.  C<DataSource> fixes this automatically by reading
the first line of the file and detecting the actual separator.  If you bypass
C<DataSource> and call C<Database::Abstraction> directly, you B<must> pass
C<sep_char =E<gt> ','> yourself.

=item B<A table with no "entry" column returns zero rows (without DataSource)>

C<Database::Abstraction> uses C<entry> as its default primary-key column name.
When slurping a CSV, it discards any row where C<$row-E<gt>{entry}> is
undefined.  Because most CSV files do not have an C<entry> column, B<all rows
are silently discarded>.  C<DataSource> prevents this by reading the actual
first column name from the CSV header and passing it as C<id>, and also by
setting C<no_entry =E<gt> 1> so all rows are kept as an ordered array.

=item B<columns() returns undef for SQLite and XML files>

C<columns()> only returns an arrayref for file formats where the header order
is visible before data is read (CSV and PSV).  For SQLite and XML files it
returns C<undef>.  Always check: C<if ($source-E<gt>columns) { ... }>.  The
controller falls back to putting C<id_column> first and then sorting the rest
alphabetically when C<columns()> is C<undef>.

=item B<XML elements named "name", "id", or "key" cause parse failures>

C<XML::Simple> (used by C<Database::Abstraction> for XML files) automatically
turns a child element called C<name>, C<id>, or C<key> into a hash key instead
of keeping it as an array element.  This breaks the expected data structure.
Use different element names in your XML: for example, C<E<lt>skuE<gt>>,
C<E<lt>labelE<gt>>, or C<E<lt>codeE<gt>> instead of C<E<lt>idE<gt>> and
C<E<lt>nameE<gt>>.

  <!-- WRONG: these element names trigger XMLin key-folding -->
  <items>
    <item><id>1</id><name>Widget</name></item>
  </items>

  <!-- CORRECT: use neutral element names -->
  <items>
    <item><sku>1</sku><label>Widget</label></item>
  </items>

=item B<fetch_all returns an empty arrayref, not undef, for an empty table>

When a table exists but contains no data rows, C<fetch_all> returns C<[]> (an
empty arrayref), not C<undef>.  Check with C<scalar @{$records}>, not with
C<defined $records> or C<$records>.

=back

=head1 LIMITATIONS

=over 4

=item *

Only read operations are supported.  Write-back is not in scope.

=item *

One C<DataSource> instance corresponds to exactly one table.  Multi-table
left joins are composed at the controller layer by C<Dashboard::_left_join>;
C<Database::Join> (Phase 2) is not yet in use.

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
