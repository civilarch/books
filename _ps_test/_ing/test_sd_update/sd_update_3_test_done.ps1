
using namespace System.Collections.Generic

# ---------------------------------------- 
. ./lib_a_1.ps1
# ---------------------------------------- 







# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$global:__ns = 1; $global:__nocheck = 0
Set-Alias oo oooo
Set-Alias os ooiie
Set-Alias ov oo_vars

function sd_sync_with_hash($sd_src, $sd_dst) {
    os $sd_src
    os $sd_dst
    $sd_old = Get-Location; Set-Location $sd_src
    
    if(1){
        $a_hsf, $a_dof = get_set_dict_gci $sd_src '-file'
        $b_hsf, $b_dof = get_set_dict_gci $sd_dst '-file' 
        
        # ov  a_hsf a_dof  b_hsf  b_dof
        
        ($f_e_a_n_b = [HashSet[string]]::new($a_hsf)).Exceptwith($b_hsf)
        ($f_n_a_e_b = [HashSet[string]]::new($b_hsf)).Exceptwith($a_hsf)
        ($f_e_a_e_b = [HashSet[string]]::new($a_hsf)).IntersectWith($b_hsf)
        
        # ov  f_e_a_n_b  f_n_a_e_b  f_e_a_e_b   
        
        $f_e_a_n_b | % { cpi  $a_dof[$_]  $sd_dst }
        $f_n_a_e_b | % { cpi  $b_dof[$_]  $sd_src }
        $f_e_a_e_b | % { of_sync  $a_dof[$_]  $b_dof[$_] }
    }
    
    # $d_e_a_e_b = @()
    
    if (1) {
        $a_hsd, $a_dod = get_set_dict_gci $sd_src '-dir'
        $b_hsd, $b_dod = get_set_dict_gci $sd_dst '-dir' 
        
        ov  a_hsd a_dod  b_hsd  b_dod
        
        ($d_e_a_n_b = [HashSet[string]]::new($a_hsd)).Exceptwith($b_hsd)
        ($d_n_a_e_b = [HashSet[string]]::new($b_hsd)).Exceptwith($a_hsd)
        ($d_e_a_e_b = [HashSet[string]]::new($a_hsd)).IntersectWith($b_hsd)

        ov  d_e_a_n_b  d_n_a_e_b  d_e_a_e_b   
        
        $d_e_a_n_b | % { cpi -r  $a_dod[$_]  $sd_dst }
        $d_n_a_e_b | % { cpi -r  $b_dod[$_]  $sd_src }
    }

    # -------------------------------------------------
    
    # -------------------------------------------------
    if (1) {
        $d_e_a_e_b | % { 
            
            $sd_a = $sd_src + "\" + $_
            $sd_b = $sd_dst + "\" + $_
            
            oo_vars sd_a sd_b
            
            sd_sync_with_hash  $a_dod[$_]  $b_dod[$_] 
        
        }
    }
    
    Set-Location $sd_old
}


# $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
# $sd_src, $sd_dst = (gi "$sd_a"), (gi "$sd_b")

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# __prepare


function do_sd_sync_with_hash ( ) {
    $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
    # sd_ri_n_src_e_dst       (sp_full_x $sd_a)  (sp_full_x $sd_b)
    sd_sync_with_hash   (gi $sd_a).fullname  (gi $sd_b).fullname
    
    # $sd_a = (gi "C:\_usr\prg\pwsh_test\_ing\test_sd_update\_mock\sd_a\sd_1_2")
    # $sd_b = (gi "C:\_usr\prg\pwsh_test\_ing\test_sd_update\_mock\sd_b\sd_1_2")
    # sd_sync_with_hash   ($sd_a)  ($sd_b)
}


 
# Set-Location (sp_posix $PSScriptRoot)

ri  -r  -fo _mock/*; cpi -r  -fo _mock_save/*  _mock/
gci -file -r -n _mock/sd_a > _mock/org_sd_a.txt
gci -file -r -n _mock/sd_b > _mock/org_sd_b.txt

# sd_update_ps

do_sd_sync_with_hash

gci -file -r -n _mock/sd_a > _mock/rsl_sd_a.txt
gci -file -r -n _mock/sd_b > _mock/rsl_sd_b.txt


<#

sd_update_3_test.ps1


#>

