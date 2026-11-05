package Database::BI::SafeUA;

use strict;
use warnings;

our $VERSION = '0.021.0';

use parent 'LWP::UserAgent';

use HTTP::Response;
use Readonly;
use Socket qw(getaddrinfo getnameinfo inet_aton inet_ntoa inet_pton AF_INET AF_INET6 SOCK_STREAM NI_NUMERICHOST NIx_NOSERV);

# The fetcher for url: sources and /import.  A page that names a URL gets the
# server to fetch it, so the URL must not lead to this machine or a private
# network (SSRF): an admin page on 127.0.0.1, a database on 10.x, a cloud's
# metadata service on 169.254.169.254.  Checking the URL's text is not enough
# (a name such as localtest.me, or one whose DNS answers 127.0.0.1, says
# nothing in its text), and resolving it first is not enough either: LWP
# resolves again when it connects, and a name can answer differently the
# second time (DNS rebinding).  So every request, redirects included, is
# resolved here, refused if any address is not public, and sent to the
# address that was checked, with the name kept for the Host header, the TLS
# server name and the certificate check.

Readonly my $MAX_REDIRECT => 5;
Readonly my $TIMEOUT      => 30;

# [ network, prefix length, why ] for IPv4 and IPv6.  An address in any of them
# is refused.
Readonly my @V4_BLOCKED => (
	[ '0.0.0.0',       8, 'not an address' ],
	[ '10.0.0.0',      8, 'a private network' ],
	[ '100.64.0.0',   10, 'a shared (carrier) network' ],
	[ '127.0.0.0',     8, 'this machine' ],
	[ '169.254.0.0',  16, 'link-local, where cloud metadata services are' ],
	[ '172.16.0.0',   12, 'a private network' ],
	[ '192.0.0.0',    24, 'reserved' ],
	[ '192.0.2.0',    24, 'reserved for documentation' ],
	[ '192.168.0.0',  16, 'a private network' ],
	[ '198.18.0.0',   15, 'reserved for testing' ],
	[ '198.51.100.0', 24, 'reserved for documentation' ],
	[ '203.0.113.0',  24, 'reserved for documentation' ],
	[ '224.0.0.0',     4, 'multicast' ],
	[ '240.0.0.0',     4, 'reserved' ],
);
Readonly my @V6_BLOCKED => (
	[ '::',             128, 'not an address' ],
	[ '::1',            128, 'this machine' ],
	[ '100::',           64, 'reserved' ],
	[ '2001:db8::',      32, 'reserved for documentation' ],
	[ 'fc00::',           7, 'a private network' ],
	[ 'fe80::',          10, 'link-local' ],
	[ 'fec0::',          10, 'a private network' ],
	[ 'ff00::',           8, 'multicast' ],
);

sub _in_net {
	my ($packed, $net, $bits) = @_;
	my $full = int($bits / 8);
	return 0 unless substr($packed, 0, $full) eq substr($net, 0, $full);
	my $rest = $bits % 8 or return 1;
	my $mask = (0xff << (8 - $rest)) & 0xff;
	return (ord(substr($packed, $full, 1)) & $mask) == (ord(substr($net, $full, 1)) & $mask) ? 1 : 0;
}

