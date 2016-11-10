Get-Service | where {$_.Status -eq "Running"} | select Name;

Get-Service | Group-Object -Property status;

Get-Service | where {$_.DependentServices.Count -gt 1 } | select Name, @{Label="Aantal Afhankelijke Services";Expression={$_.dependentservices.count}};
