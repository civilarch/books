
# ---------------------------------------- 
. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. sd_update_2_code_Dev.ps1
#. sd_update_1_code_Release.ps1
# ---------------------------------------- 


<#
to process ::: 
  - files
    - n dst : copy
    - e dst : update 
  
  - dirs
    - n dst : copy
    - e dst : update 
#>


function sd_ri_n_src_e_dst($sd_src, $sd_dst) {
    $od_old = Get-Location; Set-Location $sd_dst
    gci -file -n | % { if(!(Test-Path "$sd_src/$_")) {ri -r -fo $_ } }
    gci -dir  -n | % {
        $sd_src_ = "$sd_src/$_"; $sd_dst_ = "$sd_dst/$_"
        if (!(Test-Path "$sd_src_")) { ri -r -fo "$sd_dst_" } 
        else { sd_ri_n_src_e_dst  $sd_src_  $sd_dst_ }
    }
    Set-Location $od_old
}

function sd_update_e_src_a_dst($sd_src, $sd_dst) {
    $od_old = Get-Location; Set-Location $sd_src
    gci -file -n | % { sf_update  "$sd_src/$_"  "$sd_dst/$_" }
    gci -dir  -n | % {
        $sd_a = "$sd_src/$_"; $sd_b = "$sd_dst/$_"; 
        if(Test-Path $sd_b) {sd_update_e_src_a_dst  $sd_a  $sd_b } 
        else {sd_copy  $sd_a  $sd_b }
    }
    Set-Location $od_old
}



function sd_update_ps ( ) {
    $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
    sd_ri_n_src_e_dst       (sp_full_x $sd_a)  (sp_full_x $sd_b)
    sd_update_e_src_a_dst   (sp_full_x $sd_a)  (sp_full_x $sd_b)
}



ri  -r  -fo _mock/*
cpi -r  -fo _mock_save/*  _mock/
gci -file -r -n _mock/sd_a > _mock/org_sd_a.txt
gci -file -r -n _mock/sd_b > _mock/org_sd_b.txt
sd_update_ps
gci -file -r -n _mock/sd_a > _mock/rsl_sd_a.txt
gci -file -r -n _mock/sd_b > _mock/rsl_sd_b.txt







<#

C:\_usr\prg\pwsh_test\_ing\test_sd_update\sd_update_1_code_Release.ps1

#>

