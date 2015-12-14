$webApp = Get-SPWebApplication "<WebApplicationURL>"
[Microsoft.SharePoint.Publishing.PublishingCache]::FlushBlobCache($webApp)
Write-Host "Flushed the BLOB cache for:" $webApp