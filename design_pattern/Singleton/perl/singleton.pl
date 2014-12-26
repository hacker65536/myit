package MySingletonClass;
use strict;
use warnings;
use feature 'state';

sub new {
    my ($class) = @_;
    state $instance;

    if (! defined $instance) {
        $instance = bless {}, $class;
    }
    return $instance;
}
