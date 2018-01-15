#! /usr/bin/perl -w 

# get access to the Perl Module Time
# make use of time functions in Perl package Time
#use Time::Local 'timegm';
use POSIX;
# see documentation at: http://perldoc.perl.org/Time/Local.html

# to 'hand-in' the file, place in your student web directory on keeler, i.e: 
#    cp days_diff.pl /var/www/html/students/USER/
# uncomment the following line when you copy this to your student web directory 
use lib '/var/www/html/students' ;

# load DiffTest package for testing, will run subroutine days_diff
#
# there is a version of DiffTest.pm that is located under apache web services too
#
# you can use the supplied DiffTest.pm file when developing/running from
# your account
use DiffTest ;

sub days_diff {
# routine to calculate the number of days between two dates 
# that are formatted like
# "Wed Oct 16 2002" or 'Wed Jul 4 1776'

# extract input parameters passed to function
my ($start, $end) = @_;
my ($wd1, $mo1, $day1, $yr1) = split ' ',$start;
my ($wd2, $mo2, $day2, $yr2) = split ' ',$end;

# for debugging, uncomment print statements
# an array of format expected for text months
my @mon = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);

# hash to convert month to numbers
my %m2n = map {$mon[$_] => $_} 0 .. 11;
my $month1 = $m2n{"$mo1"}+1;
my $month2 = $m2n{"$mo2"}+1;


if ( $month1 < 3 ){
	$month1 += 12;
	$yr1--;
}

if ( $month2 < 3 ){
	$month2 += 12;
	$yr2--;
}

my $dayStart = ( (365 * $yr1) + floor($yr1/4) - floor($yr1/100) + floor($yr1/400) + $day1 + floor(((153 * $month1) + 8) / 5));
my $dayEnd = ( (365 * $yr2) + floor($yr2/4) - floor($yr2/100) + floor($yr2/400) + $day2 + floor(((153 * $month2) + 8) / 5));

return $dayEnd - $dayStart;

} 