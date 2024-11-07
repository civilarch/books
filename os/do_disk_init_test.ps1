#! pwsh
# ---------------------------------------- 
# Title         : util/_disk/ambackup_clone_disk.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240602_044635
# Created by    : Swami Nirav Atasa
# powershell C:/_win/util/_disk/ambackup_clone_disk.ps1
# ---------------------------------------- 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# .  "$($PSScriptRoot[0]):/_etc/win/ps1/lib/lib_disk.ps1"
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



function disk_init_part_format ($disk_num, [int]$size_use=0) {
    
    # $disk_num = get_disk_num_last
    $offsets, $sizes = disk_part_size_get_const $disk_num  $size_use

    $offset_RES, $offset_SYS, $offset_DAT, $offset_RST  =  $offsets
      $size_RES,   $size_SYS,   $size_DAT,   $size_RST  =  $sizes

    oo_vars  offset_RES offset_SYS offset_DAT offset_RST 
    oo_vars    size_RES   size_SYS   size_DAT   size_RST  


    do_check_Continue
    # ---------------------------------------- Initialize-Disk
    Clear-Disk      $disk_num -Confirm:$false  -RemoveData -PassThru | Out-Null
    # sleep 1  # <<<<<<<<<<<<<<<<< 
    Initialize-Disk $disk_num -Confirm:$false  -PartitionStyle gpt | Out-Host
    # Initialize-Disk $disk_num -Confirm:$false  -PartitionStyle MBR 
    # sleep 1  # <<<<<<<<<<<<<<<<< 
    
    $null = Get-Partition  $disk_num ; # ''; do_check_Continue

    # sleep 1  # <<<<<<<<<<<<<<<<< 
    # ---------------------------------------- New-Partition
    # New-Partition $disk_num -Size  16MB  -GptType "{e3c9e316-0b5c-4db8-817d-f92df00215ae}"
    New-Partition $disk_num -Size $Size_SYS  -GptType "{c12a7328-f81f-11d2-ba4b-00a0c93ec93b}" | Out-Null
    New-Partition $disk_num -Size $Size_DAT  -GptType "{ebd0a0a2-b9e5-4433-87c0-68b6b72699c7}" | Out-Null
    New-Partition $disk_num -Size $Size_RST  -GptType "{de94bba4-06d1-4d40-a16a-bfd50179d6ac}" | Out-Null

    $vol_empty = get_empty_vol 'O'
    ''; oo_vars  vol_empty

    # sleep 1  # <<<<<<<<<<<<<<<<< 
    # ---------------------------------------- Format-Volume
    Get-Partition $disk_num 2 | Set-Partition -NewDriveLetter $vol_empty | Out-Null
    Get-Partition $disk_num 2 | Format-Volume -FileSystem FAT32 -NewFileSystemLabel SYSTEM | Out-Null
    Remove-PartitionAccessPath  -DriveLetter $vol_empty   -AccessPath "${vol_empty}:\" | Out-Null

    $vol_empty = get_empty_vol 
    Get-Partition $disk_num 3 | Set-Partition -NewDriveLetter $vol_empty | Out-Null
    Get-Partition $disk_num 3 | Format-Volume -FileSystem NTFS -NewFileSystemLabel 23H2_bas | Out-Null

    $vol_empty = get_empty_vol 'O'
    Get-Partition $disk_num 4 | Set-Partition -NewDriveLetter $vol_empty | Out-Null
    Get-Partition $disk_num 4 | Format-Volume -FileSystem NTFS | Out-Null
    Remove-PartitionAccessPath  -DriveLetter $vol_empty   -AccessPath "${vol_empty}:\" | Out-Null
}








# . C:/_etc/win/ps1/lib/libdisk.ps1;  disk_init_part_format  4  -2
# . C:/_etc/win/ps1/lib/libdisk.ps1
# disk_init_part_format  4  128000 
# disk_init_part_format  4  -2 half


# ----------------------------------------  disk_num_src  disk_num 
$disk_num = get_disk_num_last
  
oo_vars  disk_num 
do_check_Continue

# ---------------------------------------- disk_init_part_format
disk_init_part_format $disk_num
Get-Partition  $disk_num | Out-Host

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

do_check_exit



<#

-Offset




#>