=for
 Geef een overzicht van alle attributen (ook systeemattributen) van een klasse, waarvoor je de naam 
 meegeeft als enig argument. Bepaal ook het CIMtype van elk attribuut (haal de tekstuele beschrijving 
 op - zie oefening 1), en geef aan of de inhoud samengesteld (een array) is.
 Test dit uit voor de klasse Win32_Directory en ook voor de associatorklasse Win32_Subdirectory
=cut

use Win32::OLE qw ( in with);
use strict;

$Win32::OLE::Warn=3;

my $host = ".";
my $namespace = "root/cimv2";
my $klasse_naam = $ARGV[0];

my $Locator = Win32::OLE->new("WbemScripting.SWbemLocator");
my $WMI_Server = $Locator->ConnectServer($host,$namespace);

my $com_object = $WMI_Server->Get($klasse_naam);

die "Klasse $klasse_naam kan niet geladen worden. " if (!$com_object);

printf "Alle attributen van $klasse_naam.\n------------------------------------------\n";

my %sytemprops  = map { $_->{Name} => $_->{CIMType} } in $com_object->{SystemProperties_};
my %props  = map { $_->{Name} => $_->{CIMType} } in $com_object->{Properties_};

printf "\tSysteemattributen:\n";
foreach my $key ( keys %sytemprops ) {
	printf "\t\t-%s (%s)\n",$key, $sytemprops{$key};
}

printf "\tAndere attributen:\n";
foreach my $key ( keys %props ) {
	printf "\t\t-%s (%s)\n",$key, $props{$key};
}