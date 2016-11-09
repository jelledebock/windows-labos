#In MSDN : Win32 and COM Development -> Admininstration Management -> Windows Management Instrumentation -> WMI Reference
use Win32::OLE::Const;

$SWBem = Win32::OLE->new('WbemScripting.SWbemLocator.1');

$Swbemservice = $SWBem->ConnectServer('localhost','root/cimv2');

printf("%s\n",join(',',Win32::OLE->QueryObjectType($Swbemservice)));