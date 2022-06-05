#get all services
$allservices = Get-Service

#services to monitor
$monitorservice = "RemoteAccess","service2","service3";

#loop trhough all services
foreach ($service in $allservices) 
{
    #loop trhough monitored services
    foreach ($sa in $monitorservice) 
    {
        #check if service is a Array
        if ($service.Name -eq $sa) 
        {    
            #check if service no running
            if ($service.Status -ne "Running") {
                #output service info
                Write-Host "The Service $($service.DisplayName) Service ($($service.Name)) is not in Running State" `
                -ForegroundColor Red
            }        
        }
    }
}
