#IPv6 address
$ip6 = fd00::10
$staticIPv6 = fe80::aaa0:b000:c000:d000

Enable-NetAdapterBinding -InterfaceAlias Ethernet -ComponentID ms_tcpip6

New-NetIPAddress -InterfaceAlias Ethernet -AddressFamily IPv6 -IPAddress $ip6 -PrefixLength 64

Set-DNSClientServerAddress -InterfaceAlias Ethernet -ServerAddresses $ip6

#test the conection remote
Test-NetConnection $staticIPv6 
