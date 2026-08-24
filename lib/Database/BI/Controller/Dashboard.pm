package Database::BI::Controller::Dashboard;

use Mojo::Base 'Mojolicious::Controller', -strict, -signatures;
use Mojo::File;
use Mojo::Util qw(url_escape);

# Supported file extensions that Database::Abstraction can read.
my @SUPPORTED_EXT = qw( csv db sqlite xml psv );
my $EXT_RE = do { my $pat = join '|', @SUPPORTED_EXT; qr/\.(?:$pat)$/i };

# ---------------------------------------------------------------------------
# Private helpers
# ---------------------------------------------------------------------------

# Return arrayref of { name, file } for every supported file in data_dir.
sub _scan_data_dir ($self) {
    my $dir = $self->app->home->child($self->app->config->{data_dir} // 'data');
    return [] unless -d $dir;
    return [
        $dir->list
            ->grep(sub { $_->basename =~ $EXT_RE })
            ->map(sub {
                my $base = $_->basename;
                (my $name = $base) =~ s/\.[^.]+$//;
                { name => $name, file => $base }
            })->each
    ];
}

# Parse a spec string ("table:name" or "path:/abs/path") and return
# (DataSource, display-label).  Returns () on any failure.
sub _open_spec ($self, $spec) {
    if ($spec =~ /\Atable:([A-Za-z0-9_]+)\z/) {
        my $table    = lc $1;
        my $data_dir = $self->app->home->child($self->app->config->{data_dir} // 'data');
        # Database::Abstraction silently creates an empty object for missing files,
        # so we must check for the file ourselves before calling open_table.
        return () unless grep { -f $data_dir->child("$table.$_") } @SUPPORTED_EXT;
        my $src = eval { $self->open_table($table, directory => $data_dir->to_string) };
        return ($src, $table) if $src && !$@;
    }
    elsif ($spec =~ /\Apath:(.+)\z/) {
        my $path = $1;
        my $file = eval { Mojo::File->new($path)->realpath };
        if (defined $file && -f $file && $file->basename =~ $EXT_RE) {
            my $dir = $file->dirname->to_string;
            (my $table = $file->basename) =~ s/\.[^.]+$//;
            my $src = eval { $self->open_table(lc $table, directory => $dir) };
            return ($src, $file->basename) if $src && !$@;
        }
    }
    return ();
}

# Convert a spec string back to a browseable URL.
sub _spec_to_url ($self, $spec) {
    return "/view/$1"                               if $spec =~ /\Atable:([A-Za-z0-9_]+)\z/;
    return '/open?path=' . url_escape($1)           if $spec =~ /\Apath:(.+)\z/;
    return '/';
}

# Extract ordered column list from a DataSource + its fetched records.
# (standalone sub, not a method)
sub _get_columns {
    my ($source, $records) = @_;
    if ($source->columns) {
        return @{ $source->columns };
    }
    elsif ($records->[0]) {
        my $id  = $source->id_column // (sort keys %{ $records->[0] })[0];
        my %all = map { $_ => 1 } keys %{ $records->[0] };
        delete $all{$id};
        return ($id, sort keys %all);
    }
    return ();
}

# Left join: every left row is kept; matching right row's columns are appended.
# Columns shared between the two tables (other than the join key) are prefixed
# with right_label to avoid collisions.
# Returns (\@merged_records, \@merged_columns).
sub _left_join {
    my ($left_recs, $left_cols, $left_key,
        $right_recs, $right_cols, $right_key, $right_label) = @_;

    # Index right records by join key (first match wins).
    my %right_idx;
    for my $row (@$right_recs) {
        my $k = $row->{$right_key} // '';
        $right_idx{$k} //= $row;
    }

    # Map right column names: skip the join key (redundant), prefix collisions.
    my %left_set = map { $_ => 1 } @$left_cols;
    my @add_cols;
    my %col_map;
    for my $col (grep { $_ ne $right_key } @$right_cols) {
        my $out = $left_set{$col} ? "${right_label}.${col}" : $col;
        $col_map{$col} = $out;
        push @add_cols, $out;
    }

    my @merged;
    for my $left_row (@$left_recs) {
        my $k         = $left_row->{$left_key} // '';
        my $right_row = $right_idx{$k} // {};
        my %row       = %$left_row;
        for my $rcol (grep { $_ ne $right_key } @$right_cols) {
            $row{ $col_map{$rcol} } = $right_row->{$rcol};
        }
        push @merged, \%row;
    }

    return (\@merged, [@$left_cols, @add_cols]);
}

# ---------------------------------------------------------------------------
# Actions
# ---------------------------------------------------------------------------

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

    my @columns;
    if ($source->columns) {
        @columns = @{ $source->columns };
    }
    elsif ($records->[0]) {
        my $id  = $source->id_column // (sort keys %{ $records->[0] })[0];
        my %all = map { $_ => 1 } keys %{ $records->[0] };
        delete $all{$id};
        @columns = ($id, sort keys %all);
    }

    $self->render(
        template         => "$platform/$language/dashboard",
        handler          => 'tt',
        format           => 'html',
        records          => $records,
        columns          => \@columns,
        table            => $table,
        title            => ucfirst($table),
        left_spec        => "table:$table",
        current_joins    => [],
        available_tables => $self->_scan_data_dir,
        join_summaries   => [],
    );
}

# GET /browse — navigate the filesystem and pick a data file.
sub browse ($self) {
    my $conf     = $self->app->config;
    my $platform = $conf->{platform} // 'web';
    my $language = $self->_resolve_language($conf->{language} // 'en');

    my $raw_path = $self->param('path') // $ENV{HOME} // '/';
    my $dir      = eval { Mojo::File->new($raw_path)->realpath };
    unless (defined $dir && -d $dir) {
        return $self->reply->not_found;
    }

    my (@dirs, @files);
    if (opendir my $dh, $dir->to_string) {
        while (my $entry = readdir $dh) {
            next if $entry eq '.' || $entry eq '..';
            next if $entry =~ /\A\./;
            my $f = $dir->child($entry);
            if (-d $f) {
                push @dirs, {
                    name => $entry,
                    href => '/browse?path=' . url_escape($f->to_string),
                };
            }
            elsif ($entry =~ $EXT_RE) {
                push @files, {
                    name => $entry,
                    href => '/open?path=' . url_escape($f->to_string),
                };
            }
        }
        closedir $dh;
    }
    @dirs  = sort { lc $a->{name} cmp lc $b->{name} } @dirs;
    @files = sort { lc $a->{name} cmp lc $b->{name} } @files;

    my @crumbs;
    {
        my $f = $dir;
        while (1) {
            my $name = $f->basename;
            $name    = '/' unless length $name;
            unshift @crumbs, {
                name => $name,
                href => '/browse?path=' . url_escape($f->to_string),
            };
            my $parent = $f->dirname;
            last if $parent->to_string eq $f->to_string;
            $f = $parent;
        }
    }

    my $parent      = $dir->dirname;
    my $parent_href = $parent->to_string ne $dir->to_string
        ? '/browse?path=' . url_escape($parent->to_string)
        : undef;

    $self->render(
        template     => "$platform/$language/browse",
        handler      => 'tt',
        format       => 'html',
        title        => 'Browse Files',
        current_path => $dir->to_string,
        parent_href  => $parent_href,
        crumbs       => \@crumbs,
        dirs         => \@dirs,
        files        => \@files,
    );
}

# GET /open — open a data file from any absolute filesystem path.
sub open_file ($self) {
    my $conf      = $self->app->config;
    my $platform  = $conf->{platform} // 'web';
    my $language  = $self->_resolve_language($conf->{language} // 'en');
    my $file_path = $self->param('path');

    unless (defined $file_path) {
        return $self->reply->not_found;
    }

    my $file = eval { Mojo::File->new($file_path)->realpath };
    unless (defined $file && -f $file && $file->basename =~ $EXT_RE) {
        return $self->reply->not_found;
    }

    my $dir      = $file->dirname;
    (my $table   = $file->basename) =~ s/\.[^.]+$//;
    $table       = lc $table;
    my $back     = '/browse?path=' . url_escape($dir->to_string);
    my $filename = $file->basename;

    my $source  = $self->open_table($table, directory => $dir->to_string);
    my $records = eval { $source->fetch_all };
    if ($@) {
        $self->render(
            template   => "$platform/$language/home",
            handler    => 'tt',
            format     => 'html',
            tables     => [],
            title      => 'Error',
            error      => "Could not open '$filename': $@",
            back_url   => $back,
            back_label => 'Back to browser',
        );
        return;
    }

    my @columns;
    if ($source->columns) {
        @columns = @{ $source->columns };
    }
    elsif ($records->[0]) {
        my $id  = $source->id_column // (sort keys %{ $records->[0] })[0];
        my %all = map { $_ => 1 } keys %{ $records->[0] };
        delete $all{$id};
        @columns = ($id, sort keys %all);
    }

    $self->render(
        template         => "$platform/$language/dashboard",
        handler          => 'tt',
        format           => 'html',
        records          => $records,
        columns          => \@columns,
        table            => $table,
        title            => $filename,
        back_url         => $back,
        back_label       => 'Back to browser',
        file_path        => $file->to_string,
        left_spec        => 'path:' . $file->to_string,
        current_joins    => [],
        available_tables => $self->_scan_data_dir,
        join_summaries   => [],
    );
}

# GET /api/columns — return column names for a table as JSON.
# Used by the join UI to populate the right-key dropdown without a page reload.
sub columns_api ($self) {
    my $table_name = $self->param('table');
    my $path       = $self->param('path');

    my $source;
    if (defined $table_name && $table_name =~ /\A[A-Za-z0-9_]+\z/) {
        my $data_dir = $self->app->home->child($self->app->config->{data_dir} // 'data');
        return $self->render(json => { error => 'not found' }, status => 404)
            unless grep { -f $data_dir->child(lc($table_name) . ".$_") } @SUPPORTED_EXT;
        $source = eval { $self->open_table(lc $table_name, directory => $data_dir->to_string) };
    }
    elsif (defined $path) {
        my $file = eval { Mojo::File->new($path)->realpath };
        if (defined $file && -f $file && $file->basename =~ $EXT_RE) {
            my $dir = $file->dirname->to_string;
            (my $tbl = $file->basename) =~ s/\.[^.]+$//;
            $source = eval { $self->open_table(lc $tbl, directory => $dir) };
        }
    }

    unless ($source) {
        return $self->render(json => { error => 'not found' }, status => 404);
    }

    my @cols;
    if ($source->columns) {
        @cols = @{ $source->columns };
    }
    else {
        my $recs = eval { $source->fetch_all } // [];
        @cols = $recs->[0] ? sort keys %{ $recs->[0] } : ();
    }

    $self->render(json => { columns => \@cols });
}

# GET /join — perform one or more left joins and render the merged table.
#
# Query parameters:
#   l   = left table spec: "table:name" or "path:/abs/path"
#   j   = join spec (repeatable): "<right-spec>|<left-key>|<right-key>"
#
# Join semantics: left join — every left row is kept; columns from the right
# table are appended for matching rows, or left undef when there is no match.
sub join_tables ($self) {
    my $conf     = $self->app->config;
    my $platform = $conf->{platform} // 'web';
    my $language = $self->_resolve_language($conf->{language} // 'en');

    my $left_spec = $self->param('l') // '';
    my ($left_src, $left_label) = $self->_open_spec($left_spec);
    return $self->reply->not_found unless $left_src;

    my $left_recs = eval { $left_src->fetch_all };
    if ($@) {
        return $self->render(
            template => "$platform/$language/home", handler => 'tt', format => 'html',
            tables => [], title => 'Error', error => "Could not open table: $@",
        );
    }
    $left_recs //= [];

    my @left_cols = _get_columns($left_src, $left_recs);
    my @join_specs = @{ $self->every_param('j') };

    my $records    = $left_recs;
    my @columns    = @left_cols;
    my @summaries;

    for my $jspec (@join_specs) {
        my ($right_spec, $left_key, $right_key) = split /\|/, $jspec, 3;
        next unless defined $right_spec && defined $left_key && defined $right_key;
        next unless grep { $_ eq $left_key } @columns;

        my ($right_src, $right_label) = $self->_open_spec($right_spec);
        next unless $right_src;

        my $right_recs = eval { $right_src->fetch_all } // [];
        next if $@;
        my @right_cols = _get_columns($right_src, $right_recs);
        next unless grep { $_ eq $right_key } @right_cols;

        ($records, my $new_cols) = _left_join(
            $records, \@columns, $left_key,
            $right_recs, \@right_cols, $right_key, $right_label,
        );
        @columns = @$new_cols;
        push @summaries, { label => $right_label, left_key => $left_key, right_key => $right_key };
    }

    my $title = $left_label;
    $title .= ' + ' . join(' + ', map { $_->{label} } @summaries) if @summaries;

    # Stable localStorage key: join:left:right1:right2:...
    my $table_key = 'join:' . lc($left_label);
    $table_key   .= ':' . lc($_->{label}) for @summaries;

    $self->render(
        template         => "$platform/$language/dashboard",
        handler          => 'tt',
        format           => 'html',
        records          => $records,
        columns          => \@columns,
        table            => $table_key,
        title            => $title,
        back_url         => $self->_spec_to_url($left_spec),
        back_label       => "Back to $left_label",
        left_spec        => $left_spec,
        current_joins    => \@join_specs,
        available_tables => $self->_scan_data_dir,
        join_summaries   => \@summaries,
    );
}

sub _resolve_language ($self, $default) {
    my $accept = $self->req->headers->accept_language // '';
    my ($lang) = $accept =~ /\b([a-z]{2})(?:-[A-Z]{2})?\b/;
    return $lang // $default;
}

1;

=head1 NAME

Database::BI::Controller::Dashboard - Home picker, table viewer, and join engine

=head1 DESCRIPTION

C<index> scans the configured C<data_dir> and presents clickable links for
every supported data file it finds.

C<view> opens the selected table via the C<open_table> helper and renders it
using the VWF-style path C<templates/[platform]/[language]/dashboard.html.tt>.

C<join_tables> accepts a left table spec (C<l=>) and zero or more join specs
(C<j=>), performs left joins in sequence, and renders the merged result using
the same dashboard template.

C<columns_api> returns a JSON array of column names for a given table or path,
used by the join UI to populate the right-key dropdown.

=cut
