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
}
else{
	$Book = $Excel->Workbooks->Add;
	$Book->SaveAs($full_name_file);
	print "Nieuw bestand $full_name_file geopend.\n";
}

my $aantal_werkbladen = $Book->Sheets->Count;
print "Aantal werkbladen : ".$aantal_werkbladen;


