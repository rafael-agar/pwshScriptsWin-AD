$ip = Read-Host -Pormpt "Type IP Address: "
$gw = Read-Host -Pormpt "Type GateWay IP: "
$prefix = Read-Host -Pormpt "Prefix Length: "

Get-NetAdapter

$adapter = Read-Host -Pormpt "Type Network Adapter Name: "
$newname = Read-Host -Pormpt "Type Computer Name: "

$result = @"
IP addres: $ip
Gateway: $gw/$prefix
Adapter: $adapter
Name Computer: $newname
"@

Write-Host "============================="
Write-Host -ForegroundColor Green "Please check:"
$result

$confirm = Read-Host 'Are you Sure You Want to Proceed? please type "yes", If Not Sure press "No" '

if ($confirm -eq 'yes') {
    #setting
New-NetIPAddress -InterfaceIndex $adapter -IPAddress $ip -AddressFamily IPv4 -PrefixLength $prefix -DefaultGateway $gw
Rename-Computer -NewName $newname -Force -Restart:$true
} else {
    Remove-Variable -Name $ip $gw $prefix $adapter $newname $result
}
