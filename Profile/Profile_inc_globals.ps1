#! pwsh
# ---------------------------------------- 
# Title         : os/ps1/Profile_inc_globals.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240526_120432
# Created by    : Swami Nirav Atasa
# powershell D:/_etc/win/ps1/Profile_inc_globals.ps1
# ---------------------------------------- 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$gsd_ps1                = "C:/_etc/win/ps1"
$gsd_pwsh_module        = "C:/_etc/win/ps1/module"

$gsd_bin                = "C:/_etc/win/bin"
$gsd_sbin               = "C:/_etc/win/sbin"

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$gsd_Sublime            = "C:/_usr/prg/Sublime_1"
$gsd_Sublime2           = "C:/_usr/prg/Sublime_2"
$gsd_msys64             = "C:/_usr/pos/msys64"

$gsd_temp               = "C:/_wvar/_temp"
$gsf_temp_out           = "C:/_wvar/_temp/_out.txt"


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# ---------------------------------------- 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$sfexe_wt_g             = $env:LOCALAPPDATA + "\Microsoft\WindowsApps\wt.exe"
$gsd_powershell         = "C:/Windows/System32/WindowsPowerShell/v1.0"
$sfexe_WinRAR_g         = "C:/Program Files (x86)/WinRAR/WinRAR.exe"
$sfexe_Chrome_g         = "C:/Program Files/Google/Chrome/Application/chrome.exe"
$sfexe_youtube_dl_g     = "C:/_win/prg/_Multimedia/youtube-dl/yt-dlp.exe"

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
if (Test-Path "Z:"){
    $sd_backup_root     = "Z:/_backup"
    $sd_backup_text     = "Z:/_backup_text"
    $sd_backup_root_eng = "Z:/_eng/_backup"
}
else {
    $sd_backup_root     = "\\Router\usb_svr\_backup"
    $sd_backup_text     = "\\Router\usb_svr\_backup_text"
    $sd_backup_root_eng = "\\Router\usb_svr\_eng\_backup"
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# APPDATA                        C:\Users\user\AppData\Roaming
# LOCALAPPDATA                   C:\Users\user\AppData\Local

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

