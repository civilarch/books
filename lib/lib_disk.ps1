#! pwsh
# ---------------------------------------- 
# Title         : util/_disk/lib_disk.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240602_033405
# Created by    : Swami Nirav Atasa
# powershell C:/_etc/win/ps1/lib/libdisk.ps1
# ---------------------------------------- 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function get_empty_vol ($vol_start='D'){
    $vols = (Get-Volume).DriveLetter
    for ($i=[int][char]$vol_start.ToUpper(); $i -le [int][char]'Z'; $i++) {
        if ( $vols -notcontains [char]$i) { return [char]$i }
    }
}



function bcdboot_disk ( $disk_num ) {
    $vol_dst      = (Get-Partition ${disk_num} 3).DriveLetter
    $vol_empty    = get_empty_vol 'O'

    Get-Partition ${disk_num} 2 | Set-Partition -NewDriveLetter $vol_empty

    bcdboot  ${vol_dst}:\windows  /s ${vol_empty}:  /f all

    Remove-PartitionAccessPath  -DriveLetter $vol_empty   -AccessPath "${vol_empty}:\"
}


function bcdboot_vol($vol){
    $oVol  = Get-Volume $vol
    $oPart = Get-Partition  -dr  $vol
    # $oPart = Get-Volume $vol |  Get-Partition
    $oDisk = Get-Disk -part $oPart
    # $oDisk = Get-Partition  -dr  $vol | Get-Disk

    bcdboot_disk  $oDisk.number
}




# $disk_num_src, $disk_num_dst = get_disk_num_src_dst

function get_disk_num_src_dst {
    # Get-Disk |sort Number|select Number, FriendlyName, Size, PartitionStyle
    Get-Disk |sort Number|select Number, FriendlyName, Size, PartitionStyle | Out-Host
    # Get-Disk  | Out-Host

    $odisk_src  = Get-Disk |sort Number| select -f 1
    $odisk_dst  = Get-Disk |sort Number| select -l 1

    $disk_num_src  = $odisk_src.Number
    $disk_num_dst  = $odisk_dst.Number
    # oo_vars  disk_num_src  disk_num_dst 

    $sParam = "$disk_num_src $disk_num_dst"
    ooie "Select  src  dst : $disk_num_src $disk_num_dst"
    $sParam = ask_ $sParam "Input src  dst : "
    $sParam.split()
}



# $disk_num_src, $disk_num_dst = get_disk_num_src_dst



# . C:/_etc/win/ps1/lib/libdisk.ps1;  disk_init_part_format  4  -2
# . C:/_etc/win/ps1/lib/libdisk.ps1
# disk_init_part_format  4  128000 
# disk_init_part_format  4  -2 half


function disk_size_to_byte($sSize) {
    $result = $sSize -match '(-?\d+)([TGMK]?)'
    [Int64]$nSize, $unit = $matches[1], $matches[2]
    if ($sSize -lt 0) { return $sSize }
    switch ($unit.ToUpper()) {
        "T" { $nSize * 1000 * 1000 * 1000 * 1000  }
        "G" { $nSize * 1000 * 1000 * 1000 }
        "M" { $nSize * 1000 * 1000 }
        "K" { $nSize * 1000 }
        Default { $nSize }
    }
}





function disk_init_part_format ($disk_num, $size_use=0, $ask=0) {
    
    $offsets, $sizes = disk_part_size_get_const $disk_num  $size_use  $ask

    $offset_RES, $offset_SYS, $offset_DAT, $offset_RST  =  $offsets
      $size_RES,   $size_SYS,   $size_DAT,   $size_RST  =  $sizes

    oo_vars  offset_RES offset_SYS offset_DAT offset_RST 
    oo_vars    size_RES   size_SYS   size_DAT   size_RST  

    if ($ask) { do_check_Continue }

    # ---------------------------------------- Initialize-Disk
    Clear-Disk      $disk_num -Confirm:$false  -RemoveData -RemoveOEM -PassThru | Out-Null
    # sleep 1  # <<<<<<<<<<<<<<<<< 
    Initialize-Disk $disk_num -Confirm:$false  -PartitionStyle gpt | Out-Host
    # Initialize-Disk $disk_num -Confirm:$false  -PartitionStyle MBR 
    # sleep 1  # <<<<<<<<<<<<<<<<< 
    
    $null = Get-Partition  $disk_num ; # ''; do_check_Continue

    # sleep 1  # <<<<<<<<<<<<<<<<< 
    # ---------------------------------------- New-Partition
    # New-Partition $disk_num -Size  16MB  -GptType "{e3c9e316-0b5c-4db8-817d-f92df00215ae}"
    New-Partition $disk_num -Size $Size_SYS  -GptType $uuid_SYS | Out-Null
    New-Partition $disk_num -Size $Size_DAT  -GptType $uuid_DAT | Out-Null
    New-Partition $disk_num -Size $Size_RST  -GptType $uuid_RST | Out-Null

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




    # ---------------------------------------- 
    # ---------------------------------------- 
    # ---------------------------------------- 
    # ---------------------------------------- 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
 
function sure_mount_disk {
    # ----------------------------------------  
    $disk_num = get_disk_num_last
    $part_num = 3

    $part_3 = Get-Partition $disk_num $part_num
    ooie "DriveLetter :" $part_3.DriveLetter
    if ($part_3.DriveLetter) { return $part_3.DriveLetter }


    Get-Disk $disk_num | Set-Disk -IsOffline $true
    sleep 2
    Get-Disk $disk_num | Set-Disk -IsOffline $false
    sleep 2

    $part_3 = Get-Partition $disk_num $part_num
    ooie "DriveLetter :" $part_3.DriveLetter
    if ($part_3.DriveLetter) { return $part_3.DriveLetter }


    $vol_empty = get_empty_vol 

    ''; oo_vars  disk_num  part_num  vol_empty
    __Chect_continue__ 

    Get-Partition $disk_num $part_num | Set-Partition -NewDriveLetter ${vol_empty}

    # Add-PartitionAccessPath 1 2 -AccessPath F:
    # Add-PartitionAccessPath -DiskNumber $disk_num -PartitionNumber $part_num -AccessPath "${vol_empty}:"

    $part_3 = Get-Partition $disk_num $part_num
    ooie "DriveLetter :" $part_3.DriveLetter
    if ($part_3.DriveLetter) { return $part_3.DriveLetter }
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$sf_AMBackup  = "C:/_win/util/_disk/AOMEI/AOMEI Backupper/7.3.3/AMBackup.exe"

function adi_get_disk_no($sf_adi) {
    $sf_adi_win  = sp_win $sf_adi
    
    $sOut = (& $sf_AMBackup /l /s $sf_adi_win 2>$null)
    
    if($sOut[0] -match 'disk') {
        # $sOut[3].split()[0][4], 'disk'
        $sOut[-1][4], 'disk'
    }
    else{
        $sOut[3].split()[0][0], 'part'
    }
}


function adi_get_disk_part_no($sf_adi) {
    $sf_adi_win  = sp_win $sf_adi
    
    $sOut = & $sf_AMBackup /l /s $sf_adi_win 2>$null
    
    if($sOut[0] -match 'Disk') {
        $disk_no = $sOut[-1][4]
        $sOut = & $sf_AMBackup /l  $disk_no  /s $sf_adi_win 2>$null
        $sOut[3+3].split()[0], 'disk'
    }
    else{
        $sOut[3].split()[0], 'part'
    }
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
 

