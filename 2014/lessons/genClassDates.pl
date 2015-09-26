#!/usr/bin/perl

use strict;
use warnings;
use Date::Manip::Recur;

my $thisYear = `date +%Y`;
chomp $thisYear;
my $thisStartDayOfMonth = 0;
my $thisLastDayOfMonth = 0;

print "Enter the day of month of first class (assuming August, $thisYear): ";
$thisStartDayOfMonth = <>;
chomp $thisStartDayOfMonth;

print "Enter the day of month of last class (assuming December, $thisYear): ";
$thisLastDayOfMonth = <>;
chomp $thisLastDayOfMonth;

# To find the 2nd Tuesday of every month from Jan 1 1999 to Apr 30 1999
my $recur = new Date::Manip::Recur;
my $start = $recur->new_date();
my $end   = $recur->new_date();
$start->parse("Aug $thisStartDayOfMonth $thisYear");
$end->parse("Dec $thisLastDayOfMonth $thisYear");

$recur->parse("0:1*2:2:0:0:0",$start,$end);
my @date = $recur->dates();

print join(", ", @date);
