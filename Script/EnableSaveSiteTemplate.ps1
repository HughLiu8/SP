$WebAppURL = "http://hector7:1111"

$SPweb = get-spwebapplication -identity $WebAppURL
foreach ($SPSite in $SPweb.sites)
{
	"SPSite Begin---" + $SPSite.url + "---SPSite Begin"

	foreach ($web in $SPSite.AllWebs) 
	{

        $web.SaveSiteAsTemplateEnabled = $true;
        $web.Update();
    }

	
	"SPSite End---" + $SPSite.url + "----SPSite End"
}
