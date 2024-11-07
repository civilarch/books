# ---------------------------------------- 
# Title         : _var/__info/multi_replace.ps1
# powershell C:/_var/__info/multi_replace.ps1
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

 
