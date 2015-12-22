$sitecollection = "https://ra.kisp.com/PNC"

$prefix = "PNC_"
$arrayLoginNames = 'PNC_PNCUser', 'PNC_MosaicDemo', 'PNC_Mosaic', 'PNC_System', 'PNC_Apopiel', 'PNC_audrac', 'PNC_barcusa', 'PNC_BMCDesign', 'PNC_BMCUser', 'PNC_BMUser', 'PNC_BOSuser', 'PNC_CFIuser', 'PNC_COEuser', 'PNC_DBIuser', 'PNC_dfisher', 'PNC_dougsmith', 'PNC_dusti', 'PNC_ELIuser', 'PNC_ENCuser', 'PNC_FBIUser', 'PNC_GDW8', 'PNC_GJWF', 'PNC_GLG4', 'PNC_gmg1', 'PNC_GTF2', 'PNC_GTH5', 'PNC_GTP6', 'PNC_hollyt', 'PNC_ILLuser', 'PNC_Interphaseuser', 'PNC_ISCGUser', 'PNC_jacquelinek', 'PNC_JCWuser', 'PNC_jenniferb', 'PNC_KINGuser', 'PNC_kpeterson', 'PNC_lballard', 'PNC_lengel', 'PNC_Matthew Kortering', 'PNC_MMuser', 'PNC_MosaicDemo', 'PNC_mwaldron', 'PNC_nancys', 'PNC_neo2', 'PNC_NHP6', 'PNC_NKC1', 'PNC_NLT1', 'PNC_NMH4', 'PNC_NRG7', 'PNC_nrh4', 'PNC_OESuser', 'PNC_OEuser', 'PNC_PMuser', 'PNC_POEuser', 'PNC_RCD2', 'PNC_RCFuser', 'PNC_SGN1', 'PNC_snye', 'PNC_SPACEuser', 'PNC_Sroseuser', 'PNC_terril128', 'PNC_TKBI', 'PNC_UNSuser', 'PNC_WJPJ', 'PNC_wlw7', 'PNC_YJH4', 'PNC_YMDE'


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

