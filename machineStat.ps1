#server name 
$server = Read-Host -Prompt "Enter a name server (localhost is default)"

#if server name is empty, set variable to localhost
if ($server -ep "") {
    $server = "localhost"
}

#server stats
$os = Get-CimInstance Win32_OperatingSystem -ComputerName $server
$mTotal = ($os.TotalVisibleMemorySize / 1MB)
$mAvailable = ($os.FreePhysicalMemory / 1MB)

#write stats
Write-Host "Stats for $server" -ForegroundColor Green
Write-Host ('-' * 25)
Write-Host "Total Memory       : $mTotal GB"
Write-Host "Avaialable Memory  : $mAvailable GB"
Write-Host "Used Memory        : $($mTotal - $mAvailable) GB"
Write-Host "Operating System   : $($os.Caption)"
Write-Host "System Drive       : $($os.SystemDrive)\"
