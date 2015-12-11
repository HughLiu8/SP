#$WebAppURL = "http://hector7:1111"
#$SPweb = get-spwebapplication -identity $WebAppURL

$masterNameEndsWith = "masterpage/SnapTracker.master"
$arrCssNameEndsWith = "/Style Library/SnapTracker.css", "/Style Library/SnapTracker-13.css", "/Style Library/SnapTracker-13-v2.css", "/Style Library/SnapTracker-13-bctwrap.css"

function IsOriginalCSS($CSSURL)
{
    foreach($CSSIterator in $arrCssNameEndsWith)
    {
        if($CSSURL.EndsWith($CSSIterator))
        {
            return $true
        }
    }

    return $false
}


#foreach ($SPSite in $SPweb.sites)
#{
	foreach($web in $SPSite.AllWebs) 
	{
		$urlDisplayed = 0
		if($web.CustomMasterUrl.EndsWith($masterNameEndsWith) -eq $false)
		{
			"****** " + $web.url
			$urlDisplayed = 1
			"********* Site Master Page is Customized to " + $web.CustomMasterUrl
		}
		
		if($web.MasterUrl.EndsWith($masterNameEndsWith) -eq $false)
		{
			if(0 -eq $urlDisplayed)
			{
				"****** " + $web.url
				$urlDisplayed = 1
			}
			
			"********* System Master Page is Customized to " + $web.MasterUrl
		}

        if(IsOriginalCSS($web.AlternateCssUrl))
        {
            continue
        }

		if(0 -eq $urlDisplayed)
		{
			"****** " + $web.url
			$urlDisplayed = 1
		}
			
		if($web.AlternateCssUrl.length -eq 0)
		{
			"********* No Alternate CSS URL."
		}
		else
		{
			"********* Alternate CSS URL is Customized to " + $web.AlternateCssUrl
		}
		
	}

#}


