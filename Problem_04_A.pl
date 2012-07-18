# This does not work!!!
#
use strict;
use warnings;
use Time::HiRes qw( time );

my $n1 = 999;
my $n2 = 999;
my $beep_boop = "beep";

my $start  = Time::HiRes::gettimeofday();

while (($n1 >= 100) and ($n2 >= 100)) {
  my $n3 = $n1 * $n2;
  
  if (is_palindrome($n3)) {
    my $end = Time::HiRes::gettimeofday();
    printf("$n1 * $n1 = $n3 %.4f\n", $end - $start );
  }
  
  if ($beep_boop eq "beep") {
    $beep_boop = "boop";
    $n1--;
  }
  else {
    $beep_boop = "beep";
    $n2--;
  }
}

# if (is_palindrome("1221")) {
  # print "Yes!\n";
# }
# else {
  # print "No!\n";
# }




# Returns "TRUE" if a number is a palindrom
#
# INPUT: a number
#
# OUTPUT: true or false
#
sub is_palindrome {  
  my @letters = split(//, $_[0]);
  my $front = 0;
  my $back = scalar (@letters) - 1;
  # print "front: $front\n";
  # print "back : $back\n";
  
  while ($front < $back) {
    if ($letters[$front] ne $letters[$back]) {
      return 0;
    } # if
    $front++;
    $back--;
  }
  
  return 1;

}
