# Script disables UAC - Not Typically Recommended
Clear-Host
Write-Host "Disabling UAC." -ForegroundColor Yellow
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 00000000
