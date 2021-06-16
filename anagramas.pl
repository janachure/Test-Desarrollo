use strict;
use warnings;


sub main { 

    my $prim_string= shift @ARGV;       ## Tomo argumentos
    my $seg_string = shift @ARGV;       ## Tomo argumentos
    ### Tomo sus tamaños: 
    my $prim_string_size = length $prim_string;    
    my $seg_string_size = length $seg_string;    

    my @prim_string_list = (); 
    my @second_string_list = (); 
    ### Si no miden lo mismo ya esta:
    if ($prim_string_size != $seg_string_size){
        return print("False","\n");
    }
    ### Agrego a una lista cada Char de cada String
    for (my $var = 0; $var < $seg_string_size; $var++) {
        push(@second_string_list,substr($seg_string,$var,1));
        push(@prim_string_list,substr($prim_string,$var,1));
    }
    
    if (@prim_string_list != @second_string_list){
        return print("False","\n");
    }
    my @sort_prim = sort @prim_string_list;     ## Ordeno
    my @sort_secnd = sort @second_string_list;  ## Ordeno 
    # Ahora recorro cada uno si es que son iguales: 
    for (my $prim_it = 0; $prim_it < $prim_string_size; $prim_it++) {
        if ($sort_prim[$prim_it] ne $sort_secnd[$prim_it] ){
            return print("False","\n");
        };
    };
    return print ("True","\n");
}

main();



##anagrama(11, "aaba", 15);