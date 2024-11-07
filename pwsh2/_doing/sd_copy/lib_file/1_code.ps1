
# ---------------------------------------- 
. ./lib_a_1.ps1
. ./lib_a_2.ps1
# ---------------------------------------- 
# ---------------------------------------- 
#. ./1_code.ps1
#. ./1_code_00_debug.ps1
# ---------------------------------------- 

function sd_update_a ($sp_src, $sp_dst) {
     = Test-Path ;  = Test-Path 
    if (!) { return 0 }
    if () { 
         = (gi ).LastWriteTime;  = (gi ).LastWriteTime
        if ( -le ) { return 0 }
    }
    return 1
}



can_update  _test/a/aaa.txt  _test/b/aaa.txt
can_update   _test/b/aaa_new.txt  _test/a/aaa.txt 
can_update  _test/a/aaa.txt  _test/b/no_exist.txt


