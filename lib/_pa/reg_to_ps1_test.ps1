

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# ---------------------------------------- $sf_self
$sf_self  = sp_posix $PSCommandPath 
$sd_pwd   = pop_slash(sp_posix $PSScriptRoot)
oo_vars sf_self sd_pwd  
Set-Location (sp_posix $PSScriptRoot)
# ---------------------------------------- 

# ---------------------------------------- Prerequiste
    
# ---------------------------------------- Variables
# ---------------------------------------- Preparation
# ---------------------------------------- Check
# oo_vars  sd_sys sd_new      
# ooiie  "ni_i_SymbolicLink  $sd_sys  _pos"    

# __Chect_continue__ 5
# ---------------------------------------- run

. "C:\_etc\win\ps1\lib\reg_to_ps1.ps1"


for ($i=0; $i -lt $args.count; $i++) {
    $sf_reg = $args[$i]
    echo $sf_reg
    
    
    sure_exist $sf_reg 

    $sd, $sfn, $sfnb, $sExt = sp_split ( sp_full $sf_reg )

    $sf_out = "${sd}/${sfnb}_reg.ps1"
    
    oo_vars sd sfn sfnb
    
    $text_reg = gc $sf_reg
    
    
    
    
    $text_ps = reg_to_ps  $text_reg 
    
    $text_ps
}


    # do_check_Continue

    # $Commands | out-file -FilePath $sf_out -encoding $encoding

# ---------------------------------------- Post process
# ---------------------------------------- Post Check
# do_check_exit
# "`n"*7;

# $od_old = Get-Location; Set-Location $sd_dst
# Set-Location $od_old

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
echo ''; oooi "$(':'*50)";
Sleep -m 200; $nSec = [int]$env:PSRUNWAIT; Sleep -m 200
# __Chect_out__  $nSec
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# exit



