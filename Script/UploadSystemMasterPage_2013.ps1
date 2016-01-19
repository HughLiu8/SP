$MasterPageDir = "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\TEMPLATE\FEATURES\MosaicMasterPages\MosaicMasterPages"
#$WebAppURL = "http://hector7:7777"
#$SPweb = get-spwebapplication -identity $WebAppURL


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


$MasterName = "seattleNoLeftNavigation.master"

$masterFilePath = $MasterPageDir + $MasterName





function UploadFile($web, $SrcFilePath, $DocumentName, $DestURL)
{
	try
	{
		$web.AllowUnsafeUpdates=$true;
		
		$DocumentFolder = ($web).GetFolder($DocumentName)
		#$outputtext = "DocumentFolder.Exists: " + $DocumentFolder.Exists + "DestURL: " + $DestURL
		#Write-Output $outputtext
		
		$CurFile = $web.GetFile($DestURL)
		#"CurFile.Exists: " + $CurFile.Exists + "DestURL: " + $DestURL

		$stream = [IO.File]::OpenRead($SrcFilePath)
	
		#"CurFile.CheckOutStatus: " + $CurFile.CheckOutStatus
        if($CurFile.Exists)
        {
		    if($CurFile.CheckOutStatus -ne "None")
		    {
               $CurFile.CheckIn($checkInComment);  
            }

            $CurFile.CheckOut();
        }       
			    
        $Result = $DocumentFolder.files.Add($DestURL, $stream, $true)
        $CurFile = $web.GetFile($DestURL)
        if($CurFile.CheckOutStatus -ne "None")
		{
            $CurFile.CheckIn($checkInComment);  
        }
        else
        {
            $CurFile.CheckOut();
            $CurFile.CheckIn($checkInComment);  
        }
		   
		if($stream -ne $null)
		{
			$stream.close()
		}                                   
		try
		{
		    if($CurFile.CheckOutStatus -ne "None")
		    {
               $CurFile.CheckIn($checkInComment);  
            }

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
	
	
}

function UseNewMasterPage($web, $MasterName)
{
    $web.AllowUnsafeUpdates  = $true;
    $destUrl = $web.ServerRelativeUrl + "/_catalogs/masterpage/" + $MasterName
    $web.MasterUrl = $destUrl
    $web.Update()
    $web.AllowUnsafeUpdates  = $false;
}


#foreach ($SPSite in $SPweb.sites)
#{

	$web = $SPSite.RootWeb
		
	#"****** " + $web.url

    if($web.WebTemplate.ToString() -ne "MOSAICSITEDEFIN")
    {
        continue
    }

	$destUrl = $web.Url + "/_catalogs/masterpage/" + $MasterName
	UploadFile $web $masterFilePath "Master Page Gallery" $destUrl


	UseNewMasterPage $web $MasterName
	$web.AllowUnsafeUpdates  = $false;
	
#}

