=for
 Zoek in WMI CIM Studio de instantie die een Interrupt Request beschrijft, met IRQNumber=18.
 Deze instantie is geassocieerd met objecten van verschillende klassen.
 Bepaal enkel de netwerkverbinding(en) die gekoppeld zijn aan deze instantie. Geef de 
 "beschrijving" van elke netwerkverbinding - zoek het juiste attribuut op in WMI CIM Studio. 
=cut

use Win32::OLE qw ( in with);
use strict;

$Win32::OLE::Warn=3;

my $server = ".";
my $namespace = "root/cimv2";
my $IRQNumber = $ARGV[0];

my $Locator = Win32::OLE->new("WbemScripting.SWbemLocator");
my $WMI_Server = $Locator->ConnectServer($server,$namespace);
my $associator_string = "Win32_IRQResource.IRQNumber='$IRQNumber'";

my $IRQ_18_Associators = $WMI_Server->AssociatorsOf($associator_string);

foreach my $Associator (in $IRQ_18_Associators){
	if($Associator->{Path_}->{Class} eq "Win32_NetworkAdapter"){
		printf "IRQNumber %d is geassocieerd met netwerkadapter %s.\n", $IRQNumber, $Associator->{Name};
	}
}
