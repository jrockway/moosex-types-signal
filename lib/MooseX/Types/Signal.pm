package MooseX::Types::Signal;
# ABSTRACT: a type for UNIX signals

use MooseX::Types -declare => ['Signal'];
use MooseX::Types::Moose qw(Str Int);

1;

__END__

=head1 SYNOPSIS

C<MooseX::Types::Signal> exports a type, C<Signal>, that recognizes
valid signals on your platform.  The underlying type is a non-negative
number, but there is a coercion from strings to numbers that
recognizes signals by name.

   package Example;
   use MooseX::Types::Signal qw(Signal);
   use Moose;

   has 'kill_with' => (
       is     => 'rw',
       isa    => Signal,
       coerce => 1,
   );

   my $example = Example->new;

   # kill with SIGKILL
   $example->kill_with(9);
   $example->kill_with('KILL');
   $example->kill_with('SIGKILL');
