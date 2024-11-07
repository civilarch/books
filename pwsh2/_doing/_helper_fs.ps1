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
function sf_copy($sf_src, $sf_dst, $sOpts="") {
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
    if (!(can_update $sf_src $sf_dst)) { return 0 }
    sf_copy  $sfSrc  $sfDst  $sOpts
    return 1
}

function can_sync($sf_src, $sf_dst) {
    $e_src = Test-Path $sf_src; $e_Dst = Test-Path $sf_Dst
    if (!$e_src -and !$e_Dst) { return 0 }
    $t_src = iif($e_src (gi $sf_src).LastWriteTime  0 ) 
    $t_dst = iif($e_dst (gi $sf_dst).LastWriteTime  0 ) 
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

function sd_ri_n_src_e_dst_($sd_src, $sd_dst) {
    $od_old = Get-Location; Set-Location $sd_dst
    gci -file -n | % { if(!(Test-Path "$sd_src/$_")) { ri -r -fo $_ } }
    gci -dir  -n | % {
        $sd_src_ = "$sd_src/$_"; $sd_dst_ = "$sd_dst/$_"
        if(Test-Path "$sd_src_") { 
            sd_ri_n_src_e_dst_   $sd_src_   $sd_dst_ 
        } else {
            ri -r -fo $_ 
        }
    }
    Set-Location $od_old
}

function sd_ri_n_src_e_dst($sd_src, $sd_dst) {
    $sd_src_ = sp_full_x $sd_src; $sd_dst_ = sp_full_x $sd_dst; 
    sd_ri_n_src_e_dst_  $sd_src_  $sd_dst_ 
}


# ------------------ 
# $sf   = $sf -replace '\\\\?', '/'
 


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






# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





