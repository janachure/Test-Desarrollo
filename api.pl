#!/usr/bin/perl   
use strict; 
use warnings;  
#use LWP::Simple;  
!perl -MLWP -le "print(LWP->VERSION)";

my $code   = 0011;
my $code2  = 0011;
my $ua = LWP::UserAgent->new;

my $param1 = sprintf("api.openweathermap.org/data/2.5/weather?q={"%u"}&appid={"%u"}", code, code2);

my $response = $ua->get($param1);

if ($response->is_success) {
    print $response->decoded_content;  # or whatever
}
else {
    die $response->status_line;
}
