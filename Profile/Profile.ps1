# ---------------------------------------- 
# Title         : __prophile/powershell/Profile.ps1
# powershell tools/pwsh2/__prophile/powershell/Profile.ps1
# ---------------------------------------- 


$sVerMajor = $PSVersionTable.PSVersion.Major

$profile = $PSCommandPath
function reload {. $profile  2> $null }

. C:/_etc/win/ps1/Profile/Profile_inc_globals.ps1

. C:/_etc/win/ps1/Profile/_ps_helper_lang.ps1
. C:/_etc/win/ps1/Profile/_ps_helper_string.ps1
. C:/_etc/win/ps1/Profile/_ps_helper_debug.ps1

. C:/_etc/win/ps1/Profile/_ps_helper_io.ps1
. C:/_etc/win/ps1/Profile/_ps_helper_ps.ps1
. C:/_etc/win/ps1/Profile/_ps_helper_fs_const.ps1
. C:/_etc/win/ps1/Profile/_ps_helper_fs.ps1
. C:/_etc/win/ps1/Profile/_ps_helper_ui.ps1
. C:/_etc/win/ps1/Profile/_ps_helper_shell.ps1

. C:/_etc/win/ps1/Profile/_ps_helper_dotnet.ps1
. C:/_etc/win/ps1/Profile/_ps_helper_appl.ps1
. C:/_etc/win/ps1/Profile/_ps_helper_dev.ps1
. C:/_etc/win/ps1/Profile/_ps_helper_job.ps1


. C:/_etc/win/ps1/Profile/Profile_inc_ps${sVerMajor}.ps1

# sleep 1

# Clear-Host

