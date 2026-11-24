use strict;
use warnings;

# "no autodie" in a file that never says "use autodie" is not a harmless no-op.
# With autodie 2.29, which perl 5.28 ships, it leaves later calls to the
# builtins it covers (flock, unlink, ...) in that package as "Undefined
# subroutine called".  CPAN Testers saw it on perl 5.28.3 as a 500 from every
# route that saves, because saving takes a flock (Database-BI 0.024.0).
# Only a file that turns autodie on may turn it off.
#
#   prove -l t/no-stray-no-autodie.t

use Test::More;
use File::Find;

my @files;
find({ no_chdir => 1, wanted => sub { push @files, $_ if /\.pm\z/ || m{/script/[^/]+\z} && -f } }, 'lib', 'script');

ok(scalar @files, 'there are files to check');

for my $file (sort @files) {
	open my $fh, '<', $file or BAIL_OUT("cannot read $file: $!");
	my $text = do { local $/; <$fh> };
	close $fh;
	$text =~ s/\n__END__\n.*\z//s;    # not the POD
	$text =~ s/^\s*#.*$//mg;          # nor comments

	next unless $text =~ /\bno\s+autodie\b/;
	like($text, qr/\buse\s+autodie\b/, "$file: a 'no autodie' has a 'use autodie' to undo");
}

done_testing();
