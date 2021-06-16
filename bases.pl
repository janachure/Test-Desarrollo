use strict;
use warnings;


## Idea : 1001 = 1* (2**3) + 0*(2**2) + 0*(2**1) + 1*(2**0)  
## Cada elemento es la base elevado a algun exponente

sub a_base_10 { 
	my $first_base = shift @ARGV; ## Tomo argv[0]
	my $number     = shift @ARGV; ## Tomo argv[1]
    #print ($first_base,$number,$secnd_base);
    my $ans = 0;
    my $base = 1;
    my $seg_string_size = length $number;
    if ($first_base == 10){ ## No tengo que hacer nada base 10
        $ans = $number;
    }
    else
    {
        for (my $str = $seg_string_size- 1; $str >= 0; $str--) {
            $ans += $base*char_to_val(substr($number,$str,1));
            $base *= $first_base; 
        }        
    }
    return print ($ans);
  }
sub a_base_n {
    my $number     = shift ; ## Tomo argv[0]
    my $second_base = shift; ## Tomo argv[1]
    my $indx = 0;
    my $ans = ''; 
    #print($number,$second_base,"\n");
    while ($number > 0) {
        $ans .= (to_any_base($number % $second_base));
        print(to_any_base($number % $second_base),"\n");
        $number = int(($number / $second_base));
    }
    print ($ans);
}

sub char_to_val {
    my $char = shift @_; ## Tomo argv[0]
    if ($char ge '0' && $char le '9') {
        return (ord($char) - ord('0'));
    }
    else {
        return (ord($char) - ord('A') + 10);
    }
}


sub to_any_base {
    my $char = shift @_; ## Tomo argv[0]
    if ($char >= '0' && $char <= '9') {
        return (chr($char + ord('0')),"\n");
    }
    else {
        return (chr($char - 10 + ord('A')),"\n");
    }
}

sub to_decimal {
    my $string = shift @_; ## Tomo argv[0] = String a convertir 
    my $base = shift @_; ## Tomo argv[1] = Base
}
 
sub main{
    my $first_base = shift @ARGV; ## Tomo argv[0]
    my $number     = shift @ARGV; ## Tomo argv[1]
    my $second_base= shift @ARGV; ## Tomo argv[2]
    #to_any_base(11);
    
    a_base_n(15, $second_base);
    
    ##a_base_10($first_base,$number,$secnd_base);
}
main();
##anagrama(11, "aaba", 15);