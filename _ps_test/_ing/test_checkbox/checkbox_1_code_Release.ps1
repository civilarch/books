
# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. checkbox_2_code_Dev.ps1
#. checkbox_1_code_Release.ps1
# ---------------------------------------- 

function checkbox ($sf_src, $sf_dst) {
    $e_src = Test-Path $sf_src; $e_Dst = Test-Path $sf_Dst
    if (!$e_src) { return 0 }
    if ($e_Dst) { 
        $t_src = (gi $sf_src).LastWriteTime; $t_dst = (gi $sf_dst).LastWriteTime
        if ($t_src -le $t_dst) { return 0 }
    }
    return 1
}


<#

$sf_src = "aaaa" 
$sf_dst = "bbbb"
$sn_subj  $sf_src  $sf_dst

#>

