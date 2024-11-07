
# ---------------------------------------- 
. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. sd_update_2_code_Dev.ps1
#. sd_update_1_code_Release.ps1
# ---------------------------------------- 

using namespace System.Collections.Generic


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function sd_ri_n_src_e_dst($sd_src, $sd_dst) {
    $od_old = Get-Location; Set-Location $sd_dst
    gci -file -n | % {
        if(!(Test-Path "$sd_src/$_")) { 
            # ri -r -fo $_ 
            oooo "RI file >> $sd_dst/$_"
        }
    }

    gci -dir -n | % {
        $sd_src_ = "$sd_src/$_"; $sd_dst_ = "$sd_dst/$_"
        if(!(Test-Path "$sd_src_")) { 
            # ri -r -fo $_ 
            oooo "RI Dir >> $sd_dst_/$_"
        } else {
            sd_ri_n_src_e_dst    $sd_src_   $sd_dst_ 
        }
    }
    
    Set-Location $od_old
}


function sd_update_e_src_a_dst($sd_src, $sd_dst) {
    
    $od_old = Get-Location; Set-Location $sd_src
    
    gci -file -n | % {
        # oooi "sf_update  $sd_src/$_  $sd_dst/$_"
        sf_update  "$sd_src/$_"  "$sd_dst/$_"
    }

    gci -dir -n | % {
        $sd_a = "$sd_src/$_"; $sd_b = "$sd_dst/$_"; 
        
        if(Test-Path $sd_b) { 
            # oo_vars  sd_a  sd_b
            # oooi "sd_update_e_src_a_dst  $sd_a  $sd_b"
            sd_update_e_src_a_dst  $sd_a  $sd_b
        } else {
            oooi "sd_copy  $sd_a  $sd_b"
            sd_copy  $sd_a  $sd_b
        }
    }

    Set-Location $od_old
}





    
function sd_sync_with_hash($sd_src, $sd_dst) {
    
    $od_old = Get-Location; Set-Location $sd_src
    
    gci -file -n | % {
        # oooi "sf_update  $sd_src/$_  $sd_dst/$_"
        sf_update  "$sd_src/$_"  "$sd_dst/$_"
    }

    gci -dir -n | % {
        $sd_a = "$sd_src/$_"; $sd_b = "$sd_dst/$_"; 
        
        if(Test-Path $sd_b) { 
            # oo_vars  sd_a  sd_b
            # oooi "sd_update_e_src_a_dst  $sd_a  $sd_b"
            sd_update_e_src_a_dst  $sd_a  $sd_b
        } else {
            oooi "sd_copy  $sd_a  $sd_b"
            sd_copy  $sd_a  $sd_b
        }
    }

    Set-Location $od_old
}




function arr_sf_copy_to_dir($arr_sf, $sd_dst) {
    $arr_sf | % { cpi  $_  $sd_dst }
}
    
function sd_sync_with_hash($sd_src, $sd_dst) {
    
    $a_dof = [Dictionary[string,object]]::new()
    $a_dod = [Dictionary[string,object]]::new()
    
    $b_dof = [Dictionary[string,object]]::new()
    $b_dod = [Dictionary[string,object]]::new()
    
    gci -file $sd_src | % { $a_dof.Add($_.fullname, $_) }
    gci -dir  $sd_src | % { $a_dod.Add($_.fullname, $_) }
    
    gci -file $sd_dst | % { $b_dof.Add($_.fullname, $_) }
    gci -dir  $sd_dst | % { $b_dod.Add($_.fullname, $_) }
    
    $f_e_a_n_b = [Dictionary[string,object]]::new($a_dof).Exceptwith($b_dof)
    $f_n_a_e_b = [Dictionary[string,object]]::new($b_dof).Exceptwith($a_dof)
    $f_e_a_e_b = [Dictionary[string,object]]::new($a_dof).Exceptwith($f_e_a_n_b)
    $f_pairs_ee = $f_e_a_e_b.values | % { ,@($_, (gi "$sd_dst/$_.name")) }
    
    $d_e_a_n_b = [Dictionary[string,object]]::new($a_dod).Exceptwith($b_dod)
    $d_n_a_e_b = [Dictionary[string,object]]::new($b_dod).Exceptwith($a_dod)
    $d_e_a_e_b = [Dictionary[string,object]]::new($a_dod).Exceptwith($d_e_a_n_b)
    $d_pairs_ee = $d_e_a_e_b.values | % { ,@($_, (gi "$sd_dst/$_.name")) }
    
    # -------------------------------------------------
    $f_e_a_n_b.values | % { cpi  $_  $sd_dst }
    $f_n_a_e_b.values | % { cpi  $_  $sd_src }
    $f_pairs_ee | % { of_sync  $_[0]  $_[1] }
    
    $d_e_a_n_b.values | % { cpi -r  $_  $sd_dst }
    $d_n_a_e_b.values | % { cpi -r  $_  $sd_src }
    # -------------------------------------------------
    $f_e_a_n_b.Clear(); $f_n_a_e_b.Clear(); $f_e_a_e_b.Clear(); $f_pairs_ee.Clear()
    $d_e_a_n_b.Clear(); $d_n_a_e_b.Clear(); $d_e_a_e_b.Clear()
    
    # -------------------------------------------------
    $d_pairs_ee | % { of_sync  $_[0].fullname  $_[1].fullname }
    
}




