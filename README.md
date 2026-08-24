# NAME

Database::BI - Web-based Business Intelligence viewer for flat data files

# SYNOPSIS

    # Development server (auto-reloads on file changes)
    morbo script/database-bi

    # Production server
    hypnotoad script/database-bi

# DESCRIPTION

`Database::BI` is a [Mojolicious](https://metacpan.org/pod/Mojolicious) web application that reads arbitrary
flat data files (CSV, PSV, SQLite, XML, etc.) via [Database::Abstraction](https://metacpan.org/pod/Database%3A%3AAbstraction)
and presents them as styled, sortable, reorderable HTML tables.

Key features:

- **File picker** - the home page scans `data_dir` and shows a card for
every supported file.  Recently opened filesystem files appear in a
"Recently opened" section powered by `localStorage`.
- **Filesystem browser** - `/browse` lets the user navigate the entire
filesystem and open any supported data file, not just files in `data_dir`.
- **Column sort and reorder** - clicking a header sorts the table; headers
are draggable to reorder.  Both settings are persisted in `localStorage`
by column name and survive page reloads.
- **Left join** - the "Add database / Filter results" panel on any table view
lets the user join one or more additional tables on a shared key.  Every
left row is kept; right-table columns are appended for matching rows.
- **Result filters** - the same panel lets the user add filter conditions
(column / operator / value) that are applied server-side after all joins.
Operators: `eq`, `ne`, `contains`, `starts`, `lt`, `le`, `gt`,
`ge`, `empty`, `notempty`.  Active filters are shown as chips in the
toolbar with a one-click "Clear" link.

# ROUTES

- `GET /`

    Scans `data_dir`, renders a card grid of available tables.

- `GET /view/:table`

    Opens the named table from `data_dir`.  Accepts `?f=col:op:val`
    (repeatable) to pre-filter results.

- `GET /browse`

    Filesystem navigator.  Accepts `?path=` to set the starting directory
    (defaults to `$HOME`).

- `GET /open`

    Opens any supported file by absolute path (`?path=`).  Accepts `?f=`
    filters.

- `GET /join`

    Performs one or more left joins and renders the merged table.  Parameters:

        l=<spec>               left table: "table:name" or "path:/abs/path"
        j=<spec>|<lk>|<rk>    join step (repeatable): right-spec, left key, right key
        f=<col>:<op>:<val>     result filter (repeatable)

- `GET /api/columns`

    Returns `{ "columns": [...] }` for a table (`?table=name`) or file
    (`?path=/abs/path`).  Used by the join UI to populate the right-key
    dropdown without a page reload.

# CONFIGURATION

Place a `database_bi.conf` file in the application root to override
defaults:

    {
        data_dir => 'data',   # directory scanned for data files on the home page
        platform => 'web',    # VWF template dimension
        language => 'en',     # VWF template dimension
    }

# AUTHOR

Nigel Horne `<njh@nigelhorne.com>`

# LICENCE AND COPYRIGHT

Copyright 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.
If you use it,
please let me know.
