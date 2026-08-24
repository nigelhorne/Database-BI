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
- **Drag-and-drop upload** - any supported data file can be dropped directly
onto the application.  On the home page the file is opened immediately;
when the join panel is open the dropped file populates the right-table
path field.
- **Export** - the toolbar on any view offers an export panel that writes
the current logical view (after joins and filters) to a chosen filesystem
path as CSV (`.csv`) or SQLite (`.sql`).

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

- `GET /export`

    Exports the current logical view (same `l=`, `j=`, `f=` parameters as
    `/join`) as a file download.  Additional parameter:

        format=csv      (default) - RFC 4180 CSV; UTF-8; CRLF line endings
        format=sqlite   - SQLite 3 database with a single table named "data"

    The download filename is derived from the left table label with
    non-alphanumeric characters replaced by underscores.

- `POST /export`

    Writes the current logical view to a chosen filesystem path.
    Body params: `l=`, `j=`, `f=` (same as GET), plus
    `dir=` (target directory) and `filename=` (name including extension;
    extension determines format: `.csv` or `.sql`).
    Returns JSON `{ saved: "/abs/path" }` or `{ error: "..." }`.

- `GET /api/dirs`

    Returns a JSON directory listing (subdirectories only) for the export
    panel's inline directory browser.  Accepts `?path=` (defaults to
    `$HOME`).  Returns `{ path, parent, dirs: [{name, path}] }`.

- `GET /api/stat`

    Returns filesystem metadata for a file path (`?path=`).
    Returns `{ exists, path, mtime, size }`.  If the file does not exist,
    `exists` is `false` and the remaining fields are absent (HTTP 200).
    Returns HTTP 400 when `path` is missing.

- `POST /upload`

    Accepts a multipart file upload (field name: `file`), validates the
    extension, saves to a managed `.uploads/` subdirectory under the app
    home, and returns JSON `{ url, path }`.

# CONFIGURATION

Place a `database_bi.conf` file in the application root to override
defaults:

    {
        data_dir => 'data',   # directory scanned for data files on the home page
        platform => 'web',    # VWF template dimension
        language => 'en',     # VWF template dimension
    }

# LIMITATIONS

- Only read operations on data files are supported.  Write-back (editing
cell values in the browser and saving them to the data file) is not
implemented.
- The left-join engine (`Dashboard::_left_join`) is an in-memory O(n\*m)
hash join.  It is suitable for BI files that fit comfortably in RAM.
For very large files, replace the `open_table` helper body with a
`Database::Join` instance (Phase 2) without changing the controller.
- The `.uploads/` directory grows indefinitely; no automatic eviction is
performed.  Users may delete `.uploads/` at any time to reclaim space.
- `Sub::Private`/:Private enforcement relies on the CHECK compilation
phase.  When a module is loaded dynamically at test time (e.g. via
`Test::Mojo-`new(...)>), the CHECK phase has already passed and the
"Too late to run CHECK block" warning is emitted -- the private
restriction is not enforced in that context.  This is a known
limitation of `Sub::Private` and does not affect production
(morbo/hypnotoad) deployments where the module is compiled on startup.

# REPOSITORY

[https://github.com/nigelhorne/Database-BI](https://github.com/nigelhorne/Database-BI)

# SUPPORT

This module is provided as-is without any warranty.

# AUTHOR

Nigel Horne `<njh@nigelhorne.com>`

# LICENCE AND COPYRIGHT

Copyright 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.
If you use it,
please let me know.
