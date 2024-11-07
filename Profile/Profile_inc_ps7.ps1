# ---------------------------------------- 
# Title         : tools/pwsh/Profile_inc_pwsh.ps1
# Date          : 240420_101519
# C:/_win/pwsh/Profile_inc_pwsh.ps1
# ---------------------------------------- 

# ---------------------------------------- 
# -- prompt : two lines
# ---------------------------------------- 
function prompt {
    $loc = $executionContext.SessionState.Path.CurrentLocation;

    $out = ""
    if ($loc.Provider.Name -eq "FileSystem") {
        $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
    }
    $out += "pwsh ---- $loc`r`n$('>' * ($nestedPromptLevel + 1)) ";
    return $out
}


# $PSVersionTable.PSVersion

