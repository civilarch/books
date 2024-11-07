 
# ---------------------------------------- $sf_self 
Set-Location $PSScriptRoot
# ---------------------------------------- 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$uuid_RES = "{e3c9e316-0b5c-4db8-817d-f92df00215ae}" 
$uuid_SYS = "{c12a7328-f81f-11d2-ba4b-00a0c93ec93b}" 
$uuid_DAT = "{ebd0a0a2-b9e5-4433-87c0-68b6b72699c7}" 
$uuid_RST = "{de94bba4-06d1-4d40-a16a-bfd50179d6ac}" 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
Function iif($If, $Right, $Wrong) {if ($If) {$Right} Else {$Wrong}}
Function ifd($If,  $default) {if ($If) {$If} Else {$default}}
Function ifset ([ref]$var, $new) {if(!$var.Value){$var.Value = $new}}

function get_var($snVar, $nScope=1){(Get-Variable -Scope $nScope $snVar).Value}

Set-Alias oooo Write-Host
function oooj { if($global:__ns){return};oooo ($args -join ' ') }
function oooi { if($global:__ns){return}; oooj "    " @args; }
function ooie  { if($global:__ns){return}; oooi (':'*50); oooi @args; oooi (':'*50); }
function ooii  { if($global:__ns){return}; oooj "      "  @args; }
function ooiie { if($global:__ns){return}; oooi (':'*50); ooii @args; oooi (':'*50); }
function ooon { if($global:__ns){return}; oooo -n ($args -join ' '); }
function ooin { if($global:__ns){return}; ooon "    " @args; }


function oo_vars { if($global:__ns){return};
    oooi (':'*50);
    for ($i=0; $i -lt $args.count; $i++) {
        $var = Get-Variable -Scope 1 $args[$i]
        if ($var -and $var.Value) { 
            $sTypeName = $var.Value.GetType().name 
            if ( 'Dictionary`2', 'HashSet`1' -contains $sTypeName) {
                oooi "`$$($var.Name.PadRight(16)) : >>>>"
                $var.Value | Format-Table | Out-String
                return
            }
        }
        
        oooi "`$$($var.Name.PadRight(16)) : $($var.Value)"
    }
    oooi (':'*50);        
}




function ask_($val, $prompt="") {
    $prompt = ifd $prompt "New value: "
    ooin $prompt; $ans = Read-Host;
    if ($ans) { $val = $ans }
    $val
}

function ask_change($snVar, $prompt="") {
    $prompt = ifd $prompt "New value: "
    $value = get_var $snVar 2
    ooiie "`$$snVar : $value"
    ooin $prompt; $ans = Read-Host;
    if ($ans) { $value = $ans }
    $value
}


function do_check_exit($sMsg){
    $sAdd = iif $sMsg "$sMsg :" ""
    '';ooin "-- $sAdd check !!!";Read-Host; exit;
}

function do_check_Continue($sMsg){ if($global:__nocheck){return};
    $sAdd = iif $sMsg "$sMsg :" ""
    ooin "-- $sAdd Continue ? (Y,n)";$ans=Read-Host;if($ans -eq 'n'){exit}
}


function __wait_sec__($nSec=5) {
    sleep -m 99; $host.ui.RawUI.FlushInputBuffer(); sleep -m 9;
    $key = ''
    if($nSec -eq 0){$key = do_readkey; return $key; }
    for ($y=$nSec*10; $y; $y--) {
        if(!($y % 10)){ooon ("{0} "-f($y/10)) }
        if( $Host.UI.RawUI.KeyAvailable ) {$key = do_readkey; break; }
        [Threading.Thread]::Sleep( 990/10 )
    }
    $key
}


function __Chect_out__($nSec=5) {
    ooon "`n  ---- Chect out!!! Stay?(y/N)""`n";
    $key = __wait_sec__ $nSec
    if ($key -ne 'y' ) { exit; }
    ooon "`n  ---- Staying !!! Press any key.""`n";
    $key = do_readkey
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

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


function disk_part_size_get_const($disk_num, $size_use=0, $ask=0) {
    # ---------------------------------------- Constants
    $size_RES    =  15 * 1024*1024
    $size_SYS    = 112 * 1024*1024
    # $size_SYS    = 100 * 1024*1024
    $size_DAT    =   0 * 1024*1024
    $size_RST    = 800 * 1024*1024

    $offset_RES  =   1 * 1024*1024
    $offset_SYS  = $offset_RES + $size_RES
    $offset_DAT  = $offset_SYS + $size_SYS
    $offset_RST  =   0 * 1024*1024
    
    # ---------------------------------------- Variables
    # ------------------ disk_Size_full
    $disk_Size_full = (Get-Disk $disk_num).Size
    # ---------------------------------------- Preparation
    
    if ($size_use -match '128G?') {
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


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function get_empty_vol ($vol_start='D'){
    $vols = (Get-Volume).DriveLetter
    for ($i=[int][char]$vol_start.ToUpper(); $i -le [int][char]'Z'; $i++) {
        if ( $vols -notcontains [char]$i) { return [char]$i }
    }
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



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function get_usb_nvme_disk_num_last($ask=0) {
    Get-Disk |sort Number|select Number, FriendlyName, Size, PartitionStyle | Out-Host
    Get-Disk |sort Number|? BusType -eq USB |select Number, FriendlyName, Size, PartitionStyle | Out-Host
    $usb_disks = Get-Disk |sort Number|? BusType -eq USB | ? {$_.size -lt 257000000000 -and $_.size -gt 110000000000 } |select Number, FriendlyName, Size, PartitionStyle ; 
    $usb_disks | Out-Host
    $odisk_tgt  = $usb_disks| select -l 1
    $disk_num_tgt  = $odisk_tgt.Number

    $sParam = "$disk_num_tgt"
    ooie "Select  tgt : $disk_num_tgt"
    if ($ask) { $sParam = ask_ $sParam "Input disk : " }
    $sParam.split()
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# ---------------------------------------- Constants
$size = 0;  $ask = 1

# ---------------------------------------- Prerequiste
# ---------------------------------------- Variables
$disk_num = get_usb_nvme_disk_num_last  1
# oo_vars  disk_num 
# do_check_Continue

# ---------------------------------------- run
disk_init_part_format $disk_num  $size  $ask

# ---------------------------------------- Post process
# ---------------------------------------- Post Check
Get-Partition  $disk_num | Out-Host



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
echo ''; oooi "$(':'*50)";
Sleep -m 200; $nSec = [int]$env:PSRUNWAIT; Sleep -m 200
__Chect_out__  3
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# & C:\_etc\win\ps1\os\do_disk_init.ps1


