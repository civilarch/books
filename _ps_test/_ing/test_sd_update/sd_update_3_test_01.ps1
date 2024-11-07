
# ---------------------------------------- 
. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. sd_update_2_code_Dev.ps1
#. sd_update_1_code_Release.ps1
# ---------------------------------------- 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


function sd_sync_with_hash_o($od_src, $od_dst) {

    [HashSet[string]] $a_hsf = ($a_ofs = gci -file $od_src)|% name
    [HashSet[string]] $b_hsf = ($b_ofs = gci -file $od_dst)|% name
    [Dictionary[string, object]] $a_dof = @{}; $a_ofs | % { $a_dof.Add($_.name, $_) }
    [Dictionary[string, object]] $b_dof = @{}; $b_ofs | % { $b_dof.Add($_.name, $_) }
    ($f_e_a_n_b = [HashSet[string]]::new($a_hsf)).Exceptwith($b_hsf)
    ($f_n_a_e_b = [HashSet[string]]::new($b_hsf)).Exceptwith($a_hsf)
    ($f_e_a_e_b = [HashSet[string]]::new($a_hsf)).IntersectWith($b_hsf)
    
    [HashSet[string]] $a_hsd = ($a_ods = gci -dir $od_src)|% name
    [HashSet[string]] $b_hsd = ($b_ods = gci -dir $od_dst)|% name
    [Dictionary[string, object]] $a_dod = @{}; $a_ods | % { $a_dod.Add($_.name, $_) }
    [Dictionary[string, object]] $b_dod = @{}; $b_ods | % { $b_dod.Add($_.name, $_) }
    ($d_e_a_n_b = [HashSet[string]]::new($a_hsd)).Exceptwith($b_hsd)
    ($d_n_a_e_b = [HashSet[string]]::new($b_hsd)).Exceptwith($a_hsd)
    ($d_e_a_e_b = [HashSet[string]]::new($a_hsd)).IntersectWith($b_hsd)
    # -------------------------------------------------
    
    # -------------------------------------------------
    $f_e_a_n_b | % { cpi  $a_dof[$_]  $b_dof[$_] }
    $f_n_a_e_b | % { cpi  $b_dof[$_]  $a_dof[$_] }
    $f_e_a_e_b | % { of_sync  $a_dof[$_]  $b_dof[$_] }
    
    # $a_hsf.Clear(); $a_ofs.Clear(); $b_hsf.Clear(); $b_ofs.Clear(); $a_dof.Clear(); $b_dof.Clear(); 
    # $f_e_a_n_b.Clear(); $f_n_a_e_b.Clear(); $f_e_a_e_b.Clear();     

    $d_e_a_n_b | % { cpi -r  $a_dod[$_].fullname  $od_dst }
    $d_n_a_e_b | % { cpi -r  $b_dod[$_].fullname  $od_src }

    # $a_hsd.Clear(); $a_ods.Clear(); $b_hsd.Clear(); $b_ods.Clear(); 
    # $d_e_a_n_b.Clear(); $d_n_a_e_b.Clear(); 
    
    # $a_dod.Clear(); $b_dod.Clear();  $d_e_a_e_b.Clear();

    # -------------------------------------------------
    $d_e_a_e_b | % { 
        
        # $_
        
        # $a_ = $a_dod[$_]
        # $b_ = $b_dod[$_]
        
        # $a_.fullname
        # $b_.fullname
        
        # oo_vars  a_  b_  
    
    
        # sd_sync_with_hash_o  $a_dod[$_]  $b_dod[$_] 
    }
    
    
    
    # $d_e_a_e_b | % { sd_sync_with_hash_o  $a_dod[$_]  $b_dod[$_] }
    
}


# $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
# $od_src, $od_dst = (gi "$sd_a"), (gi "$sd_b")




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# __prepare


function do_sd_sync_with_hash_o ( ) {
    $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
    # sd_ri_n_src_e_dst       (sp_full_x $sd_a)  (sp_full_x $sd_b)
    # sd_sync_with_hash_o   (gi $sd_a)  (gi $sd_b)
    
    $od_a = (gi "C:\_usr\prg\pwsh_test\_ing\test_sd_update\_mock\sd_a\sd_1_2")
    $od_b = (gi "C:\_usr\prg\pwsh_test\_ing\test_sd_update\_mock\sd_b\sd_1_2")
    
    sd_sync_with_hash_o   ($od_a)  ($od_b)
    
    
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

