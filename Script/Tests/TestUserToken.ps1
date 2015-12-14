$WebAppURL = "http://hector7:1111/"
$SPweb = get-spwebapplication -identity $WebAppURL


foreach ($SPSite in $SPweb.sites)
{

	"site.url:" + $SPSite.url
    $SPSite.RootWeb.CurrentUser.loginname
    $SPSite.AllowUnsafeUpdates
	foreach($web in $SPSite.AllWebs) 
	{
        "-- " + $web.Url
        "---- " + $web.AllUsers
        foreach($user in $web.AllUsers)
        {
            "------ " + $user
            "------ BinaryToken: " + $user.UserToken.BinaryToken
        }

	}

}

