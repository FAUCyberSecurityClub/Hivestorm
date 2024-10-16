# Hivestorm
Scripts and Tasks for Hivestorm

## Example of Priority and Logging Findings

![Screenshot 2024-10-16 at 12 58 17 AM](https://github.com/user-attachments/assets/d90b15ca-5ddc-4ee7-95e1-4de756853488)


## Windows Update
### Check for available updates
    Get-WindowsUpdate
### Install all available updates
    Install-WindowsUpdate -AcceptAll -AutoReboot

    
## Users

### Unauthorized Users
    Get-LocalUser | Where-Object { $_.Enabled -eq $true -and $_.Name -notin @("Administrator", "DefaultAccount", "Guest") }
### List all local users
    Get-LocalUser
### Disable an unauthorized user
    Disable-LocalUser -Name "Username"
### Remove an unauthorized user
    Remove-LocalUser -Name "Username"

## Examine Security Settings and Policies
### Group Policy Settings:
#### Open Group Policy Editor
    gpedit.msc
#### Alternatively, export and review specific policies
    Get-GPOReport -All -ReportType HTML -Path "C:\GPOReport.html"
### Audit and Logging:
#### Enable auditing for logon events
    AuditPol /set /subcategory:"Logon" /success:enable /failure:enable
#### Review security logs
    Get-EventLog -LogName Security -Newest 100



## Password
### Password Policies
    Get-LocalUser | Select-Object Name, PasswordLastSet, PasswordNeverExpires

### Set password to expire after 90 days
    net accounts /maxpwage:90

## Firewall 
### Firewall Status
    Get-LocalUser | Select-Object Name, PasswordLastSet, PasswordNeverExpires


    Get-NetFirewallProfile

    
### Enable firewall for all profiles
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
#### Explanation:

Set-NetFirewallProfile: This cmdlet modifies the settings of the Windows Firewall profiles.

- Profile Domain,Public,Private: Specifies that the changes should apply to all three firewall profiles: Domain, Public, and Private.

- Enabled True: Sets the Enabled property to True, effectively turning on the firewall for the specified profiles.

## Installed Apps    
### Get-InstalledModule
    Get-InstalledModule

## Network Ports    
### Nmap Open Ports
    nmap -sV -O <VM_IP_Address>
### Do the next three commands in a sequence if you can.    
### List open ports
    Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, State
### Disable a service
    Stop-Service -Name "ServiceName"
### Disable a service at Startup
    Set-Service -Name "ServiceName" -StartupType Disabled


## Windows Defender    
### Windows Defender QuickScan
    Start-MpScan -ScanType QuickScan

### List installed software
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion

### BE CAREFUL ONLY PUT specific software name in SoftwareName!!!
### Uninstall unauthorized software
    Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name = 'SoftwareName'" | ForEach-Object { $_.Uninstall() }





