use Win32::OLE;

$Win32::OLE::Warn = 3;

$wmi = Win32::OLE->new('WbemScripting.SWbemLocator.1');

$server = $wmi->ConnectServer(".","root/cimv2");

$adapters = $server->ExecQuery("select * from Win32_NetworkAdapter");
$number_of_adapters=$adapters->Count;

print "There are $number_of_adapters adapters in this pc\n";

foreach my $adapter (in $adapters){
	print "\t$adapter->{Name}\n";
}
