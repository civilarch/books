
using namespace System.Collections.Generic

# ---------------------------------------- 
. ./lib_a_1.ps1
# ---------------------------------------- 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$global:__ns = 0; $global:__nocheck = 0
Set-Alias oo oooo
Set-Alias os ooiie
Set-Alias ov oo_vars

function sd_sync_with_hash_o($od_src, $od_dst) {
    os $od_src.fullname
    os $od_dst.fullname
    $od_old = Get-Location; Set-Location $od_src
    
    if(1){
        $a_hsf, $a_dof = get_set_dict_gci $od_src '-file'
        $b_hsf, $b_dof = get_set_dict_gci $od_dst '-file' 
        
        ($f_e_a_n_b = [HashSet[string]]::new($a_hsf)).Exceptwith($b_hsf)
        ($f_n_a_e_b = [HashSet[string]]::new($b_hsf)).Exceptwith($a_hsf)
        ($f_e_a_e_b = [HashSet[string]]::new($a_hsf)).IntersectWith($b_hsf)
        
        $f_e_a_n_b | % { cpi  $a_dof[$_].fullname  $od_dst }
        $f_n_a_e_b | % { cpi  $b_dof[$_].fullname  $od_src }
        $f_e_a_e_b | % { of_sync  $a_dof[$_]  $b_dof[$_] }
    }
    
    # $d_e_a_e_b = @()
    
    if (0) {
        $a_hsd, $a_dod = get_set_dict_gci $od_src '-dir'
        $b_hsd, $b_dod = get_set_dict_gci $od_dst '-dir' 
        
        ($d_e_a_n_b = [HashSet[string]]::new($a_hsd)).Exceptwith($b_hsd)
        ($d_n_a_e_b = [HashSet[string]]::new($b_hsd)).Exceptwith($a_hsd)
        
        ($d_e_a_e_b = [HashSet[string]]::new($a_hsd)).IntersectWith($b_hsd)

        $d_e_a_n_b | % { cpi -r  $a_dod[$_].fullname  $od_dst }
        $d_n_a_e_b | % { cpi -r  $b_dod[$_].fullname  $od_src }
    }

    # -------------------------------------------------
    
    # -------------------------------------------------
    if (0) {
        $d_e_a_e_b | % { 
            
            $od_a = (gi ($od_src.fullname + "\" + $_))
            $od_b = (gi ($od_dst.fullname + "\" + $_))
            
            oo_vars od_a od_b
            
            # sd_sync_with_hash_o  $a_dod[$_]  $b_dod[$_] 
        
        }
    }
    
    Set-Location $od_old
}


# $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
# $od_src, $od_dst = (gi "$sd_a"), (gi "$sd_b")




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# __prepare


function do_sd_sync_with_hash_o ( ) {
    $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
    # sd_ri_n_src_e_dst       (sp_full_x $sd_a)  (sp_full_x $sd_b)
    sd_sync_with_hash_o   (gi $sd_a)  (gi $sd_b)
    
    # $od_a = (gi "C:\_usr\prg\pwsh_test\_ing\test_sd_update\_mock\sd_a\sd_1_2")
    # $od_b = (gi "C:\_usr\prg\pwsh_test\_ing\test_sd_update\_mock\sd_b\sd_1_2")
    # sd_sync_with_hash_o   ($od_a)  ($od_b)
}


ri  -r  -fo _mock/*; cpi -r  -fo _mock_save/*  _mock/
gci -file -r -n _mock/sd_a > _mock/org_sd_a.txt
gci -file -r -n _mock/sd_b > _mock/org_sd_b.txt

# sd_update_ps

do_sd_sync_with_hash_o


gci -file -r -n _mock/sd_a > _mock/rsl_sd_a.txt
gci -file -r -n _mock/sd_b > _mock/rsl_sd_b.txt


<#

sd_update_3_test.ps1


#>

