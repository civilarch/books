

function can_update($sf_src, $sf_dst) {


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



can_update  _test/a/aaa.txt  _test/b/aaa.txt
can_update   _test/b/aaa_new.txt  _test/a/aaa.txt 

can_update  _test/a/aaa.txt  _test/b/no_exist.txt
