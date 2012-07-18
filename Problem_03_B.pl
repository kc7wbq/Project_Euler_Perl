use strict;
use warnings;
use Time::HiRes qw( time );

my $n      = 600851475143;
my $n_half = 300425737571;

# my $n = 189689;
# my $n_half = $n / 2;
my @primes = (3);
my $start  = Time::HiRes::gettimeofday();

NEXTNUMBER: for ( my $i = 5 ; $i < $n_half ; $i += 2 ) {
    foreach my $cur_prime (@primes) {
        my $division = $i / $cur_prime;

        if ( is_whole($division) ) {
            next NEXTNUMBER;
        }
    }
    push( @primes, $i );
    # print "$i\n";

    my $division = $n / $i;
    if ( is_whole($division) ) {
        print "$i";
        
        my $end = Time::HiRes::gettimeofday();
        printf( " : %.4f\n", $end - $start );
    }
}

my $end = Time::HiRes::gettimeofday();
        printf("All done! %.4f\n", $end - $start );


# Given a number, returns true if number has decimals value.
#
#INPUT: a number.
#
#OUPUT: true/false
#
sub is_whole {

    my ($val) = $_[0];

    my $int = int($val);

    my $remain = $val - $int;

    return !$remain;

}
