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
        #"---- " + $web.Folders
        #"---- " + $web.AllUsers
        #"---- " + $web.Users
        #$web.Title = "changed by ps"
        #$web.Update()
        #"---- " + $web.Title

        foreach($list in $web.Lists)
        {
            "---- " + $list.Title
            #"------ " + $list.RootFolder
            #"------ " + $list.Fields

            
            foreach ($item in $list.Items) {
                "------ " + $item.Title
                "------ " + $item.File.Name;
                "------ " + $item.File.Length;
            }
            
        }


	}



}

