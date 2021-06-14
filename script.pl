use strict;
use warnings;

my %cypher = ('a'=>'n', 'b'=>'o', 'c'=>'p', 'd'=>'q', 'e'=>'r', 'f'=>'s', 'g'=>'t', 'h'=>'u','i'=>'v', 'j'=>'w', 'k'=>'x', 'l'=>'y', 'm'=>'z', 'n'=>'a', 'o'=>'b', 'p'=>'c', 'q'=>'d', 'r'=>'e', 's'=>'f', 't'=>'g', 'u'=>'h', 'v'=>'i', 'w'=>'j', 'x'=>'k','y'=>'l', 'z'=>'m', 'A'=>'N', 'B'=>'O', 'C'=>'P', 'D'=>'Q', 'E'=>'R', 'F'=>'S', 'G'=>'T', 'H'=>'U', 'I'=>'V', 'J'=>'W', 'K'=>'X', 'L'=>'Y', 'M'=>'Z', 'N'=>'A', 'O'=>'B', 'P'=>'C', 'Q'=>'D', 'R'=>'E', 'S'=>'F', 'T'=>'G', 'U'=>'H', 'V'=>'I', 'W'=>'J', 'X'=>'K', 'Y'=>'L', 'Z'=>'M');
#%decypher = reverse %cypher;

my $count_argv = $#ARGV + 1;

my @stack; ## Pila para polish

## Solo modifica el stack
sub aplica_op { 
    my $last_item1 = pop @stack;
    my $last_item2 = pop @stack;
    ## tomo operador
    my $op = shift @_; 
    if ($op eq "+") {
        push @stack, $last_item1 + $last_item2;
    }
    if ($op eq "-") {
        push @stack, $last_item1 - $last_item2;
    }
    if ($op eq "*") {
        push @stack, $last_item1 * $last_item2;
    }
    if ($op eq "/") {
        push @stack, $last_item1 / $last_item2;
    }
}

for (my $i_argv = 0; $i_argv < $count_argv; $i_argv++) {
        my $entry = shift; 
        ## Si son operaciones:
        if ($entry eq "+" || $entry eq "-" || $entry eq "*" || $entry eq "/"){ 
                aplica_op($entry);
        } else { ## Si son son numeros:
                push @stack, $entry;
        }       
}

print pop @stack;
