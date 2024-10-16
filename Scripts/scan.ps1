# Create or clear the scan.txt file
New-Item -Path .\scan.txt -ItemType File -Force | Out-Null

# Function to add a section header to the log file
function Add-SectionHeader($header) {
    Add-Content -Path .\scan.txt -Value "`n`n=== $header ===`n"
}

# Malware Scan
Add-SectionHeader "Windows Defender QuickScan"
Start-MpScan -ScanType QuickScan | Out-File -Append -FilePath .\scan.txt

# Open Ports Scan
Add-SectionHeader "Open TCP Ports"
Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, State | Format-Table | Out-File -Append -FilePath .\scan.txt

# Installed Software Scan
Add-SectionHeader "Installed Software"
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | 
    Select-Object DisplayName, DisplayVersion | 
    Where-Object { $_.DisplayName -ne $null } | 
    Sort-Object DisplayName | 
    Format-Table -AutoSize | 
    Out-File -Append -FilePath .\scan.txt

# Installed PowerShell Modules
Add-SectionHeader "Installed PowerShell Modules"
Get-InstalledModule | Format-Table -AutoSize | Out-File -Append -FilePath .\scan.txt

Write-Host "Scan completed. Results have been saved to scan.txt"

