<#
It must create two volumes o each ones: Data and Logs.
Data and Log disk must be initialized as GTP.
The two data volumes must be of identical size.
The two log volumes sould be of identical size.
All replica data and logs volumes must have the same sector size.
The log Volumen sould use flash-based storage (SSD) at least 9GB.
Data disk can use HDD, SSD or combined, Mirrored or RAID.
The File Server Role is only for Test-SRTopology.
#>

#Installing Stotare Replica two Computers
Invoke-Command -ComputerName COMP1,COMP2 `
-ScriptBlock {Install-WindowsFeature Storage-Replica, FS-FoleServer -IncludeManagementTools -Restart}

# Testing on premise
Test-SRTopology -SouceComputerName COMP1 -SourceVolumeName U: SourceLogVolumeName L: `
-DestinationComputerName COMP2 -DestinationVolumeName U: -DestinationLogVolumeName L: `
-DurationInMinutes 5 -ResultPath c:\temp

#creating Partnership
New-SRPartnership -SouceComputerName COMP1 -SourceRGName RG1 `
-SourceVolumeName U: SourceLogVolumeName L: `
-DestinationComputerName COMP2 -SourceRGName RG2 `
-DestinationVolumeName U: -DestinationLogVolumeName L:
