param ([string]$inputFile, [string]$outputFile)

if (!$inputFile -or -Not (Test-Path $inputFile)) {
    $inputFile = read-host -Prompt "Please enter path to the input file"        
}

if (!$outputFile -or -Not (Test-Path $outputFile)) {
    $outputFile = $inputFile -replace ".csv", "_converted.csv"
    
    #if not .csv
    if ($outputFile -eq $inputFile) {
        $outputFile = $inputFile + "_converted"
    }
}

function FixImageUrls {
    param (
            [string]$line
    )

	$imgStartIndex = $line.IndexOf("https://woolmorning-106486.shoparena.pl/console/image/resize");
	$allImgs = $line.Substring($imgStartIndex).TrimEnd(';').Replace(";", ", ");
	
	return "$($line.Substring(0, $imgStartIndex))`"$($allImgs)`"";
}

function  FixHeader{
    param (
        [string]$header
        )
	$img1Index = $header.IndexOf("`"images 1`"");
	
	return $header.Substring(0, $img1Index) + "images";
}

ValidateInputParameters

$lines = Get-Content $inputFile

$header = FixHeader $lines[0]
Add-Content $outputFile $header
$lines | Select-Object -Skip 1 | ForEach-Object { FixImageUrls $_ | Add-Content $outputFile }

Write-Host "Success! Output file is " $outputFile