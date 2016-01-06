$WebAppURL = "http://hector7:7777"
$SPweb = get-spwebapplication -identity $WebAppURL

$MasterNameEndsWith = "masterpage/MosaicCustom.master"

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

function IsCustomlMaster($masterURL)
{

    if($masterURL.EndsWith($MasterNameEndsWith))
    {
        return $true
    }

    return $false
}


foreach ($SPSite in $SPweb.sites)
{
	foreach($web in $SPSite.AllWebs) 
	{

		$urlDisplayed = 0
        $bCustom = IsCustomlMaster($web.CustomMasterUrl)
		if($bCustom)
		{
			"****** " + $web.url
			$urlDisplayed = 1
			"********* Site Master Page is Customized to " + $web.CustomMasterUrl
		}

		$bCustom = IsCustomlMaster($web.MasterUrl)
		if($bCustom)
		{

            if($urlDisplayed -eq 0)
            {

			    "****** " + $web.url
            }

			
			"********* System Master Page is " + $web.MasterUrl		
		}
			
	}

}


