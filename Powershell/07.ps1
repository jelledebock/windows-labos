﻿Get-ChildItem -Path C:\Users\Administrator\Documents | where { $_.LastWriteTime.DayOfWeek -gt 0 } | select Name, @{Label="Uur";Expression={$_.LastWriteTime.Hour}}
