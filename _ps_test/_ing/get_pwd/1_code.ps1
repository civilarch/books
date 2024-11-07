
function get_pwd (, ) {
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


