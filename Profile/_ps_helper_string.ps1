#! pwsh
# ---------------------------------------- 
# Title         : __prophile/powershell/_ps_helper_string.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240424_130918
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh2/__prophile/powershell/_ps_helper_string.ps1
# ---------------------------------------- 



function separate_to_words($sStr){
    $sStr = [regex]::replace( $sStr, '(?<=[a-z])(?=[A-Z])', ' ').ToLower()
    [regex]::replace( $sStr, '[-_./\\:,\|+; ]+', ' ')
}

function capwords($sStr){
    [regex]::replace( $sStr, '\b([a-z])', { $args[0].Value.ToUpper()} )
}



function case_to_pascal($sStr){
    (capwords (separate_to_words $sStr)).replace(' ', '')
}

function case_to_camel($sStr){
    [regex]::replace((case_to_pascal $sStr), '^.', {$args[0].Value.ToLower()} )
}

function case_to_snake($sStr){
    (separate_to_words $sStr).replace(' ', '_')
}

function case_to_kebab($sStr){
    (separate_to_words $sStr).replace(' ', '-')
}

function case_to_dotted($sStr){
    (separate_to_words $sStr).replace(' ', '.')
}

function case_to_slash($sStr){
    (separate_to_words $sStr).replace(' ', '/')
}

function case_to_backslash($sStr){
    (separate_to_words $sStr).replace(' ', '\')
}

function case_to_delim($sStr, $delim){
    (separate_to_words $sStr).replace(' ', $delim)
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function get_lines($sText) {
    $aLines  = ($sText -split "`n") 
    $aLines  = ($aLines | ?{ ($_ -notmatch '^\s*$') -and ($_ -notmatch '^\s*#')  } )
    $aLines
}

function get_lines_trim($sText) {
    (get_lines $sText) -replace '^\s*(\S*)\s*', '$1'
}


filter to_lines{ get_lines $_ }
filter to_lines_trim{ get_lines_trim $_ }



# function  to_lines{
#     [CmdletBinding()]
#     Param( [Parameter(ValueFromPipeline)] $_ )
#     $aLines  = ($_ -split "`n") 
#     $aLines  = ($aLines | ?{ ($_ -notmatch '^\s*$') -and ($_ -notmatch '^\s*#')  } )
#     $aLines
# }





<#
$sText.trim() -split '\s*\n\s*' 
$sText -split '\n'|%{$_.trim()}
($sText -split '\n') -replace '^\s*(.+)\s*$', '$1'


#>
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function get_timestamp($Format = "yyMMdd_HHmm" ) {
    return Get-Date -Format $Format
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


