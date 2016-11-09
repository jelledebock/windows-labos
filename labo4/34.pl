=for
...........................................................................................................
 Geef een overzicht van alle specifieke attributen van een klasse uit de root/cimv2 - namespace,
 die beschikken over het ValueMap-mechanisme . Voor deze attributen geef je de beschrijving en
 alle overeenkomstige waarden van zowel het Values, als het ValueMap - qualifierItem. Gebruik 
 een hash om de koppeling op te slaan.
 De naam van de klasse, vb Win32_NetworkAdapter, wordt als enig argument opgegeven. 
...........................................................................................................
=cut

use Win32::OLE;
use strict;

$Win32::OLE::Warn=3;

my $locator = Win32::OLE->new("WbemScripting.SWbemLocator");
my $wbemservice = $locator->ConnectServer(".","root/cimv2");

my $wmi_klasse = $ARGV[0];

my $klasse = ($wbemservice->Get($wmi_klasse) or die $wmi_klasse."is geen geldige klassenaam.\n");

printf "$wmi_klasse\n-----------------------\n";

my $properties = $klasse->{Properties_};

foreach my $property (in $properties){
	my $Qualifiers = $property->{Qualifiers_};

	if ($Qualifiers->{ValueMap}){
	     print "\n",$property->{name} ;
	     print "\nDescription : ",$Qualifiers->Item("Description")->{Value} ;
	     my %hash;
	     @hash{@{$Qualifiers->Item("ValueMap")->{Value}}} = @{$Qualifiers->Item("Values")->{Value}}; #koppelen in een hash
	     while (my ($key,$value)=each(%hash)){ 
	        printf "\n %30s: %s",$key,$value;
	     }
	     print "\n----------------------------------------------";
	  }
}

