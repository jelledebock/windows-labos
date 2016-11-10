dir -File | where{$_.LastWriteTime -gt (Get-Date -Year 2016 -Month 10 -Day 1)} | Sort-Object -Property LastWriteTime -Descending
