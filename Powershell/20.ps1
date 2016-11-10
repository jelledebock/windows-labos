<#-----------------------------------------------------------------------------------------------
    Toon alle methodes + methodequalifiers voor Win32_Process. De uitvoer afwerken zodat je alle 
    qualifiers ook ziet is niet zo evident. Gebruik daarvoor foreach + Write-Host.
-----------------------------------------------------------------------------------------------#>

$server = New-Object -ComObject "WbemScripting.SWBemLocator";
$wmi_class = $server.ConnectServer(".","root/cimv2");

$process = $wmi_class.get("Win32_Process");

foreach ($_ in $process.Properties_){
    write "........................";
    write $_.Name;
    write "........................";
    foreach ($qualifier in $_.Qualifiers_){
        #Write-Output $qualifier;
        $qualifier | select @{Label="Qualifiernaam";Expression={$_.name}}, @{Label="Waarde";Expression={$_.value}};
    }
}