sub blocked_address {
	my ($ip) = @_;
	return 'not an address' unless defined $ip && length $ip;
	(my $bare = $ip) =~ s/\A\[|\]\z//g;
	$bare =~ s/%.*\z//;	# a zone index (fe80::1%eth0)

	if ($bare =~ /:/) {
		my $packed = inet_pton(AF_INET6, $bare) // return 'not an address';
		# IPv4 inside IPv6: mapped (::ffff:a.b.c.d), NAT64 (64:ff9b::a.b.c.d),
		# compatible (::a.b.c.d) and 6to4 (2002:aabb:ccdd::) all reach that
		# IPv4 address, so it is the one checked.
		for my $prefix ("\0" x 10 . "\xff\xff", "\0\x64\xff\x9b" . "\0" x 8, "\0" x 12) {
			return blocked_address(inet_ntoa(substr($packed, 12, 4)))
				if substr($packed, 0, 12) eq $prefix && $packed ne "\0" x 15 . "\1" && $packed ne "\0" x 16;
		}
		return blocked_address(inet_ntoa(substr($packed, 2, 4))) if substr($packed, 0, 2) eq "\x20\x02";
		for my $net (@V6_BLOCKED) {
			return $net->[2] if _in_net($packed, inet_pton(AF_INET6, $net->[0]), $net->[1]);
		}
		return undef;
	}

	my $packed = inet_pton(AF_INET, $bare) // return 'not an address';
	for my $net (@V4_BLOCKED) {
		return $net->[2] if _in_net($packed, inet_pton(AF_INET, $net->[0]), $net->[1]);
	}
	return undef;
}

sub numeric_host {
	my ($host) = @_;
	return undef unless defined $host;
	(my $h = lc $host) =~ s/\.\z//;
	if ($h =~ /\A\[([0-9a-f:.%a-z]+)\]\z/) {
		my $inner = $1;
		return $inner =~ /:/ ? $inner : undef;
	}
	return $h if $h =~ /:/ && defined inet_pton(AF_INET6, $h);
	# The forms inet_aton (and so the resolver) reads as an address: 127.1,
	# 2130706433, 0x7f000001, 0177.0.0.1.
	return undef unless $h =~ /\A(?:0x[0-9a-f]+|[0-9]+)(?:\.(?:0x[0-9a-f]+|[0-9]+)){0,3}\z/;
	my $packed = inet_aton($h) // return undef;
	return inet_ntoa($packed);
}

sub resolve_host {
	my ($host) = @_;
	local ($@, $!);
	my ($err, @res) = getaddrinfo($host, undef, { socktype => SOCK_STREAM });
	return () if $err;
	my (%seen, @ips);
	for my $r (@res) {
		my ($e, $ip) = getnameinfo($r->{addr}, NI_NUMERICHOST, NIx_NOSERV);
		push @ips, $ip if !$e && defined $ip && !$seen{$ip}++;
	}
	return @ips;
}

sub new {
	my ($class, %args) = @_;
	my $resolve = delete $args{resolve};
	my $private = delete $args{private_hosts};
	my $self = $class->SUPER::new(
		timeout           => $TIMEOUT,
		max_redirect      => $MAX_REDIRECT,
		protocols_allowed => [ 'http', 'https' ],
		agent             => "Database-BI/$VERSION",
		%args,
	);
	$self->{bi_resolve} = ref($resolve) eq 'CODE' ? $resolve : \&resolve_host;
	$self->{bi_private} = [ map { lc } grep { defined && !ref } @{ ref($private) eq 'ARRAY' ? $private : [] } ];
	return $self;
}

