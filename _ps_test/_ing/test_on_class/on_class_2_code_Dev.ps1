
# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. on_class_2_code_Dev.ps1
#. on_class_1_code_Release.ps1
# ---------------------------------------- 


function on_class ($sf_src, $sf_dst) {

    $e_src = Test-Path $sf_src; $e_Dst = Test-Path $sf_Dst

    if (!$e_src) { return 0 }

    if ($e_Dst) { 

        oo_vars e_src sf_src e_Dst sf_Dst

        $t_src = (gi $sf_src).LastWriteTime; $t_dst = (gi $sf_dst).LastWriteTime
        
        oo_vars t_src t_dst  
        
        if ($t_src -le $t_dst) { return 0 }

    }

    return 1
}


<#

$sf_src = "aaaa" 
$sf_dst = "bbbb"
$sn_subj  $sf_src  $sf_dst

#>


