
Start-Process  explorer.exe   -ArgumentList  "/n", "O:"


Get-ScheduledTask -TaskName  "OpenExplorer*" | Unregister-ScheduledTask -Confirm $false


<#

Get-ScheduledTask -TaskName  "OpenExplorer*" | Unregister-ScheduledTask

Start-Process  powershell  C:\_usr\prg\pwsh2\_doing\Scheduled\open_explorer_vol.ps1   -NoNewWindow




#>









