# Compute the prime factorization of each number from 1 to 20, and multiply
# the greatest power of each prime together. 
# Brute force method.
# For range of 100: 25164150 in 0.0002 seconds.


use strict;
use warnings;
use Time::HiRes qw( time );
my $start = Time::HiRes::gettimeofday();

my $range_start   = 1;
my $range_end     = 10;
   $range_end     = 100;
my @range = ($range_start .. $range_end);

my $sum            = 0;
my $sum_of_squares = 0;
my $square_of_sums = 0;
foreach my $cur_number (@range) {  
  $sum += $cur_number;
  $sum_of_squares += $cur_number * $cur_number;  }

$square_of_sums = $sum * $sum;

my $difference = $square_of_sums - $sum_of_squares;print "Square of sums = $square_of_sums\n";
print "Sum of Squares = $sum_of_squares\n";
print "difference     = $difference\n";








my $end = Time::HiRes::gettimeofday();            
printf( "run time: %.4f\n", $end - $start );
