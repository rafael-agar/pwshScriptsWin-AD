$domain = Read-Host -Pormpt "Type Domain Name: "

Install-windowsfeature -name AD-Domain-Services -IncludeManagementTools

#join to domain
Install-ADDomainController -name $domain -credential (get-credential)

#Promoting a domain member to an RODC
Install-ADDSDomainController -Credential (Get-Credential) -DomainName $domain -InstallDNS:$true -ReadOnlyReplica:$true -SiteName "Default-First-Site-Name" -Force:$true
