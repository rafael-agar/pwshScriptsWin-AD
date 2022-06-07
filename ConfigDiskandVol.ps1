#Remeber write the File System Label in the variable
$name = ""
Get-Disk | `
Where-Object PartitionStyle -EQ "Raw" | `
Initialize-Disk -PartitionStyle GPT -PassThru | `
New-Partition -UseMaximumSize -AssignDriveLetter | `
Format-Volume -FileSystem NTFS -NewFileSystemLabel $name
