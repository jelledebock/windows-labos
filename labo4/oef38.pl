use Win32::OLE;
use Data::Dumper;

$Win32::OLE::Warn = 3;

$klasse = $ARGV[0] or die "Please enter a valid WMI classname";

$Wbem = Win32::OLE->new('WbemScripting.SWbemLocator.1');

$server = $Wbem->ConnectServer(".","root/cimv2");

$methodes = $server->Get($klasse)->{Methods_};

print "De klasse $klasse heeft volgende methodes: \n";
foreach $methode (in $methodes){
	print "\t* $methode->{Name}\n";
	print "\t\tMethode Qualifiers:\n";
	$qualifiers = $methode->{Qualifiers_};
	foreach $qualifier (in $qualifiers){
		print "\t\t- $qualifier->{Name} = $qualifier->{Value}\n";
	}
}
