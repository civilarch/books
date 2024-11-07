#! pwsh
# ---------------------------------------- 
# Title         : __prophile/powershell/_ps_helper_lang.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240424_125427
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh2/__prophile/powershell/_ps_helper_lang.ps1
# ---------------------------------------- 

using namespace System.Collections.Generic


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function get_field($str, $idx=-1, $fd="[-_,.:/\\| ]") {
    ($str -split $fd)[$idx]
}


function sfnb_last_field($sf, $idx=-1) {
    $sfn     = ($sf -split '[\\/]')[-1]
    $sfnb    = $sfn -replace '\..*$'
    get_field  $sfnb  $idx
}




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function split_args($args_) {
    $dict_opts = @{}; $args_new = @()

    for ($i=0; $i -lt $args_.count; $i++) {
        $arg = $args_[$i]
        if ($arg[0] -eq '-') { $dict_opts.add( $arg.substring(1), $args[$i+1]); $i++ }
        else { $args_new += , $arg }
    }
    $dict_opts, $args_new
}


function crange($chrA, $chrB) {
    [char[]]([char]$chrA..[char]$chrB)
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# ---------------------------------------- 
# Function IIf($If, $IfTrue, $IfFalse) {
#     If ($If) {If ($IfTrue -is "ScriptBlock") {&$IfTrue} Else {$IfTrue}}
#     Else {If ($IfFalse -is "ScriptBlock") {&$IfFalse} Else {$IfFalse}}
# }

Function iif($If, $Right, $Wrong) {if ($If) {$Right} Else {$Wrong}}
Function ifd($If,  $default) {if ($If) {$If} Else {$default}}
Function ifset ([ref]$var, $new) {if(!$var.Value){$var.Value = $new}}

# val_between $val_  $val_a  $val_b
function val_between {
    if ($val_a -le $val_  -and  $val_ -le $val_b) { return $true; }
    return $false;
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function get_var($snVar, $nScope=1){(Get-Variable -Scope $nScope $snVar).Value}
function get_var2($snVar, $nScope=2){(Get-Variable -Scope $nScope $snVar).Value}



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


# function get_time_ago_str([string]$t_str) {
#     $t_unit, $t_qty = split_time_str $t_str
#     get_time $t_unit -$t_qty
# }



# ---------------------------------------- 
# ------------------ 

function flt_date ([string]$t_unit, [int]$t_qty) { 
    if (! $t_qty) {$t_unit, $t_qty = split_time_str $t_unit }
    begin { $t_ago = get_time_ago  $t_unit  $t_qty } 
    process { if($_.LastWriteTime -gt $t_ago){$_}} 
}

function flt_date ([string]$t_str) { 
    begin { $t_ago = get_time_ago  $t_str } 
    process { if($_.LastWriteTime -gt $t_ago){$_}} 
}

function flt_date_range_str ($t_str_a, $t_str_b) { 
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

# ---------------------------------------- 
# ------------------ 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# $sd, $sfn, $sfnb, $sExt = sp_split  'C:/_var/code'  
# oo_vars   sd  sfn  sfnb  sExt


function sp_split($sp) {
    $sp   = $sp  -replace  '\\\\?', '/'
    $sd   = $sp  -replace  '(^|[\\/])[^\\/]*$'
    $sfn  = $sp  -replace  '^.*[\\/]'
    $sfnb, $sExt = $sfn -split '(?=\.[^.]*$)'
    # ---------------------------------------- 
    $sd, $sfn, $sfnb, $sExt
}



function sure_ni_d($sd) {
    if (!(Test-Path $sd)) { ni -i d $sd | Out-Null}
}


function sure_mkdir($sd) {
    if (!(Test-Path $sd)) { ni -i d $sd | Out-Null}
}


function sp_sure_mkdir_parent($sp) {
    $sd, $sfn, $sfnb, $sExt = sp_split $sp
    if ($sd) { sure_ni_d $sd }
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function dict_from_arr($arr_k, $arr_v) {
    $Type_key = $arr_k[0].GetType().name
    $Type_val = $arr_v[0].GetType().name
    $dict = New-Object ("Dictionary[$Type_key, $Type_val]")
    for ($i=0; $i -lt $arr_k.count; $i++) {
        $dict.Add($arr_k[$i], $arr_v[$i])
    }
    $dict
}

# $dict = dict_from_arr  "a","b"  "aa","bb"




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



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 









