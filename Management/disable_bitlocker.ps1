# Disables BitLocker on all Fixed Drives
Clear-Host
Write-Host "Disabling Bitlocker, please wait." -ForegroundColor Yellow

$string = [System.IO.DriveInfo]::GetDrives() | Where-Object {$_.DriveType -eq 'Fixed'} | Select-Object -Property Name
$array = @()
foreach ($d in $string) {$array = $array + $d.Name}
$array = $array.trimend("\")

foreach ($d in $array)
    {
        if ((Get-WMIObject -namespace root\CIMv2\Security\MicrosoftVolumeEncryption -class Win32_EncryptableVolume -filter "DriveLetter = `"$d`"").ProtectionStatus -eq 1)
        {
            Clear-BitLockerAutoUnlock
            Disable-Bitlocker -MountPoint "$d"
        }
    }
