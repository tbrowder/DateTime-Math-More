unit module DateTime::Math::More:auth<github:tbrowder>;

# file:  ALL-SUBS.md
# title: Subroutines Exported by the `:ALL` Tag

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

##### subroutines #####

