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

sub get_api_key {
    my $config = Config::Tiny->read('config.ini');
    return $config->{openweathermap}{api};
}
 
sub get_weather {

	
    my ($api_key,$location) = @_;
    my $url;
    #print(looks_like_number($location));
    if (looks_like_number($location)){
		$url = sprintf('https://api.openweathermap.org/data/2.5/weather?id=%s&appid=%s&units=metric&lang=es', $location, $api_key);	    	
    }else {
    	$url = sprintf('https://api.openweathermap.org/data/2.5/weather?q=%s&appid=%s&units=metric&lang=es', $location, $api_key);	

    }
    #print($url);
    #print ($url,"\n");
    my $request = HTTP::Request->new(GET => $url);

    my $response = $browser->request($request);
    return decode_json($response->content());

}
 
sub main {
    my $location = shift @ARGV or die "Usage: $0 QUEEE\n";
    my $api_key = get_api_key();
    my $weather = get_weather($api_key, $location);
	#say $weather;	 
    say ($weather->{weather}[0]{description},," ",$weather->{main}{temp},"°C", " ",($weather->{main}{humidity}),,"%",);
    #say ;
    #print (warn Dumper $weather);
    #print ((warn Dumper $weather));
}
 
main();
 
