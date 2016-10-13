use Win32::OLE;
use Win32::OLE::Const 'Microsoft Excel 12.0 Object Library';

print "Oefening 8...\n";

$Win32::OLE::Warn = 3;

$cdo = Win32::OLE->new("Excel.Sheet.12") or die "error.\n";

print xlCircle;

