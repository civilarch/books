 
# ---------------------------------------- $sf_self
$sd_pwsh5 = "C:/Windows/System32/WindowsPowerShell/v1.0" 
$sf_self  = sp_posix $PSCommandPath
$sd_pwd   = sp_par $sf_self

Set-Location $sd_pwd 
oo_vars sf_self sd_pwd  
# ---------------------------------------- 

# ---------------------------------------- powershell to pwsh
$sdFr = "C:/Windows/System32/WindowsPowerShell/v1.0" 
# $sdTo = "powershell"

cpi -fo -v $sdFr/_ps_helper* powershell/
cpi -fo -v $sdFr/_ps_helper* pwsh/

# ---------------------------------------- 
do_check_exit
