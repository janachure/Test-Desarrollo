use strict;
use warnings;
 
my $filename = shift;
my $code_decode = shift;

 
my $data = read_file($filename);

if ($code_decode eq "c"){
	$data =~ tr/a-mn-zA-MN-Z/n-za-mN-ZA-M/;
}else{
	$data =~ tr/n-za-mN-ZA-M/a-mn-zA-MN-Z/;
}
write_file($filename, $data);
exit;
 
sub read_file {
    my ($filename) = @_;
 
    open my $in, '<:encoding(UTF-8)', $filename or die "Could not open '$filename' for reading $!";
    local $/ = undef;
    my $all = <$in>;
    close $in;
 
    return $all;
}
 
sub write_file {
    my ($filename, $content) = @_;
 
    open my $out, '>:encoding(UTF-8)', $filename or die "Could not open '$filename' for writing $!";;
    print $out $content;
    close $out;
 
    return;
}