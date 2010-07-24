package Router::Simple::Sinatraish;
use strict;
use warnings;
use parent qw/Exporter/;
use 5.00800;
our $VERSION = '0.01';
use Router::Simple;

our @EXPORT = qw/router any get post/;

# our $ROUTERS;
sub router {
    my $class = shift;
    no strict 'refs';
    ${"${class}::ROUTER"} ||= Router::Simple->new();
    # $ROUTERS->{$class} ||= Router::Simple->new();
}

# any [qw/get post delete/] => '/bye' => sub { ... };
# any '/bye' => sub { ... };
sub any($$;$) {
    my $pkg = caller(0);
    if (@_==3) {
        my ($methods, $pattern, $code) = @_;
        $pkg->router->connect(
            $pattern,
            {code => $code},
            { method => [ map { uc $_ } @$methods ] }
        );
    } else {
        my ($pattern, $code) = @_;
        $pkg->router->connect(
            $pattern,
            {code => $code},
        );
    }
}

sub get  {
    my $pkg = caller(0);
    $pkg->router->connect($_[0], {code => $_[1]}, {method => ['GET', 'HEAD']});
}
sub post {
    my $pkg = caller(0);
    $pkg->router->connect($_[0], {code => $_[1]}, {method => ['POST']});
}

1;
__END__

=encoding utf8

=head1 NAME

Router::Simple::Sinatraish -

=head1 SYNOPSIS

  use Router::Simple::Sinatraish;

=head1 DESCRIPTION

Router::Simple::Sinatraish is

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF GMAIL COME<gt>

=head1 SEE ALSO

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