sub private_host_allowed {
	my ($self, $host) = @_;
	$host = lc($host // '');
	for my $name (@{ $self->{bi_private} }) {
		return 1 if $name eq $host;
		return 1 if $name =~ /\A\*(\..+)\z/ && length($host) > length($1) && substr($host, -length $1) eq $1;
	}
	return 0;
}

sub _refuse {
	my ($request, $why) = @_;
	my $res = HTTP::Response->new(403, "Refused: $why");
	$res->header('Client-Warning' => 'Internal response');
	$res->request($request);
	return $res;
}

sub send_request {
	my ($self, $request, $arg, $size) = @_;
	my $uri    = $request->uri;
	my $scheme = lc($uri->scheme // '');
	return _refuse($request, 'only http and https addresses are fetched')
		unless $scheme eq 'http' || $scheme eq 'https';
	(my $name = lc($uri->host // '')) =~ s/\.\z//;
	return _refuse($request, 'the address names no host') unless length $name;

	my $literal = numeric_host($name);
	my @addrs   = defined $literal ? ($literal) : $self->{bi_resolve}->($name);
	return _refuse($request, "$name was not found") unless @addrs;
	unless (!defined $literal && $self->private_host_allowed($name)) {
		for my $ip (@addrs) {
			my $why = blocked_address($ip) // next;
			return _refuse($request, $ip eq $name ? "$name is $why" : "$name is $ip, which is $why");
		}
	}

	# Connect to the address checked, not to the name again.
	my $pinned = $request->clone;
	my $to     = $uri->clone;
	$to->host($addrs[0] =~ /:/ ? "[$addrs[0]]" : $addrs[0]);
	$pinned->uri($to);
	my $authority = $uri->authority;
	$authority =~ s/\A[^\@]*\@//;
	$pinned->header(Host => $authority);
	local $self->{ssl_opts} = $scheme eq 'https'
		? { %{ $self->{ssl_opts} // {} }, SSL_hostname => $uri->host, SSL_verifycn_name => $uri->host }
		: $self->{ssl_opts};

	my $res = $self->SUPER::send_request($pinned, $arg, $size);
	$res->request($request);
	return $res;
}

1;

__END__

=head1 NAME

Database::BI::SafeUA - Fetch a URL only if it leads to the public internet

=head1 VERSION

0.021.0

=head1 SYNOPSIS

    my $ua  = Database::BI::SafeUA->new(private_hosts => ['intranet.example.com']);
    my $res = $ua->get('https://example.com/table.html');
    # http://localtest.me/ -> 403 "Refused: localtest.me is 127.0.0.1, which is this machine"

=head1 DESCRIPTION

An L<LWP::UserAgent> for C<url:> sources and C</import>.  Every request,
including each redirect (at most 5), is resolved, refused with a C<403>
response if any address is on this machine, a private or shared network,
link-local (cloud metadata services), multicast or reserved, and then sent to
the address that was checked.  The name stays in the C<Host> header, the TLS
server name (SNI) and the certificate check, so DNS that answers differently
on a second lookup (rebinding) changes nothing.  An IPv4 address inside IPv6
(mapped, NAT64, compatible, 6to4) is checked as that IPv4 address.  Only
C<http> and C<https> are fetched.

=head1 METHODS

=head2 new

=head3 API SPECIFICATION

=head4 INPUT

    private_hosts: arrayref of host names, optional; names (or *.suffix) that
                   may resolve to private addresses (an intranet).  An address
                   written as such is never one of them.
    resolve:       code ref, optional; host -> list of address strings (tests)
    anything else: as LWP::UserAgent->new (timeout 30, max_redirect 5 by default)

=head4 OUTPUT

The user agent.

=head2 send_request

As L<LWP::UserAgent/send_request>, with the checks above.  A refused request
gets C<403> with the reason in the message, and C<Client-Warning: Internal
response>; nothing is sent.

=head1 FUNCTIONS

=head2 blocked_address

    my $why = Database::BI::SafeUA::blocked_address('10.1.2.3');   # 'a private network'

=head3 API SPECIFICATION

=head4 INPUT

    $ip: an IPv4 or IPv6 address as text (brackets and a zone index are allowed)

=head4 OUTPUT

Why the address is refused, or C<undef> when it is public.  Text that is not
an address is refused.

=head2 numeric_host

    numeric_host('2130706433');   # '127.0.0.1'
    numeric_host('example.com');  # undef

=head3 API SPECIFICATION

=head4 INPUT

    $host: a URL's host

=head4 OUTPUT

The address the host is when it is written as one, in any form the resolver
reads (C<127.1>, C<0x7f000001>, C<0177.0.0.1>, C<[::1]>), else C<undef>.

=head2 resolve_host

=head3 API SPECIFICATION

=head4 INPUT

    $host: a host name

=head4 OUTPUT

Its addresses (getaddrinfo), or an empty list.

=head1 AUTHOR

Nigel Horne C<< <njh@nigelhorne.com> >>

=head1 LICENCE AND COPYRIGHT

Copyright 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.

=cut
