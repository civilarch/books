
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

function copy_to_repl_vol($spSrc, $vol) {
    $spDst = $vol + $spSrc.substring(1)
    sure_delete $spDst
    sp_sure_mkdir_parent $spDst
    Copy-Item  -r  $spSrc  $spDst
    $spDst
}


# ---------------------------------------- 
function sd_update($sd_src, $sd_dst, $sOpts="") {
    if (!(can_update $sd_src $sd_dst)) { return 0 }
    sd_copy  $sfSrc  $sfDst  $sOpts
    return 1
}


function sd_sync($sd_src, $sd_dst, $sOpts="") {
    $can_sync = can_sync $sd_src $sd_dst
    if ($can_sync -eq 0) { return 0 }
    if ($can_sync -gt 0) { sd_copy $sd_src $sd_dst $sOpts }
    if ($can_sync -lt 0) { sd_copy $sd_dst $sd_src $sOpts }
    return 1 
}



