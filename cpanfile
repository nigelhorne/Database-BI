# Generated from Makefile.PL using makefilepl2cpanfile

requires 'perl', '5.020';

requires 'Carp';
requires 'Database::Abstraction';
requires 'Mojolicious', '9.0';
requires 'Mojolicious::Plugin::TemplateToolkit';

on 'test' => sub {
	requires 'IPC::System::Simple';
	requires 'Test::Mojo';
	requires 'Test::Most';
};

on 'develop' => sub {
	requires 'Devel::Cover';
	requires 'Perl::Critic';
	requires 'Test::Pod';
	requires 'Test::Pod::Coverage';
};
