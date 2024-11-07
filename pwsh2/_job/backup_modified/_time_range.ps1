# ---------------------------------------- 
# sf   : C:\_usr\prg\pwsh2\_job\backup_modified\_backup_modified.ps1
# Time : Monday May 13, 2024 07:42:44
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 1






# ------------------ 2
function flt_date ($t_unit, $t_str) { 
    begin { $t_ago = get_time_ago  $t_unit  $t_str } 
    process { if($_.LastWriteTime -gt $t_ago){$_}} 
}



function flt_date_str ([string]$t_str) { 
    begin { $t_ago = get_time_ago_str  $t_str } 
    process { if($_.LastWriteTime -gt $t_ago){$_}} 
}


function flt_date_str ($t_str_a, $t_str_b='') { 
    begin { 
        $time_a = get_time_ago  $t_str_a  $qty 
    
    } 
    process { if($_.LastWriteTime -gt $time_a){$_}} 
}



function flt_date_range_str ($t_str_a, $t_str_b='') { 
    begin { 
        $time_a = get_time_ago_str  $t_str_a
        $time_b = get_time_ago_str  $t_str_b
    
    } 
    process { if($_.LastWriteTime -gt $time_a){$_}} 
}


flt_date 1D



# ------------------ 3






# ------------------ 4






# ------------------ 5





