# Generated from Makefile.PL using makefilepl2cpanfile

requires 'perl', '5.020';

requires 'Carp';
requires 'Database::Abstraction', '0.38';
requires 'Mojolicious', '9.0';
requires 'Mojolicious::Plugin::TemplateToolkit';
requires 'Params::Validate::Strict', '0.39';

on 'test' => sub {
	requires 'DBD::CSV';
	requires 'IPC::System::Simple';
	requires 'Test::Mojo';
	requires 'Test::Most';
	requires 'Text::xSV::Slurp';
};

on 'develop' => sub {
	requires 'Devel::Cover';
	requires 'Perl::Critic';
	requires 'Test::Pod';
	requires 'Test::Pod::Coverage';
};
