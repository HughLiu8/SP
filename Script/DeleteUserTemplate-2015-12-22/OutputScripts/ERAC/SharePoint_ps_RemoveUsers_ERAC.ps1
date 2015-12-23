$sitecollection = "https://ra.kisp.com/ERAC1"

$prefix = "ERAC1_"
$arrayLoginNames = 'ERAC1_MosaicDemo', 'ERAC1_Mosaic', 'ERAC1_System', 'ERAC1_ACE2', 'ERAC1_alice', 'ERAC1_am153', 'ERAC1_Amyfi', 'ERAC1_Ann Lang', 'ERAC1_APA5', 'ERAC1_asaryan', 'ERAC1_asmith', 'ERAC1_BEDUNN', 'ERAC1_brownjfih', 'ERAC1_BUCKINGHAM', 'ERAC1_CDEANS', 'ERAC1_CDESMARAIS', 'ERAC1_CHELSEAT', 'ERAC1_chrisj', 'ERAC1_crumleskie', 'ERAC1_dang', 'ERAC1_David Daughtry', 'ERAC1_DAVIDD', 'ERAC1_David-NJ', 'ERAC1_dcrenshaw', 'ERAC1_ddaughtry', 'ERAC1_DEBRATESENIAR', 'ERAC1_dmassa', 'ERAC1_ECV3', 'ERAC1_EDS3', 'ERAC1_ehill', 'ERAC1_EJJ5', 'ERAC1_ELLENFFID', 'ERAC1_EPJ2', 'ERAC1_ERB5', 'ERAC1_ERSK', 'ERAC1_ESBJ', 'ERAC1_fimetcalf', 'ERAC1_francineg', 'ERAC1_gabrahams', 'ERAC1_gdobbelaere', 'ERAC1_GDW8', 'ERAC1_ghill', 'ERAC1_gpfeiffer', 'ERAC1_GPSA', 'ERAC1_grenfrofid', 'ERAC1_GSchamp', 'ERAC1_jbelli', 'ERAC1_jcockerton', 'ERAC1_jessicat', 'ERAC1_jimw', 'ERAC1_josieb', 'ERAC1_juliea', 'ERAC1_kesuloff', 'ERAC1_kgreen', 'ERAC1_ksuloff', 'ERAC1_mhritz', 'ERAC1_Michelena', 'ERAC1_NGA4', 'ERAC1_nicholson', 'ERAC1_NMB6', 'ERAC1_pears', 'ERAC1_pschuman', 'ERAC1_PVANAY', 'ERAC1_pwilson', 'ERAC1_ricke129', 'ERAC1_Ritany', 'ERAC1_robertl', 'ERAC1_RPE1', 'ERAC1_skitada', 'ERAC1_tthomas', 'ERAC1_VLE2', 'ERAC1_wec4', 'ERAC1_wreid', 'ERAC1_WRH5'


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

