package Database::BI::Controller::Dashboard;

use Mojo::Base 'Mojolicious::Controller', -strict, -signatures;
use Mojo::File;

# Supported file extensions that Database::Abstraction can read.
my @SUPPORTED_EXT = qw( csv db sqlite xml psv );
my $EXT_RE = do { my $pat = join '|', @SUPPORTED_EXT; qr/\.(?:$pat)$/i };

# GET / — scan data_dir and present a list of available tables.
sub index ($self) {
    my $conf     = $self->app->config;
    my $platform = $conf->{platform} // 'web';
    my $language = $self->_resolve_language($conf->{language} // 'en');

    my $dir_path = $self->app->home->child($conf->{data_dir});
    my @tables;
    if (-d $dir_path) {
        @tables = $dir_path->list
            ->grep(sub { $_->basename =~ $EXT_RE })
            ->map(sub {
                my $base = $_->basename;
                (my $name = $base) =~ s/\.[^.]+$//;
                { name => $name, file => $base }
            })->each;
    }

    $self->render(
        template => "$platform/$language/home",
        handler  => 'tt',
        format   => 'html',
        tables   => \@tables,
        title    => 'Choose a Database',
    );
}

# GET /view/:table — open and display the chosen table.
sub view ($self) {
    my $conf     = $self->app->config;
    my $platform = $conf->{platform} // 'web';
    my $language = $self->_resolve_language($conf->{language} // 'en');
    my $table    = $self->stash('table');

    # Prevent path traversal: table names are bare identifiers only.
    unless (defined $table && $table =~ /\A[A-Za-z0-9_]+\z/) {
        return $self->reply->not_found;
    }

    my $source  = $self->open_table($table);
    my $records = eval { $source->fetch_all };
    if ($@) {
        $self->render(
            template => "$platform/$language/home",
            handler  => 'tt',
            format   => 'html',
            tables   => [],
            title    => 'Choose a Database',
            error    => "Could not open table '$table': $@",
        );
        return;
    }

    # Prefer the file's own column order (CSV/PSV header line).
    # Fall back to putting the id column first then sorting the rest;
    # hash key order in Perl is non-deterministic so a plain sort is
    # no worse than the alternative for backends that don't expose order.
    my @columns;
    if ($source->columns) {
        @columns = @{ $source->columns };
    } elsif ($records->[0]) {
        my $id  = $source->id_column // (sort keys %{ $records->[0] })[0];
        my %all = map { $_ => 1 } keys %{ $records->[0] };
        delete $all{$id};
        @columns = ($id, sort keys %all);
    }

    $self->render(
        template => "$platform/$language/dashboard",
        handler  => 'tt',
        format   => 'html',
        records  => $records,
        columns  => \@columns,
        table    => $table,
        title    => ucfirst($table),
    );
}

sub _resolve_language ($self, $default) {
    my $accept = $self->req->headers->accept_language // '';
    my ($lang) = $accept =~ /\b([a-z]{2})(?:-[A-Z]{2})?\b/;
    return $lang // $default;
}

1;

=head1 NAME

Database::BI::Controller::Dashboard - Home picker and table viewer

=head1 DESCRIPTION

C<index> scans the configured C<data_dir> and presents clickable links for
every supported data file it finds.

C<view> opens the selected table via the C<open_table> helper and renders it
using the VWF-style path C<templates/[platform]/[language]/dashboard.html.tt>.

=cut
