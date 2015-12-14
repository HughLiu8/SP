$WebAppURL = "http://hector7:1111/"
$SPweb = get-spwebapplication -identity $WebAppURL

cls
foreach ($SPSite in $SPweb.sites)
{

	"site.url:" + $SPSite.url
    $SPSite.RootWeb.CurrentUser.loginname
    $SPSite.AllowUnsafeUpdates
	foreach($web in $SPSite.AllWebs) 
	{
        "-- " + $web.Url
        $collDocTemplates = $web.DocTemplates;
        foreach ($oDocTemplate in $collDocTemplates)
        {
           "---- Template: " + $oDocTemplate.DefaultTemplate
           "---- Description: " + $oDocTemplate.Description
           "---- Name: " + $oDocTemplate.Name 
           "---- Type: " + $oDocTemplate.Type
        }

	}



}

