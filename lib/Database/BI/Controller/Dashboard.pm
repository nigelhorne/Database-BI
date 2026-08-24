package Database::BI::Controller::Dashboard;

use Mojo::Base 'Mojolicious::Controller', -strict, -signatures;
use Mojo::File;
use Mojo::JSON qw(encode_json);
use Mojo::Util qw(url_escape encode);
use File::Temp qw(tempfile tempdir);

# Supported file extensions that Database::Abstraction can read.
# Note: D::A probes ".sql" for SQLite databases (not ".sqlite").
my @SUPPORTED_EXT = qw( csv db sql xml psv );
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
        my %all = map { $_ => 1 } keys %{ $records->[0] };
        my $id  = do {
            my $c = $source->id_column;
            ($c && $all{$c}) ? $c : (sort keys %all)[0];
        };
        delete $all{$id};
        return ($id, sort keys %all);
    }
    return ();
}

# Apply one filter spec ("col:op:val") to an arrayref of record hashrefs.
# Returns a new (possibly shorter) arrayref.
sub _apply_filter_spec {
    my ($records, $spec) = @_;
    my ($col, $op, $val) = split /:/, $spec, 3;
    return $records unless defined $col && length $col
                        && defined $op  && length $op;
    $val //= '';
    return [grep {
        my $cell = defined $_->{$col} ? $_->{$col} : '';
        $op eq 'eq'       ? lc($cell) eq lc($val)            :
        $op eq 'ne'       ? lc($cell) ne lc($val)            :
        $op eq 'contains' ? index(lc($cell), lc($val)) != -1 :
        $op eq 'starts'   ? index(lc($cell), lc($val)) == 0  :
        $op eq 'lt'       ? $cell <  $val                    :
        $op eq 'le'       ? $cell <= $val                    :
        $op eq 'gt'       ? $cell >  $val                    :
        $op eq 'ge'       ? $cell >= $val                    :
        $op eq 'empty'    ? $cell eq ''                      :
        $op eq 'notempty' ? $cell ne ''                      :
        1
    } @$records];
}

# Read "f" query params, apply them to $records, and return the filtered
# arrayref plus a JSON string for the template (for pre-populating the UI).
sub _apply_filters ($self, $records) {
    my @specs = @{ $self->every_param('f') // [] };
    for my $s (@specs) {
        $records = _apply_filter_spec($records, $s);
    }
    my @parsed;
    for my $s (@specs) {
        my ($col, $op, $val) = split /:/, $s, 3;
        next unless defined $col && length $col && defined $op && length $op;
        push @parsed, { col => $col, op => $op, val => $val // '' };
    }
    my $json = encode_json(\@parsed);
    $json =~ s{</}{<\\/}g;
    return ($records, \@specs, $json);
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

# Encode one row as an RFC 4180 CSV line.
sub _csv_row {
    return join(',', map {
        my $f = $_ // '';
        $f =~ /[,"\r\n]/ ? do { (my $q = $f) =~ s/"/""/g; qq{"$q"} } : $f;
    } @_) . "\r\n";
}

# Build a base export URL for the current view (without &format=).
sub _build_export_url ($self, $left_spec, $join_specs, $filter_specs) {
    my $u = '/export?l=' . url_escape($left_spec);
    $u .= '&j=' . url_escape($_) for @$join_specs;
    $u .= '&f=' . url_escape($_) for @$filter_specs;
    return $u;
}

# ---------------------------------------------------------------------------
# Actions
# ---------------------------------------------------------------------------

# GET / - scan data_dir and present a list of available tables.
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

# GET /view/:table - open and display the chosen table.
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
        my %all = map { $_ => 1 } keys %{ $records->[0] };
        my $id  = do {
            my $c = $source->id_column;
            ($c && $all{$c}) ? $c : (sort keys %all)[0];
        };
        delete $all{$id};
        @columns = ($id, sort keys %all);
    }

    my ($filtered, $filter_specs, $filters_json) = $self->_apply_filters($records);

    $self->render(
        template         => "$platform/$language/dashboard",
        handler          => 'tt',
        format           => 'html',
        records          => $filtered,
        columns          => \@columns,
        table            => $table,
        title            => ucfirst($table),
        left_spec        => "table:$table",
        current_joins    => [],
        available_tables => $self->_scan_data_dir,
        join_summaries   => [],
        filter_specs     => $filter_specs,
        filters_json     => $filters_json,
        export_url       => $self->_build_export_url("table:$table", [], $filter_specs),
    );
}

# GET /browse - navigate the filesystem and pick a data file.
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

# GET /open - open a data file from any absolute filesystem path.
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
        my %all = map { $_ => 1 } keys %{ $records->[0] };
        my $id  = do {
            my $c = $source->id_column;
            ($c && $all{$c}) ? $c : (sort keys %all)[0];
        };
        delete $all{$id};
        @columns = ($id, sort keys %all);
    }

    my ($filtered, $filter_specs, $filters_json) = $self->_apply_filters($records);
    my $lspec = 'path:' . $file->to_string;

    $self->render(
        template         => "$platform/$language/dashboard",
        handler          => 'tt',
        format           => 'html',
        records          => $filtered,
        columns          => \@columns,
        table            => $table,
        title            => $filename,
        back_url         => $back,
        back_label       => 'Back to browser',
        file_path        => $file->to_string,
        left_spec        => $lspec,
        current_joins    => [],
        available_tables => $self->_scan_data_dir,
        join_summaries   => [],
        filter_specs     => $filter_specs,
        filters_json     => $filters_json,
        export_url       => $self->_build_export_url($lspec, [], $filter_specs),
    );
}