function sd_sync_with_hash_o($od_src, $od_dst) {
    
    $a_dof = [Dictionary[string,object]]::new()
    $a_dod = [Dictionary[string,object]]::new()
    
    $b_dof = [Dictionary[string,object]]::new()
    $b_dod = [Dictionary[string,object]]::new()
    
    gci -file $sd_src | % { $a_dof.Add($_.fullname, $_) }
    gci -dir  $sd_src | % { $a_dod.Add($_.fullname, $_) }
    
    gci -file $sd_dst | % { $b_dof.Add($_.fullname, $_) }
    gci -dir  $sd_dst | % { $b_dod.Add($_.fullname, $_) }
    
    $f_e_a_n_b = [Dictionary[string,object]]::new($a_dof).Exceptwith($b_dof)
    $f_n_a_e_b = [Dictionary[string,object]]::new($b_dof).Exceptwith($a_dof)
    $f_e_a_e_b = [Dictionary[string,object]]::new($a_dof).Exceptwith($f_e_a_n_b)
    $f_pairs_ee = $f_e_a_e_b.values | % { ,@($_, (gi "$sd_dst/$_.name")) }
    
    $d_e_a_n_b = [Dictionary[string,object]]::new($a_dod).Exceptwith($b_dod)
    $d_n_a_e_b = [Dictionary[string,object]]::new($b_dod).Exceptwith($a_dod)
    $d_e_a_e_b = [Dictionary[string,object]]::new($a_dod).Exceptwith($d_e_a_n_b)
    $d_pairs_ee = $d_e_a_e_b.values | % { ,@($_, (gi "$sd_dst/$_.name")) }
    
    # -------------------------------------------------
    $f_e_a_n_b.values | % { cpi  $_  $sd_dst }
    $f_n_a_e_b.values | % { cpi  $_  $sd_src }
    $f_pairs_ee | % { of_sync  $_[0]  $_[1] }
    
    $d_e_a_n_b.values | % { cpi -r  $_  $sd_dst }
    $d_n_a_e_b.values | % { cpi -r  $_  $sd_src }
    # -------------------------------------------------
    $f_e_a_n_b.Clear(); $f_n_a_e_b.Clear(); $f_e_a_e_b.Clear(); $f_pairs_ee.Clear()
    $d_e_a_n_b.Clear(); $d_n_a_e_b.Clear(); $d_e_a_e_b.Clear()
    
    # -------------------------------------------------
    $d_pairs_ee | % { of_sync  $_[0].fullname  $_[1].fullname }
    
}








# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# __prepare

function sd_sync_with_hash_ps ( ) {
    $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
    sd_update_e_src_a_dst   (sp_full_x $sd_a)  (sp_full_x $sd_b)
    sd_update_e_src_a_dst   (sp_full_x $sd_b)  (sp_full_x $sd_a)
}

function sd_sync_ps ( ) {
    $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
    sd_update_e_src_a_dst   (sp_full_x $sd_a)  (sp_full_x $sd_b)
    sd_update_e_src_a_dst   (sp_full_x $sd_b)  (sp_full_x $sd_a)
}


function sd_update_purge_ps ( ) {
    $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
    sd_ri_n_src_e_dst       (sp_full_x $sd_a)  (sp_full_x $sd_b)
    sd_update_e_src_a_dst   (sp_full_x $sd_a)  (sp_full_x $sd_b)
}


function sd_update_ps ( ) {
    $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
    # sd_ri_n_src_e_dst       (sp_full_x $sd_a)  (sp_full_x $sd_b)
    sd_update_e_src_a_dst   (sp_full_x $sd_a)  (sp_full_x $sd_b)
}


ri  -r  -fo _mock/*; cpi -r  -fo _mock_save/*  _mock/
gci -file -r -n _mock/sd_a > _mock/org_sd_a.txt
gci -file -r -n _mock/sd_b > _mock/org_sd_b.txt
sd_update_ps
gci -file -r -n _mock/sd_a > _mock/rsl_sd_a.txt
gci -file -r -n _mock/sd_b > _mock/rsl_sd_b.txt


<#

sd_update_3_test.ps1


#>

