# Script is a Menu for launching other scripts

function Show-Menu
{
   Clear-host
   Write-Host "`t`tMenu`n" -Fore Cyan
   Write-Host "`t1. Option 1" -Fore Cyan
   Write-Host "`t2. Option 2" -Fore Cyan
   Write-Host "`t3. Option 3" -Fore Cyan
   Write-Host "`t4: Option 4" -Fore Cyan
   Write-Host "`tX: Exit." -Fore Cyan
}

# Execution
Do
{
     Show-Menu
     Write-Host "`n`tEnter Menu Option Number:"
     $key = [Console]::ReadKey()
	   $input = $key.KeyChar
	   Switch ($input)
      {
             '1' {
                Clear-Host
				        Invoke-Expression $PSScriptRoot\<script.ps1>
           } '2' {
                Clear-Host
                Invoke-Expression $PSScriptRoot\<script.ps1>
           } '3' {
                Clear-Host
                Invoke-Expression $PSScriptRoot\<script.ps1>
		       } '4' {
                Clear-Host
                Invoke-Expression $PSScriptRoot\<script.ps1>
           } 'x' {
                Return
           }
      }
}
Until ($input -eq 'x')
