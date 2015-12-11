$LayoutPath = "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\TEMPLATE\LAYOUTS"
#$WebAppURL = "http://hector7:1111"
#$SPweb = get-spwebapplication -identity $WebAppURL

$arrInternalAccount = "system", "SharePoint\system", "EBIZ\administrator"

if($LayoutPath.endswith("/") -eq $false)
{
	if($LayoutPath.endswith("\") -eq $false)
	{
		$LayoutPath += "\"
	}
}

$checkInComment="Check In"
$publishComment="published"
$approveComment="Approved"


$masterName = "SnapTracker.master"
$masterFilePath = $LayoutPath + $masterName
$cssName = "SnapTracker.css"
$cssFilePath = $LayoutPath + $cssName

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
		$bInternalAccount = IsInternalAccount $name
        if($bInternalAccount -eq $false)
        {
            $output = "****** The file - " + $DestURL + " is last modified by " + $name +", not by internal account - " + $arrInternalAccount
	        Write-Output $output

			return
        }
	
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
	$destUrl = $web.Url + "/_catalogs/masterpage/" + $masterName
	UpdateFile $web $masterFilePath "Master Page Gallery" $destUrl
	
	$folder = ($web).GetFolder("Style Library")
	$destUrl = $folder.url + "/" + $cssName
	UpdateFile $web $cssFilePath "Style Library" $destUrl
	
	
#}

