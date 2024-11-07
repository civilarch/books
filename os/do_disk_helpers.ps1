
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 
. C:/_etc/win/ps1/os/do_disk_part_size_get_const.ps1
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 

$disk_num = get_disk_num_last
$offsets, $sizes = disk_part_size_get_const $disk_num

$offset_RES, $offset_SYS, $offset_DAT, $offset_RST  =  $offsets
  $size_RES,   $size_SYS,   $size_DAT,   $size_RST  =  $sizes

oo_vars  offset_RES offset_SYS offset_DAT offset_RST 
oo_vars    size_RES   size_SYS   size_DAT   size_RST  

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


function disk_part_delete_rest($disk_num) {
     Get-Partition $disk_num| Out-Host
     Get-Partition $disk_num| sort size -Descending | Out-Host
     do_check_Continue
     Get-Partition $disk_num| sort size -d | select -last 2 | Remove-Partition -Confirm:$False
}



function disk_part_move_resize($disk_num) {
     Resize-Partition -DiskNumber $disk_num -PartitionNumber 3  -Offset $offset_RES -Size $size_DAT
     Resize-Partition -DiskNumber $disk_num -PartitionNumber 3  -Size $size_DAT
}

     Get-Partition $disk_num 3




function disk_part_add_res_sys($disk_num) {

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


$disk_num = get_disk_num_last; 

disk_part_add_res_sys  4


    # $uuid_RES = "{e3c9e316-0b5c-4db8-817d-f92df00215ae}" 
    # $uuid_SYS = "{c12a7328-f81f-11d2-ba4b-00a0c93ec93b}" 
    # $uuid_DAT = "{ebd0a0a2-b9e5-4433-87c0-68b6b72699c7}" 
    # $uuid_RST = "{de94bba4-06d1-4d40-a16a-bfd50179d6ac}" 

    # $size_RES    =  16 * 1024*1024
    # $size_SYS    = 100 * 1024*1024
    # $size_RST    = 800 * 1024*1024
    # $size_DAT    =   0 * 1024*1024






