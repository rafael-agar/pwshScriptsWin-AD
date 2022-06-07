$domain = Read-Host -Pormpt "Type Domain Name: "
Write-Host "You Domain Name is: $domain"
$confirm = Read-Host 'Are you Sure You Want to Proceed? please type "yes", If Not Sure press "No" '

if ($confirm -eq 'yes') {
    #set Firewall Rulles
    New-NetFirewallRule -DisplayName "Allow ICMPv4" -Direction Inbound -Action Allow -Protocol ICMPv4
    New-NetFirewallRule -DisplayName "Allow ICMPv6" -Direction Inbound -Action Allow -Protocol ICMPv6

    #install ADDS
    Install-windowsfeature -name FS-FileServer

    #join the domain
    Add-Computer -DomainName $domain -credential (get-credential) -Restart
}
else {
    Remove-Variable -Name $domain,$confirm
}
