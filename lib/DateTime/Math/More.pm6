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


#------------------------------------------------------------------------------
# Subroutine: delta-time-hms
# Purpose : Convert time in seconds to hms format
# Params  : Time in seconds
# Returns : Time in hms format, e.g, "3h02m02.65s"
sub delta-time-hms($Time) returns Str is export(:delta-time-hms) {
    #say "DEBUG exit: Time: $Time";
    #exit;

    my Num $time = $Time.Num;

    my Int $sec-per-min = 60;
    my Int $min-per-hr  = 60;
    my Int $sec-per-hr  = $sec-per-min * $min-per-hr;

    my Int $hr  = ($time/$sec-per-hr).Int;
    my Num $sec = $time - ($sec-per-hr * $hr);
    my Int $min = ($sec/$sec-per-min).Int;

    $sec = $sec - ($sec-per-min * $min);

    return sprintf "%dh%02dm%05.2fs", $hr, $min, $sec;
} # delta-time-hms


#------------------------------------------------------------------------------
# Subroutine: read-sys-time
# Purpose : An internal helper function that is not exported
# Params  : Name of a file that contains output from the GNU 'time' command
# Returns : A list or a single value depending upon the presence of the ':$uts' variable
sub read-sys-time($time-file, :$uts) {
    say "DEBUG: time-file '$time-file'" if $DEBUG;
    my ($Rts, $Uts, $Sts);
    for $time-file.IO.lines -> $line {
	say "DEBUG: line: $line" if $DEBUG;

	my $typ = $line.words[0];
	my $sec = $line.words[1];
	given $typ {
            when $_ ~~ /real/ {
		$Rts = sprintf "%.3f", $sec;
		say "DEBUG: rts: $Rts" if $DEBUG;
            }
            when $_ ~~ /user/ {
		$Uts = sprintf "%.3f", $sec;
		say "DEBUG: uts: $Uts" if $DEBUG;
            }
            when $_ ~~ /sys/ {
		$Sts = sprintf "%.3f", $sec;
		say "DEBUG: sts: $Sts" if $DEBUG;
            }
	}
    }

    # convert each to hms
    my $rt = delta-time-hms($Rts);
    my $ut = delta-time-hms($Uts);
    my $st = delta-time-hms($Sts);

    # back to the caller
    return $Uts if $uts;
    return $Rts, $rt,
           $Uts, $ut,
           $Sts, $st;
} # read-sys-time
