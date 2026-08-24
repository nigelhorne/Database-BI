# NAME

Database::BI - Web-based Business Intelligence tool

# SYNOPSIS

    morbo script/database-bi

# DESCRIPTION

A Mojolicious web application that reads data via [Database::Abstraction](https://metacpan.org/pod/Database%3A%3AAbstraction)
and presents it as styled HTML tables, with a VWF-style template hierarchy
for multi-platform, multi-language support.

The home page scans `data_dir` for supported data files and presents a
picker.  Selecting one opens `/view/:table`.

# CONFIGURATION

Place a `database_bi.conf` file in the application root to override defaults:

    {
        data_dir => 'data',
        platform => 'web',
        language => 'en',
    }

# AUTHOR

Nigel Horne `<njh@nigelhorne.com>`

# LICENCE AND COPYRIGHT

Copyright 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.
If you use it,
please let me know.
