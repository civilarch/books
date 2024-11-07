
# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. bbbb_2_code_Dev.ps1
#. bbbb_1_code_Release.ps1
# ---------------------------------------- 


function sd_ri_n_src_e_dst_($sd_src, $sd_dst) {
    $od_old = Get-Location; Set-Location $sd_dst
    gci -file -n | % { if(!(Test-Path "$sd_src/$_")) {ri -r -fo $_ } }
    gci -dir  -n | % {
        $sd_src_ = "$sd_src/$_"; $sd_dst_ = "$sd_dst/$_"
        if (!(Test-Path "$sd_src_")) { ri -r -fo "$sd_dst_" } 
        else { sd_ri_n_src_e_dst_  $sd_src_  $sd_dst_ }
    }
    Set-Location $od_old
}


function sd_ri_n_src_e_dst($sd_src, $sd_dst) {
    $sd_src_ = sp_full_x $sd_src; $sd_dst_ = sp_full_x $sd_dst; 
    sd_ri_n_src_e_dst_  $sd_src_  $sd_dst_ 
}



function test_bbbb {
    $sd_src_root = "_mock\sd_a"
    $sd_dst_root = "_mock\sd_b"

    sd_ri_n_src_e_dst   "_mock\sd_a"  "_mock\sd_b"
}

test_bbbb




<#

gci -file -r -n  > a.txt
gci -file -r -n  > b.txt
cpi -r  -fo _mock_save/*  _mock/


#>

