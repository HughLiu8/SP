$WebAppURL = "http://hector7:7777"

$strWantedEmail = "shelley.smyth@haworth.com"
$strNewEmail = "Shelley.Arendshorst@Haworth.com"

$SPweb = get-spwebapplication -identity $WebAppURL
foreach ($SPSite in $SPweb.sites)
{
	"SPSite Begin---" + $SPSite.url + "---SPSite Begin"
	$site = $SPSite.OpenWeb()
	$groups = $site.sitegroups
	foreach ($grp in $groups) 
	{
		$count = $grp.users.count;
		$groupName = $grp.name
		
		if($count -gt 0)
		{
			foreach ($user in $grp.users) 
			{
                if($user.Email -eq $strWantedEmail)
                {
                    $user.Email = $strNewEmail
                    $user.Update()
                    "    modified:" + $user.name + ", oldEmail: " + $user.Email + ", newEmail:" + $user.Email
                }
				
			}	
		}

	}

	
	"SPSite End---" + $SPSite.url + "----SPSite End"
}
