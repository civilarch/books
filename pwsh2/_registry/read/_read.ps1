

$cnt = 0

function reg_list_val ( $rsd  ) {
    gci  -r  $rsd  -ea 0 | % { $rkey = $_;
        $rkey | Get-Member -MemberType Property | ? { if (++$cnt -eq 20) { exit }
            
            oooi " $cnt >> $rkey :: $_" 
        }
    }
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function reg_list_val ( $rsd  ) {
    gci  -r  $rsd  -ea 0 | % { $rkey = $_;
        
        $okey = (gi "Registry::$rkey" )
        
        $rkey | Get-Member -MemberType Property | % { if (++$cnt -eq 3) { exit }
            $prop = $_
            ooie  "Property :: $_"
                
            $val = $okey.GetValue($prop, $null)
            oooi " $cnt >> $rkey :: $prop :: $val" 

        }
    }
}




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 




reg_list_val "HKLM:\SOFTWARE\Classes"

do_check_exit



















































