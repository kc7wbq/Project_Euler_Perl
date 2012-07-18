use strict;
use warnings;
use Time::HiRes qw( time );

#my $fib_max = 4000000;
my $fib_max = 10;
my $fib_cur = 1;
my $fib_old = 0;
my $fib_temp;
my $sum_even = 0;

my $start = Time::HiRes::gettimeofday();

while ( $fib_cur <= $fib_max ) {
    $fib_temp = $fib_cur;
    $fib_cur  = $fib_cur + $fib_old;
    $fib_old  = $fib_temp;

    if ( $fib_cur % 2 == 0 ) {
        $sum_even += $fib_cur;
    }
}
my $end = Time::HiRes::gettimeofday();

print "Sum of even fib: $sum_even\n";
printf("%.4f\n", $end - $start);