# GET /api/columns - return column names for a table as JSON.
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

# GET /join - perform one or more left joins and render the merged table.
#
# Query parameters:
#   l   = left table spec: "table:name" or "path:/abs/path"
#   j   = join spec (repeatable): "<right-spec>|<left-key>|<right-key>"
#
# Join semantics: left join - every left row is kept; columns from the right
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

    my ($filtered, $filter_specs, $filters_json) = $self->_apply_filters($records);

    my $title = $left_label;
    $title .= ' + ' . join(' + ', map { $_->{label} } @summaries) if @summaries;

    # Stable localStorage key: join:left:right1:right2:...
    my $table_key = 'join:' . lc($left_label);
    $table_key   .= ':' . lc($_->{label}) for @summaries;

    $self->render(
        template         => "$platform/$language/dashboard",
        handler          => 'tt',
        format           => 'html',
        records          => $filtered,
        columns          => \@columns,
        table            => $table_key,
        title            => $title,
        back_url         => $self->_spec_to_url($left_spec),
        back_label       => "Back to $left_label",
        left_spec        => $left_spec,
        current_joins    => \@join_specs,
        available_tables => $self->_scan_data_dir,
        join_summaries   => \@summaries,
        filter_specs     => $filter_specs,
        filters_json     => $filters_json,
        export_url       => $self->_build_export_url($left_spec, \@join_specs, $filter_specs),
    );
}

# Run the join+filter pipeline shared by all export actions.
# Returns ($records, \@columns, $left_label) on success, or () on failure.
sub _run_export_pipeline ($self) {
    my $left_spec = $self->param('l') // '';
    my ($left_src, $left_label) = $self->_open_spec($left_spec);
    return () unless $left_src;

    my $left_recs = eval { $left_src->fetch_all };
    return () if $@;
    $left_recs //= [];

    my @columns = _get_columns($left_src, $left_recs);
    my $records  = $left_recs;

    for my $jspec (@{ $self->every_param('j') }) {
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
    }

    for my $s (@{ $self->every_param('f') }) {
        $records = _apply_filter_spec($records, $s);
    }

    return ($records, \@columns, $left_label);
}

# GET /export -- stream the current logical view as a browser file download.
#
# Accepts: l=, j=, f= (same as /join), plus format=csv (default) or format=sqlite.
# Used for direct URL access and API testing.
sub export_data ($self) {
    my ($records, $columns, $left_label) = $self->_run_export_pipeline;
    return $self->reply->not_found unless $records;

    my $format = $self->param('format') // 'csv';
    $format    = 'csv' unless $format eq 'sqlite';
    (my $safe_name = lc $left_label) =~ s/[^a-z0-9_]+/_/g;

    return $format eq 'sqlite'
        ? $self->_render_sqlite($records, $columns, $safe_name)
        : $self->_render_csv($records, $columns, $safe_name);
}

