[[setting]] Win SErver

New-NetIPAddress -InterfaceIndex 5 -IPAddress "192.168.1.10" -AddressFamily IPv4 ‑PrefixLength 24 -DefaultGateway "192.168.1.1"
Rename-Computer -NewName "DC" -Force -Restart:$true
[[install]] ADDS
Install-windowsfeature -name AD-Domain-Services -IncludeManagementTools
[[promote]]
InstallADDForest -Domainname domain.com -InstallDns

[[setting]] FileServer
New-NetIPAddress -InterfaceIndex 5 -IPAddress "192.168.1.10" -AddressFamily IPv4 ‑PrefixLength 24 -DefaultGateway "192.168.1.1"
Rename-Computer -NewName "DC" -Force -Restart:$true
[[install]] ADDS
Install-windowsfeature -name FS-FileServer
[[join]] the domain
Add-Compter -DomainName domain.com -NewName "***" -Restart



[[join]] to domain
Install-ADDomainController -name domain.com -credential (get-credential)

[[Promoting]] a domain member to an RODC
Install-ADDSDomainController -Credential (Get-Credential) -DomainName <domainName> -InstallDNS:$true -ReadOnlyReplica:$true -SiteName "Default-First-Site-Name" -Force:$true
	
[[remuve]]
Remove-Computer -Credential "aybtotal.local\Administrator" -Restart -Force

Remove-Computer -Identity "NameComputer" -Restart -Force

Remove-Computer -Filter 'Location -eq "Default-First-First-Site-Name"' -Restart -Force
	

[[Verificar]] carpeta compartidas
Get-SmbShare

[[Verificar]] confianza entre DCs
Get-ADTrust -Filter * | ogv

[[Verificar]] roles FSMO
Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator

Get-ADForest | Select-Object DomainNamingMaster, SchemaMaster

Get-ADDomainController -Service PrimaryDC -Discover

Get-ADDomainController -Filter * |
    Select-Object Name, Domain, Forest, OperationMasterRoles |
    ft -AutoSize
	
	
[[Time]] to live
[[Consultar]] niveles funcionales
(Get-ADForest).ForestMode

(Get-ADDomain).DomainMode

[[Consultar]] caracteristicas opcionales de AD
Get-ADOptionalFeature -Filter *

[[Habilitar]] caracteristica
Enable-ADOptionalFeature "Privileged Access Management Feature" -Scope ForestOrConfigurationSet -Target CONTOSO.local