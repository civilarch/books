# ---------------------------------------- 
# sf   : C:\_usr\prg\pwsh2\_job\backup_modified\_backup_modified.ps1
# Time : Monday May 13, 2024 07:42:44
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 1





function get_time_ago([string]$t_unit, [int]$t_qty) {
    switch -CaseSensitive ($t_unit) {
       "ms" { return (get-date).AddMilliseconds( -$t_qty); }
       "s"  { return (get-date).AddSeconds(      -$t_qty); }
       "m"  { return (get-date).AddMinutes(      -$t_qty); }
       "h"  { return (get-date).AddHours(        -$t_qty); }
       "D"  { return (get-date).AddDays(         -$t_qty); }
       "M"  { return (get-date).AddMonths(       -$t_qty); }
       "Y"  { return (get-date).AddYears(        -$t_qty); }
       default { oooi "--get_time_ago Error !!!"; do_check_exit}
    }    
}

function split_time_str([string]$t_str) {
    $t_unit = 'm'; $t_qty = $t_str;
    if     ($t_str -match '^([a-zA-Z]+)(\d+)$'){ $t_unit, $t_qty= $Matches[1], $Matches[2]; }
    elseif ($t_str -match '^(\d+)([a-zA-Z]+)$'){ $t_unit, $t_qty= $Matches[2], $Matches[1]; }
    $t_unit, [int]$t_qty
}

function get_time_ago_str([string]$t_str) {
    $t_unit, $t_qty = split_time_str $t_str
    get_time_ago $t_unit $t_qty
}

# get_time_ago_str 3D

# $arr = split_time_str 3D
# get_time_ago @arr

# get_time_ago -e (split_time_str 3D)


# ------------------ 4


function show_args($a, $b) {
    if ($a -is [array]) { $a, $b = $a }
    oo_vars a b
}

show_args  aa bb
show_args  ('aa', 'bb')


# ------------------ 5





