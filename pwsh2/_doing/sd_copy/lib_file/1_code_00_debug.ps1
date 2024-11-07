
# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
# ---------------------------------------- 
# ---------------------------------------- 
#. ./1_code.ps1
#. ./1_code_00_debug.ps1
# ---------------------------------------- 


function lib_file (, ) {

     = Test-Path ;  = Test-Path 

    if (!) { return 0 }

    if () { 

        oo_vars e_src sf_src e_Dst sf_Dst

         = (gi ).LastWriteTime;  = (gi ).LastWriteTime
        
        oo_vars t_src t_dst  
        
        if ( -le ) { return 0 }

    }

    return 1
}



can_update  _test/a/aaa.txt  _test/b/aaa.txt
can_update   _test/b/aaa_new.txt  _test/a/aaa.txt 

can_update  _test/a/aaa.txt  _test/b/no_exist.txt

