# ---------------------------------------- 
# Title         : _temp/ps1/next_name.ps1
# powershell C:/_ext/_use/_temp/ps1/next_name.ps1
# ---------------------------------------- 

<#
C:/_win/tool/7z_cmds/make_7z_test.ps1 "C:\_usr\prg\AutoHotkey_code" "C:\_usr\prg\pwsh2"

gci -r -file | sort LastWriteTime | %{ $_, $_.LastWriteTime }
#>

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: environments

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: mock
# ---------------------------------------- Constants

function get_next_sp($sp) {
    $sp_next = ''

    $sp   = $sp -replace '\\\\?', '/'
    $sd   = $sp -replace '[\\/][^\\/]*$'
    $sfn  = $sp -replace '^.*[\\/]'
    # ---------------------------------------- Prerequiste
    # ---------------------------------------- Variables
    pushd $sd
    ooiie  "`$pwd     : $($pwd) ";

    oo_vars  sp  sd  sfn  
    # ---------------------------------------- Preparation
    $sf_last = gci  ${sfn}_[0-9][0-9]* | sort Name | select -last 1 

    $sf   = $sf_last -replace '\\\\?', '/'
    $sfn  = $sf -replace '^.*[\\/]'
    $sfnb  = $sfn -replace '\.[^.]*$'
    $sExt  = $sfn -replace '^.*(?=\.)'
    
    oo_vars  sf   sfn   sfnb  sExt

    # ------------------ 
    $sfnb -match '(.+?)_?(\d\d*)$'

    $sFront, $sNum = $Matches[1], $Matches[2] 
    $sNum_next = '{0:d2}' -f ([int]$sNum + 1)
    oo_vars  sFront   sNum   sNum_next  

    "${sFront}_${sNum_next}${sExt}"
}


$arg = 'C:/_usr/prg/AutoHotkey_code'

$sp_next = (get_next_sp  $arg)

oo_vars  sp_next


# ---------------------------------------- Check
 # oo_vars  sd_sys sd_new      
 # ooiie  "ni_i_SymbolicLink  $sd_sys  _pos"    

# '';wrh -n'    -- Continue ? (Y,n)';$ans=Read-Host;if($ans -eq 'n'){exit}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ---------------------------------------- run

# gci  ${sfn}_[0-9][0-9]* | sort LastWriteTime | select -first 1



# ---------------------------------------- Post process
popd

# ---------------------------------------- Post Check

# '';wrh -n'    -- Continue ? (Y,n)';$ans=Read-Host;if($ans -eq 'n'){exit}
# "`n"*7;
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: test


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



<#
 gci -r -file | sort LastWriteTime | %{ $_, $_.LastWriteTime }

#>