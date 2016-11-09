use Win32::OLE::Const;

$locator = Win32::OLE->new('WbemScripting.SWbemLocator.1');

%props = %{Win32::OLE::Const->Load($locator)};

foreach (keys %props){
	print "$_ -> $props{$_}\n";
}