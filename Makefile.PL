use strict;
use warnings;
use ExtUtils::MakeMaker;

my $dist = {
	COMPRESS => 'gzip -9f',	# Compress tarball using gzip
	SUFFIX => 'gz',	# File suffix for tarball
};

if($^O eq 'darwin') {
	$dist->{'TAR'} = 'gtar';
}

WriteMakefile(
	NAME			 => 'Database::BI',
	VERSION_FROM	 => 'lib/Database/BI.pm',
	ABSTRACT_FROM => 'lib/Database/BI.pm',
	AUTHOR		   => 'Nigel Horne <njh@nigelhorne.com>',
	LICENSE		  => 'gpl_2',
	MIN_PERL_VERSION => '5.020',
	EXE_FILES	=> ['script/database-bi'],
	PREREQ_PM => {
		'Carp'						=> 0,
		'Database::Abstraction'	=> '0.38',
		'Mojolicious'				=> '9.0',
		'Mojolicious::Plugin::TemplateToolkit'  => 0,
		'Params::Validate::Strict'	=> '0.39',
	}, TEST_REQUIRES => {
		'DBD::CSV' => 0,
		'IPC::System::Simple' => 0,
		'Test::Most' => 0,
		'Test::Mojo' => 0,
		'Text::xSV::Slurp' => 0,
	}, dist => $dist,
	clean	=> { FILES => 'Database-BI-*' },
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
