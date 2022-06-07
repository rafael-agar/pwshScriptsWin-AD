$clustername = ""

#installing in failover over machines
Invoke-Command -ComputerName NAME1,NAME2 -ScriptBlock {Install-WindowsFeature Failover-Clustering -IncludeManagementTools}

#validate
Test-Cluster -node NAME1,NAME2 -Include "Storage Spaces Direct", "Inventory", "Network", "System Configuration"

#creating cluster, type IP address
New-Cluster -name $clustername -node NAME1,NAME2 -NoStorage -StaticAddress "IP"

#config quorum, type the rute
Set-ClusterQuorum -Cluster $clustername -FileShareWitness "\\route\file"
