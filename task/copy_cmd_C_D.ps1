# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
. C:\_etc\win\ps1\lib\lib_disk.ps1
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# ---------------------------------------- 
$vol = sure_mount_disk
# ---------------------------------------- 
if (! $vol) {
    ooie "vol is EMPTY !!!"
    __Chect_out__; exit
}


$vol_src = "C";  $vol_dst = $vol


$sps = get_lines @"
C:\_etc\win\ps1\task
C:\_etc\win\ps1\os
C:\_usr\net\OpenSSH\_commands
C:\Z_w11_setup\ph_1_common\01_ess\03_sshd
C:\Z_w11_setup\ph_1_common\01_ess\03_winget_ssh
C:\Z_w11_setup\ph_1_common\01_ess\01_first\71_set_ip
"@|% trim



foreach ($sp in $sps) {
    $sp_rear = $sp.substring(1)
    $sp_src = $vol_src +  "$sp_rear"
    $sp_dst = $vol_dst +  "$sp_rear"
    
    sure_exist  $sp_src
    sure_delete $sp_dst
    sp_sure_mkdir_parent $sp_dst

    oo_vars sp_src sp_dst
    
    Copy-Item  -v -r $sp_src  $sp_dst
}




""; __Chect_out__





