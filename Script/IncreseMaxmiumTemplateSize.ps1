
 
#For MOSS 2007, Uncomment below two lines
#[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint")
#[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint.Administration")
 
$webservice = [Microsoft.SharePoint.Administration.SPWebService]::ContentService
 
#Get the current Maximum Size
$webservice.MaxTemplateDocumentSize
 
#Set New Limit and update
$webservice.MaxTemplateDocumentSize = 524288000 #500 MB
$webservice.Update()


