package Database::BI;

use Mojo::Base 'Mojolicious', -strict, -signatures;

use Database::BI::Model::DataSource;

our $VERSION = '0.01';

=head1 NAME

Database::BI - Web-based Business Intelligence viewer for flat data files

=head1 SYNOPSIS

    # Development server (auto-reloads on file changes)
    morbo script/database-bi

    # Production server
    hypnotoad script/database-bi

=head1 DESCRIPTION

C<Database::BI> is a L<Mojolicious> web application that reads arbitrary
flat data files (CSV, PSV, SQLite, XML, etc.) via L<Database::Abstraction>
and presents them as styled, sortable, reorderable HTML tables.

Key features:

=over 4

=item *

B<File picker> - the home page scans C<data_dir> and shows a card for
every supported file.  Recently opened filesystem files appear in a
"Recently opened" section powered by C<localStorage>.

=item *

B<Filesystem browser> - C</browse> lets the user navigate the entire
filesystem and open any supported data file, not just files in C<data_dir>.

=item *

B<Column sort and reorder> - clicking a header sorts the table; headers
are draggable to reorder.  Both settings are persisted in C<localStorage>
by column name and survive page reloads.

=item *

B<Left join> - the "Add database / Filter results" panel on any table view
lets the user join one or more additional tables on a shared key.  Every
left row is kept; right-table columns are appended for matching rows.

=item *

B<Result filters> - the same panel lets the user add filter conditions
(column / operator / value) that are applied server-side after all joins.
Operators: C<eq>, C<ne>, C<contains>, C<starts>, C<lt>, C<le>, C<gt>,
C<ge>, C<empty>, C<notempty>.  Active filters are shown as chips in the
toolbar with a one-click "Clear" link.

=back

=head1 ROUTES

=over 4

=item C<GET />

Scans C<data_dir>, renders a card grid of available tables.

=item C<GET /view/:table>

Opens the named table from C<data_dir>.  Accepts C<?f=col:op:val>
(repeatable) to pre-filter results.

=item C<GET /browse>

Filesystem navigator.  Accepts C<?path=> to set the starting directory
(defaults to C<$HOME>).

=item C<GET /open>

Opens any supported file by absolute path (C<?path=>).  Accepts C<?f=>
filters.

=item C<GET /join>

Performs one or more left joins and renders the merged table.  Parameters:

  l=<spec>               left table: "table:name" or "path:/abs/path"
  j=<spec>|<lk>|<rk>    join step (repeatable): right-spec, left key, right key
  f=<col>:<op>:<val>     result filter (repeatable)

=item C<GET /api/columns>

Returns C<{ "columns": [...] }> for a table (C<?table=name>) or file
(C<?path=/abs/path>).  Used by the join UI to populate the right-key
dropdown without a page reload.

=item C<GET /export>

Exports the current logical view (same C<l=>, C<j=>, C<f=> parameters as
C</join>) as a file download.  Additional parameter:

  format=csv      (default) - RFC 4180 CSV; UTF-8; CRLF line endings
  format=sqlite   - SQLite 3 database with a single table named "data"

The download filename is derived from the left table label with
non-alphanumeric characters replaced by underscores.

=back

=head1 CONFIGURATION

Place a C<database_bi.conf> file in the application root to override
defaults:

    {
        data_dir => 'data',   # directory scanned for data files on the home page
        platform => 'web',    # VWF template dimension
        language => 'en',     # VWF template dimension
    }

=cut

sub startup ($self) {
	$self->plugin('Config', {
		default => {
			data_dir => 'data',
			platform => 'web',
			language => 'en',
		}
	});

	# Default export directory: ~/Downloads when it exists, else HOME, else tmpdir.
	{
		require File::Spec;
		my $home   = $ENV{HOME} // '';
		my $dl_dir = ($home && -d "$home/Downloads") ? "$home/Downloads"
		           : ($home || File::Spec->tmpdir);
		$self->defaults(download_dir => $dl_dir);
	}

	# Register as 'tt' so template files keep the .html.tt extension and
	# WRAPPER directives like [% WRAPPER 'foo.html.tt' %] resolve correctly
	# via Template::Provider::Mojo.  TT options must live under 'template';
	# the top-level config is for plugin options only.
	# renderer->paths already points at templates/ by default - no INCLUDE_PATH needed.
	$self->plugin('TemplateToolkit', {
		name     => 'tt',
			template => {
			POST_CHOMP => 1,
			TRIM       => 1,
		},
	});

	# Factory helper: opens any named table from the configured data directory.
	# Phase 2: replace the DataSource instantiation here with Database::Join -
	# the controller never changes.
	my $conf     = $self->config();
	my $data_dir = $self->home->child($conf->{data_dir})->to_string;

	# Pass directory => $path to override the default data_dir.
	# Phase 2: swap DataSource for Database::Join here only.
	$self->helper(open_table => sub ($c, $table, %opts) {
	my $dir = exists $opts{directory} ? $opts{directory} : $data_dir;
	Database::BI::Model::DataSource->new(
		directory => $dir,
		table     => $table,
		);
	});

	my $r = $self->routes();
	$r->get('/')->to('Dashboard#index');
	$r->get('/view/:table')->to('Dashboard#view');
	$r->get('/browse')->to('Dashboard#browse');
	$r->get('/open')->to('Dashboard#open_file');
	$r->get('/join')->to('Dashboard#join_tables');
	$r->get('/api/columns')->to('Dashboard#columns_api');
	$r->get('/export')->to('Dashboard#export_data');
	$r->post('/export')->to('Dashboard#export_write');
	$r->get('/api/dirs')->to('Dashboard#dirs_api');
	$r->post('/upload')->to('Dashboard#upload_file');
}

=head1 REPOSITORY

L<https://github.com/nigelhorne/Database-BI>

=head1 SUPPORT

This module is provided as-is without any warranty.

=head1 AUTHOR

Nigel Horne C<< <njh@nigelhorne.com> >>

=head1 LICENCE AND COPYRIGHT

Copyright 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.
If you use it,
please let me know.

=cut

1;
