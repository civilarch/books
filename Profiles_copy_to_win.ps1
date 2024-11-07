

# $env:PSRUNWAIT = 10


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



# ---------------------------------------- powershell to pwsh
$sdFr = "powershell"
$sdTo = "pwsh"

cpi -fo -v $sdFr/_ps_helper* $sdTo/


# ---------------------------------------- $sf_self
$sd_pwsh5 = "C:/Windows/System32/WindowsPowerShell/v1.0" 
$sf_self  = sp_posix $PSCommandPath
$sd_pwd   = sp_par $sf_self

Set-Location $sd_pwd 
oo_vars sf_self sd_pwd  
# ---------------------------------------- 
$sVolCur = $sf_self[0]

$sdFr = "powershell"
$sdTo = "$sVolCur`:/Windows/System32/WindowsPowerShell/v1.0"

oo_vars   sVolCur  sdFr  sdTo
# ---------------------------------------- 
cpi -fo -v $sdFr/* $sdTo/



# ---------------------------------------- 
# C:/_win/pwsh/7

$sdFr = "pwsh"
$sdTo = "../../pwsh/7"

oo_vars   sVolCur  sdFr  sdTo
# ---------------------------------------- 
cpi -fo -v $sdFr/* $sdTo/

# ---------------------------------------- 
# ---------------------------------------- 
$ans = Read-Host "`n`n  -- check !!!"; exit




# ---------------------------------------- 
# $sfn     = ($sf_self -split '[\\/]')[-1]
# $sfnb    = $sfn -replace '\..*$'
# $sVolNew = $sfnb[-1]

# ooiie "Set-Partition -DriveLetter $sVolCur  -NewDriveLetter $sVolNew"
# '';ooin '-- Continue ? (Y,n)';$ans=Read-Host;if($ans -eq 'n'){exit}


 