# POST /export -- write the current logical view to a chosen filesystem path.
#
# Body params: dir= (target directory), filename= (name including extension).
# The extension determines the format: .csv -> RFC 4180 CSV, .sql -> SQLite.
# Returns JSON { saved => '/abs/path' } on success or { error => '...' } on failure.
sub export_write ($self) {
    my $dir      = $self->param('dir')      // '';
    my $filename = $self->param('filename') // '';

    # Resolve and validate target directory.
    my $dest_dir = eval { Mojo::File->new($dir)->realpath };
    unless (defined $dest_dir && -d $dest_dir) {
        return $self->render(json => { error => 'Directory not found' }, status => 404);
    }

    # Strip any path separators from the filename and validate extension.
    ($filename) = $filename =~ m{([^/\\]+)\z};
    my $format;
    if    ($filename && $filename =~ /\.csv$/i) { $format = 'csv';    }
    elsif ($filename && $filename =~ /\.sql$/i) { $format = 'sqlite'; }
    else {
        return $self->render(
            json   => { error => 'Use a .csv or .sql filename extension' },
            status => 415,
        );
    }

    my ($records, $columns, $left_label) = $self->_run_export_pipeline;
    return $self->render(json => { error => 'Table not found' }, status => 404)
        unless $records;

    my $dest = $dest_dir->child($filename);
    eval {
        if ($format eq 'csv') {
            my $out = _csv_row(@$columns);
            for my $row (@$records) {
                $out .= _csv_row(map { $row->{$_} } @$columns);
            }
            $dest->spurt(encode('UTF-8', $out));
        }
        else {
            require DBI;
            my ($tmp_fh, $tmpfile) = tempfile(SUFFIX => '.db', UNLINK => 0);
            close $tmp_fh;
            my $dbh = DBI->connect("dbi:SQLite:dbname=$tmpfile", '', '', {
                RaiseError => 1, AutoCommit => 1,
            });
            my @quoted = map { my $c = $_; $c =~ s/"/""/g; qq{"$c"} } @$columns;
            $dbh->do('CREATE TABLE "data" (' . join(', ', map { "$_ TEXT" } @quoted) . ')');
            if (@$records) {
                my $ph  = join(', ', ('?') x scalar @$columns);
                my $sth = $dbh->prepare(
                    'INSERT INTO "data" (' . join(', ', @quoted) . ") VALUES ($ph)"
                );
                for my $row (@$records) {
                    $sth->execute(map { $row->{$_} } @$columns);
                }
            }
            $dbh->disconnect;
            $dest->spurt(Mojo::File->new($tmpfile)->slurp);
            unlink $tmpfile;
        }
    };
    return $self->render(json => { error => "Write failed: $@" }, status => 500) if $@;

    $self->render(json => { saved => $dest->to_string });
}

# GET /api/dirs -- return a JSON directory listing (subdirs only) for the export panel.
sub dirs_api ($self) {
    my $raw = $self->param('path') // $ENV{HOME} // '/';
    my $dir = eval { Mojo::File->new($raw)->realpath };
    unless (defined $dir && -d $dir) {
        return $self->render(json => { error => 'Not a directory' }, status => 404);
    }

    my @dirs;
    if (opendir my $dh, $dir->to_string) {
        while (my $entry = readdir $dh) {
            next if $entry eq '.' || $entry eq '..';
            next if $entry =~ /\A\./;
            my $f = $dir->child($entry);
            push @dirs, { name => $entry, path => $f->to_string } if -d $f;
        }
        closedir $dh;
    }
    @dirs = sort { lc($a->{name}) cmp lc($b->{name}) } @dirs;

    my $parent = $dir->dirname;
    $self->render(json => {
        path   => $dir->to_string,
        parent => ($parent->to_string ne $dir->to_string ? $parent->to_string : undef),
        dirs   => \@dirs,
    });
}

sub _render_csv ($self, $records, $columns, $name) {
    my $out = _csv_row(@$columns);
    for my $row (@$records) {
        $out .= _csv_row(map { $row->{$_} } @$columns);
    }
    $self->res->headers->content_type('text/csv; charset=UTF-8');
    $self->res->headers->content_disposition(qq{attachment; filename="${name}.csv"});
    $self->render(data => encode('UTF-8', $out));
}

sub _render_sqlite ($self, $records, $columns, $name) {
    require DBI;

    my ($tmp_fh, $tmpfile) = tempfile(SUFFIX => '.db', UNLINK => 0);
    close $tmp_fh;

    my $dbh = DBI->connect("dbi:SQLite:dbname=$tmpfile", '', '', {
        RaiseError => 1,
        AutoCommit => 1,
    });

    my @quoted = map { my $c = $_; $c =~ s/"/""/g; qq{"$c"} } @$columns;
    $dbh->do('CREATE TABLE "data" (' . join(', ', map { "$_ TEXT" } @quoted) . ')');

    if (@$records) {
        my $ph  = join(', ', ('?') x scalar @$columns);
        my $sth = $dbh->prepare(
            'INSERT INTO "data" (' . join(', ', @quoted) . ") VALUES ($ph)"
        );
        for my $row (@$records) {
            $sth->execute(map { $row->{$_} } @$columns);
        }
    }

    $dbh->disconnect;
    my $data = Mojo::File->new($tmpfile)->slurp;
    unlink $tmpfile;

    $self->res->headers->content_type('application/vnd.sqlite3');
    $self->res->headers->content_disposition(qq{attachment; filename="${name}.db"});
    $self->render(data => $data);
}

# POST /upload - accept a drag-and-dropped data file, save it to a private
# temp directory under its original name, and return JSON { url, path } so the
# browser can navigate to /open?path=... or populate the join panel path field.
#
# The temp directory persists for the life of the process; files are typically
# small and this is a local single-user tool so disk growth is not a concern.
sub upload_file ($self) {
    my $upload = $self->req->upload('file');
    unless ($upload && $upload->filename) {
        return $self->render(json => { error => 'No file received' }, status => 400);
    }

    # Strip any path prefix the browser may include in the filename.
    (my $filename = $upload->filename) =~ s{.*[/\\]}{};
    unless ($filename && $filename =~ $EXT_RE) {
        return $self->render(
            json   => { error => 'Unsupported file type. Accepted: CSV, PSV, XML, SQLite (.sql)' },
            status => 415,
        );
    }

    my $tmp_dir = tempdir(CLEANUP => 0);
    my $dest    = Mojo::File->new($tmp_dir)->child($filename)->to_string;
    $upload->move_to($dest);

    my $url = '/open?path=' . url_escape($dest);
    $self->render(json => { url => $url, path => $dest });
}

sub _resolve_language ($self, $default) {
    my $accept = $self->req->headers->accept_language // '';
    my ($lang) = $accept =~ /\b([a-z]{2})(?:-[A-Z]{2})?\b/;
    return $lang // $default;
}

1;

=head1 NAME

Database::BI::Controller::Dashboard - Home picker, filesystem browser, table
viewer, left-join engine, and result filter

=head1 DESCRIPTION

All user-facing routes in C<Database::BI> are handled by this controller.

=head2 Actions

=over 4

=item C<index> - C<GET />

Scans the configured C<data_dir> for supported data files (CSV, PSV, SQLite,
XML) and renders a card grid.  The template also renders a "Recently opened"
section from C<localStorage> (client-side only; the server supplies an empty
placeholder).

=item C<view> - C<GET /view/:table>

Opens the named table from C<data_dir> via the C<open_table> helper, applies
any C<?f=col:op:val> filters from the query string, and renders
C<dashboard.html.tt>.  Table names must match C<[A-Za-z0-9_]+>; anything
else returns 404.

=item C<browse> - C<GET /browse>

Filesystem navigator.  Resolves C<?path=> through C<realpath> (returns 404
for non-existent or non-directory paths), then lists directories and
supported files as clickable links.  Defaults to C<$HOME>.

=item C<open_file> - C<GET /open>

Opens a supported data file from an arbitrary absolute path (C<?path=>).
The path is resolved through C<realpath> and checked against the supported
extension list before instantiating C<DataSource>.  Applies C<?f=> filters.
Sets C<file_path> in the stash so the template can record the file in
C<localStorage> "recently opened".

=item C<join_tables> - C<GET /join>

Performs one or more left joins in the order given by repeatable C<j=>
parameters, then applies any C<f=> result filters.

Query parameters:

  l=<spec>               Required. Left table spec: "table:name" or
                           "path:/abs/path".  Returns 404 if unresolvable.
  j=<spec>|<lk>|<rk>    Repeatable join step.  <spec> is a right-table
                           spec; <lk> and <rk> are the left and right key
                           column names.  Invalid or non-existent steps are
                           silently skipped.
  f=<col>:<op>:<val>     Repeatable result filter.  Applied server-side
                           after all joins.

Left-join semantics: every left row is kept.  Right-table columns are
appended for rows that match on the join key; unmatched rows get C<undef>
for all right-table columns.  If a right-table column name collides with a
left-table column name the right column is prefixed with
C<< right_label.colname >>.

=item C<columns_api> - C<GET /api/columns>

Returns C<{ "columns": [...] }> as JSON.  Accepts C<?table=name> (table
from C<data_dir>) or C<?path=/abs/path> (arbitrary file).  Returns 404
when the table or file cannot be found or resolved.  Used by the join panel
to populate the right-key dropdown without a page reload.

=item C<export_data> - C<GET /export>

Exports the current logical view as a file download.  Accepts the same
C<l=>, C<j=>, and C<f=> parameters as C<join_tables>, plus C<format=>:

  format=csv     (default) - RFC 4180 CSV, UTF-8, CRLF line endings;
                   generated without external dependencies.
  format=sqlite  - SQLite 3 database written via DBI/DBD::SQLite to a
                   temporary file, slurped, and returned as
                   application/vnd.sqlite3.  The single table is named
                   C<data>; every column is declared C<TEXT>.

Returns 404 if the left table spec is invalid or the table cannot be
opened.  An empty result set (all rows filtered out) exports correctly as
header-only CSV or an empty SQLite table.

=back

=head2 Filter operators

The C<f=col:op:val> filter spec supports:

  eq        case-insensitive string equality
  ne        case-insensitive string inequality
  contains  case-insensitive substring match
  starts    case-insensitive prefix match
  lt        numeric less-than
  le        numeric less-than-or-equal
  gt        numeric greater-than
  ge        numeric greater-than-or-equal
  empty     cell is undef or empty string (val ignored)
  notempty  cell is defined and non-empty (val ignored)

The colon separator is split with a limit of 3, so values may themselves
contain colons (e.g. C<f=sale_date:eq:2025-01-15>).

=head2 Private helpers

=over 4

=item C<_open_spec($spec)>

Parses a C<table:name> or C<path:/abs> spec, checks that the file exists
(C<Database::Abstraction> silently creates empty objects for missing files
- existence must be tested explicitly), and returns C<($datasource, $label)>
or an empty list on failure.

=item C<_apply_filter_spec($records, $spec)>

Standalone sub.  Parses C<col:op:val> and returns a filtered copy of the
records arrayref.

=item C<_apply_filters($self, $records)>

Reads all C<f=> query params, applies them in order via
C<_apply_filter_spec>, and returns C<($filtered, \@raw_specs, $json)>.
C<$json> is a script-safe JSON array of C<{col,op,val}> objects used to
pre-populate filter rows in the join panel.

=item C<_left_join(...)>

Standalone sub.  Performs a single left join and returns
C<(\@merged_records, \@merged_columns)>.

=item C<_get_columns($source, $records)>

Standalone sub.  Returns the ordered column list from the C<DataSource>
object, falling back to C<id_column>-first alphabetic order when the
backend does not expose column order (SQLite, XML).

=item C<_csv_row(@fields)>

Standalone sub.  Formats one row of values as an RFC 4180 CSV line (CRLF
terminated).  Fields containing commas, double-quotes, or newlines are
quoted; embedded double-quotes are doubled.

=item C<_build_export_url($self, $left_spec, \@join_specs, \@filter_specs)>

Method.  Builds a C</export?l=...&j=...&f=...> URL string from the current
view's parameters, suitable for use in HTML C<href> attributes (the caller
must apply C<| html> in TT to escape C<&> to C<&amp;>).

=item C<_render_csv($self, $records, \@columns, $name)>

Method.  Serialises C<$records> to RFC 4180 CSV and renders it as a UTF-8
download with C<Content-Disposition: attachment; filename="${name}.csv">.

=item C<_render_sqlite($self, $records, \@columns, $name)>

Method.  Creates a temporary SQLite database, inserts all records into a
table named C<data>, slurps the file, and renders it as a binary download
with C<Content-Disposition: attachment; filename="${name}.db">.  The
temporary file is unlinked immediately after reading.

=back

=cut
