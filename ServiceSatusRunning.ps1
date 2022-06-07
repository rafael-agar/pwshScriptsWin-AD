function Get-RunningServices {
    param (
        $computerName
    )
    
    Get-Service | Where-Object Status -eq 'Running'
}

#use the Function, type the computer name
Get-RunningServices -ComputerName NAME-COMPUTER
