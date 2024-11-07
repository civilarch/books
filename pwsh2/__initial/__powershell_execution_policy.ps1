#! pwsh
# ---------------------------------------- 
# Title         : 01_ess/00_powershell/powershell_execution_policy.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240501_151723
# Created by    : Swami Nirav Atasa
# powershell H:/_win_setup/ph_1_common/01_ess/00_powershell/powershell_execution_policy.ps1
# ---------------------------------------- 


# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ self-elevating @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator
if ($myWindowsPrincipal.IsInRole($adminRole)) {
   Write-Host "`n    >> Already elevated !!!`n"
} else {
   Write-Host "`n    >> To elevate and resume !!!`n"
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);
   exit
}
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 




# ---------------------------------------- 
# ------------------ 
# (Optional) set the current user policy to Undefined
# Set-ExecutionPolicy Bypass -Scope CurrentUser -Force


# ---------------------------------------- 
# ------------------ 
# Use the PowerShell set execution policy command to enable PowerShell scripts in Windows
# You can set the execution policy for the current Windows user and the Local machine with two separate commands:

Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
Set-ExecutionPolicy Unrestricted -Scope LocalMachine -Force

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass


# ---------------------------------------- 
# ------------------ 
# Enable PowerShell script execution for the current instance
# In your PowerShell window, type and enter:
# Set-ExecutionPolicy Bypass -Scope Process -Force
# ---------------------------------------- 
# ------------------ 

# Install-Module -Name PSCI

