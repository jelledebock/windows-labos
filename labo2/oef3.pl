use strict;
use Win32::OLE qw(in with);
use Win32::OLE::Const 'Microsoft Excel';
$Win32::OLE::Warn = 3;                                # die on errors...

my $Excel = Win32::OLE->GetActiveObject('Excel.Application.12')
    || Win32::OLE->new('Excel.Application.12', 'Quit');  # get already active Excel
                                                      # application or open new
$Excel->{visible}=1;  #naar keuze

my $fso = Win32::OLE->new("Scripting.FileSystemObject");


my $file = $ARGV[0];
my $full_name_file = $fso->GetAbsolutePathName($file);
my $Book;

if($fso->FileExists($full_name_file)){
	$Book = $Excel->Workbooks->Open($full_name_file); # open Excel file
	print "Bestaand bestand $full_name_file geopend.\n";
	foreach my $Sheet (in $Book->Sheets){
		print "Sheet : ".$Sheet->Name."\n";
		my $Range = $Sheet->UsedRange;
		my $rows = $Range->Rows->Count;
		my $columns = $Range->Columns->Count;
		if($rows==1 && $columns==1){
			print "Sheet ".$Sheet->Name." niet gebruikt.\n";
		}
		else{
			print "Gebruikte range: (".$rows." x ".$columns.").\n";
		}

	} 
}