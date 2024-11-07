# ---------------------------------------- 
# Title         : //do_my_daily_copy_to_drive_m.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240513_140604
# Created by    : Swami Nirav Atasa
# powershell C:/do_my_daily_copy_to_drive_m.ps1
# ---------------------------------------- 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function get_lines($sText) {
    $aLines = $sText -split "`n"
    $aLines  = ($aLines | ?{ ($_ -notmatch '^\s*$') -and ($_ -notmatch '^\s*#')  } )
    $aLines
}


function sure_ni_d($sd) {
    if (!(Test-Path $sd)) { ni -i d $sd | Out-Null}
}


function sp_sure_mkdir_parent($sp) {
    $sd, $sfn, $sfnb, $sExt = sp_split $sp
    if ($sd) { sure_ni_d $sd }
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# $t_unit, $t_qty = split_time_str "m60"
# $t_unit, $t_qty = split_time_str $t_str

function split_time_str([string]$t_str) {
    $t_unit = 'm'; $t_qty = $t_str;
    if     ($t_str -match '^([a-zA-Z]+)(\d+)$'){ $t_unit, $t_qty= $Matches[1], $Matches[2]; }
    elseif ($t_str -match '^(\d+)([a-zA-Z]+)$'){ $t_unit, $t_qty= $Matches[2], $Matches[1]; }
    $t_unit, [int]$t_qty
}

function get_time($t_unit, [int]$t_qty) {
    if ($t_unit -is [array]) { $t_unit, $t_qty = $t_unit }
    switch -CaseSensitive ($t_unit) {
       "s"  { return (get-date).AddSeconds(     $t_qty); }
       "m"  { return (get-date).AddMinutes(     $t_qty); }
       "h"  { return (get-date).AddHours(       $t_qty); }
       "D"  { return (get-date).AddDays(        $t_qty); }
       "M"  { return (get-date).AddMonths(      $t_qty); }
       "Y"  { return (get-date).AddYears(       $t_qty); }
       "ms" { return (get-date).AddMilliseconds($t_qty); }
       default { return (get-date).AddDays($args[2]);}
    }    
}

function get_time_ago_str([string]$t_str) {
    $t_unit, $t_qty = split_time_str $t_str
    get_time $t_unit -$t_qty
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function flt_date_str ([string]$t_str) { 
    begin { $t_ago = get_time_ago_str  $t_str } 
    process { if($_.LastWriteTime -gt $t_ago){$_}} 
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# vol_modified_copy_to_m 666  .  y

function vol_day_date_copy_to( $t_str="60m", $sdSrc=".", $destVol="D", $mid="" ){
    $od_cur = (gi $sdSrc)
    $od_old = Get-Location; Set-Location $od_cur
    $sd_cur = $od_cur.fullname  -replace '\\\\?', '/'
    $sd_dst = $destVol + ':' + $mid + $sd_cur.Substring(2)
    oo_vars sd_cur  sd_dst
    
    gci -r -i $exts_day $sdSrc | flt_date_str  $t_str |  % {
        $sp_rel = Resolve-Path -Relative $_.fullname
        $sp_rear = $sp_rel.substring(2)  -replace '\\\\?', '/'
        $sf_b = "$sd_dst/$sp_rear"
        sp_sure_mkdir_parent  $sf_b
        $sf_b
        Copy-Item  $_  $sf_b
    }
    
    Set-Location $od_old
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$sds_daily  = get_lines  @"
\Program Files\WindowsPowerShell
\Windows\System32\WindowsPowerShell\v1.0
\_wvar\_win\_win_os\_win_setting
\_etc
\_usr\util\PowerGREP
\_win\util\_disk
\_win\tool\Everything
\_usr\prg\Sublime_1\_util
\_usr\prg\Sublime_1\Packages
\_usr\prg\Sublime_1\_util
\_usr\prg\Sublime_1\Data\Packages\User
\_usr\prg\Sublime_self
"@|% trim


# my_daily_copy_to_drive_m  555  c y  

function my_daily_copy_to_drive( $qty=60, $volSrc="C", $volDst="D", $mid="" ){
    foreach ($sd_from_ in $sds_daily) {
        $sd_from = $volSrc + ':' + $sd_from_
        vol_day_date_copy_to   $qty  $sd_from  $volDst  $mid
        # oooo "`n"; ooiie "done : $sd_from"
        # sleep -m 500
    }
}


function restore_all_to_drive( $sdSrc=".", $volDst="D", $mid="" ){
    foreach ($sd_from_ in $sds_daily) {
        $sd_from = $volSrc + ':' + $sd_from_
        vol_day_date_copy_to   $qty  $sd_from  $volDst  $mid
        # oooo "`n"; ooiie "done : $sd_from"
        # sleep -m 500
    }
}






# $strings -is [object]  [array] [Hashtable] [Object[]]   IO.FileSystemInfo  DirectoryInfo
# [IO.FileInfo]  
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# V:\S_modified\do_restore_all_to_drive.ps1


function copy_all_to($sdSrc, $sdDst) {
    $od_old = Get-Location; Set-Location $sdSrc
    
    if ($sdDst -match '^[a-zA-Z]$') { $sdDst = $sdDst + ':' }
    
    gci -r -file $sdSrc | % {
        $sf_rel  = Resolve-Path -Relative $_.fullname
        $sf_dst = $sdDst + $sf_rel.Substring(1)
        # $_
        $sf_dst
        
        safe_copy  $_  $sf_dst
        
        # exit
    }

    Set-Location $od_old
}

 

function do_copy_all_to ($sdSrc) {
    
    $sArgs_ = "$sdSrc  y"
    
    # ---------------------------------------- sdDst
    oooi (':'*50);
    oooi "copy_all_to  `$sdSrc `$sdDst "
    oooi "copy_all_to   $sArgs_"
    "    $('-'*30) Enter arguments : "; 
    ooin 'copy_all_to  '; $sArgs = Read-Host;
    if (! $sArgs) { $sArgs = $sArgs_ }
    if ($sArgs -match '^\S+$') { $sArgs = "$sdSrc $sArgs" }
    ''
    $sdSrc, $sdDst =  $sArgs.Trim() -split '\s+'
    if ($sdDst -match '^[a-zA-Z]$') { $sdDst = $sdDst + ':' }
    oo_vars  sdSrc  sdDst  
    sure_exist ($sdDst)
    do_check_Continue
    # ---------------------------------------- sdDst
        
    copy_all_to  $sdSrc  $sdDst
}



$sf_self   = sp_posix $PSCommandPath
$sdSrc   = sp_par $sf_self

do_copy_all_to  $sdSrc



<#

oooi (':'*50);
oooi "my_daily_copy_to_drive  `$qty `$volSrc `$volDst  `$mid"
oooi "my_daily_copy_to_drive  3D  c  v  /S_modified"
"    $('-'*30) Enter arguments : "; 
ooin 'my_daily_copy_to_drive  '; $args = Read-Host;
if (! $args) { $args = "3D  c  v  /S_modified"
    
}

''
$qty, $volSrc, $volDst, $mid  =  $args.Trim() -split '\s+'
oo_vars  qty  volSrc  volDst  mid
sure_exist ($volDst + ':')

''
my_daily_copy_to_drive  $qty  $volSrc $volDst $mid
# my_daily_copy_to_drive  300D  c  v  /S_modified

# ---------------------------------------- 
do_check_exit


#>


