$WebAppURL = "http://hector7:1111"
$SPweb = get-spwebapplication -identity $WebAppURL

cls

foreach ($SPSite in $SPweb.sites)
{
	foreach($web in $SPSite.AllWebs) 
	{
        "****** " + $web.url
        $web.allProperties
        foreach($property in $web.allProperties)
        {
            
            
        }

        if($web.Url -eq "http://hector7:1111/snaptrackerweb60_0_1/A-BACHELOR")
        {
            $web.allProperties["__InheritsMasterUrl"] = "False"            
            $web.allProperties["__InheritsCustomMasterUrl"] = "False"
            $web.allProperties["__InheritsAlternateCssUrl"] = "False"
            $web.Update()
        }
		
	}

}


