use strict;
use Win32::OLE qw(in with);
use Win32::OLE::Const 'Microsoft Excel';
$Win32::OLE::Warn = 3;                                # die on errors...
my $Excel = Win32::OLE->GetActiveObject('Excel.Application')
    || Win32::OLE->new('Excel.Application', 'Quit');  # get already active Excel
                                                      # application or open new
my $fso = Win32::OLE->new("Scripting.FileSystemObject");


my $file = $ARGV[0];
my $full_name_file = $fso->GetAbsolutePathName($file);
my $Book;

if($fso->FileExists($full_name_file)){
	$Book = $Excel->Workbooks->Open($full_name_file);
	print "Bestaand bestand $full_name_file geopend.\n";
	foreach my $Sheet (in $Book->Sheets){
		print "Sheet: ".$Sheet->Name."\n";
		my $array = $Sheet->UsedRange->{'Value'};        # get the contents
		if($array){
			foreach my $ref_array (@$array) {                     # loop through the array
		                                                      # referenced by $array
			    foreach my $scalar (@$ref_array) {
			        print "$scalar\t";
			    }
		    	print "\n";
			}
		}
		else{
			print "Empty worksheet.\n";
		}
	}
}