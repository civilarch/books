
function sd_copy($sd_src, $sd_dst, $sOpts="") {
    sp_sure_mkdir_parent $sd_dst
    if ($sOpts) { Copy-Item -r $sd_src  $sd_dst  $sOpts.split() } 
    else        { Copy-Item -r $sd_src  $sd_dst }
}

function sf_copy($sf_src, $sf_dst, $sOpts="") {
    sp_sure_mkdir_parent $sf_dst
    if ($sOpts) { Copy-Item  $sf_src  $sf_dst  $sOpts.split() } 
    else        { Copy-Item  $sf_src  $sf_dst  }
}










sd_copy  "Y:\3\sd\sd_a\sd_1_1"   "Y:\3\sd\sd_a\sd_1_x"


