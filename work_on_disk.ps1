#nuw Volume
Get-Disk -Number 1 | Initialize-Disk -PartitionStyle GPT -PassThru | New-Volume -FileSystem NTFS -DriveLetter F -FriendlyName 'New-Volume'

#new Partition
New-Partition -DiskNumber 1 -UseMaximumSize -DriveLetter F | Format-Volume -NewFileSystemLabel “stuff” -FileSystem ReFS

#Creating a Virtual Hard Disk, remember use the right driveletter
New-VHD -Path F:\myvhd.vhd -Dynamic -SizeBytes 10Gb | Mount-VHD -Passthru | Initialize-Disk -Passthru | New-Partition -AssignDriveLetter  -UseMaximumSize | Format-Volume -FileSystem NTFS
Get-VHD F:\myvhd.vhd
#Convert VHD to VHDX to optimize
Dismount-VHD F:\myvhd.vhd | Convert-VHD F:\myvhd.vhd  -DestinationPath F:\myvhd.vhdx | Optimize-VHD -Path F:\myvhd.vhdx -Mode Full | Mount-VHD F:\myvhd.vhdx 
