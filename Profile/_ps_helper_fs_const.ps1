#! pwsh
# ---------------------------------------- 
# Title         : ps1/Profile/_ps_helper_fs_const.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240608_215317
# Created by    : Swami Nirav Atasa
# powershell C:/_etc/win/ps1/Profile/_ps_helper_fs_const.ps1
# ---------------------------------------- 

function sure_colon($sVol)  { $sVol -replace '(?<=^[a-zA-Z])$', ":" }
function pop_slash($sp)     { $sp -replace '[\\/]+$' }
function sp_posix($sp) { $sp -replace '\\\\?', '/' }
function sp_win($sp)   { $sp -replace '/', '\'     }
function sp_win2($sp)  { $sp -replace '/', '\\'    }

function sp_par($sp)      { $sp -replace '[\\/][^\\/]*$' }
function path_par_par($sp)  { sp_par (sp_par $sp) }

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function is_fsi  ($ob) { $ob -is [IO.FileSystemInfo] }

function is_file ($ob){if(is_fsi($ob)){!$ob.PSIsContainer} else { [IO.File]::Exists($ob) }}
function is_dir  ($ob){if(is_fsi($ob)){ $ob.PSIsContainer} else { [IO.Directory]::Exists($ob) }}
function is_exist($ob){if(is_fsi($ob)){ $true }            else { $false }}

# function is_file ($sp) { [System.IO.File]::Exists($sp) }
# function is_dir  ($sp) { [System.IO.Directory]::Exists($sp) }
# function is_exist($sp) { [System.IO.Path]::Exists($sp) }

function not-exist { -not (Test-Path $args) }
Set-Alias !exist not-exist -Option "Constant, AllScope"
Set-Alias exist Test-Path -Option "Constant, AllScope"

function ife_run($sf) { 
    if (Test-Path $sf) { & $sf } 
    else { ooie "ALERT ::: NOT exist ::: $sf" }
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function sp_rel ($ob) { Resolve-Path -r $ob }
function sp_full($sp) { sp_posix (gi $sp).fullname }
function sp_full_x($sp) { pop_slash (sp_full $sp) }

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# is_recent $time_file -D -5
function is_recent {
    $time = get_time $args[1]  $args[2] 
    if ($time -lt $args[0]) { return $true; }
    return $false;
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function repl_vol($sp, $vol) { $vol + $sp.substring(1) }
function repl_head($s, $f, $r) { $s -replace ("^"+[Regex]::Escape($f)), $r }
function repl_rear($s, $f, $r) { $s -replace ([Regex]::Escape($f)+"$"), $r }

function set_sfn($sp, $sfn) {
    $sp = $sp -replace '[\\/]+$'
    ($sp -replace '[^\\/]*$') + $sfn
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function find_file_parent_tree($sd_cur, $sfn) {
    for ($i=0; $i -lt 20; $i++) {
        $sd_cur = "$sd_cur\.."
        if (Test-Path  "$sd_cur\$sfn") {return "$sd_cur\$sfn" }
    }
}

# ---------------------------------------- 
# -- 
# ---------------------------------------- 
Function psfind ([string]$sPath) {
    Get-Childitem "$sPath" -recurse | % {$_.FullName}
}

Function psfind_file ([string]$sPath) {
    Get-Childitem "$sPath" -recurse -File | % {$_.FullName}
}

Function psfind_dir ([string]$sPath) {
    Get-Childitem "$sPath" -recurse -Directory | % {$_.FullName}
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function get_empty_vol ($vol_start='D'){
    $vols = (Get-Volume).DriveLetter
    for ($i=[int][char]$vol_start.ToUpper(); $i -le [int][char]'Z'; $i++) {
        if ( $vols -notcontains [char]$i) { return [char]$i }
    }
}


function get_empty_vol_rev ($vol_start='R', $vol_end='M'){
    $vols = (Get-Volume).DriveLetter
    for ($i=[int][char]$vol_start.ToUpper(); $i -le [int][char]$vol_start.ToUpper(); $i--) {
        if ( $vols -notcontains [char]$i) { return [char]$i }
    }
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# alias|os -s|sls proc

function duc($unit='K') {
    $div = 1000
    if ($unit -eq 'M') { $div = 1000000 }
    if ($unit -eq 'G') { $div = 1000000000 }
    
    gci -dir -name | %{
        $nSize = (gci -r -file $_ | Measure Length -Sum).Sum
        $sSize = "{0,10} $unit" -f [int]($nSize / $div)
        "$sSize : $_"
    }
}

function ducm { duc M }
function ducg { duc G }


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

 
 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# alias|os -s|sls proc

function duc($unit='K') {
    $div = 1000
    if ($unit -eq 'M') { $div = 1000000 }
    if ($unit -eq 'G') { $div = 1000000000 }
    
    gci -dir -name | %{
        $nSize = (gci -r -file $_ | Measure Length -Sum).Sum
        $sSize = "{0,10} $unit" -f [int]($nSize / $div)
        "$sSize : $_"
    }
}

function ducm { duc M }
function ducg { duc G }




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


    # $sp_last = get_sp_last  $sp  $sExt
    
function get_sp_last($sp, $sExt='.7z') {
    $sp   = $sp -replace '\\\\?', '/'
    $sd, $sfn, $__ = sp_split $sp 
    
    pushd $sd
    $sp_last = gci ${sfn}_[0-9][0-9]$sExt | sort Name | select -last 1 
    popd
    
    if (! $sp_last) { return "" }
    
    $sp_last.FullName
}


# $sp_next =  get_next_sp  'C:/_usr/prg/AutoHotkey_code'

function get_next_sp($sp, $sExt='.7z') {
    $sp   = $sp -replace '\\\\?', '/'
    $sd, $sfn, $sfnb, $__ = sp_split($sp)

    $sp_last = get_sp_last  $sp  $sExt
    
    if (! $sp_last) {
        return "$sd/${sfnb}_01${sExt}"
    }

    $sf_C   = $sp_last -replace '\\\\?', '/'
    $sd_C, $sfn_C, $sfnb_C, $__ = sp_split($sf_C)
    
    if ($sfnb_C -match '(.+?)_?(\d\d*)$') {
        $sFront, $sNum = $Matches[1], $Matches[2] 
        $sNum_next = '{0:d2}' -f ([int]$sNum + 1)
        return "$sd/${sFront}_${sNum_next}${sExt}"
    }
}


 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


function repl_ext($sp, $ext) {
    $front, $rear = $sp -split '\.(?=\w*$)'
    if ($ext.contains('.')) {  
        $dummy, $ext = $ext -split '\.(?=\w*$)'
    }
    $front + '.' + $ext
}


# $sd, $sfn, $sfnb, $sExt = sp_split $sp

function sp_split($sp) {
    $sp   = $sp  -replace  '\\\\?', '/'
    $sd   = $sp  -replace  '(^|[\\/])[^\\/]*$'
    $sfn  = $sp  -replace  '^.*[\\/]'
    $sfnb, $sExt = $sfn -split '(?=\.[^.]*$)'
    # ---------------------------------------- 
    $sd, $sfn, $sfnb, $sExt
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# function safe_copy($sf_src, $sf_dst) {
#     sure_exist $sf_src
#     sure_delete $sf_dst
#     sp_sure_mkdir_parent $sf_dst

#     Copy-Item  $sf_src  $sf_dst
#     sure_exist $sf_dst
# }

# function safe_copy($sf_src, $sf_dst) {
#     if ($sf_src -is [object]) { $sf_src = $sf_src.fullname }
#     sure_exist  $sf_src
#     # sure_delete $sf_dst
#     sp_sure_mkdir_parent $sf_dst
#     try {Copy-Item  $sf_src  $sf_dst} catch { exit }
#     # sure_exist $sf_dst
# }

 
 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: pipe
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: pipe
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: pipe
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: pipe


function flt_date ([string]$t_unit, [int]$t_qty) { 
    begin { $t_ago = get_time_ago  $t_unit  $t_qty } 
    process { if($_.LastWriteTime -gt $t_ago){$_}} 
}

# function flt_date_str ([string]$t_str) { 
#     begin { $t_ago = get_time_ago  $t_str } 
#     process { if($_.LastWriteTime -gt $t_ago){$_}} 
# }

function flt_date_range ([string]$t_str_a, [string]$t_str_b) { 
    begin { 
        $time_a = get_time_ago  $t_str_a
        $time_b = get_time_ago  $t_str_b
    } 
    process { 
        if(($time_a -le $_.LastWriteTime) -and ($_.LastWriteTime -lt $time_b)){
            $_
        }
    } 
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: files
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: files
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: files
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: files
$exts_subl = 'settings commands menu keymap build'.split()|%{"*.sublime-$_"}
$exts_ps1  = 'ps1 bat ahk sh py reg'.split()|%{"*.$_"}
$exts_day  = $exts_ps1 + $exts_subl 
$exts_day  = $exts_ps1 + $exts_subl 

$exts_shell= 'sh ps1 bat'.split()|%{"*.$_"}

$exts_vs   = 'proj vcxproj sln props'.split()|%{"*.$_"}
$exts_c    = 'h c cpp hpp rc'.split()|%{"*.$_"}
$exts_vc   = $exts_vs + $exts_c 

$exts_php  = 'php'.split()|%{"*.$_"}
$exts_java = 'java'.split()|%{"*.$_"}

$exts_js   = 'js'.split()|%{"*.$_"}
$exts_fe   = 'html htm css js'.split()|%{"*.$_"}
$exts_web  = $exts_fe + $exts_js

$exts_code = ('ps1 py ahk bat php sh'.split()|%{"*.$_"}) + $exts_vc + $exts_web 


function gci_date   ($sd="*", [string]$t_str="2D") { gci $sd  @args | flt_date $t_str }
function gci_date_n ($sd="*", [string]$t_str="2D") { gci -file $sd  @args | flt_date $t_str | rvpa -r }

function gci_day   ($sd="*") { gci -file -i $exts_day   $sd  @args }
function gci_day_n ($sd="*") { gci -file -i $exts_day   $sd  @args | rvpa -r }

function gci_day_date   ([string]$t_str="2D", $sd="*") { gci -file -i $exts_day   $sf  @args | flt_date $t_str }
function gci_day_date_n ([string]$t_str="2D", $sd="*") { gci -file -i $exts_day   $sf  @args | flt_date $t_str | rvpa -r  }


function gci_r_date   ([string]$t_str="2D", $sd=".") { gci -r -file $sd  @args | flt_date $t_str }
function gci_r_date_n ([string]$t_str="2D", $sd=".") { gci -r -file $sd  @args | flt_date $t_str | rvpa -r }

function gci_r_day  ($sd=".") { gci -r -file -i $exts_day   $sd  @args }
function gci_r_vcx  ($sd=".") { gci -r -file -i $exts_vc    $sd  @args }
function gci_r_code ($sd=".") { gci -r -file -i $exts_code  $sd  @args }

function gci_r_day_date  ([string]$t_str="2D", $sd=".") { gci -r -file -i $exts_day   $sd  @args | flt_date $t_str }
function gci_r_vcx_date  ([string]$t_str="2D", $sd=".") { gci -r -file -i $exts_vc    $sd  @args | flt_date $t_str }
function gci_r_code_date ([string]$t_str="2D", $sd=".") { gci -r -file -i $exts_code  $sd  @args | flt_date $t_str }

function gci_r_day_date_n  ([string]$t_str="2D", $sd=".") { gci -r -file -i $exts_day   $sd  @args | flt_date $t_str | rvpa -r  }
function gci_r_vcx_date_n  ([string]$t_str="2D", $sd=".") { gci -r -file -i $exts_vc    $sd  @args | flt_date $t_str | rvpa -r  }
function gci_r_code_date_n ([string]$t_str="2D", $sd=".") { gci -r -file -i $exts_code  $sd  @args | flt_date $t_str | rvpa -r  }


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: files
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: files
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: files
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: files
function get_set_dict_gci($sd, $sOpt = "") {
    $sCommand = "gci  $sOpt  $sd"
    $hset = [HashSet[string]]@(); $dict = [Dictionary[string, object]]@{};
    iex $sCommand | % { $null = $hset.Add($_.name); $dict.Add($_.name, $_.fullname) }
    $hset, $dict
}


# $hset,  $dict = get_set_dict_gci .


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function sure_exist {
    if ( 1 -eq $args.count) {$args=,$args}
    for ($i=0; $i -lt $args.count; $i++) {
        if ( -not (Test-Path $args[$i]) ) {
            exit_  "Error :: Not Exist : $($args[$i])" 
        }    
    }
}

function sure_exist_not {
    if ( 1 -eq $args.count) {$args=,$args}
    for ($i=0; $i -lt $args.count; $i++) {
        if ( (Test-Path $args[$i]) ) {
            exit_  "Error :: Already Exist : $($args[$i])" 
        }    
    }
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function get_vol_dst_ask($sp_src) {
    # ------------------ 
    $vol_src = $sp_src[0]
    # ------------------ 
    $vols = gdr -P 'FileSystem' | % name
    $vols = $vols | ?{ $_ -ne $vol_src }
    # ------------------ 
    [Collections.ArrayList] $vols = gdr -P 'FileSystem' | % name
    $vols.Remove($vol_src)
    # ------------------ 
    $idx = do_menu_select_of_arr $vols.ToArray() "vol_dst?"  0 
    
    if ($idx -is [int]) { $vols[$idx] }
    else {$idx}
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function sp_find_exist($sps) {
   for ($i=0; $i -lt $sps.count; $i++) { $sp = $sps[$i];
      if (Test-Path $sp) { return $sp }
   }
}

function get_vol_exist($svols) {
    if($svols -match ' +'){$vols = $svols -split ' +'}
    else{$vols = $svols -split ''|?{$_}}
    $vols = $vols|%{$_+':'}
    $vol = sp_find_exist $vols
    if($vol){$vol[0]}
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$uuid_RES = "{e3c9e316-0b5c-4db8-817d-f92df00215ae}" 
$uuid_SYS = "{c12a7328-f81f-11d2-ba4b-00a0c93ec93b}" 
$uuid_DAT = "{ebd0a0a2-b9e5-4433-87c0-68b6b72699c7}" 
$uuid_RST = "{de94bba4-06d1-4d40-a16a-bfd50179d6ac}" 



function get_disk_num_last($ask=0) {
    Get-Disk |sort Number|select Number, FriendlyName, Size, PartitionStyle | Out-Host
    $odisk_last  = Get-Disk |sort Number| select -l 1
    $disk_num_last  = $odisk_last.Number
    $sParam = "$disk_num_last"
    ooie "Select last : $disk_num_last"
    if ($ask) { $sParam = ask_ $sParam "Input disk : " }
    $sParam.split()
}


function get_usb_disk_num_last($ask=0) {
    Get-Disk |sort Number|select Number, FriendlyName, Size, PartitionStyle | Out-Host
    Get-Disk |sort Number|? BusType -eq USB |select Number, FriendlyName, Size, PartitionStyle | Out-Host
    $usb_disks = Get-Disk |sort Number|? BusType -eq USB |select Number, FriendlyName, Size, PartitionStyle ; 
    $usb_disks | Out-Host
    $odisk_tgt  = $usb_disks| select -l 1
    $disk_num_tgt  = $odisk_tgt.Number

    $sParam = "$disk_num_tgt"
    ooie "Select  tgt : $disk_num_tgt"
    if ($ask) { $sParam = ask_ $sParam "Input disk : " }
    $sParam.split()
}



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


<#

14333 / G


#>
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function iso_mount($sf_ISO, $vol='') {
     $sf_ISO = (gi $sf_ISO)
     
     $isoDrive = (Get-DiskImage -ImagePath $sf_ISO)
     
     if ($isoDrive.Attached) {
          $vol = ($isoDrive | Get-Volume).DriveLetter + ':'
          return $vol
     }
     $isoDrive = Mount-DiskImage -ImagePath $sf_ISO -PassThru  -NoDriveLetter
     $volInfo = $isoDrive | Get-Volume
     Mountvol "${vol}:" $volInfo.UniqueId
     return $vol
}


function iso_dismount($sf_ISO) {
     $sf_ISO = (gi $sf_ISO)
     Dismount-DiskImage  -ImagePath $sf_ISO  
}


<#
$sf_ISO = "w11_23H2_en_22631.3880_MSDN.iso"
iso_mount      $sf_ISO  (get_empty_vol_rev)
iso_dismount   $sf_ISO   
#>



function iso_mount_in_sd($sd="") {
    if (! $sd) { $sd = sp_posix $PWD }
    Set-Location $sd
    
    $sfn_ISO = gci *.iso -name | select -f 1
    $sf_ISO = "$PWD/$sfn_ISO"

    $vol_empty = get_empty_vol_rev
    # ---------------------------------------- Preparation
    # ---------------------------------------- Check
    oo_vars  sfn_ISO   sf_ISO  vol_empty 
    # ooiie  "ni_i_SymbolicLink  $sd_sys  _pos"    

    __Chect_continue__ 1; oole
    # ---------------------------------------- run
     $isoDrive = (Get-DiskImage -ImagePath $sf_ISO)
     
    if ($isoDrive.Attached) {
        $vol_exist = ($isoDrive | Get-Volume).DriveLetter + ':'
        ooln
        oooi "Already mounted on $vol_exist !!!"
        oooi "iso_dismount   $sf_ISO ...."
        ooln
        iso_dismount   $sf_ISO   
    }
    else {
        iso_mount      $sf_ISO  $vol_empty
        ooln
        oooi "Mounted on $vol_empty !!!"
        ooln
    }
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function scheduled_open_explorer_vol($sdVol) {
   if ($sdVol -imatch '^[C-Z]$') {
       $sdVol = "${sdVol}:"
   }
   Get-ScheduledTask -TaskName  "OpenExplorer*" | Unregister-ScheduledTask -Confirm:$false
   Start-Process  explorer.exe  "$sdVol"
}



function change_vol_open($sVolCur, $sVolNew) {
   $sdVol   = $sVolNew + ':'
   oo_vars sVolCur  sVolNew  sdVol  

   # ---------------------------------------- 
   while ( !$sVolNew -or (Test-Path "$sVolNew`:")) {
      ooie "    $sVolNew`:  is empty or already Exist !!!"
      oooo -n '    -- Enter ndw volumn : ';$sVolNew=Read-Host;
      
      oo_vars  sVolNew
   }

   # ---------------------------------------- 
   ooie "Set-Partition -DriveLetter $sVolCur  -NewDriveLetter $sVolNew"
   __Chect_continue__ 1

   # ---------------------------------------- 
   Set-Partition -DriveLetter $sVolCur  -NewDriveLetter $sVolNew

   # ---------------------------------------- 
   $Command = "scheduled_open_explorer_vol $sdVol"

   Get-ScheduledTask -TaskName  "OpenExplorer*" | Unregister-ScheduledTask -Confirm:$false
   $Params = @{
      Action      = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument $Command
      Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMilliseconds(1000))
      TaskName    = 'OpenExplorer'
      Description = 'OpenExplorer Description'
   }
   Register-ScheduledTask @Params
   
}






# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

<#

cpi  -v -fo  D:\_etc\win\ps1\Profile\_ps_helper_fs_const.ps1  C:\_etc\win\ps1\Profile\_ps_helper_fs_const.ps1  





#>



