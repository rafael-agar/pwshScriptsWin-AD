Get-VM *| Enable-VMResourceMetering

Get-VM
Get-VM | Format-Table Name,State,ResourceMeteringEnabled


Get-VM | Measure-VM

#To stop collect data now reset it and disable it
Get-VM * | Reset-VMResourceMetering
Get-VM | Disable-VMResourceMetering
