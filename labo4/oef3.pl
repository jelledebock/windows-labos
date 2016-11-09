use Win32::OLE;

@adapters = Win32::OLE->GetObject('winmgmts://./root/cimv2:Win32_NetworkAdapter');

foreach $network_adapter (@adapters){
	print "$network_adapter->{Name}\n";
}