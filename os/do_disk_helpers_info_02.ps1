

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$disk_num = get_disk_num_last
$offsets, $sizes = disk_part_size_get_const $disk_num

$offset_RES, $offset_SYS, $offset_DAT, $offset_RST  =  $offsets
  $size_RES,   $size_SYS,   $size_DAT,   $size_RST  =  $sizes

oo_vars  offset_RES offset_SYS offset_DAT offset_RST 
oo_vars    size_RES   size_SYS   size_DAT   size_RST  


Get-Partition $disk_num | Remove-Partition -Co:$False

New-Partition $disk_num -Offset $offset_RES -Size $size_RES  -GptType $uuid_RES | Out-Null
New-Partition $disk_num -Offset $offset_SYS -Size $size_SYS  -GptType $uuid_SYS | Out-Null
New-Partition $disk_num -Offset $offset_DAT -Size $size_DAT  -GptType $uuid_DAT | Out-Null
New-Partition $disk_num -Offset $offset_RST -Size $size_RST  -GptType $uuid_RST | Out-Null

New-Partition $disk_num -Size $size_RES  -GptType $uuid_RES | Out-Null
New-Partition $disk_num -Size $size_SYS  -GptType $uuid_SYS | Out-Null
New-Partition $disk_num -Size $size_DAT  -GptType $uuid_DAT | Out-Null
New-Partition $disk_num -Size $size_RST  -GptType $uuid_RST | Out-Null

New-Partition $disk_num -Size $size_RES  -GptType $uuid_RES | Out-Null
New-Partition $disk_num -Size $size_SYS  -GptType $uuid_SYS | Out-Null
New-Partition $disk_num -Size $size_DAT  -GptType $uuid_DAT | Out-Null
New-Partition $disk_num -Size $size_RST  -GptType $uuid_RST | Out-Null

Get-Partition $disk_num






# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
Get-Partition -DiskNumber 3 -PartitionNumber 2

# Resize the partition to 900GB.
Resize-Partition -DiskNumber 3 -PartitionNumber 2 -Size (900GB)

Get-Partition -DiskNumber 3 -PartitionNumber 2

# Get the partition sizes.
$size = (Get-PartitionSupportedSize -DiskNumber 3 -PartitionNumber 2)

# Resize to the maximum size.
Resize-Partition -DiskNumber 3 -PartitionNumber 2 -Size $size.SizeMax

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
 Get-PartitionSupportedSize 4 3

    SizeMin      SizeMax
    -------      -------
12033011712 255652589056

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
Resize-Partition -DiskNumber 4 -PartitionNumber 3  -Offset 121634816  -Size (120GB)


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
Remove-Partition -DriveLetter Y
Remove-Partition -DiskNumber 4 -PartitionNumber 1
Remove-Partition -DiskNumber 4 -PartitionNumber 1  -Confirm:$False

$parts = Get-Partition $disk_num| sort size -d 

for ($i=0; $i -lt $parts.count; $i++) { $part = $parts[$i];
     if ($i) { $part | Remove-Partition -Confirm:$False }
}
Get-Partition $disk_num

get-disk
Get-Partition 4
Get-Partition 4|Remove-Partition -Co:$False
Get-Partition 4

New-Partition $disk_num -Offset $offset_RES -Size $size_RES  -GptType $uuid_RES | Out-Null
New-Partition $disk_num -Offset $offset_SYS -Size $size_SYS  -GptType $uuid_SYS | Out-Null
New-Partition $disk_num -Offset $offset_DAT -Size ($size_DAT)  -GptType $uuid_DAT | Out-Null
# New-Partition $disk_num -Offset $offset_RST -Size $size_RST  -GptType $uuid_RST | Out-Null

New-Partition $disk_num -Offset ($offset_RST + 1024*256*3 )  -Size $size_RST  -GptType $uuid_RST | Out-Null



Remove-Partition $disk_num  4 -Confirm:$False
Remove-Partition $disk_num  3 -Confirm:$False
New-Partition $disk_num -Offset $offset_DAT -Size ($size_DAT - 1024*256*3)  -GptType $uuid_DAT | Out-Null
New-Partition $disk_num -Offset $offset_RST -Size $size_RST  -GptType $uuid_RST | Out-Null

Get-Partition $disk_num



New-Partition $disk_num -Size $size_RES  -GptType $uuid_RES | Out-Null
New-Partition $disk_num -Size $size_SYS  -GptType $uuid_SYS | Out-Null
New-Partition $disk_num -Size ($size_DAT)  -GptType $uuid_DAT | Out-Null
New-Partition $disk_num  -UseMaximumSize -GptType $uuid_RST | Out-Null




# Resize-Partition $disk_num 3  -Offset $offset_RES -Size $size_DAT
Resize-Partition $disk_num 3  -Size $size_DAT


function disk_part_new_adjust($disk_num, $offset, $size, $uuid) {
   for ($i=0; $i -lt 10; $i++) {
       New-Partition $disk_num -Offset $offset -Size $size  -GptType $uuid -ea 'silentlycontinue' | Out-Null
       if ($?) { return $offset; }
       ooie "Fail : $i"
       $offset = $offset + 120*1000
   }
}
Remove-Partition $disk_num  4 -Confirm:$False
disk_part_new_adjust  $disk_num  $offset_RST  $size_RST  $uuid_RST

# New-Partition $disk_num -Offset $offset_RST -Size $size_RST  -GptType $uuid_RST | Out-Null

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
Get-Partition $disk_num
Remove-Partition $disk_num  4 -Confirm:$False




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
127192280640

127192432640
127192304640
127192289280



256060514304
256060514304 -1024*1024
256059465728

128029732864
128029732864

     ::::::::::::::::::::::::::::::::::::::::::::::::::
     $disk_size_full   : 256060514304
     $disk_size        : 128028946432
     $offset_RES       : 1048576
     $size_mar         : 1572864
     ::::::::::::::::::::::::::::::::::::::::::::::::::
     $offset_RES       : 1048576
     $offset_SYS       : 16777216
     $offset_DAT       : 134217728
     $offset_RST       : 127190085632
     ::::::::::::::::::::::::::::::::::::::::::::::::::
     $size_RES         : 15728640
     $size_SYS         : 117440512
     $size_DAT         : 127056654336
     $size_RST         : 838860800
     ::::::::::::::::::::::::::::::::::::::::::::::::::





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

 15728640 + 104857600 + 127070285824 + 838860800


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

1651750
1572864


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





