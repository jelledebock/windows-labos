=for
Ontwikkel een semi-synchroon script dat een melding geeft voor elk proces dat gestart op gestopt wordt. 
Geef voor elk process de naam en het processId. Werk dit uit op twee manieren: met de specifieke Event-klasse voor 
processen (zie oef 34 uit vorige reeks), of met de algemene Event-klassen (zie oef 36 uit vorige reeks).
In de tweede methode moet je een "frequentie" opgegeven. Hierdoor kan het voorkomen dat je processen niet opmerkt 
omdat ze onmiddellijk gesloten worden. Kijk wat er gebeurt als je de calculator opstart. Op windows 10 was er in vorige 
reeks een probleem met dit proces. Dat wordt in deze oefening verklaard.
=cut

#!/usr/bin/perl

use Win32::OLE;
use Data::Dumper;

$Win32::OLE::Warn=3;

$locator = Win32::OLE->new("WbemScripting.SWbemLocator.1");
$com_obj = $locator->ConnectServer(".","root/cimv2");

$exec_event_source = $com_obj->ExecNotificationQuery("SELECT * FROM Win32_ProcessTrace WHERE ProcessName='calc.exe'");

while(my $event = $exec_event_source->NextEvent(5000)){
	printf "PID %d : %s\n", $event->{'ProcessID'}, $event->{'ProcessName'};
}



