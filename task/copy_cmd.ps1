# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$vol_src = "C";  $vol_dst = "D"

$sps = get_lines @"
C:\_etc\win\ps1\task
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






# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$vol_src = "U";  $vol_dst = "E"
$vol_src = "C";  $vol_dst = "D"

$sps = get_lines @"
C:\Z_w11_setup\ph_1_common\01_ess\01_first
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


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$sd_src_root = "U:\__new\c_root";  $sd_dst_root = "D:"
$sd_src_root = "U:\__new\c_root";  $sd_dst_root = "E:"

$sp_rears = get_lines @"
\Z_w11_setup\ph_1_common\01_ess\01_first\__ph_1_run_regs.bat
U:\__new\c_root\_etc\win\ps1
U:\__new\c_root\Z_w11_setup\ph_1_common\01_ess\01_first
"@|% trim

foreach ($sp_rear in $sp_rears) {
    $sp_rear = $sp_rear -replace [Regex]::Escape($sd_src_root)
    # oo_vars sp_rear 
    
    $sp_src = $sd_src_root +  "$sp_rear"
    $sp_dst = $sd_dst_root +  "$sp_rear"
    
    sure_exist  $sp_src
    sure_delete $sp_dst
    sp_sure_mkdir_parent $sp_dst
    
    oo_vars sp_src sp_dst

    Copy-Item  -v -r $sp_src  $sp_dst
}




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 









