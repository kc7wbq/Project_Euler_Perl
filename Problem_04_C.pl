use strict;
use warnings;
use Time::HiRes qw( time );

my $palindrome = 0;

my $start = Time::HiRes::gettimeofday();

for ( my $n1 = 999 ; $n1 >= 100 ; $n1-- ) {
    for ( my $n2 = $n1 ; $n2 >= 100 ; $n2-- ) {
        my $n3 = $n1 * $n2;
        if ( ($n3 >= $palindrome) and (is_palindrome($n3))) {
            my $end = Time::HiRes::gettimeofday();            
            printf( "$n1 * $n1 = $n3 %.4f\n", $end - $start );
            $palindrome = $n3;            
        }
    }
}

# Returns "TRUE" if a number is a palindrom
#
# INPUT: an integer
#
# OUTPUT: true or false
#
sub is_palindrome {
    my @letters = split( //, $_[0] );
    my $front   = 0;
    my $back    = scalar(@letters) - 1;

    # print "front: $front\n";
    # print "back : $back\n";

    while ( $front < $back ) {
        if ( $letters[$front] ne $letters[$back] ) {
            return 0;
        }    # if
        $front++;
        $back--;
    }

    return 1;

}
