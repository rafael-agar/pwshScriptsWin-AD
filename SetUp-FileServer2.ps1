$domain = Read-Host -Pormpt "Type Domain Name: "

#install ADDS
Install-windowsfeature -name FS-FileServer

#join the domain
Add-Computer -DomainName $domain -credential (get-credential) -Restart
