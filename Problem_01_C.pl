# realizing that 1+2+3+...+p = 1/2 * p * (p+1) 
# add the sum-divisiable-by 3 to the sum-divisable-by 5, subtract the 
# sum-divisiable-by 15;

use strict;
use warnings;
use Time::HiRes qw( time );
my $start  = Time::HiRes::gettimeofday();

my $target = 1000000;
my $target3  = $target - 1;
my $target5  = $target - 5;
my $target15 = $target - 10;;

my $sum = SumDivisibleBy(3, $target3) + SumDivisibleBy(5, $target5) - SumDivisibleBy(15, $target15) ;


print "sum=$sum\n";

 my $end = Time::HiRes::gettimeofday();            
 printf( "time %.4f\n", $end - $start );

sub SumDivisibleBy {
  #use integer;
  my $n = $_[0];
  my $target = $_[1]; 
  my $p = $target / $n;
  my $a1 = $p * ($p + 1);
  my $a2 = $a1 / 2;
  my $a3 = $n * $a2;
  
  my $answer = $n * ($p * ($p + 1) / 2);
  return $answer;
  }