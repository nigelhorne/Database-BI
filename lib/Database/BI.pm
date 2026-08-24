package Database::BI;

use Mojo::Base 'Mojolicious', -strict, -signatures;

use Database::BI::Model::DataSource;

our $VERSION = '0.01';

=head1 NAME

Database::BI - Web-based Business Intelligence tool

=head1 SYNOPSIS

    morbo script/database-bi

=head1 DESCRIPTION

A Mojolicious web application that reads data via L<Database::Abstraction>
and presents it as styled HTML tables, with a VWF-style template hierarchy
for multi-platform, multi-language support.

The home page scans C<data_dir> for supported data files and presents a
picker.  Selecting one opens C</view/:table>.

=head1 CONFIGURATION

Place a C<database_bi.conf> file in the application root to override defaults:

    {
        data_dir => 'data',
        platform => 'web',
        language => 'en',
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

	# Register as 'tt' so template files keep the .html.tt extension and
	# WRAPPER directives like [% WRAPPER 'foo.html.tt' %] resolve correctly
	# via Template::Provider::Mojo.  TT options must live under 'template';
	# the top-level config is for plugin options only.
	# renderer->paths already points at templates/ by default — no INCLUDE_PATH needed.
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
}

=head1 AUTHOR

Nigel Horne C<< <njh@nigelhorne.com> >>

=head1 LICENCE AND COPYRIGHT

Copyright 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.
If you use it,
please let me know.

=cut

1;
