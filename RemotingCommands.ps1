#init 
Enter-PSSession -ComputerName NAME-COMPUTER

#creating a new session and copy files
$session = New-PSSession -ComputerName NAME-COMPUTER
Copy-Item -Path 'C:\Documents and Settings' -Destination 'C:\Documents and Settings' -Recurse -ToSession $session 
Enter-PSSession $session

#send command (get service for example) to machine after init PSSession
Invoke-Command -ComputerName NAME-COMPUTER -ScriptBlock { Get-Service}

#send command to multiple machines after init PSSession
Invoke-Command -ComputerName NAME-COMPUTER, NAME-COMPUTER2, NAME-COMPUTER3 -ScriptBlock { Get-Service NAME*}

#send Script to multiple machines after init PSSession
Invoke-Command -ComputerName NAME-COMPUTER, NAME-COMPUT -FilePath c:\Documents\script.ps1
