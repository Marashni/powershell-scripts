# Script disabled Windows notifications
Clear-Host
Write-Host "Disabling Notifications." -ForegroundColor Yellow

$null = New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Value 0 -PropertyType DWord -Force
$null = New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SoftLandingEnabled" -Value 0 -PropertyType DWord -Force
$null = New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-310093Enabled" -Value 0 -PropertyType DWord -Force
