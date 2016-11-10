$virtual_adapter = Get-WmiObject -Query "select * from Win32_NetworkAdapter where ServiceName='VBoxNetAdp'";

$virtual_adapter.Properties;
$virtual_adapter.SystemProperties;
