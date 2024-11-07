
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


<#

gci -file -r -n  > a.txt
gci -file -r -n  > b.txt
cpi -r  -fo _mock_save/*  _mock/




#>