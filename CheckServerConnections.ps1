$servers = Get-ADComputer -Filter {(OpertatingSystem -like "*server*")}

#ping each server
foreach ($i in $servers) {
    Test-Connection -ComputerName $i.Name -Count 1
}
