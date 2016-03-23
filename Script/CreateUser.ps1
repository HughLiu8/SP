$url = "http://gauti.sharepoint.com"  
$site = new-object Microsoft.SharePoint.SPSite($url)   
$web = $site.OpenWeb()   
$groups = $web.sitegroups   
   
$userName = "username\Domain"   
write-host "--------------"   
$i = 0;   
$myGroups = @();   
foreach($group in $groups) {   
  if($group -match "admin")
    {   
        $myGroups += $group   
    }   
}   
   
foreach ($gr in $myGroups)    
{   
    write-host $gr   
#add user to SP Group  
    Set-SPUser -Identity $userName -web $url -Group $gr   
    $theGroup = $web.SiteGroups[$gr]       
    $theUser = $web.AllUsers.Item($userName)   
  
#Remove user from SP Group  
#   $theGroup.RemoveUser($theUser);   
    write-host "User " $userName   "added to " $gr   
}  