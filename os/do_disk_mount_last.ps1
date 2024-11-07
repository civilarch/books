

function sure_mount_disk {
    # ----------------------------------------  
    $disk_num = get_disk_num_last
    $part_num = 3

    $part_3 = Get-Partition $disk_num $part_num
    ooie "DriveLetter :" $part_3.DriveLetter
    if ($part_3.DriveLetter) { exit }


    Get-Disk $disk_num | Set-Disk -IsOffline $true
    sleep 2
    Get-Disk $disk_num | Set-Disk -IsOffline $false
    sleep 2

    $part_3 = Get-Partition $disk_num $part_num
    ooie "DriveLetter :" $part_3.DriveLetter
    if ($part_3.DriveLetter) { exit }


    $vol_empty = get_empty_vol 

    ''; oo_vars  disk_num  part_num  vol_empty
    __Chect_continue__ 

    Get-Partition $disk_num $part_num | Set-Partition -NewDriveLetter ${vol_empty}

    # Add-PartitionAccessPath 1 2 -AccessPath F:
    # Add-PartitionAccessPath -DiskNumber $disk_num -PartitionNumber $part_num -AccessPath "${vol_empty}:"

    $part_3 = Get-Partition $disk_num $part_num
    ooie "DriveLetter :" $part_3.DriveLetter
    if ($part_3.DriveLetter) { exit }
}

# ---------------------------------------- 
# ---------------------------------------- 
$vol = sure_mount_disk
# ---------------------------------------- 
# ---------------------------------------- 
__Chect_out__



# [-NewDriveLetter

# Set-Partition  $part_3  -NewDriveLetter  "${vol_empty}:"








