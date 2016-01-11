$MasterPageDir = "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\TEMPLATE\FEATURES\MosaicMasterPages\MosaicMasterPages"
#$WebAppURL = "http://hector7:7777"
#$SPweb = get-spwebapplication -identity $WebAppURL

$arrInternalAccount = "system", "SharePoint\system", "EBIZ\administrator"

if($MasterPageDir.endswith("/") -eq $false)
{
	if($MasterPageDir.endswith("\") -eq $false)
	{
		$MasterPageDir += "\"
	}
}

$checkInComment="Check In"
$publishComment="published"
$approveComment="Approved"


$arrMasterName = "MosaicBusiness.master", "MosaicCentene.master", "MosaicCustom.master", "MosaicDefaults.master", "MosaicEducat.master", "MosaicFinance.master", "MosaicGov.master", "MosaicHealth.master", "MosaicManufacturing.master", "MosaicShop.master", "MosaicSust.master", "MosaicTech.master"

$global:arrmasterFilePath = @()
foreach($masterName in $arrMasterName)
{
    $masterFilePath = $MasterPageDir + $masterName
    $global:arrmasterFilePath += $masterFilePath
}



function GetLatestModifiedUserName($item)
{
	$name = $item.ModifiedBy.LoginName
	$name = $name.SubString($name.LastIndexOf("|") + 1, $name.length - $name.LastIndexOf("|") - 1)
	
	return $name
}

function IsInternalAccount($loginname)
{
    foreach($curName in $arrInternalAccount)
    {
        if($curName -eq $loginname)
        {
            return $true
        }
    }

    return $false
}



function UpdateFile($web, $SrcFilePath, $DocumentName, $DestURL)
{
	try
	{
		$web.AllowUnsafeUpdates=$true;
		
		$DocumentFolder = ($web).GetFolder($DocumentName)
		#$outputtext = "DocumentFolder.Exists: " + $DocumentFolder.Exists + "DestURL: " + $DestURL
		#Write-Output $outputtext
		
		$CurFile = $web.GetFile($DestURL)
		#"CurFile.Exists: " + $CurFile.Exists + "DestURL: " + $DestURL
		if($CurFile.Exists -eq $false)
		{
			return
		}	
		
		$name = GetLatestModifiedUserName $CurFile

		$stream = [IO.File]::OpenRead($SrcFilePath)
	
		#"CurFile.CheckOutStatus: " + $CurFile.CheckOutStatus
		if($CurFile.CheckOutStatus -ne "None")
		{
			$Result = $DocumentFolder.files.Add($DestURL, $stream, $true)
		   
			if($stream -ne $null)
			{
				$stream.close()
			}                                 
			$CurFile.CheckIn($checkInComment);      
			try
			{
				$CurFile.Publish($publishComment);     
			}
			catch
			{
				Write-Output $_
			}
			                  
			#$CurFile.Approve($approveComment);
			$CurFile.Update();        
			$web.Update();
			$web.AllowUnsafeUpdates  = $false;
			$outputText = "****** " + $CurFile.Name + " uploaded on " + $web.url + " site"
			Write-Output $outputText
			
		}
		else
		{
			$CurFile.CheckOut();
			try{
				$Result = $DocumentFolder.Files.Add($DestURL, $stream, $true)
			}
			catch
			{
				if($stream -ne $null)
				{
					$stream.close()
				}  
				$web.AllowUnsafeUpdates  = $false;
				#Write-Output "0 exception web url"
				#Write-Output $web.url
				#Write-Output $_
			}
			if($stream -ne $null)
			{
				$stream.close()
			}                                  
			$CurFile.CheckIn($checkInComment);                                     
			try
			{
				$CurFile.Publish($publishComment);     
			}
			catch
			{
				Write-Output $_
			}                                    
			#$CurFile.Approve($approveComment);
			$CurFile.Update();        
			$web.Update();
			$web.AllowUnsafeUpdates  = $false;
			$outputText = "****** " + $CurFile.Name + " uploaded on " + $web.url + " site"
			Write-Output $outputText
		}	
	}
	catch
	{
		if($stream -ne $null)
		{
			$stream.close()
		}

		$web.AllowUnsafeUpdates  = $false;
		#Write-Output "1 exception web url"
		#Write-Output $web.url
		#Write-Output $_
	}
	
	$web.AllowUnsafeUpdates  = $false;
}


#foreach ($SPSite in $SPweb.sites)
#{

	$web = $SPSite.RootWeb
		
	#"****** " + $web.url
    $count = $arrMasterName.Count
    for($i=0; $i -le $count; $i++)
    {
        $curMasterName = $arrMasterName[$i]
        $curMasterPath = $global:arrmasterFilePath[$i]
	    $destUrl = $web.Url + "/_catalogs/masterpage/" + $curMasterName
	    UpdateFile $web $curMasterPath "Master Page Gallery" $destUrl
    }

	
	
	
#}

