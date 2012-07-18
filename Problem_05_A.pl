use strict;
use warnings;
use Time::HiRes qw( time );
my $start = Time::HiRes::gettimeofday();

my $range_start   = 1;
#my $range_end     = 10;
my $range_end     = 20;
my @range = ($range_start .. $range_end);

NEXT_NUM:for (my $i = $range_end; 1; $i++) {
    foreach my $cur_range_num (@range) {
      if ($i % $cur_range_num != 0) {
        next NEXT_NUM;
      }      
    }
    print $i . "\n";
    last;
}

my $end = Time::HiRes::gettimeofday();            
printf( "run time: %.4f\n", $end - $start );

# 232792560 in 124.1859 seconds