=for
.........................................................................................................................................
 Creëer via een WMI script een nieuwe environment variabele. Controleer dat je hiervoor de statische methode moet gebruiken.
 Belangrijk voor later (permanente eventregistratie): Na creëren van een nieuwe instantie, met de statische methode, heb je in bepaalde 
 situaties de absolute padnaam nodig van dit nieuwe object. De relatieve padnaam ophalen lukt zonder problemen, maar de absolute padnaam 
 kan NIET worden opgehaald met de informele methode - zoek uit hoe dit wel lukt !!
 Controleer met de oplossing van oefening 12 dat dit correct gebeurd is. Je kan ook met c:\windows\system32\sysdm.cpl alle environment 
 variabelen controleren. 
.........................................................................................................................................
=cut

use Win32::OLE;
use strict;
use warnings;

$Win32::OLE::Warn=3;

