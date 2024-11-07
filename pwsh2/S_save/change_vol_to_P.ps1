#! pwsh
# ---------------------------------------- 
# Title         : //change_vol_to_S.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240420_140623
# Created by    : Swami Nirav Atasa
# powershell E:/change_vol_to_S.ps1
# ---------------------------------------- 

# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ self-elevating @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator
if ($myWindowsPrincipal.IsInRole($adminRole)) {
   Write-Host "`n    >> Already elevated !!!`n";
} else {
   Write-Host "`n    >> To elevate and resume !!!`n"
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);
   exit
}
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 

$env:PSRUNWAIT = 10


# ---------------------------------------- $sf_self
$sd_pwsh5 = "C:/Windows/System32/WindowsPowerShell/v1.0" 
$sf_self  = sp_posix $PSCommandPath
$sd_pwd   = sp_par $sf_self

Set-Location $sd_pwd 
oo_vars sf_self sd_pwd  
# ---------------------------------------- 
$sVolCur = $sf_self[0]

$sfn     = ($sf_self -split '[\\/]')[-1]
$sfnb    = $sfn -replace '\..*$'
$sVolNew = "" + $sfnb[-1]
$sdVol   = $sVolNew + ':'

oo_vars sfnb  sVolCur  sVolNew  sdVol  

# ---------------------------------------- 
while ( !$sVolNew -or (Test-Path "$sVolNew`:")) {
   ooiie "    $sVolNew`:  is empty or already Exist !!!"
   ooin '-- Enter ndw volumn : ';$sVolNew=Read-Host;
   
   oo_vars  sVolNew
}

# ---------------------------------------- 
ooiie "Set-Partition -DriveLetter $sVolCur  -NewDriveLetter $sVolNew"
do_check_Continue

# ---------------------------------------- 
Set-Partition -DriveLetter $sVolCur  -NewDriveLetter $sVolNew

# Sleep 2

# ---------------------------------------- 



Get-ScheduledTask -TaskName  "OpenExplorer*" | Unregister-ScheduledTask -Confirm:$false
$Params = @{
   Action      = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "$sdVol/open_explorer_vol.ps1 $sdVol"
   Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMilliseconds(1000))
   TaskName    = 'OpenExplorer'
   Description = 'OpenExplorer Description'
}
Register-ScheduledTask @Params


<#
Get-ScheduledTask -TaskName  "OpenExplorer*" | Unregister-ScheduledTask -Confirm:$false
$Params = @{
   Action      = New-ScheduledTaskAction -Execute 'powershell.exe' `
       -Argument "C:/_etc/win/ps1/pwsh2/_doing/Scheduled/open_explorer_vol.ps1"
   Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMilliseconds(1000))
   TaskName    = 'OpenExplorer'
   Description = 'OpenExplorer Description'
}
Register-ScheduledTask @Params



#>

