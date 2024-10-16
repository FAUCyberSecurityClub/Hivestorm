# Hivestorm
Scripts and Tasks for Hivestorm

## Users

### Unauthorized Users
    Get-LocalUser | Where-Object { $_.Enabled -eq $true -and $_.Name -notin @("Administrator", "DefaultAccount", "Guest") }
### List all local users
    Get-LocalUser
### Disable an unauthorized user
    Disable-LocalUser -Name "Username"
### Remove an unauthorized user
    Remove-LocalUser -Name "Username"

## Password
### Password Policies
    Get-LocalUser | Select-Object Name, PasswordLastSet, PasswordNeverExpires

### Set password to expire after 90 days
    net accounts /maxpwage:90

## Firewall 
### Firewall Status
    Get-LocalUser | Select-Object Name, PasswordLastSet, PasswordNeverExpires

## Installed Apps    
### Get-InstalledModule
    Get-InstalledModule

## Network Ports    
### Nmap Open Ports
    nmap -sV -O <VM_IP_Address>

## Windows Defender    
### Windows Defender QuickScan
    Start-MpScan -ScanType QuickScan



