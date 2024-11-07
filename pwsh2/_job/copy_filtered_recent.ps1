
# ---------------------------------------- Preparation
cd  C:\_ext\_client\_i_15

function rear_front($spRear, $spFront, $spMid) {
    $sp = $spFront + $spMid + $spRear
}



function recent_files_copy_m( $qty=60, $from=".", $dest="T:/_xvar/backup/modified", $mid="" ){
    $sDate   = Get-Date -Format "yyMMdd"
    $sdn_cur = (gi $from).name
    $sd_dest = "$dest$mid/$sDate/$sdn_cur" 
    
    oo_vars sdn_cur  sd_dest
    
    recent_gci_r_Min $qty |  % {
        $sp_rel = Resolve-Path -Relative $_.fullname
        $sp_rear = $sp_rel.substring(2)  -replace '\\\\?', '/'
        $sf_b = "$sd_dest/$sp_rear"
        sp_sure_mkdir_parent  $sf_b
        $sf_a = $_.fullname
        $sf_b
        # oo_vars  sf_a  sf_b
        Copy-Item  $sf_a  $sf_b
    }
}

recent_files_copy_m  


<#

recent_files_copy()


(gi .).name

#>






# function | ($qty) {
#     gci -r -file | ? {$_.LastWriteTime -gt (Get-Date).AddMinutes(-$qty)}
# }

# function recent_gci_r_Hour($qty) {
#     gci -r -file | ? {$_.LastWriteTime -gt (Get-Date).AddHours(-$qty)}
# }

# function recent_gci_r_Day($qty) {
#     gci -r -file | ? {$_.LastWriteTime -gt (Get-Date).AddDays(-$qty)}
# }

# function recent_gci_r_Month($qty) {
#     gci -r -file | ? {$_.LastWriteTime -gt (Get-Date).AddMonths(-$qty)}
# }

# function recent_gci_r_Year($qty) {
#     gci -r -file | ? {$_.LastWriteTime -gt (Get-Date).AddYears(-$qty)}
# }







# ---------------------------------------- Check
# oo_vars  sd_sys sd_new      
# ooiie  "ni_i_SymbolicLink  $sd_sys  _pos"    

# do_check_Continue
# ---------------------------------------- run

# ---------------------------------------- Post process
# ---------------------------------------- Post Check
# do_check_Continue
# "`n"*7;



