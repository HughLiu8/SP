$str = "C:\User\SourceCode\SharePoint Web Service\4.5\Main\KispSharePointWebSolution\KispSharePointWeb\Layouts"

if($str.endswith("/") -eq $false)
{
	if($str.endswith("\") -eq $false)
	{
		$str += "\"
	}
}

$str
