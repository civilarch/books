


# ---------------------------------------- 
function sf_copy($sf_src, $sf_dst, $sOpts="") {
    oooi "sf_copy  $sf_src  $sf_dst"
    sp_sure_mkdir_parent $sf_dst
    if ($sOpts) { Copy-Item  $sf_src  $sf_dst  $sOpts.split() } 
    else        { Copy-Item  $sf_src  $sf_dst  }
}

function sd_copy($sd_src, $sd_dst, $sOpts="") {
    sp_sure_mkdir_parent $sd_dst
    if ($sOpts) { Copy-Item -r $sd_src  $sd_dst  $sOpts.split() } 
    else        { Copy-Item -r $sd_src  $sd_dst }
}

# ---------------------------------------- 
function can_update($sf_src, $sf_dst) {
    $e_src = Test-Path $sf_src; $e_Dst = Test-Path $sf_Dst
    if (!$e_src) { return 0 }
    if ($e_Dst) { 
        $t_src = (gi $sf_src).LastWriteTime; $t_dst = (gi $sf_dst).LastWriteTime
        if ($t_src -le $t_dst) { return 0 }
    }
    return 1
}

function sf_update($sf_src, $sf_dst, $sOpts="") {
    if (can_update $sf_src $sf_dst) { sf_copy  $sf_src  $sf_dst  $sOpts }
}

function can_sync($sf_src, $sf_dst) {
    $e_src = Test-Path $sf_src; $e_Dst = Test-Path $sf_Dst
    if (!$e_src -and !$e_Dst) { return 0 }
    $t_src = iif  $e_src (gi $sf_src).LastWriteTime  0
    $t_dst = iif  $e_dst (gi $sf_dst).LastWriteTime  0 
    if ($t_src -eq $t_dst) { return 0 }
    return $t_src - $t_dst
}

function sf_sync($sf_src, $sf_dst, $sOpts="") {
    $can_sync = can_sync $sf_src $sf_dst
    if ($can_sync -eq 0) { return 0 }
    if ($can_sync -gt 0) { sf_copy $sf_src $sf_dst $sOpts }
    if ($can_sync -lt 0) { sf_copy $sf_dst $sf_src $sOpts }
    return 1 
}



