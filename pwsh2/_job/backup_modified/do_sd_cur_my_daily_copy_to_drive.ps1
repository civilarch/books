#! pwsh
# ---------------------------------------- 
# Title         : _win_os/_win_setting/do_sd_cur_my_daily_copy_to_drive.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240514_212848
# Created by    : Swami Nirav Atasa
# powershell win/_win_os/_win_setting/do_sd_cur_my_daily_copy_to_drive.ps1
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
$exts_subl = 'settings commands menu keymap build'.split()|%{"*.sublime-$_"}
$exts_ps1  = 'ps1 bat sh py reg'.split()|%{"*.$_"}
$exts_day  = $exts_ps1 + $exts_subl 

# vol_modified_copy_to_m 666  .  y


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$sdSrc   = $PSScriptRoot -replace '\\\\?', '/'

oooi (':'*50);
oooi "vol_day_date_copy_to  `$t_str  `$volDst  "
oooi "vol_day_date_copy_to  999m y "
"    $('-'*30) Enter arguments : "; 
ooin 'vol_day_date_copy_to  '; $args = Read-Host;
$t_str, $volDst  =  $args.Trim() -split '\s+'

# $t_str, $volDst  =  '999', 'y'

''; oo_vars  args  t_str  sdSrc  volDst; ''

do_check_Continue

$global:dryrun = 1
vol_day_date_copy_to  $t_str  $sdSrc  $volDst 
ooiie "to run"; do_check_Continue;$global:dryrun = 0
vol_day_date_copy_to  $t_str  $sdSrc  $volDst 


# ---------------------------------------- 
do_check_exit

