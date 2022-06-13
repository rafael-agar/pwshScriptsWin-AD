function GetMachineType {
    param (
        [String]$ComputerName
    )
$os = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $ComputerName

$type = switch ($os.ProductType) {
    1 { "Workstation" }
    2 { "Domain Controller" }
    3 { "Server" }
}

Write-Host "$ComputerName is a $type"
    
}

GetMachineType -ComputerName 'CompNameHere'
