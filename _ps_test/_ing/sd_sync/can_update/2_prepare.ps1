
# ---------------------------------------- 
# . ./1_code.ps1
# . ./2_prepare.ps1
# . ./3_run_test.ps1
# . ./5_post_process.ps1
# ---------------------------------------- 


function __prepare {
    ni -i d _test
    ni -i d _test/a
    ni -i d _test/b

    ni  _test/a/aaa.txt
    ni  _test/b/aaa.txt
}

function __prepare_b {
    ni  _test/b/aaa_new.txt
}


function __setup_mock {
    
}


__prepare; sleep 1; __prepare_b;

__setup_mock

