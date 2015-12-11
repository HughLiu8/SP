$SPPath = "C:\User\SourceCode\SharePoint Web Service\4.5\Main"
$BuildPath = "C:\Work-Hugh\Build\Build"


$RARPathWebParts = $SPPath + "\KispSharePointWebSolution\KispSharePointWeb\bin\Release\KispSharePointWeb.wsp"
$WillRemovedMinifestPath = $BuildPath + "\manifest.xml"

$TemplatePath = $BuildPath + "\15\TEMPLATE"

$arrCanDirectCopyFolders = "\GLOBAL", "\IDENTITYMODEL", "\XML"
$arrFeatures = @()
$arrFeatures += "\KispSharePointWeb_ManufacturerList"


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
		try
		{
			New-Item -path $DestPath -type directory
		}
		catch
		{
			write-Output $_
		}
		
	}

	Move-Item $Folder $DestPath -force
	$copytext = "move folder from: " + $Folder + " to: " + $DestPath
	Write-Output $copytext
}

function MoveFolderStructue($Folder, $DestPath)
{
	$from = $Folder
	$to = $DestPath
	Get-ChildItem -Path $from -Recurse  | 
			  Copy-Item -Destination {
				if ($_.PSIsContainer) {
				  Join-Path $to $_.Parent.FullName.Substring($from.length)
				} else {
				  Join-Path $to $_.FullName.Substring($from.length)
				}
			   } -Force -Exclude $exclude  
	$copytext = "move folder content from: " + $Folder + " to: " + $DestPath
	Write-Output $copytext
	
	Remove-Item $Folder –Force -Recurse
}

function MoveFeatureFolders()
{
	foreach($folder in $arrFeatures)
	{
		$folderSrcAbsolute = $BuildPath + $folder
		$folderDestAbsolute = $TemplatePath + "\FEATURES"
		Write-Output $folderSrcAbsolute
		Write-Output $folderDestAbsolute
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

function MoveFolders()
{
	MoveFeatureFolders
	MoveCanDirectFolders
	
	$folderSrcAbsolute = $BuildPath + "\ISAPI"
	$folderDestAbsolute = $BuildPath + "\15"
	MoveFolder $folderSrcAbsolute $folderDestAbsolute
	
	$folderSrcAbsolute = $BuildPath + "\CONTROLTEMPLATES"
	$folderDestAbsolute = $TemplatePath + "\CONTROLTEMPLATES"
	MoveFolderStructue $folderSrcAbsolute $folderDestAbsolute	
	
	$folderSrcAbsolute = $BuildPath + "\Layouts"
	$folderDestAbsolute = $TemplatePath + "\Layouts"	
	MoveFolderStructue $folderSrcAbsolute $folderDestAbsolute
		
}



Extract-RAR-File $RARPathWebParts $BuildPath

if(Test-Path $WillRemovedMinifestPath)
{
	Remove-Item $WillRemovedMinifestPath –Force
}


MoveFolders

