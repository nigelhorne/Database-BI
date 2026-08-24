use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Database::BI',
    VERSION_FROM     => 'lib/Database/BI.pm',
    ABSTRACT_FROM    => 'lib/Database/BI.pm',
    AUTHOR           => 'Nigel Horne <njh@bandsman.co.uk>',
    LICENSE          => 'gpl_2',
    MIN_PERL_VERSION => '5.020',
    EXE_FILES        => ['script/database-bi'],
    PREREQ_PM => {
        'Carp'                                  => 0,
        'Database::Abstraction'                 => 0,
        'Mojolicious'                           => '9.0',
        'Mojolicious::Plugin::TemplateToolkit'  => 0,
    },
    TEST_REQUIRES => {
        'Test::More' => 0,
        'Test::Mojo' => 0,
    },
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url  => 'https://github.com/nigelhorne/Database-BI.git',
                web  => 'https://github.com/nigelhorne/Database-BI',
            },
            bugtracker => {
                web => 'https://github.com/nigelhorne/Database-BI/issues',
            },
        },
    },
);
