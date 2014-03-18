#!/usr/local/bin/perl

use strict;
use warnings;

local $/=undef;
open FILE, "PonyPhysics.nb"
  or die "Couldn't open file: $!";
my $string = <FILE>;
close FILE;

my $find = '$CellContext`';
$find = quotemeta $find; # escape regex metachars if present

$string =~ s/$find//g;

$string =~ s/,\s*CellChangeTimes->\{(\{[0-9\s\*\^\-,\.]*\}(,\s*)?)*\}//g;
$string =~ s/,\s*CellChangeTimes->\{([0-9\s\*\^\-\.]*(,\s*)?)*\}//g;

open OUTFILE, ">PonyPhysics.nb"
  or die "can't open file: $!";

print (OUTFILE "$string");

close OUTFILE
  or die "can't close file: $!";

1;
