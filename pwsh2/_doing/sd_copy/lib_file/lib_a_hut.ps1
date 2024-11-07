
# ---------------------------------------- 
. ./lib_a_1.ps1
# ---------------------------------------- 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function safe_copy($sp_src, $sp_dst) {
    if ($sp_src -is [IO.FileSystemInfo]) { $sp_src = $sp_src.fullname }
    sure_exist  $sp_src
    sure_delete $sp_dst
    sp_sure_mkdir_parent $sp_dst
    try {Copy-Item  $sp_src  $sp_dst} catch { exit }
    # sure_exist $sp_dst
}




# ---------------------------------------- 

# ---------------------------------------- 

function copy_to_repl_vol($spSrc, $vol) {
    $spDst = $vol + $spSrc.substring(1)
    sure_delete $spDst
    sp_sure_mkdir_parent $spDst
    Copy-Item  -r  $spSrc  $spDst
    $spDst
}




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 






