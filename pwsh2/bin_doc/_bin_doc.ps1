# ---------------------------------------- 
# sf   : C:\_usr\prg\pwsh\bin_doc\_bin_doc.ps1
# Time : Wednesday May 15, 2024 15:43:09
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 1




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

C:\do_my_daily_copy_to_drive.ps1

my_daily_copy_to_drive  $qty  $volSrc $volDst $mid

my_daily_copy_to_drive  300D  c  v  /S_modified


my_daily_copy_to_drive  300D  c  v  


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

"C:\_usr\prg\_bin\do_create_time_stamp_file.ps1"

create_time_stamp_file_sd(sd)
{
    sf_wt       := EnvGet("LOCALAPPDATA") "\Microsoft\WindowsApps\wt.exe"
    sf_pwershell:= "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
    sf_script   := gsd_var "/_day/tools/_bin/do_create_time_stamp_file.ps1" 
    
    sCmd := sf_wt ' ' sf_pwershell ' ' sf_script ' "' sd '" '
    Run(sCmd, , 'Hide')
}



#HotIf ( WinActive("ahk_class CabinetWClass") || WinActive("ahk_class Progman") || WinActive("ahk_class ExploreWClass") || WinActive("ahk_class WorkerW") )

    #^!m::
    {
        Wait_Released_Key_A_ThisHotkey()    
        
        sPwd := get_pwd()
        
        create_time_stamp_file_sd(sPwd)
    }

#HotIf


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

"C:\_usr\prg\_bin\do_sd_cur_my_daily_copy_to_drive.ps1"



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# Add-Type -AssemblyName System.Windows.Forms
# [Windows.Forms.MessageBox]::Show( $args[0] , "Info", 0 )  
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

& sd_cur_my_daily_copy_to_drive $args[0]



function sd_cur_my_daily_copy_to_drive($sdSrc) {
    # ---------------------------------------- 
    $od_old = Get-Location; Set-Location $sdSrc
    $sdSrc   = $sdSrc -replace '\\\\?', '/'
    # ---------------------------------------- sArgs
    $sArgs_ = "3D  y  /S_modified"

    oooi (':'*50);
    oooi "vol_day_date_copy_to  `$t_str  `$volDst  `$mid"
    oooi "vol_day_date_copy_to  $sArgs_"
    "    $('-'*30) Enter arguments : "; 
    ooin 'vol_day_date_copy_to  '; $sArgs = Read-Host;
    if (! $sArgs) { $sArgs = "$sArgs_" }
    # ---------------------------------------- $t_str, $volDst, $mid
    $t_str, $volDst, $mid  =  $sArgs.Trim() -split '\s+'
    # $t_str, $volDst  =  '999', 'y'
    ''; oo_vars  sArgs  t_str  sdSrc  volDst; ''
    do_check_Continue
    # ---------------------------------------- 
    $global:dryrun = 1
    vol_day_date_copy_to  $t_str  $sdSrc  $volDst  $mid
    # ---------------------------------------- 
    ooiie "to run"; do_check_Continue; 
    # ---------------------------------------- 
    $global:dryrun = 0
    vol_day_date_copy_to  $t_str  $sdSrc  $volDst  $mid
    # ---------------------------------------- 
    Set-Location $od_old; do_check_exit
}



sd_cur_my_daily_copy_to_drive(sd)
{
    sf_wt       := EnvGet("LOCALAPPDATA") "\Microsoft\WindowsApps\wt.exe"
    sf_pwershell:= "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
    sf_script   := gsd_var "/_day/tools/_bin/do_sd_cur_my_daily_copy_to_drive.ps1" 
    
    sCmd := sf_wt ' ' sf_pwershell ' ' sf_script ' "' sd '" '
    ; Run(sCmd, , 'Hide')
    ; pid := ""
    Run(sCmd,,,&pid)
    ; Run("notepad.exe",,,&pid)
    Sleep 200
    ; MsgBox(pid)
    WinActivate(  "ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
    ; WinWaitActive("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")  
}


#HotIf ( WinActive("ahk_class CabinetWClass") || WinActive("ahk_class Progman") || WinActive("ahk_class ExploreWClass") || WinActive("ahk_class WorkerW") )

    #^!b::
    {
        Wait_Released_Key_A_ThisHotkey()
        
        
        sPwd := get_pwd()
        
        sd_cur_my_daily_copy_to_drive(sPwd)
        
        ; Run "C:\Windows\notepad.exe"
        
        
    }

#HotIf
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



