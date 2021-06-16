use strict;
use warnings;


## Idea : 1001 = 1* (2**3) + 0*(2**2) + 0*(2**1) + 1*(2**0)  
## Cada elemento es la base elevado a algun exponente

sub a_base_10 { 
	my $number     = shift ; ## Tomo argv[1]
	my $param_base = shift ; ## Tomo argv[0]
    
    
    my $answer = 0;
    my $base = 1;
    my $number_size = length $number;
    if ($param_base == 10){ ## No tengo que hacer nada base 10
        $answer = $number;
    }
    else
    {
        for (my $str = $number_size- 1; $str >= 0; $str--) {
            $answer += $base*char_to_value(substr($number,$str,1));
            $base *= $param_base; 
        }        
    }
    return ($answer);
  }

### Ahora que tengo el numero en base 10 lo puedo pasar a cualquier base 
### Idea: cada numero le tomo modulo y a esa ubicacion en digits la concateno
### con mi respuesta.

sub a_base_n {
    my $number      = shift;
    my $second_base = shift;
    my @digits = (0..9,"A".."O");
    my $ans = " "; 
    while ($number > 0) {
        my $resto = $number % $second_base;
        $ans = $digits[$resto].$ans;
        $number = ($number - $resto) / $second_base;
    }

    return ($ans);
}

## Convierto el char en un entero:
sub char_to_value {
    my $char = shift @_; ## Tomo argv[0]
    if ($char ge '0' && $char le '9') {
        return (ord($char) - ord('0'));
    }
    else {
        return (ord($char) - ord('A') + 10);
    }
}

 
sub main{
    my $first_base = shift @ARGV; ## Tomo argv[0]
    my $number     = shift @ARGV; ## Tomo argv[1]
    my $second_base= shift @ARGV; ## Tomo argv[2]


    my $base_10 = a_base_10($number, $first_base);
    my $answer = a_base_n($base_10, $second_base);
    print($answer,"\n");
}

main();
