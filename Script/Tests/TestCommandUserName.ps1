$WebAppURL = "http://hector7:55555/"
$SPweb = get-spwebapplication -identity $WebAppURL


foreach ($SPSite in $SPweb.sites)
{

	"site.url:" + $SPSite.url
    $SPSite.RootWeb.CurrentUser.loginname
	foreach($web in $SPSite.AllWebs) 
	{


	}

}

