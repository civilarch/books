# ---------------------------------------- 
# Title         : _temp/ps1/next_name.ps1
# powershell C:/_ext/_use/_temp/ps1/next_name.ps1
# ---------------------------------------- 

<#
C:/_win/tool/7z_cmds/make_7z_test.ps1 "C:\_usr\prg\AutoHotkey_code" "C:\_usr\prg\pwsh2"

gci -r -file | sort LastWriteTime | %{ $_, $_.LastWriteTime }
#>

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: environments
# $sd, $sfn, $sfnb, $sExt = sp_split  'C:/_var/code'  
# oo_vars   sd  sfn  sfnb  sExt

function sp_split($sp) {
    $sp   = $sp  -replace  '\\\\?', '/'
    $sd   = $sp  -replace  '[\\/][^\\/]*$'
    $sfn  = $sp  -replace  '^.*[\\/]'
    $sfnb = $sfn -replace  '\.[^.]*$'
    $sExt = $sfn -replace  '^.*(?=\.?)'
    # ---------------------------------------- 
    $sd, $sfn, $sfnb, $sExt
}

    # $sp_last = get_sp_last  $sp  $sExt
    
function get_sp_last($sp, $sExt='.7z') {
    $sp   = $sp -replace '\\\\?', '/'
    $sd, $sfn, $__ = sp_split $sp 
    
    pushd $sd
    $sp_last = gci ${sfn}_[0-9][0-9]$sExt | sort Name | select -last 1 
    popd
    
    if (! $sp_last) { return "" }
    
    $sp_last.FullName
}


# $sp_next =  get_next_sp  'C:/_usr/prg/AutoHotkey_code'

function get_next_sp($sp, $sExt='.7z') {
    $sp   = $sp -replace '\\\\?', '/'
    $sd, $sfn, $__ = sp_split($sp)

    $sp_last = get_sp_last  $sp  $sExt
    
    if (! $sp_last) {
        return "$sd/${sfnb}_01${sExt}"
    }

    $sf_C   = $sp_last -replace '\\\\?', '/'
    $sd_C, $sfn_C, $sfnb_C, $__ = sp_split($sf_C)
    
    if ($sfnb_C -match '(.+?)_?(\d\d*)$') {
        $sFront, $sNum = $Matches[1], $Matches[2] 
        $sNum_next = '{0:d2}' -f ([int]$sNum + 1)
        return "$sd/${sFront}_${sNum_next}${sExt}"
    }
}



$sp_next =  get_next_sp  'C:/_usr/prg/AutoHotkey_code'

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