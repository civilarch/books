

# ---------------------------------------- $sf_self
$sd_pwsh5 = "C:/Windows/System32/WindowsPowerShell/v1.0" 
$sf_self  = $PSCommandPath -replace '\\\\?', '/'
$sd_pwd   = $sf_self -replace '[\\/][^\\/]*$'

Set-Location $sd_pwd 
oo_vars sf_self sd_pwd  
# ---------------------------------------- 
$sVolCur = $sf_self[0]

$sfn     = ($sf_self -split '[\\/]')[-1]
$sfnb    = $sfn -replace '\..*$'
$sVol = "" + $sfnb[-1]
$sdVol   = $sVol + ':'

oo_vars sfnb  sVolCur  sVol  sdVol  
# ---------------------------------------- 

if (Test-Path $sdVol) {
    net use $sdVol /del
}
else{
    net use $sdVol \\sshfs\root@192.168.1.44\.. /user:root nirav344
}

# ---------------------------------------- 


    # net use $sdVol \\sshfs\root@192.168.1.111\.. /user:root nirav344


# ---------------------------------------- 




# ---------------------------------------- 



# ---------------------------------------- 

