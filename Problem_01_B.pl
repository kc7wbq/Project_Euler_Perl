# Instead of looking at every single number and checking it's mod value, 
# find the sum of all the multiples of three, and add them to the sum of
# all the multiples of 5. Then to remove duplicate values, subtract the 
# sum of the multiples of 15. 
#

use strict;
use warnings;
use Time::HiRes qw( time );
my $start  = Time::HiRes::gettimeofday();
my $target = 1000000;

my $sum = 0;
for (my $i = 0; $i < $target; $i += 3) {  
  $sum += $i;
}
 
for (my $i = 0; $i < $target; $i += 5) {  
  $sum += $i;
}

for (my $i = 0; $i < $target; $i += 15) {  
  $sum -= $i;
}
  
  print "sum=$sum\n";
  
   my $end = Time::HiRes::gettimeofday();            
 printf( "time %.4f\n", $end - $start );
  
  