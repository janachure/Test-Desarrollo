use strict;
use warnings;

my $count_argv = $#ARGV + 1;

my @stack; ## Pila para polish

## Solo modifica el stack
sub aplica_op { 
    my $last_item1 = pop @stack;
    my $last_item2 = pop @stack;
    ## tomo operador
    my $op = shift @_; 
    if ($op eq "+") {
        push @stack, $last_item1 + $last_item2; ## En la suma no importa el orden
    }
    if ($op eq "-") {
        push @stack, $last_item2 - $last_item1; ## Aca si importa l_i2, l_i1 => l_i2-l_i1
    }
    if ($op eq "*") {
        push @stack, $last_item1 * $last_item2; ## En la * no importa el orden
    }
    if ($op eq "/") {
        push @stack, $last_item2 / $last_item1; ## Aca si importa => l_i2/l_i1
    }
}
sub main{
        my $string = shift @ARGV;
        my @entry = split(" ", $string);
    foreach my $i (@entry) {
        ## Si es un operador:
        if ($i eq "+" || $i eq "-" || $i eq "*" || $i eq "/"){ 
                aplica_op($i);
        } else { ## Si son son numeros:
                push @stack, $i;
        }       
    }
    print (pop @stack,"\n");
}

main();
