package Database::BI::Controller::Dashboard;

use Mojo::Base 'Mojolicious::Controller', -strict, -signatures;

sub index ($self) {
    my $conf     = $self->app->config;
    my $platform = $conf->{platform} // 'web';
    my $language = $self->_resolve_language($conf->{language} // 'en');

    my $records = $self->data_source->fetch_all;
    my @columns = $records->[0] ? sort keys %{ $records->[0] } : ();

    # VWF-style template resolution: templates/[platform]/[language]/[name].html.tt
    $self->render(
        template => "$platform/$language/dashboard",
        handler  => 'tt',
        format   => 'html',
        records  => $records,
        columns  => \@columns,
        title    => 'Dashboard',
    );
}

# Pick language from config; Accept-Language header can override in future.
sub _resolve_language ($self, $default) {
    my $accept = $self->req->headers->accept_language // '';
    my ($lang) = $accept =~ /\b([a-z]{2})(?:-[A-Z]{2})?\b/;
    return $lang // $default;
}

1;

=head1 NAME

Database::BI::Controller::Dashboard - Dashboard controller

=head1 DESCRIPTION

Fetches all records from the configured data source and renders them via the
VWF-style template hierarchy C<templates/[platform]/[language]/dashboard.html.tt>.

=cut
