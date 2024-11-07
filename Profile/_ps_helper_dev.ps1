#! pwsh
# ---------------------------------------- 
# Title         : WindowsPowerShell/v1.0/_ps_helper_dev.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240428_105019
# Created by    : Swami Nirav Atasa
# powershell C:/Windows/System32/WindowsPowerShell/v1.0/_ps_helper_dev.ps1
# ---------------------------------------- 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: lib dev
    # csc.exe -NoLogo "$sf" && & "${sdb}.exe"
function csr($sf) {
    $sdb = (Split-Path -Path $sf -LeafBase)
    (csc.exe -NoLogo "$sf") -and (& "${sdb}.exe")
}






# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function create_time_stamp_file($sd) {
    $sfn_date = Get-Date -Format "yyMMdd_HHmm"
    $sfn    = '__Modified_' + $sfn_date + '.txt'
    
    @"
# ---------------------------------------- 
# Title         : $sdnPar/$sdn
# Environment   : 
# Descriptions  : ---------------
# Date          : $sfn_date
# Created by    : Swami Nirav Atasa
# path          : $sd
# ---------------------------------------- 

# ------------------ environments
# ------------------ purposes, symptoms

# ------------------ what

# ------------------ actions




# ------------------ result
# ------------------ comment


"@ | of "$sd/$sfn"
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


