# Hivestorm
Scripts and Tasks for Hivestorm


### Unauthorized Users
    Get-LocalUser | Where-Object { $_.Enabled -eq $true -and $_.Name -notin @("Administrator", "DefaultAccount", "Guest") }

### Password Policies
    Get-LocalUser | Select-Object Name, PasswordLastSet, PasswordNeverExpires
### Firewall Status
    Get-LocalUser | Select-Object Name, PasswordLastSet, PasswordNeverExpires
### Get-InstalledModule
    Get-InstalledModule



