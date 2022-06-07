$domain = Read-Host -Pormpt "Type Domain Name: "

New-NetFirewallRule -DisplayName "Allow ICMPv4" -Direction Inbound -Action Allow -Protocol ICMPv4
New-NetFirewallRule -DisplayName "Allow ICMPv6" -Direction Inbound -Action Allow -Protocol ICMPv6

#install ADDS
Install-windowsfeature -name FS-FileServer

#join the domain
Add-Computer -DomainName $domain -credential (get-credential) -Restart
