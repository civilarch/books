

function disk_part_size_get_constXX($disk_num, $size_use=0, $ask=0) {
    # ---------------------------------------- Constants
    $size_RES    =  15 * 1024*1024
    $size_SYS    = 112 * 1024*1024
    # $size_SYS    = 100 * 1024*1024
    $size_DAT    =   0 * 1024*1024
    $size_RST    = 800 * 1024*1024

    $offset_RES  =   2 * 1024*1024
    $offset_SYS  = $offset_RES + $size_RES
    $offset_DAT  = $offset_SYS + $size_SYS
    $offset_RST  =   0 * 1024*1024
    
    # ---------------------------------------- Variables
    # ------------------ disk_Size_full
    $disk_Size_full = (Get-Disk $disk_num).Size
    # ---------------------------------------- Preparation
    
    if ($size_use -eq 128) {
        # ---------------------------------
        $offset_RST = 127190872064
        # ---------------------------------
        $size_DAT   = 127055924104
        # ---------------------------------
        return @($offset_RES, $offset_SYS, $offset_DAT, $offset_RST), @($size_RES, $size_SYS, $size_DAT, $size_RST)
    }
    
    # ---------------------------------------- size_to_use
    $size_to_use = $disk_size_full - $offset_RES
    $size_use    = disk_size_to_byte($size_use)
    
    if     ($size_use -eq 0) {
        # $size_to_use = $disk_size_full - $offset_RES
    }
    elseif ($size_use -lt 0) {
        $size_to_use = [Int64]($size_to_use / -$size_use)
    }
    elseif ($size_use -gt 0) {
        $size_to_use = $size_use
    }
    # ---------------------------------------- ask
    if ($ask) {
        [Int64] $size_new = $size_to_use
        [Int64] $size_new = (ask_change size_new)
        $size_new = disk_size_to_byte($size_new)
        if ($size_new -lt 0) { $size_to_use = [Int64]($size_to_use / -$size_new) }
        elseif ($size_new -gt 0) {$size_to_use = $size_new}
    }
    # ---------------------------------------- ask
    # ---------------------------------------- size_to_use
    
    # ---------------------------------------- Check
    oo_vars  disk_size_full  size_to_use  offset_RES;
    if ($ask) { do_check_Continue }
    
    # ---------------------------------------- size_DAT
    $size_DAT    = [Int64] (($size_to_use-($size_RES+$size_SYS+$size_RST)) * 0.999986 )
    # ---------------------------------------- size_DAT

    # ---------------------------------------- offset_RST
    $offset_RST    = $size_to_use - $size_RST 
    # ---------------------------------------- offset_RST

    @($offset_RES, $offset_SYS, $offset_DAT, $offset_RST), @($size_RES, $size_SYS, $size_DAT, $size_RST)
}




    $disk_num = get_disk_num_last
    
    Clear-Disk      $disk_num -Confirm:$false  -RemoveOEM  -RemoveData -PassThru
    
    $offsets, $sizes = disk_part_size_get_constXX $disk_num  (ifd $args[0] 128G )

    $offset_RES, $offset_SYS, $offset_DAT, $offset_RST  =  $offsets
      $size_RES,   $size_SYS,   $size_DAT,   $size_RST  =  $sizes

    oo_vars  offset_RES offset_SYS offset_DAT offset_RST 
    oo_vars    size_RES   size_SYS   size_DAT   size_RST  

