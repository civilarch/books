
function can_update($sf_src, $sf_dst) {
    $e_src = Test-Path $sf_src; $e_Dst = Test-Path $sf_Dst
    if (!$e_src) { return 0 }
    if ($e_Dst) { 
        $t_src = (gi $sf_src).LastWriteTime; $t_dst = (gi $sf_dst).LastWriteTime
        if ($t_src -le $t_dst) { return 0 }
    }
    return 1
}


# ------------------ 2

function __prepare {
    ni -i d _test
    ni -i d _test/a
    ni -i d _test/b

    ni  _test/a/aaa.txt
    ni  _test/b/aaa.txt
    
}

function __setup_mock {
    
}


function __test {
    
    can_update  _test/a/aaa.txt  _test/b/aaa.txt
    
}


function __post_process {
    
}



# __prepare
__test

# ------------------ 3






# ------------------ 4






# ------------------ 5





