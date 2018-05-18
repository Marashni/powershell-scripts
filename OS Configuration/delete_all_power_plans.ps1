# Deletes Non-Active Windows Power Plans
Clear-Host
Write-Host "Deleting All Non-Active Power Plans." -ForegroundColor Yellow

#Get Active Power Scheme GUID
$guid = powercfg -GetActiveScheme
$guid = $guid -Split("\s")
$guid = $guid[3].Trim()

#Remove Non-Active Power Plans
$guid2 = powercfg -l | Select-String -pattern "(GUID)"
foreach ($d in $guid2)
	{
		$d = $d -Split("\s")
		$d = $d[3].Trim()
		if ($d -ne $guid)
			{
				powercfg -d $d
			}
	}
