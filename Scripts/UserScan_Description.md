
## This script does the following:
- Creates (or clears if it already exists) a file named User_Scan.txt.
- Defines a function to add section headers to the log file.
- Lists all local users and logs the results.
- Finds potentially unauthorized users (enabled users not named Administrator, DefaultAccount, or Guest) and logs the results.
- Checks password policies for all users (including last password set date and whether the password never expires) and logs the results.
- Outputs a message to the console when the scan is complete.


### To use this script:
- Save it as UserScan.ps1 in your desired directory.
- Open PowerShell as an administrator (this is necessary to access user information).
- Navigate to the directory containing the script.
- Run the script by typing .\UserScan.ps1.
  
The script will execute all the user-related scanning commands and save the results in User_Scan.txt in the same directory. This will give you a comprehensive overview of the user accounts on the system, helping you identify potential security issues related to user management.
