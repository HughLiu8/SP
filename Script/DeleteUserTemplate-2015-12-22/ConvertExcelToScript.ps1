$ExcelDirectory = "C:\WorkHLiu\GH\SP\Script\DeleteUserTemplate-2015-12-22\Excels"
$OutPutDirectory = "C:\WorkHLiu\GH\SP\Script\DeleteUserTemplate-2015-12-22\OutputScripts\"
$TemplateScriptPath = "C:\WorkHLiu\GH\SP\Script\DeleteUserTemplate-2015-12-22\TemplateScript.txt"

$global:strArrUserIDS = ""
$global:strOriginalPrefix = ""
$global:strCurPrefix = ""

$mapSpecialPrefix = @{ WorldBank = "WorldBankMosaic"; ERAC = "ERAC1"; LDS = "LDS1"; IngersollRand = "ir"}



$content = Get-Content $TemplateScriptPath
Get-ChildItem $ExcelDirectory -Filter *.* | `
Foreach-Object{
    $global:strArrUserIDS = ""
    $global:strCurPrefix = ""
    $global:strOriginalPrefix = ""
	$filename = [System.IO.Path]::GetFileNameWithoutExtension($_.FullName)
    GetPrefix $filename
	
	$result = readExcel $_.FullName

    $OutputSubDir = $OutPutDirectory + $global:strOriginalPrefix + "\"
    MakeDir $OutputSubDir
    
    $OutputFileName = "SharePoint_ps_RemoveUsers_" + $global:strOriginalPrefix + ".ps1"    
	$scriptpath = $OutputSubDir + $OutputFileName
	modifyScript $scriptpath $content
}

function MakeDir($OutputSubDir)
{
    if((Test-Path $OutputSubDir) -eq $false)
    {
    	New-Item -path $OutputSubDir -type directory
    }

}

function GetPrefix($filename)
{
    $strLeftSeperator = " - "
    $lengthOfLeftSeperator = $strLeftSeperator.length
    $prefiexname = $filename
    $prefiexname = $prefiexname.SubString($prefiexname.LastIndexOf($strLeftSeperator) + $lengthOfLeftSeperator, $prefiexname.length - $prefiexname.LastIndexOf($strLeftSeperator) - $lengthOfLeftSeperator)
    $global:strOriginalPrefix = $prefiexname
    $prefiexname = $prefiexname.Replace(" ", "")
    
    $result = $mapSpecialPrefix.ContainsKey($prefiexname)
    if($result -eq $true)
    {
        $prefiexname = $mapSpecialPrefix.$prefiexname
    }
    
    $global:strCurPrefix = $prefiexname
    
    return $prefiexname
}


function readExcel($ExcelName)
{
	try
	{
		$xl = New-Object -COM "Excel.Application"
		$xl.Visible = $true
		$wb = $xl.Workbooks.Open($ExcelName)
		$ws = $wb.Sheets.Item(1)

		$rows = $ws.UsedRange.Rows.Count
		$first = 1
		for ($i=2; $i -le $rows; $i++){
            $v1 = $ws.Cells.Item($i, 1).text 
            if($v1.length -eq 0)
            {
                continue
            }
            
			if($first -ne 1)
			{
				$global:strArrUserIDS += ", "
			}
			$first = 0
			
			
			$global:strArrUserIDS += "'"
			$global:strArrUserIDS += $global:strCurPrefix + "_" + $v1
			$global:strArrUserIDS += "'"
		}
		
		$wb.Close()
		$xl.Quit()
		[System.Runtime.Interopservices.Marshal]::ReleaseComObject($xl)
	}
	catch
	{
		return 0
	}
	
	return 1
}

function modifyScript($outputpath, $templateContent)
{
    $curWebURL = "https://ra.kisp.com/" + $global:strCurPrefix
	New-Item $outputpath -type file -force
	(Get-Content $TemplateScriptPath) | Foreach-Object {
    $_ -replace '@\(\)', $global:strArrUserIDS `
       -replace 'PSTemplatePrifex', $global:strCurPrefix `
       -replace 'https://ra.kisp.com/', $curWebURL `
    } | Set-Content $outputpath
	
}

