#! pwsh
# ---------------------------------------- 
# Title         : ps1/_info/set_ExecutionPolicy.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240605_161800
# Created by    : Swami Nirav Atasa
# powershell T:/_wvar/_minimal_my_env/_etc/win/ps1/_info/set_ExecutionPolicy.ps1
# ---------------------------------------- 


Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force;
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force;



<#

Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell]
"EnableScripts"=dword:00000001 "ExecutionPolicy"="Bypass"

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell]
"EnableScripts"=dword:00000001 "ExecutionPolicy"="Unrestricted"


#>





