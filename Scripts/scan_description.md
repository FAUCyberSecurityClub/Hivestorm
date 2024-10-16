
## This script does the following:
- Creates (or clears if it already exists) a file named scan.txt.
- Defines a function to add section headers to the log file.
- Runs a Windows Defender QuickScan and logs the results.
- Scans for open TCP ports and logs the results.
- Scans for installed software from the Windows registry and logs the results.
- Lists installed PowerShell modules and logs the results.
- Outputs a message to the console when the scan is complete.

  
### To use this script:
- Save it as scan.ps1 in your desired directory.
- Open PowerShell as an administrator.
- Navigate to the directory containing the script.
- Run the script by typing .\scan.ps1.
The script will execute all the scanning commands and save the results in scan.txt in the same directory. Note that the Windows Defender scan might take some time to complete, depending on your system.
