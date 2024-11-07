
# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
# ---------------------------------------- 
# ---------------------------------------- 
#. ./1_code.ps1
#. ./1_code_00_debug.ps1
# ---------------------------------------- 


function __post_process {
    
}


__post_process



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



