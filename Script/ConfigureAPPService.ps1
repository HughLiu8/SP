

$subSettingstName = "Subscription Settings Service" 
$subSettingstDatabaseName = "SP2013_Farm_SubSettingsDB" 
$appManagementName = "App Management Service"
$appManagementProxyName = "App Management Service Proxy"
$appManagementDatabaseName = "SP2013_Farm_AppManagementDB" 
$databaseServerName = "Hector7"

$saAppPoolName = "ServiceAppPool"

#New-SPServiceApplicationPool -Name $saAppPoolName -Account (Get-SPManagedAccount KISP151\sp_dev)

Write-Host "Creating Subscription Settings Service and Proxy..." 
$subSvc = New-SPSubscriptionSettingsServiceApplication –ApplicationPool $saAppPoolName –Name $subSettingstName –DatabaseName $subSettingstDatabaseName 
$subSvcProxy = New-SPSubscriptionSettingsServiceApplicationProxy –ServiceApplication $subSvc 
Get-SPServiceInstance | where-object {$_.TypeName -eq $subSettingstName} | Start-SPServiceInstance > $null



Write-Host "Creating App Management Service and Proxy..."
$appManagement = New-SPAppManagementServiceApplication -Name $appManagementName -DatabaseServer $databaseServerName -DatabaseName $appManagementDatabaseName –ApplicationPool $saAppPoolName

$appManagementProxy = New-SPAppManagementServiceApplicationProxy -ServiceApplication $appManagement -Name $appManagementProxyName
Get-SPServiceInstance | where-object {$_.TypeName -eq $appManagementName} |
Start-SPServiceInstance > $null

