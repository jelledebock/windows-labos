=begin
 Geef van de SNMP service een op naam gesorteerde lijst van alle attributen en systeemattributen, en hun waarden. Zorg er ook voor dat meervoudige waarden geconcateneerd op één lijn getoond worden.
 Wijzig je oplossing zodat je die informatie ophaalt voor de bijhorende klasse. Wat merk je op ?
=cut

use Win32::OLE qw (in with);
use strict;
use Data::Dumper;

$Win32::OLE::Warn=3;

my $host = ".";
my $namespace = "root/cimv2";

my $Locator = Win32::OLE->new("WBemscripting.SWbemLocator");
my $WMI_Klasse = $Locator->ConnectServer($host,$namespace);

my $SNMP = $WMI_Klasse->Get("Win32_Service.Name='browser'");

die "Instantie snmphost kan niet geladen worden. " if (!$SNMP);

printf "Alle attributen van SNMPHost.\n------------------------------------------\n";
my %attributen = map { $_->{Name} => $_->{Value} } in $SNMP->{SystemProperties_}, $SNMP->{Properties_};

foreach (sort keys %attributen){
	printf "- %s => %s\n" , $_, $attributen{$_};
}