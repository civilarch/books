

function reg_list_val ( $rsd  ) {
    gci  -r  $rsd  -ea SilentlyContinue | % { $rkey = $_;
        $rkey.Property | ? { 
            oooi ">> $rkey :: $_" 
            $val = gpv  "Registry::$rkey"  $_
            if ($val) {
                oooi "    ====> $val" 
            }
        }
    }
}



function reg_list_val ( $rsd  ) {
    gci  -r  $rsd  -ea 0 | % { $rkey = $_;
        $rkey | Get-Member -MemberType Property | ? { 
            
            oooi ">> $rkey :: $_" 
            # $val = gpv  "Registry::$rkey"  $_
            # if ($val) {
                # oooi "    ====> $val" 
            # }
        }
    }
}




reg_list_val "HKLM:\SOFTWARE\Classes"

do_check_exit




<#

about_CommonParameters

Break   6
Suspend 5
Ignore  4
Inquire 3
Continue    2
Stop    1
SilentlyContinue    0

WhatIf (wi)
Confirm (cf)



#>




