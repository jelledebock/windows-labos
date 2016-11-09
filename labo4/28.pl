use Win32::OLE;
use strict;
use warnings;
use Data::Dumper;

foreach (@ARGV){
	onderzoek_klasse($_);
}

sub onderzoek_klasse{
	my $klasse_naam = $_;

	my $swbem_service = Win32::OLE->new("WBemScripting.SWbemLocator.1");

	my $wmi = $swbem_service->ConnectServer('.','root/cimv2');

	if(my $obj = $wmi->InstancesOf($_)){
		printf "- The object $_ is %s a singleton (%d).\n",($obj->{Count}==1?"":"not",$obj->{Path_}->{IsSingleton});
	}
	else{
		print ":( The object $_, was not found (perhaps you misspelled it).\n";
	}
}