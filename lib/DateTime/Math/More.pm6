unit module DateTime::Math::More:auth<github:tbrowder>;

# export a debug var for users
our $DEBUG is export(:DEBUG) = False;
BEGIN {
    if %*ENV<DATETIME_MATH_MORE_DEBUG> {
	$DEBUG = True;
    }
    else {
	$DEBUG = False;
    }
}

my %days = [
  mo => 1,
  tu => 2,
  we => 3,
  th => 4,
  fr => 5,
  sa => 6,
  su => 7,
];

my %mons = [
  jan => 1,
  feb => 2,
  mar => 3,
  apr => 4,
  may => 5,
  jun => 6,
  jul => 7,
  aug => 8,
  sep => 9,
  oct => 10,
  nov => 11,
  dec => 12,
];

##### subroutines #####
sub nth-weekday-of-month(
    UInt :$nth!,              # integer, e.g., 1 for the first weekday W in the month
    Str :$weekday!,           # first two letters of the day of the week of interest
                              #   (case insensitive)
    :$year = Date.today.year, # starting year of interest (yyyy)
    :$mon = Date.today.month, # starting month of interest (first three letters or 
                              #   number 1..12; case insensitive)
    UInt :$num = 12,          # number of dates to list
    --> List) is export {     # returns list of Date objects

    # check inputs
    my $err = 0;
    if not 0 < $nth < 6 {
        say "ERROR: \$nth not in range [1..5]";
        ++$err;
    }    

    my $wderr = 0;
    if $weekday ~~ m:i/^ <[a..z]>**2 $/ {
    }
    elsif $weekday ~~ /^ <[a..z]>**1..2 $/ {
    }
    else {
        say "ERROR: \$num not in a legitimate format";
        ++$err;
    }


    if !$num {
    }
}

sub nth-weekday-before-date(
     UInt :$nth!,              # integer, e.g., 1 for the first weekday W before a date
     Str :$weekday!,           # first two letters of the day of the week of interest
     Date :$date!              #   (case insensitive)
     --> Date) is export {
}

