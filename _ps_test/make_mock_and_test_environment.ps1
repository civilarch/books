#! pwsh
# ---------------------------------------- 
# Title         : tools/pwsh_test/make_mock_and_test_environment.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240518_083623
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh_test/make_mock_and_test_environment.ps1
# ---------------------------------------- 
 


function make_mock_and_test_environment ($sn_subj, $sPrefix="test_", $sd_cur="."){
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
    $sdn_mod = "$sPrefix$sn_subj"
    
    # ni -i d  $sd_cur
    Set-Location $sd_cur
    
    ni -i d  $sdn_mod
    # ---------------------------------------- 

# ****************************************************** 
    Set-Content $sdn_mod/${sn_subj}_9_prepare.ps1 @"


`$sn_subj = "$sn_subj"

# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. ${sn_subj}_2_code_Dev.ps1
#. ${sn_subj}_1_code_Release.ps1
# ---------------------------------------- 

function mock_a {
    ni -i d _mock
    ni -i d _mock/a
    ni -i d _mock/b

    ni  _mock/a/aaa.txt
    ni  _mock/b/aaa.txt
}

function mock_b {
    ni  _mock/b/aaa_new.txt
}


function __prepare {
    ni  _mock/b/aaa_new.txt
}



mock_a; sleep 1; mock_b;
__prepare


"@



# ****************************************************** 
    Set-Content $sdn_mod/${sn_subj}_1_code_Release.ps1 @"

# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. ${sn_subj}_2_code_Dev.ps1
#. ${sn_subj}_1_code_Release.ps1
# ---------------------------------------- 

function $sn_subj (`$sf_src, `$sf_dst) {
    `$e_src = Test-Path `$sf_src; `$e_Dst = Test-Path `$sf_Dst
    if (!`$e_src) { return 0 }
    if (`$e_Dst) { 
        `$t_src = (gi `$sf_src).LastWriteTime; `$t_dst = (gi `$sf_dst).LastWriteTime
        if (`$t_src -le `$t_dst) { return 0 }
    }
    return 1
}


<#

`$sf_src = "aaaa" 
`$sf_dst = "bbbb"
`$sn_subj  `$sf_src  `$sf_dst

#>

"@



# ****************************************************** 
    Set-Content $sdn_mod/${sn_subj}_2_code_Dev.ps1 @"

# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. ${sn_subj}_2_code_Dev.ps1
#. ${sn_subj}_1_code_Release.ps1
# ---------------------------------------- 


function $sn_subj (`$sf_src, `$sf_dst) {

    `$e_src = Test-Path `$sf_src; `$e_Dst = Test-Path `$sf_Dst

    if (!`$e_src) { return 0 }

    if (`$e_Dst) { 

        oo_vars e_src sf_src e_Dst sf_Dst

        `$t_src = (gi `$sf_src).LastWriteTime; `$t_dst = (gi `$sf_dst).LastWriteTime
        
        oo_vars t_src t_dst  
        
        if (`$t_src -le `$t_dst) { return 0 }

    }

    return 1
}


<#

`$sf_src = "aaaa" 
`$sf_dst = "bbbb"
`$sn_subj  `$sf_src  `$sf_dst

#>


"@




# ****************************************************** 
    Set-Content $sdn_mod/${sn_subj}_3_test.ps1 @"

# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. ${sn_subj}_2_code_Dev.ps1
#. ${sn_subj}_1_code_Release.ps1
# ---------------------------------------- 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# __prepare

function test_${sn_subj} {
    # can_update  _test/a/aaa.txt  _test/b/aaa.txt
}

test_${sn_subj}

"@


# ****************************************************** 
    Set-Content $sdn_mod/${sn_subj}_5_post_process.ps1 @"

# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
# ---------------------------------------- 
# ---------------------------------------- 
#. ./1_code.ps1
#. ./1_code_00_debug.ps1
# ---------------------------------------- 


function __post_process {
    
}


__post_process


"@


# ****************************************************** 
    Set-Content $sdn_mod/${sn_subj}_7_code_hut.ps1 @"

# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
# ---------------------------------------- 
# ---------------------------------------- 
#. ./1_code.ps1
#. ./1_code_00_debug.ps1
# ---------------------------------------- 


function __post_process {
    
}


__post_process


"@



# ****************************************************** 
    Set-Content $sdn_mod/lib_a_1.ps1 @"



"@


# ****************************************************** 
    Set-Content $sdn_mod/lib_a_2.ps1 @"

# ---------------------------------------- 
. ./lib_a_1.ps1
# ---------------------------------------- 



"@


# ****************************************************** 
    Set-Content $sdn_mod/lib_a_hut.ps1 @"

# ---------------------------------------- 
. ./lib_a_1.ps1
# ---------------------------------------- 



"@




# ****************************************************** 
    Set-Content $sdn_mod/lib_b_1.ps1 @"



"@


# ****************************************************** 
    Set-Content $sdn_mod/lib_b_2.ps1 @"

# ---------------------------------------- 
. ./lib_b_1.ps1
# ---------------------------------------- 



"@



# ****************************************************** 
    Set-Content $sdn_mod/lib_b_hut.ps1 @"

# ---------------------------------------- 
. ./lib_b_1.ps1
# ---------------------------------------- 



"@


# ****************************************************** 
    Set-Content $sdn_mod/lib_test.ps1 @"

# ---------------------------------------- 
# . ./lib_a_1.ps1
# ---------------------------------------- 



"@

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
}


function make_mock_and_test_environment_ui ($sd_cur){
    # Set-Location $sd_cur 
    $sd_cur = sp_full_x $sd_cur
    # ---------------------------------------- $sn_subj
    $sn_subj = Get-Clipboard
    if (($sn_subj -notmatch '^\w+$')) { $sn_subj = "aaaa" }
    
    ''; 
    "    $('-'*50)"; 
    oooo    "      `$sn_subj : $sn_subj"; 
    ooin "  `$sn_subj : "; $ans = Read-Host; if($ans) {$sn_subj = $ans}
    "    $('-'*50)";
    "      `$sn_subj : $sn_subj"
    "    $('-'*30)";
    ooin '  -- Continue ? (Y,n)';$ans=Read-Host;if($ans -eq 'n'){exit}
    # ---------------------------------------- 
    $sPrefix = "test_"
    $sd_mod = "$sd_cur/$sPrefix$sn_subj"
    oo_vars sn_subj sPrefix sd_cur sd_mod
    do_check_Continue
    
    make_mock_and_test_environment  $sn_subj  $sPrefix  $sd_cur
    
    # ---------------------------------------- 
    explorer   (sp_win "$sd_mod")
    $sf_wt   = "$Env:LOCALAPPDATA/Microsoft/WindowsApps/wt.exe"
    # . $sf_wt -d  "$sd_mod"  powershell
    
    & $gexe_Sublime "$sd_mod"

}


<#
    # ---------------------------------------- $sf_self
    $sf_self  = sp_posix $PSCommandPath
    $sd_pwd   = sp_par $sf_self
    Set-Location $sd_pwd 
    oo_vars sf_self sd_pwd  
    
    make_mock_and_test_environment_ui  $sd_pwd
    
#>


make_mock_and_test_environment_ui  $args[0]




<#

C:/_etc/win/ps1/pwsh2/bin/make_mock_and_test_environment.ps1   y:/ss/dd
 


#>