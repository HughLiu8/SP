#Variables for Web and Page URLs

$WebURL="http://hector7:7777/sites/hw1/TestSiteTemplate"

$OldPageLayoutName="About-us.aspx"

$NewPageLayoutName="About-us-V2.aspx"

 

#Get the web and page

$Web = Get-SPWeb $WebURL

 

#Get Publishing Site and Web

$PublishingSite = New-Object Microsoft.SharePoint.Publishing.PublishingSite($Web.Site)

$PublishingWeb = [Microsoft.SharePoint.Publishing.PublishingWeb]::GetPublishingWeb($web)

 

#Get New Page Layout

$SitePageLayouts = $PublishingSite.GetPageLayouts($false)

$NewPageLayout = $SitePageLayouts | ? {$_.Name -eq $NewPageLayoutName}


$myLayout = $SitePageLayouts["/sites/hw1/_catalogs/masterpage/MosaicLayout.aspx"]

 

#Get Pages Library

$PublishingPages = $PublishingWeb.GetPublishingPages()

 

#Iterate throgh each page

foreach ($Page in $PublishingPages)

{
    
    #if ($Page.Layout.Name -eq $OldPageLayoutName)

    #{

    
        $Page.CheckOut()
       
        $Page.Layout = $myLayout;

        #$Page.Layout.ServerRelativeUrl = "/sites/hw1/_catalogs/masterpage/MosaicLayout.aspx"#

        $Page.ListItem.Update();

        $Page.CheckIn("Page layout Updated via PowerShell")

     

        $page.ListItem.File.Publish("")

        if ($Page.ListItem.ParentList.EnableModeration)

        {

            $Page.ListItem.File.Approve("Publishing Page Layout Updated!");

        }

 

    # write-host "Updated Page layout on: "$Page.url
    

    #}

}

$Web.Dispose() 



