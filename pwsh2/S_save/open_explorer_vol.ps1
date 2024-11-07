#! pwsh
# ---------------------------------------- 
# Title         : sys/bin/open_explorer_vol.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240517_041312
# Created by    : Swami Nirav Atasa
# powershell C:/_etc/win/bin/open_explorer_vol.ps1
# ---------------------------------------- 



$sdVol   = $args[0]

# oo_vars sdVol
# ---------------------------------------- 
# do_check_Continue


# $sCommand = "Start-Process  explorer.exe   -ArgumentList  ""/n"", ""$sdVol""; Get-ScheduledTask -TaskName  ""OpenExplorer*""  | Unregister-ScheduledTask -Confirm:`$false"


Get-ScheduledTask -TaskName  "OpenExplorer*" | Unregister-ScheduledTask -Confirm:$false

Start-Process  explorer.exe  "$sdVol"


<#
$Params = @{
   Action      = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument $sCommand
   Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMilliseconds(1000))
   TaskName    = 'OpenExplorer'
   Description = 'OpenExplorer Description'
}
Register-ScheduledTask @Params


#>



