#!/usr/local/bin/perl

use strict;
use warnings;

my $filename = shift;
($filename eq "") and die "Must provide filename.";

local $/=undef;
open FILE, $filename
  or die "Couldn't open file: $!";
my $string = <FILE>;
close FILE;

#my $find = '$CellContext`';
#$find = quotemeta $find; # escape regex metachars if present

#$string =~ s/$find//g;

$string =~ s/,\\?\s*CellChangeTimes->\{\s*((\{\s*([0-9\*\^\-\.`]*(,\s*)?)*\s*\})|[0-9\*\^\-\.`]*(,\s*)?)*\s*\}//g;

open OUTFILE, ">$filename"
  or die "can't open file: $!";

print (OUTFILE "$string");

close OUTFILE
  or die "can't close file: $!";

1;
