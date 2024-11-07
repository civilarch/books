# ---------------------------------------- 
# ------------------ 


<#
# ---------------------------------------- 
# same:0  newer:1  src_exist:1  dst_newer:1  dst_exist:0    
# ---------------------------------------- 
/s  |  /e
# ---------------------------------------- 
# same:0  newer:1  src_exist:1  dst_newer:1  dst_exist:X    
# ---------------------------------------- 
/E /PURGE | /MIR
                /xo :: exclude older files.
                /xx :: exclude extra files and directories.
                /xl :: exclude lonely files and directories.

# ---------------------------------------- 
# same:0  newer:1  src_exist:0  dst_newer:0  dst_exist:0    
# ---------------------------------------- 
                                /xo
# ---------------------------------------- 
# same:0  newer:1  src_exist:0   dst_newer:0  dst_exist:0    
# ---------------------------------------- 
                   /xl

                   
/fp /ns /nc /njh /njs

     /ns   :: no size - don't log file sizes.
     /nc   :: no class - don't log file classes.
     /njh  :: no job header.
     /njs  :: no job summary.                   


/fp /ns /nc /njh /njs /l

robocopy  "yy\a.txt"  "cc\a.txt"   /fp /ns /nc /njh /njs /l
robocopy  "yy\a.txt"  "cc\a.txt"   /fp /ns /nc /njh /njs /l

#>




# ---------------------------------------- update
# ------------------ 

function sync_sd_update($sdSrc, $sdDst, $sOpts="") {
    robocopy  $sdSrc  $sdDst  /e /xo  $sOpts.split()
}

function sync_sd_sync($sdSrc, $sdDst) {
    robocopy  $sdDst  $sdSrc  /e /xo  $sOpts.split()
    robocopy  $sdSrc  $sdDst  /e /xo  $sOpts.split()
}



# ---------------------------------------- 
# ------------------ 


function sync_sf_update($sfSrc, $sfDst, $sOpts="") {
    $dateSrc = (gi $sfSrc).LastWriteTime 
    $dateDst = (gi $sfDst).LastWriteTime 
    if ($dateDst -lt $dateSrc) {Copy-Item  $sfSrc  $sfDst  $sOpts.split()}
    # if ($dateSrc -lt $dateDst) {Copy-Item  $sfDst  $sfSrc  $sOpts.split()}
}

function sync_sf_sync($sfSrc, $sfDst, $sOpts="") {
    $dateSrc = (gi $sfSrc).LastWriteTime 
    $dateDst = (gi $sfDst).LastWriteTime 
    if ($dateDst -lt $dateSrc) {Copy-Item  $sfSrc  $sfDst  $sOpts.split()}
    if ($dateSrc -lt $dateDst) {Copy-Item  $sfDst  $sfSrc  $sOpts.split()}
}



# ---------------------------------------- 
# ------------------ 





# ---------------------------------------- 
# ------------------ 





# ---------------------------------------- 
# ------------------ 



