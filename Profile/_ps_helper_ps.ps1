


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: utilities
function hist_all($sStr){
    if ($sStr -eq $null) { $sStr = '.' }
    Select-String $sStr (Get-PSReadlineOption).HistorySavePath | Select Line
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: sublime
function rbc($sf) { Clear-RecycleBin -Force }


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ---------------------------------------- env
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$Env:PSModulePath = $Env:PSModulePath+";$gsd_pwsh_module"

$Env:Path += ';.'


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$sb_elevate = {
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
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# Invoke-Command -ScriptBlock  $sb_elevate
# icm  $sb_elevate
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 