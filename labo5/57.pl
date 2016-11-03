=for
....................................................................................................................................
Verwijder alle objecten in verband met permanente eventregistratie. Zoek een methode van SWemObject die het object zelf verwijdert. 
Met LastError() kan je opvragen of dit gelukt is.
....................................................................................................................................
=cut

#oplossing die de twee manieren van loggen bevat en vijf instanties maakt.
use Win32::OLE 'in';
use Win32::OLE::Const 'Microsoft WMI Scripting ';
$Win32::OLE::Warn = 3; #script stopt met foutmelding als er ergens iets niet lukt

my $ComputerName = ".";
my $NameSpace = "root/cimv2";
my $Locator=Win32::OLE->new("WbemScripting.SWbemLocator");
my $WbemServices = $Locator->ConnectServer($ComputerName, $NameSpace);


