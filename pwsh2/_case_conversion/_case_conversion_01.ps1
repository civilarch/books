# ---------------------------------------- 
# sf   : C:\_usr\prg\pwsh2\_case_conversion\_case_conversion.ps1
# Time : Thursday April 25, 2024 00:02:09
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 1
# (Get-Culture).TextInfo.ToTitleCase('some title')

# ------------------ 3

# function case_to_kebab {
#     param ([string]$sStr )

#     if ($sStr -eq $null) {return $null }

#     $parts = @()
#     $part = ""
#     for ($i = 0; $i -lt $sStr.Length; $i++) {
#         if ([char]::IsUpper($sStr[$i]) -and $part.Length -gt 0) {
#             $parts += $part.ToLower()
#             $part = ""
#         } 

#         $part += $sStr[$i]
#     }
#     if ($part.Length) {$parts += $part.ToLower(); }

#     [string]::Join("-", $parts);
# }




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




$sStr = 'aaa-Sss_ttt.ddFffGgg'

case_to_pascal $sStr
case_to_camel  $sStr
case_to_snake  $sStr
case_to_kebab  $sStr
case_to_dotted $sStr




# ------------------ 4






# ------------------ 5





