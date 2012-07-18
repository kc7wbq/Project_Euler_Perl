use strict;
use warnings;
use Time::HiRes qw( time );

#my $n = 600851475143;
my $n = 6008514;  # takes 24+ seconds, answers back 58907
#my $n = 13195;
#my $n = 10;

my $start = Time::HiRes::gettimeofday();

my @all_numbers = ( 0 .. $n );
my @primes;

for ( my $i = 2 ; $i < $n ; $i++ ) {

    # A number will be zeroed out if it's found to be a composite, so don't
    # bother looking at it.
    #
    if ( $all_numbers[$i] != 0 ) {
        push( @primes, $i );
    }
    for ( my $j = 2 ; $j <= $i ; $j++ ) {
        my $cur_composite_index = $i * $j;

      # Once our multiplication has reached the target number, stop multiplying.
      #
        if ( $cur_composite_index > $n ) {
            last;
        }

        # This number was reached by multipling other numbers, so it's a
        # composit number.
        #
        $all_numbers[$cur_composite_index] = 0;
    }

}

my $prime_count = @primes;

while (@primes) {
    my $cur_prime = pop(@primes);
    if ( $n % $cur_prime == 0 ) {
        print "largest prime: $cur_prime\n";
        my $end = Time::HiRes::gettimeofday();
        printf( "%.4f\n", $end - $start );
        exit(0);
    }
}

# If we reach here we have a problem. At least 1 of the primes should be a factor of any number.

# my $end = Time::HiRes::gettimeofday();
# printf( "%.4f\n", $end - $start );
