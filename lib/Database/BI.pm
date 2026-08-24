package Database::BI;

use Mojo::Base 'Mojolicious', -strict, -signatures;

use Database::BI::Model::DataSource;

our $VERSION = '0.01';

sub startup ($self) {
    $self->plugin('Config', {
        default => {
            data_dir => 'data',
            platform => 'web',
            language => 'en',
        }
    });

    $self->plugin('TemplateToolkit', {
        INCLUDE_PATH => $self->home->child('templates')->to_string,
        POST_CHOMP   => 1,
        TRIM         => 1,
    });

    # Factory helper: opens any named table from the configured data directory.
    # Phase 2: replace the DataSource instantiation here with Database::Join —
    # the controller never changes.
    my $conf     = $self->config;
    my $data_dir = $self->home->child($conf->{data_dir})->to_string;

    $self->helper(open_table => sub ($c, $table) {
        Database::BI::Model::DataSource->new(
            directory => $data_dir,
            table     => $table,
        );
    });

    my $r = $self->routes;
    $r->get('/')->to('Dashboard#index');
    $r->get('/view/:table')->to('Dashboard#view');
}

1;

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

=head1 AUTHOR

Nigel Horne C<< <njh@bandsman.co.uk> >>

=head1 LICENSE

GPL-2.0

=cut
