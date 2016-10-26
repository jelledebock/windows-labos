use Win32::OLE;
use Data::Dumper;

$Win32::OLE::Warn = 3;

$SWBem = Win32::OLE->new('WbemScripting.SWbemLocator.1');

$Swbemservice = $SWBem->ConnectServer('.','root/cimv2');

$os = $Swbemservice->ExecQuery("Select * from Win32_OperatingSystem");

foreach my $item (in $os){
	print "OS Name = $item->{Name}\n";
}