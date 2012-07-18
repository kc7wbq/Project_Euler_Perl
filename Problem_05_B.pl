# Compute the prime factorization of each number from 1 to 20, and multiply
# the greatest power of each prime together. 

use strict;
use warnings;
use Time::HiRes qw( time );
my $start = Time::HiRes::gettimeofday();
use List::Util qw(max);

my $range_start   = 1;
#my $range_end     = 10;
my $range_end     = 20;
my @range = ($range_start .. $range_end);
my @primes = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71,);

my %all_factors;

foreach my $cur_num (@range) {
  # find the prime factoration of the current number
  #
  #print "Number: $cur_num\n";
  my @cur_factors = prime_factorization($cur_num);
  #print "@cur_factors\n";

  my %count;

  # count how many times each prime number is in the list of prime factors
  #
  foreach (@cur_factors) {
      if (exists $count{$_}) {
          $count{$_}++;
      } else {
          $count{$_} = 1;
      }
  } 

  # For each prime factor, see if it's occurance is more than any previous occurance
  # as a prime factor of any previous numbers. Keep a lit of the most times a prime factor
  # orrurcs. 
  #
  foreach (keys %count) {
      # print "$_ \toccurs $count{$_} time(s)\n";
      if (exists $all_factors{$_}) {
          $all_factors{$_} = max($all_factors{$_}, $count{$_});
      } else {
          $all_factors{$_} = $count{$_};
      }      
  } 
}

# Multiply the list of prime factors. The ansewr is the smallest positive number that 
# is evenly divisible by all the numbers in the range.
#
my $total = 1;
print "\nAll factors:\n";
foreach (keys %all_factors) {
    print "$_ \toccurs $all_factors{$_} time(s)\n";
    $total = $total * ($_ ** $all_factors{$_});    
} 
print "total = $total\n";


my $end = Time::HiRes::gettimeofday();            
printf( "run time: %.4f\n", $end - $start );




# Compute the prime factorization of a given number.
#
# INPUT: An integer.
#
# OUTPUT: An array holding the prime factorization of the give number.
#
sub prime_factorization{
  my $n = $_[0];
  my @factors;
  
  while ($n > 1) {
      foreach my $cur_prime (@primes) {
        while (is_whole($n / $cur_prime)) {
          push(@factors, $cur_prime);
          $n = $n / $cur_prime;          
        }
      }
  }
  
  return @factors;
}

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
