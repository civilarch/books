
# :::::::::::::::::::::::::::::::::::::::::::::::::::::: const
$uuid_RES = "{e3c9e316-0b5c-4db8-817d-f92df00215ae}" 
$uuid_SYS = "{c12a7328-f81f-11d2-ba4b-00a0c93ec93b}" 
$uuid_DAT = "{ebd0a0a2-b9e5-4433-87c0-68b6b72699c7}" 
$uuid_RST = "{de94bba4-06d1-4d40-a16a-bfd50179d6ac}" 

$size_RES    =  16 * 1024*1024
$size_SYS    = 100 * 1024*1024
$size_RST    = 800 * 1024*1024
$size_DAT    =   0 * 1024*1024

$offset_RES  =   0 * 1024*1024
$offset_SYS  = $size_RES
$offset_DAT  = $size_RES + $size_SYS


# :::::::::::::::::::::::::::::::::::::::::::::::::::::: const





function disk_part_add_res_sys($disk_num) {
    
    Get-Partition $disk_num| sort size -Descending | Out-Host
    oole; do_check_Continue
    
    Get-Partition $disk_num| sort size -Descending | select -last 2 | Remove-Partition -Confirm:$false
    Get-Partition $disk_num| Out-Host
    oole; do_check_Continue
    
    $disk_size_full = (Get-Disk $disk_num).Size
    if ($size_use -lt 0)       {$disk_Size = ($disk_size_full / -$size_use) }
    elseif (0 -lt $size_use)   {$disk_Size = $size_use*1000*1000 }
    else                       {$disk_Size = $disk_size_full }
    
    oo_vars  disk_size_full  disk_Size; 
    
    oole; do_check_Continue
    
    
    
    [Int64] $disk_Size = (ask_change disk_Size)
    if ($disk_Size -lt 0) { $disk_Size = ($disk_size_full / -$disk_Size) }
    $disk_Size = disk_size_to_byte($disk_Size)
    
    oo_vars disk_Size; do_check_Continue
    
    # ---------------------------------------- Size
    # $disk_Size = (Get-Disk $disk_num).Size
    
    $size_mar   = 1024 * 384
    $disk_Size  = $disk_Size - $size_mar 
    
    oo_vars  disk_num  disk_size_full  size_mar  disk_Size
    
    # $size_RES    =  16 * 1024*1024
    # $size_SYS    = 100 * 1024*1024
    $size_DAT    = $disk_Size-($size_RES+$size_SYS+$size_RST)
    # $size_RST    = 800 * 1024*1024

    $offset_RES    =   0 * 1024*1024
    $offset_SYS    = $size_RES
    $offset_DAT    = $size_RES + $size_SYS
    $offset_RST    = $size_RES + $size_SYS + $size_DAT

    oo_vars offset_RES offset_SYS offset_RST offset_DAT
    oo_vars   size_RES   size_SYS   size_RST   size_DAT
    do_check_Continue

    New-Partition $disk_num -Offset $offset_RES -Size $size_RES  -GptType uuid_RES | Out-Null
    New-Partition $disk_num -Offset $offset_SYS -Size $size_SYS  -GptType uuid_SYS | Out-Null
    # New-Partition $disk_num -Offset $offset_DAT -Size $size_DAT  -GptType uuid_DAT | Out-Null
    # New-Partition $disk_num -Offset $offset_RST -Size $size_RST  -GptType uuid_RST | Out-Null


    $vol_empty = get_empty_vol 'O'
    ''; oo_vars  vol_empty

    # sleep 1  # <<<<<<<<<<<<<<<<< 
    # ---------------------------------------- Format-Volume
    Get-Partition $disk_num 2 | Set-Partition -NewDriveLetter $vol_empty | Out-Null
    Get-Partition $disk_num 2 | Format-Volume -FileSystem FAT32 -NewFileSystemLabel SYSTEM | Out-Null
    Remove-PartitionAccessPath  -DriveLetter $vol_empty   -AccessPath "${vol_empty}:\" | Out-Null

    # $vol_empty = get_empty_vol 
    # Get-Partition $disk_num 3 | Set-Partition -NewDriveLetter $vol_empty | Out-Null
    # Get-Partition $disk_num 3 | Format-Volume -FileSystem NTFS -NewFileSystemLabel 23H2_bas | Out-Null

    # $vol_empty = get_empty_vol 'O'
    # Get-Partition $disk_num 4 | Set-Partition -NewDriveLetter $vol_empty | Out-Null
    # Get-Partition $disk_num 4 | Format-Volume -FileSystem NTFS | Out-Null
    # Remove-PartitionAccessPath  -DriveLetter $vol_empty   -AccessPath "${vol_empty}:\" | Out-Null
}


$disk_num = get_disk_num_last

disk_part_add_res_sys  4


    # $uuid_RES = "{e3c9e316-0b5c-4db8-817d-f92df00215ae}" 
    # $uuid_SYS = "{c12a7328-f81f-11d2-ba4b-00a0c93ec93b}" 
    # $uuid_DAT = "{ebd0a0a2-b9e5-4433-87c0-68b6b72699c7}" 
    # $uuid_RST = "{de94bba4-06d1-4d40-a16a-bfd50179d6ac}" 

    # $size_RES    =  16 * 1024*1024
    # $size_SYS    = 100 * 1024*1024
    # $size_RST    = 800 * 1024*1024
    # $size_DAT    =   0 * 1024*1024



<#
Get-Partition $disk_num

Get-Disk $disk_num | Set-Disk -IsOffline $true
Get-Disk $disk_num | Set-Disk -IsOffline $false


Resize-Partition 4 3 -Offset $offset_DAT  -Size 



#>

