# Windows workstation diagnostic: writes a text report in the current folder.
$report = "diagnostic_$($env:COMPUTERNAME)_$(Get-Date -Format 'yyyyMMdd_HHmm').txt"
$os = Get-CimInstance Win32_OperatingSystem
$uptime = (Get-Date) - $os.LastBootUpTime

"=== DIAGNOSTIC $($env:COMPUTERNAME) - $(Get-Date) ===" | Out-File $report
"--- System ---" | Out-File $report -Append
"OS: $($os.Caption) $($os.Version)" | Out-File $report -Append
"Uptime: $([int]$uptime.TotalDays) days" | Out-File $report -Append
("Free RAM: {0:N1} GB of {1:N1} GB" -f ($os.FreePhysicalMemory/1MB), ($os.TotalVisibleMemorySize/1MB)) | Out-File $report -Append

"--- Disks ---" | Out-File $report -Append
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    "{0} free {1:N1} GB of {2:N1} GB" -f $_.DeviceID, ($_.FreeSpace/1GB), ($_.Size/1GB)
} | Out-File $report -Append

"--- Network ---" | Out-File $report -Append
Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway } | ForEach-Object {
    "Interface: $($_.InterfaceAlias) | IP: $($_.IPv4Address.IPAddress) | Gateway: $($_.IPv4DefaultGateway.NextHop) | DNS: $($_.DNSServer.ServerAddresses -join ', ')"
} | Out-File $report -Append
$online = Test-Connection -ComputerName 8.8.8.8 -Count 2 -Quiet
"Internet access (ping 8.8.8.8): $online" | Out-File $report -Append

"--- Top 5 processes by memory ---" | Out-File $report -Append
Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First 5 Name, @{n='MB';e={[int]($_.WorkingSet64/1MB)}} | Format-Table | Out-String | Out-File $report -Append

Write-Host "Report saved: $report"