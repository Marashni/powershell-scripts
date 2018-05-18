#author: Taylor Hawkins
#scope: The scope of this powershell script file is for automating SQL Server installations with physical media. 
#Functions
#This function creates missing directories that were needed by MS SQL Server 2012 during automated install.
function createDirectory
{
    $path = @("C:\Program Files (x86)\Microsoft SQL Server\DReplayClient\ResultDir","C:\Program Files (x86)\Microsoft SQL Server\DReplayClient\WorkingDir")
    for ($k=0; $k -le ($path.Count -1); $k++) {
        if (!(Test-Path -Path $path[$k]))
        {
            New-Item -ItemType Directory -Force -Path $path[$k]
        }
    }
}
#This function checks all mounted drives for specified directory.
function checkDrive
{
	$allDrives = [System.IO.DriveInfo]::GetDrives()
	$allNames =@()
	foreach ($d in $allDrives) {
		$allNames = $allNames + $d.Name 
		}

	for ($i = 0; $i -le ($allNames.Count - 1); $i++) {
		$TARGETDIR = $allNames[$i] + "resources\1033"
		if (Test-Path -Path $TARGETDIR) {
			createDirectory -Disabled
            $fileExe = $allNames[$i] + "setup.exe"
            $configurationFile = $allNames[$i] + "ConfigurationFile.ini"
            & $fileExe /CONFIGURATIONFILE=$configurationFile
           	$i = ($allNames.Count + 1)
			$flag = 0
		}
		else {
		$flag = 1
		}
	}	
	
	if ($flag -eq 1) {
		Write-Host "Error: Microsoft SQL Server 2012 Installation Media Not Found. Please Mount Installation Media.`nPress any key to exit..."
		$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
	}
    else {
    #Output Message
	Write-Host "To Complete Installation Please Restart System.`nPress any key to exit..." -ForegroundColor Green	
	$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }	
}	


#Execution
checkDrive