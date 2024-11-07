

# ---------------------------------------- 
# . ./1_code.ps1
# . ./2_prepare.ps1
# . ./3_run_test.ps1
# . ./5_post_process.ps1
# ---------------------------------------- 


function __mock_a {
    ni -i d _mock
    ni -i d _mock/a
    ni -i d _mock/b

    ni  _mock/a/aaa.txt
    ni  _mock/b/aaa.txt
}

function __mock_b {
    ni  _mock/b/aaa_new.txt
}


function __prepare {
    ni  _mock/b/aaa_new.txt
}



__mock_a; sleep 1; __mock_b;
__prepare


