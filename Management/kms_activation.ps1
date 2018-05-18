# Auto-Activates Windows 10 Ent/Pro, Server 2012 R2 Standard/DataCenter against KMS
Clear-Host
# Check OS Version
$version = (Get-WmiObject -Class Win32_OperatingSystem).Caption

if ($version -eq "Microsoft Windows 10 Enterprise")
	{
		$key = "NPPR9-FWDCX-D2C8J-H872K-2YT43"
	}
elseif ($version -eq "Microsoft Windows 10 Pro")
	{
		$key = "W269N-WFGWX-YVC9B-4J6C9-T83GX"
	}
elseif ($version -eq "Microsoft Windows Server 2012 R2 Standard")
	{
		$key = "D2N9P-3P6X9-2R39C-7RTCD-MDVJX"
	}
elseif ($version -eq "Microsoft Windows Server 2012 R2 DataCenter")
	{
		$key = "W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9"
	}

# Activating OS
Write-Host "Activating $version via KMS." -ForegroundColor Yellow
$null = cscript c:\windows\system32\slmgr.vbs /ipk $key
$null = cscript c:\windows\system32\slmgr.vbs /skms <kms.server.local>
$null = cscript c:\windows\system32\slmgr.vbs /ato
Write-Host  "Validating Activation." -ForegroundColor Yellow
$query = (Get-WmiObject -Query 'Select GracePeriodRemaining,LicenseStatus,Name,PartialProductKey from SoftwareLicensingProduct' | Where {$_.PartialProductKey} | Where {$_.name -match "Windows*"})
$actStatus = $query.LicenseStatus
$grace = $query.GracePeriodRemaining
$grace = (New-TimeSpan -Minutes $grace).days

if ($actStatus -eq 1 -And $grace -ge 179)
	{
		Write-Host "Product Activation Successful" -ForegroundColor Green
		Write-Host "Activated for " -NoNewLine
		Write-Host "$grace" -ForegroundColor Green -NoNewLine
		Write-Host " days"
	}
elseif ($actStatus -eq 0)
	{
		Write-Host "Product activation failed" -ForegroundColor red
		Write-Host "Product key issue." -ForegroundColor red
	}
elseif ($actStatus -eq 5)
	{
		Write-Host "Product activation failed" -ForegroundColor red
		Write-Host "Check network connectivity and date and time" -ForegroundColor red
	}
else
	{
		Write-Host "Product activation failed" -ForegroundColor red
	}
Pause
