$ip = Read-Host -Pormpt "Type IP Address: "
$gw = Read-Host -Pormpt "Type GateWay IP: "
$prefix = Read-Host -Pormpt "Prefix Length: "

Get-NetAdapter -Name * | Format-Table -View Name

$adapter = Read-Host -Pormpt "Type Network Adapter Name: "
$newname = Read-Host -Pormpt "Type Computer Name: "

#setting FileServer
New-NetIPAddress -InterfaceIndex $adapter -IPAddress $ip -AddressFamily IPv4 -PrefixLength $prefix -DefaultGateway $gw
Rename-Computer -NewName $newname -Force -Restart:$true
