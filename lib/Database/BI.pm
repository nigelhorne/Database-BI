package Database::BI;

use Mojo::Base 'Mojolicious', -strict, -signatures;

use Database::BI::Model::DataSource;

our $VERSION = '0.01';

sub startup ($self) {
    $self->plugin('Config', {
        default => {
            data_dir   => 'data',
            data_table => 'sales',
            platform   => 'web',
            language   => 'en',
        }
    });

    $self->plugin('TemplateToolkit', {
        INCLUDE_PATH => $self->home->child('templates')->to_string,
        POST_CHOMP   => 1,
        TRIM         => 1,
    });

    # Instantiate once at startup so the controller stays free of DI concerns.
    # Phase 2: swap DataSource for a Database::Join-backed source here only.
    my $conf = $self->config;
    my $source = Database::BI::Model::DataSource->new(
        directory => $self->home->child($conf->{data_dir})->to_string,
        table     => $conf->{data_table},
    );
    $self->helper(data_source => sub { $source });

    my $r = $self->routes;
    $r->get('/')->to('Dashboard#index');
    $r->get('/dashboard')->to('Dashboard#index');
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

=head1 CONFIGURATION

Place a C<database_bi.conf> file in the application root to override defaults:

    {
        data_dir   => 'data',
        data_table => 'sales',
        platform   => 'web',
        language   => 'en',
    }

=head1 AUTHOR

Nigel Horne C<< <njh@bandsman.co.uk> >>

=head1 LICENSE

GPL-2.0

=cut
