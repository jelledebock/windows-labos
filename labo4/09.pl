=for 
 Bepaal enkel het aantal klassen die kunnen geassociëerd worden aan een Directory-klasse, zie oefening 31  
 uit reeks 3. Controleer met de informatie in WMI CIM Studio.
 Merk op dat, net als in WMI CIM Studio geen rekening wordt gehouden met de associatorklassen die via overerving beschikbaar zijn. 
=cut

use Win32::OLE qw(in  with);
use strict;
use Data::Dumper;

$Win32::OLE::Warn = 3;


my $host = ".";
my $namespace = "root/cimv2";
my $class = @ARGV[0];

my $Locator = Win32::OLE->new("WbemScripting.SWbemLocator");
my $WMIServer = $Locator->ConnectServer($host,$namespace);

my $Retrieved_Class = $WMIServer->Get($class);
$Win32::OLE::Last_Error == 0 or die "Could not open the specified class.";

my @Associators = map {$_->{Path_}->{class}} in $Retrieved_Class->Associators_(undef,undef,undef,
	undef,undef,1);


printf "Associated classes with %s (%s)\n--------------------------------------------\n", $class, scalar(@Associators);

for my $name (@Associators){
	printf "\t- %s\n", $name;
}
