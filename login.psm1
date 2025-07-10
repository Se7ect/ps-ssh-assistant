function login($choise){
	$ips = Import-Csv "$PSScriptRoot\.env"

	if (-not $choise){
		$i = 1
		foreach ($x in $ips) {
			Write-Host "$i)$($x.name.PadLeft(10)) ===> $($x.ip)"
			$i += 1
		}
		$choise = Read-Host "Enter connect"
	}
	
	if (($choise -as [int]) -and $ips[[int]$choise-1]){
			$conn = $ips[[int]$choise-1]
	}
	
	foreach ($x in $ips){
		if ($choise -and ($x.name -match $choise)) {$conn = $x}
	}
	if (-not $conn){
		Write-Host "Connection not found!`n" -ForegroundColor 'DarkRed'
		login
	}

ssh $conn.ip -p $conn.port
}
