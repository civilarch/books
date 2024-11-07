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




$sStr = 'aaa-Sss_ttt.ddFffGgg'

case_to_pascal $sStr
case_to_camel  $sStr
case_to_snake  $sStr
case_to_kebab  $sStr
case_to_dotted $sStr
case_to_slash $sStr
case_to_backslash $sStr
case_to_delim $sStr ':::'




# ------------------ 4






# ------------------ 5





