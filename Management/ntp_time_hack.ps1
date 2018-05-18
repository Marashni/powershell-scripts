# Synchronizes Time for Non-Domain Joined Windows Hosts behind a Corporate Firewall by monitoring Corporate NTP Server
Clear-Host
Write-Host "Setting OS Time and TimeZone." -ForegroundColor Yellow
Set-TimeZone -Name "Pacific Standard Time"
$var = w32tm /monitor /computers:<ntp.server.local>
$var = $var[6]
$var = $var.split(':').split(' ')
$var = $var[6].trimend('s')
$var = [timespan]::fromseconds($var)
Set-Date -adjust $var
