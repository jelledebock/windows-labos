=for
....................................................................................................................................
Creëer via een WMI script een nieuwe gedeelde map (share). Zoek eerst de methode op die je hiervoor ter beschikking hebt. Geef ook een 
tekstuele melding of het aanmaken van de share gelukt is. Je kan dit daarna controleren met net share .
 Probeer de formele en informele techniek voor het uitvoeren van de Create-methode. 

uint32 Create(
[in] string Path,
[in] string Name,
[in] uint32 Type,
[in] uint32 MaximumAllowed,
[in] string Description,
[in] string Password,
[in] object:Win32_SecurityDescriptor Access
);
....................................................................................................................................
=cut

#oplossing die de twee manieren van loggen bevat en vijf instanties maakt.
use Win32::OLE 'in';
use Win32::OLE::Const 'Microsoft WMI Scripting ';
use strict;
use warnings;

$Win32::OLE::Warn = 3; #script stopt met foutmelding als er ergens iets niet lukt

my $ComputerName = ".";
my $NameSpace = "root/cimv2";
my $Locator=Win32::OLE->new("WbemScripting.SWbemLocator");
my $WbemServices = $Locator->ConnectServer($ComputerName, $NameSpace);

my $class_name = "Win32_Share";

my $share_naam = "test3nov";
my $share_path = "C:\\Users\\Administrator\\test3nov";
my $type = 0; #0=disk drive

my $share = $WbemServices->Get($class_name, wbemFlagUseAmendedQualifiers);
my $rc = $share->Create($share_path,$share_naam,$type);

if ($rc==0) {print "Share succesvol gemaakt.\n";}
elsif($rc==6) {print "Share bestaat al.\n";}
else {print "Share niet aangemaakt. (rc=$rc)\n";}