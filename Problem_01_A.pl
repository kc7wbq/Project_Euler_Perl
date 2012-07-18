# For every number between 0 and the target, see if it's evenly divisable 
# by 3 or 5. If so, add it to the total. 
#

use strict;
use warnings;
use Time::HiRes qw( time );
my $start  = Time::HiRes::gettimeofday();

my $sum = 0;
for (my $i = 0; $i < 1000000; $i++) {
  if (($i % 3 == 0) or ($i % 5 == 0)) {
    $sum += $i;
    }
  }
  
  print "sum=$sum\n";
  
 my $end = Time::HiRes::gettimeofday();            
 printf( "time %.4f\n", $end - $start );