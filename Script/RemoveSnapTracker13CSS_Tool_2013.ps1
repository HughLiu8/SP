#$WebAppURL = "http://hector7:1111"
#$SPwebAPP = get-SPwebapplication -identity $WebAppURL


$arrWantTOReplaceCSS = "/Style Library/SnapTracker-13.css", "/Style Library/SnapTracker-13-v2.css", "/Style Library/SnapTracker-13-bctwrap.css"
$CSSReplaceTo = "/Style Library/SnapTracker.css"

function IsWantToReplaced($cssurl)
{
    foreach($wanttoCSS in $arrWantTOReplaceCSS)
    {
        if($cssurl.EndsWith($wanttoCSS))
        {
            return $true
        }
    }

    return $false
}

function IsFileExist($curWeb, $absoluteURL)
{
	$CurFile = $curWeb.GetFile($absoluteURL)
	if($CurFile.Exists)
	{
		return $true
	}	

    return $false
}

function RemoveFile($curWeb, $absoluteURL)
{
    $fileExsit = IsFileExist $curWeb $absoluteURL
    if($fileExsit -eq $false)
    {
        return
    }
    
    $CurFile = $curWeb.GetFile($absoluteURL)
    $CurFile.Delete()
    $curWeb.Update()
    $outputtext = "---- Remove File: " + $absoluteURL
    Write-Output $outputtext
}

function RemoveArrFiles($RootWeb, $arrURLs)
{
    foreach($relativeURL in $arrURLs)
    {
        $absoluteURL = $RootWeb.Url + $relativeURL
        RemoveFile $RootWeb $absoluteURL
    }
}


#foreach ($SPSite in $SPwebAPP.sites)
#{
    $curWebAppURL = $SPSite.WebApplication.Url
    $RootWeb = $SPSite.RootWeb
    $NewCSSURL = $RootWeb.Url + $CSSReplaceTo
    $fileExsit = IsFileExist $RootWeb $NewCSSURL
    if($fileExsit -eq $false)
    {
        continue
    }

	foreach($web in $SPSite.AllWebs) 
	{
        $OldCSSURL = $web.AlternateCssUrl
        $bWanted = IsWantToReplaced $OldCSSURL
        if($bWanted -eq $false)
        {
            continue
        }

        $OldCSSURL = $curWebAppURL + $OldCSSURL      
        
        $web.AlternateCssUrl = $NewCSSURL
        $web.Update()
        $outputtext = "---- Web URL: " + $web.Url
        Write-Output $outputtext

        $outputtext = "------ Replace CSS from " + $OldCSSURL + " to " + $NewCSSURL
        Write-Output $outputtext

	}

    RemoveArrFiles $RootWeb $arrWantTOReplaceCSS
#}


