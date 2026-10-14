package Database::BI::Calc;

use strict;
use warnings;

use Carp	qw(croak);
use POSIX	qw(floor ceil);
use Readonly;
use Scalar::Util	qw(looks_like_number);

our $VERSION = '0.001';

Readonly my $MAX_EXPR_LEN => 512;
Readonly my $MAX_DEPTH    => 20;

# --- token type constants ---
Readonly my $T_NUM    => 'NUM';
Readonly my $T_STR    => 'STR';
Readonly my $T_IDENT  => 'IDENT';
Readonly my $T_PLUS   => 'PLUS';
Readonly my $T_MINUS  => 'MINUS';
Readonly my $T_STAR   => 'STAR';
Readonly my $T_SLASH  => 'SLASH';
Readonly my $T_LPAREN => 'LPAREN';
Readonly my $T_RPAREN => 'RPAREN';
Readonly my $T_COMMA  => 'COMMA';
Readonly my $T_EOF    => 'EOF';

our %MESSAGES = (
    error_expr_too_long   => 'Expression too long (max %d characters)',
    error_expr_too_deep   => 'Expression nesting too deep (max %d levels)',
    error_unknown_fn      => "Unknown function '%s'",
    error_unknown_col     => "Unknown column '%s'",
    error_unexpected_tok  => "Unexpected token '%s' at position %d",
    error_expected_tok    => "Expected '%s' at position %d, got '%s'",
    error_unterminated    => 'Unterminated string at position %d',
    error_bad_char        => "Unexpected character '%s' at position %d",
    error_trailing        => "Unexpected token '%s' at position %d",
);

sub _fmt {
	my ($key, @args) = @_;
	return sprintf $MESSAGES{$key}, @args;
}

# --- built-in function dispatch table ---
# Each entry is a plain coderef; 'if' is handled specially in the parser
# for short-circuit evaluation (see _parse_call).

my %FUNCTIONS = (
	upper    => sub { defined $_[0] ? uc($_[0])      : undef },
	lower    => sub { defined $_[0] ? lc($_[0])      : undef },
	trim     => sub {
		return undef unless defined $_[0];
		my $s = $_[0];
		$s =~ s/\A\s+|\s+\z//g;
		$s;
	},
	len      => sub { defined $_[0] ? length($_[0])  : undef },
	concat   => sub { join '', map { defined $_ ? $_ : '' } @_ },
	substr   => sub {
		my ($s, $start, $len) = @_;
		return undef unless defined $s;
		$start //= 0;
		defined $len ? CORE::substr($s, $start, $len)
		             : CORE::substr($s, $start);
	},
	round    => sub {
		my ($n, $d) = @_;
		return undef unless defined $n && looks_like_number($n);
		$d = (defined $d && looks_like_number($d)) ? int($d) : 0;
		sprintf("%.${d}f", $n) + 0;
	},
	floor    => sub {
		defined $_[0] && looks_like_number($_[0]) ? POSIX::floor($_[0]) : undef;
	},
	ceil     => sub {
		defined $_[0] && looks_like_number($_[0]) ? POSIX::ceil($_[0]) : undef;
	},
	'abs'    => sub {
		defined $_[0] && looks_like_number($_[0]) ? CORE::abs($_[0]) : undef;
	},
	isnull   => sub { defined $_[0] ? $_[0] : $_[1] },
	coalesce => sub {
		for my $v (@_) { return $v if defined $v }
		return undef;
	},
	# 'if' is NOT here -- it is handled as a special form in _parse_call
	# so the true/false branches are short-circuit evaluated at runtime.
);

# ---------------------------------------------------------------------------
# Constructor
# ---------------------------------------------------------------------------

