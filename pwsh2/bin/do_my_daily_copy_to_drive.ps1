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

function get_time_ago([string]$t_unit, [int]$t_qty) {
    if (! $t_qty) {$t_unit, $t_qty = split_time_str $t_unit }
    get_time  $t_unit  -$t_qty
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function flt_date ([string]$t_unit, [int]$t_qty) { 
    begin { $t_ago = get_time_ago  $t_unit  $t_qty } 
    process { if($_.LastWriteTime -gt $t_ago){$_}} 
}

function gci_r_day_date  ([string]$t_str="24h", $sd=".") { gci -r -file -i $exts_day   $sd  @args | flt_date $t_str }

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# vol_modified_copy_to_m 666  .  y

function vol_day_date_copy_to( $t_str="60m", $sdSrc=".", $destVol="D", $mid="" ){
    # ---------------------------------------- 
    $od_cur = (gi $sdSrc)
    $od_old = Get-Location; Set-Location $od_cur
    $sd_cur = $od_cur.fullname  -replace '\\\\?', '/'
    # ---------------------------------------- 
    $sd_dst = $destVol + ':' + $mid + $sd_cur.Substring(2)
    oo_vars sd_cur  sd_dst
    # ---------------------------------------- 
    gci_r_day_date  $t_str  $sd_cur | pipe_copy_to  $sd_dst
    # ---------------------------------------- 
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

function my_daily_copy_to_drive( $t_str=60, $volSrc="C", $volDst="D", $mid="" ){
    foreach ($sd_from_ in $sds_daily) {
        $sd_from = $volSrc + ':' + $sd_from_
        vol_day_date_copy_to   $t_str  $sd_from  $volDst  $mid
        # oooo "`n"; ooiie "done : $sd_from"
        # sleep -m 500
    }
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# my_daily_copy_to_drive  $qty  $volSrc  $volDst  $mid
# my_daily_copy_to_drive  3D  c  v  /S_modified


function do_my_daily_copy_to_drive() {
    # ---------------------------------------- sArgs
    oooi (':'*50);
    oooi "my_daily_copy_to_drive  `$qty `$volSrc `$volDst  `$mid"
    oooi "my_daily_copy_to_drive  3D  c  v  /S_modified"
    "    $('-'*30) Enter arguments : "; 
    ooin 'my_daily_copy_to_drive  '; $sArgs = Read-Host;
    if (! $sArgs) { $sArgs = "3D  c  v  /S_modified" }
    # ---------------------------------------- $t_str, $volSrc, $volDst, $mid
    ''
    $t_str, $volSrc, $volDst, $mid  =  $sArgs.Trim() -split '\s+'
    oo_vars  t_str  volSrc  volDst  mid
    sure_exist ($volDst + ':')
    ''
    do_check_Continue
    # ---------------------------------------- 
    $global:dryrun = 1
    my_daily_copy_to_drive  $t_str  $volSrc  $volDst  $mid
    # ---------------------------------------- 
    ooiie "to run"; do_check_Continue; 
    # ---------------------------------------- 
    $global:dryrun = 0
    my_daily_copy_to_drive  $t_str  $volSrc  $volDst  $mid
    # ---------------------------------------- 
}


do_my_daily_copy_to_drive
# ---------------------------------------- 
do_check_exit

