use strict;
use warnings;


sub anagrama { 
	my $first_base = shift @_; ## Tomo argv[0]
	my $number     = shift @_; ## Tomo argv[1]
	my $secnd_base = shift @_; ## Tomo argv[2]
    print $first_base,$number,$secnd_base
    #printf "%b", $first_base;
  }

sub char_to_val {
    my $char = shift @_; ## Tomo argv[0]
    if ($char ge '0' & $char le '9') {
        return print(ord($char) - ord('0'));
    }
    else {
        return print(ord($char) - ord('A') + 10);
    }
}

char_to_val("P");

## Idea : 1001 = 1* (2**3) + 0*(2**2) + 0*(2**1) + 1*(2**0)  

sub to_decimal {
    my $string = shift @_; ## Tomo argv[0] = String a convertir 
    my $base = shift @_; ## Tomo argv[1] = Base
}
 


##anagrama(11, "aaba", 15);