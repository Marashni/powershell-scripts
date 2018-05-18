# This script will configure specific IE and Edge Browser Settings.
Clear-Host
Write-Host "Configuring IE and Edge." -ForegroundColor Yellow

# IE Configuration:
$guidpath = "HKCU:\Software\Microsoft\Internet Explorer\SearchScopes\{0633EE93-D776-472f-A0FF-E1416B8B2E3A}"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Internet Explorer\Main" -Name "Start Page" -Value "http://www.google.com"

# Tests Path, if exists, delete then create
if (Test-Path $guidpath)
	{
		Remove-Item -Path $guidpath -Recurse
	}

$null = New-Item -Path $guidpath -Force
$null = New-ItemProperty -Path $guidpath -Name "DisplayName" -Value "Google" -PropertyType String -Force
$null = New-ItemProperty -Path $guidpath -Name "FaviconPath" -Value "$env:appdata\..\LocalLow\Microsoft\Internet Explorer\Services\search_{0633EE93-D776-472f-A0FF-E1416B8B2E3A}.ico" -PropertyType String -Force
$null = New-ItemProperty -Path $guidpath -Name "FaviconURL" -Value "https://www.google.comvicon.ico" -PropertyType String -Force
$null = New-ItemProperty -Path $guidpath -Name "OSDFileURL" -Value "https://www.microsoft.com/en-us/IEGallery/GoogleAddOns" -PropertyType String -Force
$null = New-ItemProperty -Path $guidpath -Name "ShowSearchSuggestions" -Value 1 -PropertyType DWord -Force
$null = New-ItemProperty -Path $guidpath -Name "SuggestionsURL" -Value "https://www.google.com/complete/search?q={searchTerms}&client=ie8&mw={ie:maxWidth}&sh={ie:sectionHeight}&rh={ie:rowHeight}&inputencoding={inputEncoding}&outputencoding={outputEncoding}" -PropertyType String -Force
$null = New-ItemProperty -Path $guidpath -Name "URL" -Value "https://www.google.com/search?q={searchTerms}&sourceid=ie7&rls=com.microsoft:{language}:{referrer:source}&ie={inputEncoding?}&oe={outputEncoding?}" -PropertyType String -Force
$null = New-ItemProperty -Path $guidpath -Name "DefaultScope" -Value "{0633EE93-D776-472f-A0FF-E1416B8B2E3A}" -PropertyType String -Force
$null = New-ItemProperty -Path $guidpath -Name "EnableAutoUpgrade" -Value 0 -PropertyType DWord -Force

# Edge Configuration:
$guidpath = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge"
$null = New-Item -Path $guidpath\Main -Force
$null = New-Item -Path $guidpath\ServiceUI -Force
$null = New-ItemProperty -Path $guidpath\Main -Name "HomeButtonEnabled" -Value 1 -PropertyType DWord -Force
$null = New-ItemProperty -Path $guidpath\Main -Name "HomeButtonPage" -Value "http://www.google.com" -PropertyType String -Force
$null = New-ItemProperty -Path $guidpath\ServiceUI -Name "NewTabPageDisplayOption" -Value 2 -PropertyType DWord -Force
