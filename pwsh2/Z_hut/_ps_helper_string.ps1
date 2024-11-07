#! pwsh
# ---------------------------------------- 
# Title         : __prophile/powershell/_ps_helper_string.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240424_130918
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh2/__prophile/powershell/_ps_helper_string.ps1
# ---------------------------------------- 


function case_to_snake_($sStr){
    return [regex]::replace( $sStr, '(?<=[a-z])(?=[A-Z])', '_').ToLower()
}

function case_to_pascal($sStr){
    # $sStr = case_to_snake_($sStr)
    # oooo  " -- `$sStr       :$sStr ";
    [regex]::replace((case_to_snake_ $sStr), '(^|_|-|\.)(.)', { $args[0].Groups[2].Value.ToUpper()} )
}

function case_to_camel($sStr){
    [regex]::replace((case_to_pascal $sStr), '^.', {$args[0].Value.ToLower()} )
}

function case_to_snake($sStr){
    [regex]::replace((case_to_pascal $sStr), '(?<=.)(?=[A-Z])', '_').ToLower()
}

function case_to_kebab($sStr){
    [regex]::replace((case_to_pascal $sStr), '(?<=.)(?=[A-Z])', '-').ToLower()
}

function case_to_dotted($sStr){
    [regex]::replace((case_to_pascal $sStr), '(?<=.)(?=[A-Z])', '.').ToLower()
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


