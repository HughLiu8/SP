$sitecollection = "https://ra.kisp.com/Amerigroup"

$prefix = "Amerigroup_"
$arrayLoginNames = 'Amerigroup_Amerigroup1', 'Amerigroup_MosaicDemo', 'Amerigroup_Mosaic', 'Amerigroup_System'


function IsExceptUser($loginName)
{
	$name = $loginName
	$name = $name.SubString($name.LastIndexOf("|") + 1, $name.length - $name.LastIndexOf("|") - 1)
	$match = $prefix + "*"
	if($name -like $match)
	{
		foreach($lName in $arrayLoginNames)
		{
			if($name -eq $lName)
			{	
				return 1
			}
		}

		return 0
	}
	else
	{
		return 1
	}

	return 0
}

$SPSite = Get-SPSite -Identity $sitecollection
$site = $SPSite.OpenWeb()
$groups = $site.sitegroups

foreach ($grp in $groups) 
{
	$count = $grp.users.count;
	$groupName = $grp.name
				
	if($count -gt 0)
	{
		#"----Users"
		$groupshowed = 0
		foreach ($user in $grp.users) 
		{
			$loginname = $user.loginname
			$bExcept = IsExceptUser $loginname
			if($bExcept -eq 1)
			{
				continue
			}

			if(0 -eq $groupshowed)
			{
				"--Group: " + $groupName 
				$groupshowed = 1
			}

			$grp.removeUser($user)
			"    Delete user: " + $user.loginname
			
		}	
	}
	else
	{
		#"----No Users"
	}
	#"    "
}
	
$SPSite.url + "----SPSite End"

