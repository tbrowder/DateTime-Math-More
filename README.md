# DateTime::Math::More [![Build Status](https://travis-ci.org/tbrowder/DateTime-Math-More-Perl6.svg?branch=master)](https://travis-ci.org/tbrowder/DateTime-Math-More-Perl6)

Provides some additional DateTime math functions:

  nth-weekday-of-month(
     UInt :$nth!,              # integer, e.g., 1 for the first weekday W in the month
     Str :$weekday!,           # first two letters of the day of the week of interest
                               #   (case insensitive)
     :$year = Date.today.year, # starting year of interest (yyyy)
     :$mon = Date.today.month, # starting month of interest (first three letters or 
                               #   number 1..12; case insensitive)
     UInt :$num = 12,          # number of dates to list
     --> List)                 # returns list of Date objects

  nth-weekday-before-date(
     UInt :$nth!,              # integer, e.g., 1 for the first weekday W before a date
     Str :$weekday!,           # first two letters of the day of the week of interest
     Date :$date!              #   (case insensitive)
     --> Date)
