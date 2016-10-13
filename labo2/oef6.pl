use strict;
use Win32::OLE qw(in with);
use Win32::OLE::Const 'Microsoft Excel';
use Data::Dumper;
$Win32::OLE::Warn = 3;                                # die on errors...

my $Excel = Win32::OLE->GetActiveObject('Excel.Application.12')
    || Win32::OLE->new('Excel.Application.12', 'Quit');  # get already active Excel
                                                      # application or open new
$Excel->{visible}=1;  #naar keuze

my $fso = Win32::OLE->new("Scripting.FileSystemObject");


my $file = $ARGV[0];
my $aantal_rijen = $ARGV[1];
my $aantal_kolommen = $ARGV[2];

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

print "Filling worksheet 1 with $aantal_rijen rijen en $aantal_kolommen data";

my $Sheet = $Book->Worksheets(1);

my @array;
for(my $i=0;$i<$aantal_rijen;$i++){
	my $row = [];
	for(my $j=0;$j<$aantal_kolommen;$j++){
		push @$row, $i*$aantal_rijen+$j;
	}
	push @array, $row;
}

#print Dumper(\@array);

my $Range = $Sheet->Range($Sheet->Cells(1,1), $Sheet->Cells($aantal_rijen,$aantal_kolommen));
$Range->{Value} = \@array;

$Book->save;
