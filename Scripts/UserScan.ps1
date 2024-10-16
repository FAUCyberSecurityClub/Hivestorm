# Create or clear the User_Scan.txt file
New-Item -Path .\User_Scan.txt -ItemType File -Force | Out-Null

# Function to add a section header to the log file
function Add-SectionHeader($header) {
    Add-Content -Path .\User_Scan.txt -Value "`n`n=== $header ===`n"
}

# List all local users
Add-SectionHeader "All Local Users"
Get-LocalUser | Format-Table -AutoSize | Out-File -Append -FilePath .\User_Scan.txt

# Find potentially unauthorized users
Add-SectionHeader "Potentially Unauthorized Users"
Get-LocalUser | Where-Object { $_.Enabled -eq $true -and $_.Name -notin @("Administrator", "DefaultAccount", "Guest") } | 
    Format-Table -AutoSize | 
    Out-File -Append -FilePath .\User_Scan.txt

# Check password policies for users
Add-SectionHeader "User Password Policies"
Get-LocalUser | Select-Object Name, PasswordLastSet, PasswordNeverExpires | 
    Format-Table -AutoSize | 
    Out-File -Append -FilePath .\User_Scan.txt

Write-Host "User scan completed. Results have been saved to User_Scan.txt"
