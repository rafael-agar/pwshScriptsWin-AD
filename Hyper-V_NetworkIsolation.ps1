#Set up Network Isolation

#go to Hypervisor
Get-VMNetworkAdapter -VMName vmName

#now deny conection between devices
$ipremote = 192.168.0.x
Add-VMNetworkAdapterACL -VMName vmName -RemoteIPAddress $ipremote -Direction Both -Action Deny
#repeat this on devices you need it

#check
Get-VMNetworkAdapterAcl -VMName vmName