sub new {
	my ($class, %args) = @_;
	my $self = bless {
		_error   => undef,
		_code    => undef,
		_columns => {},
	}, $class;

	my $expr = $args{expr} // '';
	my @cols = @{ $args{columns} // [] };
	$self->{_columns}{$_} = 1 for @cols;

	if (length($expr) > $MAX_EXPR_LEN) {
		$self->{_error} = _fmt('error_expr_too_long', $MAX_EXPR_LEN);
		return $self;
	}

	my $tokens;
	my $ok = eval { $tokens = _tokenize($expr); 1 };
	unless ($ok) {
		my $err = $@; $err =~ s/ at \S+ line \d+\.?\n?$//;
		$self->{_error} = $err;
		return $self;
	}

	my $pos   = 0;
	my $depth = 0;
	my $code;
	$ok = eval { $code = _parse_expr($tokens, \$pos, \$depth, $self->{_columns}); 1 };
	unless ($ok) {
		my $err = $@; $err =~ s/ at \S+ line \d+\.?\n?$//;
		$self->{_error} = $err;
		return $self;
	}

	if ($tokens->[$pos]{type} ne $T_EOF) {
		$self->{_error} = _fmt('error_trailing',
			$tokens->[$pos]{val}, $tokens->[$pos]{pos});
		return $self;
	}

	$self->{_code} = $code;
	return $self;
}

# ---------------------------------------------------------------------------
# Public API
# ---------------------------------------------------------------------------

sub error     { $_[0]->{_error} }
sub has_error { defined $_[0]->{_error} }

sub evaluate {
	my ($self, $row) = @_;
	return undef unless defined $self->{_code};
	my $result;
	my $ok = eval { $result = $self->{_code}->($row); 1 };
	return undef unless $ok;
	return $result;
}

# ---------------------------------------------------------------------------
# Tokenizer
# ---------------------------------------------------------------------------

sub _tokenize {
	my ($expr) = @_;
	my @tokens;
	my $pos = 0;
	my $len = length($expr);
	my %single_ops = (
		'+' => $T_PLUS, '-' => $T_MINUS,
		'*' => $T_STAR, '/' => $T_SLASH,
		'(' => $T_LPAREN, ')' => $T_RPAREN, ',' => $T_COMMA,
	);

	while ($pos < $len) {
		my $ch = substr($expr, $pos, 1);

		# skip whitespace
		if ($ch =~ /\A\s/) { $pos++; next }

		# number literal (integer, decimal, scientific)
		if (substr($expr, $pos) =~ /\A(\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)/) {
			push @tokens, { type => $T_NUM, val => $1, pos => $pos };
			$pos += length($1);
			next;
		}

		# double-quoted string
		if ($ch eq '"') {
			my $end = index($expr, '"', $pos + 1);
			croak _fmt('error_unterminated', $pos) if $end < 0;
			push @tokens, {
				type => $T_STR,
				val  => substr($expr, $pos + 1, $end - $pos - 1),
				pos  => $pos,
			};
			$pos = $end + 1;
			next;
		}

		# single-quoted string
		if ($ch eq "'") {
			my $end = index($expr, "'", $pos + 1);
			croak _fmt('error_unterminated', $pos) if $end < 0;
			push @tokens, {
				type => $T_STR,
				val  => substr($expr, $pos + 1, $end - $pos - 1),
				pos  => $pos,
			};
			$pos = $end + 1;
			next;
		}

		# identifier: letters/digits/underscore, leading letter or _
		if (substr($expr, $pos) =~ /\A([a-zA-Z_][a-zA-Z0-9_]*)/) {
			push @tokens, { type => $T_IDENT, val => $1, pos => $pos };
			$pos += length($1);
			next;
		}

		# single-character operator/punctuation
		if (exists $single_ops{$ch}) {
			push @tokens, { type => $single_ops{$ch}, val => $ch, pos => $pos };
			$pos++;
			next;
		}

		croak _fmt('error_bad_char', $ch, $pos);
	}

	push @tokens, { type => $T_EOF, val => '', pos => $pos };
	return \@tokens;
}

# ---------------------------------------------------------------------------
# Parser  (each _parse_* returns a coderef  sub { my ($row) = @_; ... })
# ---------------------------------------------------------------------------

sub _check_depth {
	my ($depth_ref) = @_;
	croak _fmt('error_expr_too_deep', $MAX_DEPTH) if $$depth_ref >= $MAX_DEPTH;
}

sub _expect {
	my ($tokens, $pos_ref, $expected) = @_;
	my $tok = $tokens->[$$pos_ref];
	croak _fmt('error_expected_tok', $expected, $tok->{pos}, $tok->{val})
		unless $tok->{type} eq $expected;
	$$pos_ref++;
}

# expr ::= term ( ('+' | '-') term )*
sub _parse_expr {
	my ($tokens, $pos_ref, $depth_ref, $cols) = @_;
	_check_depth($depth_ref);
	$$depth_ref++;

	my $left = _parse_term($tokens, $pos_ref, $depth_ref, $cols);

	while ($tokens->[$$pos_ref]{type} eq $T_PLUS
	    || $tokens->[$$pos_ref]{type} eq $T_MINUS) {
		my $op = $tokens->[$$pos_ref]{type};
		$$pos_ref++;
		my $right = _parse_term($tokens, $pos_ref, $depth_ref, $cols);
		my ($l, $r) = ($left, $right);
		if ($op eq $T_PLUS) {
			$left = sub {
				my $lv = $l->($_[0]); my $rv = $r->($_[0]);
				return undef unless defined $lv && defined $rv;
				return undef unless looks_like_number($lv) && looks_like_number($rv);
				$lv + $rv;
			};
		} else {
			$left = sub {
				my $lv = $l->($_[0]); my $rv = $r->($_[0]);
				return undef unless defined $lv && defined $rv;
				return undef unless looks_like_number($lv) && looks_like_number($rv);
				$lv - $rv;
			};
		}
	}

	$$depth_ref--;
	return $left;
}

# term ::= factor ( ('*' | '/') factor )*
sub _parse_term {
	my ($tokens, $pos_ref, $depth_ref, $cols) = @_;

	my $left = _parse_factor($tokens, $pos_ref, $depth_ref, $cols);

	while ($tokens->[$$pos_ref]{type} eq $T_STAR
	    || $tokens->[$$pos_ref]{type} eq $T_SLASH) {
		my $op = $tokens->[$$pos_ref]{type};
		$$pos_ref++;
		my $right = _parse_factor($tokens, $pos_ref, $depth_ref, $cols);
		my ($l, $r) = ($left, $right);
		if ($op eq $T_STAR) {
			$left = sub {
				my $lv = $l->($_[0]); my $rv = $r->($_[0]);
				return undef unless defined $lv && defined $rv;
				return undef unless looks_like_number($lv) && looks_like_number($rv);
				$lv * $rv;
			};
		} else {
			$left = sub {
				my $lv = $l->($_[0]); my $rv = $r->($_[0]);
				return undef unless defined $lv && defined $rv;
				return undef unless looks_like_number($lv) && looks_like_number($rv);
				return undef if $rv == 0;
				$lv / $rv;
			};
		}
	}

	return $left;
}

# factor ::= unary | '(' expr ')' | number | string | column | call
sub _parse_factor {
	my ($tokens, $pos_ref, $depth_ref, $cols) = @_;
	my $tok = $tokens->[$$pos_ref];

	# unary minus
	if ($tok->{type} eq $T_MINUS) {
		$$pos_ref++;
		my $inner = _parse_factor($tokens, $pos_ref, $depth_ref, $cols);
		return sub {
			my $v = $inner->($_[0]);
			return undef unless defined $v && looks_like_number($v);
			-$v;
		};
	}

	# unary plus (no-op)
	if ($tok->{type} eq $T_PLUS) {
		$$pos_ref++;
		return _parse_factor($tokens, $pos_ref, $depth_ref, $cols);
	}

	# parenthesized sub-expression
	if ($tok->{type} eq $T_LPAREN) {
		$$pos_ref++;
		my $inner = _parse_expr($tokens, $pos_ref, $depth_ref, $cols);
		_expect($tokens, $pos_ref, $T_RPAREN);
		return $inner;
	}

	# number literal
	if ($tok->{type} eq $T_NUM) {
		my $val = $tok->{val} + 0;
		$$pos_ref++;
		return sub { $val };
	}

	# string literal
	if ($tok->{type} eq $T_STR) {
		my $val = $tok->{val};
		$$pos_ref++;
		return sub { $val };
	}

	# identifier -- function call or column reference
	if ($tok->{type} eq $T_IDENT) {
		my $name = $tok->{val};
		$$pos_ref++;
		return _tokens_ahead_is_lparen($tokens, $pos_ref)
			? _parse_call($tokens, $pos_ref, $depth_ref, $cols, $name, $tok->{pos})
			: _parse_colref($cols, $name, $tok->{pos});
	}

	croak _fmt('error_unexpected_tok', $tok->{val}, $tok->{pos});
}

sub _tokens_ahead_is_lparen {
	my ($tokens, $pos_ref) = @_;
	return $tokens->[$$pos_ref]{type} eq $T_LPAREN;
}

# Parse a function call.  'if' is a special form (short-circuit branches).
sub _parse_call {
	my ($tokens, $pos_ref, $depth_ref, $cols, $name, $name_pos) = @_;
	my $lc = lc($name);

	# validate function name at compile time
	croak _fmt('error_unknown_fn', $name)
		unless exists $FUNCTIONS{$lc} || $lc eq 'if';

	$$pos_ref++;	# consume '('
	my @arg_fns;
	if ($tokens->[$$pos_ref]{type} ne $T_RPAREN) {
		push @arg_fns, _parse_expr($tokens, $pos_ref, $depth_ref, $cols);
		while ($tokens->[$$pos_ref]{type} eq $T_COMMA) {
			$$pos_ref++;
			push @arg_fns, _parse_expr($tokens, $pos_ref, $depth_ref, $cols);
		}
	}
	_expect($tokens, $pos_ref, $T_RPAREN);

	# 'if' special form: short-circuit true/false branches
	if ($lc eq 'if') {
		my ($cond_fn, $true_fn, $false_fn) = @arg_fns;
		return sub {
			$cond_fn->($_[0]) ? $true_fn->($_[0]) : $false_fn->($_[0]);
		};
	}

	my $fn = $FUNCTIONS{$lc};
	return sub {
		my $row = $_[0];
		$fn->(map { $_->($row) } @arg_fns);
	};
}

# Parse a column reference; validates against the whitelist at compile time.
# Underscores in the expression may match spaces in the actual column name,
# so  account_number  can address a column named "Account Number".
sub _parse_colref {
	my ($cols, $name, $name_pos) = @_;

	my $lookup = $name;
	unless ($cols->{$lookup}) {
		(my $spaced = $name) =~ s/_/ /g;
		if ($cols->{$spaced}) {
			$lookup = $spaced;
		} else {
			croak _fmt('error_unknown_col', $name);
		}
	}

	return sub { $_[0]->{$lookup} };
}

1;

__END__

=head1 NAME

Database::BI::Calc - Safe recursive-descent expression evaluator for Database::BI

=head1 VERSION

0.001

=head1 SYNOPSIS

    use Database::BI::Calc;

    my $calc = Database::BI::Calc->new(
        expr    => 'round(amount * qty, 2)',
        columns => [qw(amount qty price discount name)],
    );

    die $calc->error if $calc->error;

    # evaluate against each data row
    for my $row (@rows) {
        my $val = $calc->evaluate($row);   # undef on runtime error
        $row->{extended} = $val;
    }

=head1 DESCRIPTION

A compile-once, evaluate-many expression engine. Expressions are parsed into
a pure-Perl closure tree at construction time. No C<eval> of user-supplied
strings is ever performed anywhere in this module.

=head1 CONSTRUCTOR

=head2 new(%args)

    my $calc = Database::BI::Calc->new(
        expr    => 'if(discount, price - discount, price)',
        columns => [qw(price discount)],
    );

Recognised keys:

=over 4

=item expr

The expression string. Maximum 512 characters.

=item columns

Arrayref of allowed column names. Any identifier in C<expr> that is not a
known function name must appear in this list (or must match when underscores
in the expression are replaced with spaces). Unknown identifiers cause a
compile-time error stored in C<error()>.

=back

Always check C<error()> after construction before calling C<evaluate()>.

=head1 METHODS

=head2 error

Returns the compile-time error string, or C<undef> if the expression compiled
successfully.

=head2 has_error

Returns true when C<error()> is defined.

=head2 evaluate(\%row)

Evaluates the compiled expression against a data row. Returns the computed
scalar value, or C<undef> on any runtime error (division by zero, non-numeric
operand, undef column value, etc.) rather than croaking.

=head1 OPERATORS

    +  addition         -  subtraction
    *  multiplication   /  division (division by zero -> undef)
    -x unary negation   +x unary identity
    (expr)  grouping

Operator precedence follows standard arithmetic: C<*> and C</> bind more
tightly than C<+> and C<->. Use parentheses to override.

=head1 BUILT-IN FUNCTIONS

    upper(s)                 uc($s)
    lower(s)                 lc($s)
    trim(s)                  strip leading/trailing whitespace
    len(s)                   length($s)
    concat(a, b, ...)        join('', ...), undef treated as ''
    substr(s, start)         0-based start, to end of string
    substr(s, start, len)    0-based start, len characters
    round(n, decimals)       sprintf-based rounding
    floor(n)                 POSIX::floor
    ceil(n)                  POSIX::ceil
    abs(n)                   absolute value
    if(cond, true, false)    short-circuit ternary (true/false branch not
                             evaluated unless needed)
    isnull(val, default)     val if defined, else default
    coalesce(v1, v2, ...)    first defined value

All arithmetic functions return C<undef> when a required numeric argument is
not defined or does not look like a number.

=head1 COLUMN NAMES WITH SPACES

Column names containing spaces can be referenced in expressions by replacing
the spaces with underscores. For example, a column named C<"Per Unit Price">
can be written as C<per_unit_price> in an expression. The constructor's
C<columns> list may contain the original name with spaces; the underscore form
is accepted in expressions automatically.

=head1 SECURITY

=over 4

=item *

No C<eval> of user-supplied strings is performed anywhere in this module.

=item *

Column references are validated at compile time against the C<columns>
whitelist passed to C<new()>. An unknown identifier causes C<new()> to record
an error in C<error()> and compile to a no-op.

=item *

Function names are validated against a hardcoded dispatch table. Unknown
function names are rejected at C<new()> time.

=item *

Expressions longer than 512 characters are rejected.

=item *

Nesting deeper than 20 levels is rejected.

=item *

Division by zero and undef/non-numeric operands return C<undef> rather than
croaking, so a bad row does not abort an entire export pipeline.

=back

=head1 DEPENDENCIES

L<POSIX>, L<Scalar::Util>, L<Readonly>, L<Carp> -- all present in the
Database::BI dependency set.

=head1 SEE ALSO

L<Database::BI>, L<Database::BI::Controller::Dashboard>

=head1 AUTHOR

Nigel Horne, C<< <njh@bandsman.co.uk> >>

=head1 LICENSE

Same terms as Database::BI.

=cut
