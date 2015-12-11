$SPPath = "C:\User\SourceCode\SharePoint Web Service\4.5\Main"
$BuildPath = "C:\Work-Hugh\Build\Build"
$Script:rarExePath =  "C:\Program Files (x86)\WinRAR\WinRAR.exe"

$MosaicRARPathDefinition = $SPPath + "\MosaicSharePointSolution\Mosaic Site Definition\bin\Release\Mosaic Site Definition.wsp"
$MosaicRARPathWebParts = $SPPath + "\MosaicSharePointSolution\MosaicWebParts\bin\Release\MosaicWebParts.wsp"
$WillRemovedMinifestPath = $BuildPath + "\manifest.xml"

$TemplatePath = $BuildPath + "\15\TEMPLATE"

$arrCanDirectCopyFolders = "\CONTROLTEMPLATES", "\Images", "\Layouts", "\SiteTemplates"
$arrFeatures = "\HaworthMosaicLists", "\KispSnapTrackerSSO", "\MosaicContactsInfo", "\MosaicLeftNavigations", "\MosaicMasterPages", "\MosaicPictureGalleryWebPart", "\MosaicProductStandardsWebPart", "\MosaicWelcomePageWebPart"


function Extract-RAR-File([string]$RarPath, $DestinationFolder) 
{

    # Verify we can access UNRAR.EXE .
	if ([string]::IsNullOrEmpty($rarExePath) -or (Test-Path -LiteralPath $rarExePath) -ne $true)
	{
	    Write-Error "Unrar.exe path does not exist '$unrarPath'."
        return
    }
	
    [string]$unrarPath = $(Get-Command $rarExePath).Definition
    if ( $unrarPath.Length -eq 0 )
    {
        Write-Error "Unable to access unrar.exe at location '$unrarPath'."
        return
    }

   # Verify we can access to the compressed file.
	if ([string]::IsNullOrEmpty($RarPath) -or (Test-Path -LiteralPath $RarPath) -ne $true)
	{
	    Write-Error "Compressed file does not exist '$RarPath'."
        return
    }
	
    [System.IO.FileInfo]$Compressedfile = get-item -LiteralPath $RarPath 

    Write-Output "Extracting files into $DestinationFolder"
    &$unrarPath x -y  $RarPath $DestinationFolder | tee-object -variable unrarOutput 
    
    #display the output of the rar process as verbose
    $unrarOutput | ForEach-Object { write-Output $_ }

}

function MoveFolder($Folder, $DestPath)
{

	if((Test-Path $DestPath) -eq $false)
	{
		New-Item -path $DestPath -type directory
	}

	Move-Item $Folder $DestPath -force
	$copytext = "move folder from: " + $Folder + " to: " + $DestPath
	Write-Output $copytext
}

function MoveFeatureFolders()
{
	foreach($folder in $arrFeatures)
	{
		$folderSrcAbsolute = $BuildPath + $folder
		$folderDestAbsolute = $TemplatePath + "\FEATURES"
		MoveFolder $folderSrcAbsolute $folderDestAbsolute
	}
}

function MoveCanDirectFolders()
{
	$folderDestAbsolute = $TemplatePath
	foreach($folder in $arrCanDirectCopyFolders)
	{
		$folderSrcAbsolute = $BuildPath + $folder
		MoveFolder $folderSrcAbsolute $folderDestAbsolute
	}	
}

function CopyFolders()
{
	MoveFeatureFolders
	MoveCanDirectFolders
	
	$folderSrcAbsolute = $BuildPath + "\1033\xml"
	$folderDestAbsolute = $TemplatePath + "\Layouts\1033"
	MoveFolder $folderSrcAbsolute $folderDestAbsolute
	
	$Folder1033 = $BuildPath + "\1033"
	Remove-Item $Folder1033 –Force -Recurse
}


Get-ChildItem -Path $BuildPath -Recurse -exclude *.txt |
Remove-Item –Force -Recurse

Extract-RAR-File $MosaicRARPathDefinition $BuildPath
Extract-RAR-File $MosaicRARPathWebParts $BuildPath

if(Test-Path $WillRemovedMinifestPath)
{
	Remove-Item $WillRemovedMinifestPath –Force
}

CopyFolders

