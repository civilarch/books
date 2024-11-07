
# using namespace System.Collections.Generic

# ---------------------------------------- 
# . ./lib_a_1.ps1
# ---------------------------------------- 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$global:__ns = 0; $global:__nocheck = 0
Set-Alias oo oooo
Set-Alias os ooiie
Set-Alias ov oo_vars

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function do_sd_sync_with_hash ( ) {
    $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
    sd_sync_with_hash   (gi $sd_a).fullname  (gi $sd_b).fullname
}


ri  -r  -fo _mock/*; cpi -r  -fo _mock_save/*  _mock/
gci -file -r -n _mock/sd_a > _mock/org_sd_a.txt
gci -file -r -n _mock/sd_b > _mock/org_sd_b.txt

do_sd_sync_with_hash

gci -file -r -n _mock/sd_a > _mock/rsl_sd_a.txt
gci -file -r -n _mock/sd_b > _mock/rsl_sd_b.txt


<#

sd_update_3_test.ps1


#>

