use strict;
use warnings;

my @numbers = (23, 42, 69); ## Arreglos

my $quince = 15; ## Variables

my $numbersize = @numbers; ## Variables

my $name=<STDIN>; ## Entrada estandar 

print $quince ; ## imprimir numero string o literal 

my $prim = $numbers[0];## seleccionar 1 elemento del arreglo

print $prim ;## imprimir elemento del arreglo

# Definicion de diccionario 
my %fruit_color = (
  apple  => "red",
  banana => "yellow",
);

# Los elementos del dic se acceden usando {} con el $.Hash elements are accessed using curly braces, again with the $ sigil.
#my $color = $fruit_color{apple};
#my $color = $fruit_color{apple};
my $color  = $fruit_color{apple};
print $color;
#### Writing subroutines. Escribiendo funciones

# Writing subroutines is easy:
# Utilizando sub
sub imprimir_nomber { 
	my $logmessage = shift; 
	#nombre =juan
	my $nombre ="Juan";
	print $logmessage ;
  #open my $logfile, ">>", "my.log" or die "Could not open my.log: $!";

	print $nombre;
}

imprimir_nomber("Juancin");