#! pwsh
# ---------------------------------------- 
# Title         : /___/collect_from_file_list.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240526_050219
# Created by    : Swami Nirav Atasa
# powershell T:/___/collect_from_file_list.ps1
# ---------------------------------------- 

# ---------------------------------------- $sf_self
$sd_pwd   = sp_posix $PSScriptRoot
oo_vars  sd_pwd  
Set-Location (sp_posix $PSScriptRoot)
# ---------------------------------------- 

# ---------------------------------------- Constants
$sf_file_list = "$sd_pwd/file_list.txt"
$sd_root_collect = "$sd_pwd/files_a"
# $sHead = "C:"

# ni -i d -fo $sd_root_collect
# ---------------------------------------- Prerequiste
function files_collect ($sf_file_list, $sd_root_src, $sd_root_collect) {
    oo_vars  sf_file_list  sd_root_src  sd_root_collect  
    $sd_root_src = vol_ask_change  sd_root_src 2
    oo_vars  sd_root_src  
    do_check_Continue
    
    $arr_sf = gc $sf_file_list
    $arr_sf  = ($arr_sf | ?{ ($_ -notmatch '^\s*$') -and ($_ -notmatch '^\s*#')  } )
    $arr_sf | % {
        $sf_src = "$sd_root_src$_"
        $sf_dst = "$sd_root_collect$_"
        # oooi "sf_copy  $sf_src  $sf_dst"
        sf_copy  $sf_src  $sf_dst
    }
    
    & C:/_etc/win/sbin/sync64.exe  $sd_root_collect

}


function files_restore ($sd_root_collect, $sd_root_dst) {
    $od_old = $pwd; cd $sd_root_collect
    
    oo_vars  sd_root_collect   sd_root_dst  
    $sd_root_dst = vol_ask_change  sd_root_dst 2
    oo_vars  sd_root_dst  
    do_check_Continue

    $arr_sf = gci -r -file -n  $sd_root_collect
    $arr_sf | % {
        $sf_dst =  "$sd_root_dst\$_"
        # oooi "sf_copy $_  $sf_dst"
        sf_copy  $_  $sf_dst
    }
    cd $od_old
    & C:/_etc/win/sbin/sync64.exe  $sd_root_dst
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$arr_menu  = get_lines  @"
    files_collect  $sf_file_list  C:  $sd_root_collect
    files_restore  $sd_root_collect  D:
"@|% trim

$idx = do_menu_select_of_arr $arr_menu "t_str  sdSrc  sdDst  mid"  1  "files ::: "
$sCommand = $arr_menu[$idx]
ooiie $sCommand
do_check_Continue

iex $sCommand



# switch ($sn_func) {
#     "files_collect" {
#         files_collect  $sf_file_list  "C:"  $sd_root_collect
#     }
#     "files_restore" {
#         files_restore  $sd_root_collect "D:"
#     }
# }


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# ---------------------------------------- 
do_check_Continue

