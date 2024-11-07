#! pwsh
# ---------------------------------------- 
# Title         : _var/__info/multi_replace.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240418_211152
# Created by    : Swami Nirav Atasa
# powershell C:/_var/__info/multi_replace.ps1
# ---------------------------------------- 
# ------------------ 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ---------------------------------------- 


        
function is_match([ref]$line, $pairs) {
    foreach ($pair in $pairs) {
        if ($line.value -match $pair[0]) {
            return $Matches.0
        }
    }
}


function apply_processes_dry($of, $pairs ) {
     gc $of | %{ 
        foreach ($pair in $pairs) {
            if ($_ -match $pair[0]) {
                $of.FullName + " : " + $($_.ReadCount) + " : " + 
                $Matches.0 + " : " + $_ + " : " + ($_ -replace $pair[0], $pair[1])
            } 
        }
    }
}


function apply_processes([ref]$sText, $pairs ) {
    foreach ($pair in $pairs) {
        $sText.value = $sText.value -replace ('(?sm)'+$pair[0]), $pair[1]
    }
}

# ---------------------------------------- 
function multi_replace_one_file($of, $pairs, $dry=0) {
    if ($dry) {
        apply_processes_dry $of $pairs
    } else {
        $sText = gc -Raw $of ;
        apply_processes  ([ref]$sText)  $pairs  
        $sText | of $of
    }
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$re_pairs_ahk = @(
    ,('gl(..)al','gggg_$1')
    ,('(..)blime','ssss_$1')
    ,('vscode','vvvvv')
)

$re_pairs_path = @(
    ,('_usr/prg/AutoHotkey', '_usr/prg/AutoHotkey')
    ,('_usr/prg/Python'    , '_var/_day/tools/Python')

)

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
cpi -fo aa_pa.ahk  aa.ahk

$dry = 0
$of = gi "aa.ahk"

multi_replace_one_file  $of  $re_pairs_ahk  $dry

gc $of



