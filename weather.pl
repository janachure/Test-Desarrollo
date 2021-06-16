use 5.010;
use strict;
use warnings;
#use JSON::XS; 
use LWP 5.64;#::Simple qw(get);
use Scalar::Util qw(looks_like_number);
use Config::Tiny;
use Cpanel::JSON::XS qw(decode_json encode_json);
use Data::Dumper qw(Dumper);

my $browser = LWP::UserAgent->new;

sub conseguir_clave {
	### tengo que abrir el archivo y leer las claves:
    my $config = Config::Tiny->read('keys.ini');
    return $config->{openweathermap}{api};
}
 
sub get_clima {

	
    my ($api_key,$location) = @_;
    my $url;
    ### Estoy utilizando un numero de ciudad o un string de la ciudad
    if (looks_like_number($location)){
		$url = sprintf('https://api.openweathermap.org/data/2.5/weather?id=%s&appid=%s&units=metric&lang=es', $location, $api_key);	    	
    }else {
    	$url = sprintf('https://api.openweathermap.org/data/2.5/weather?q=%s&appid=%s&units=metric&lang=es', $location, $api_key);	

    }
    ### Pido al URL lo que necesito
    my $request = HTTP::Request->new(GET => $url);

    my $response = $browser->request($request);
    return decode_json($response->content());

}
 
sub main {
    my $location = shift @ARGV or die " No tomo bien los parametros\n";
    my $api_key = conseguir_clave();
    my $weather = get_clima($api_key, $location);
	
	### Decodifico lo que me esta diciendo:
	## Retornarlo por consola: 
    say ($weather->{weather}[0]{description},," ",$weather->{main}{temp},"°C", " ",($weather->{main}{humidity}),,"%",);
}
 
main();
 
