=for
 Bepaal het aantal objecten(instanties) die geassocieerd zijn met de rootdirectory van de C:partitie.
 Bepaal ook het aantal verschillende klasse(n) voor deze geassocieerde objecten.
 Controleer je antwoorden met de informatie die je in WMI CIM Studio terugvindt. 
=cut

use Win32::OLE qw ( in with );
use strict;

$Win32::OLE::Warn=3;

my $host = ".";
my $namespace = "root/cimv2";

my $Locator = Win32::OLE->new("WbemScripting.SWbemLocator");
my $WMI_Server = $Locator->ConnectServer($host,$namespace);

my $object = "Win32_Directory.Name='c:\\'";

my $C_drive = $WMI_Server->AssociatorsOf($object);

printf "Aantal geassocieerde objecten met %s = %d.\n", $object, scalar(in $C_drive);

