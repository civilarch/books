

$sn_subj = "set"

# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. set_2_code_Dev.ps1
#. set_1_code_Release.ps1
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


