# ---------------------------------------- 
# Title         : WindowsPowerShell/v1.0/Profile_inc_powershell.ps1
# Date          : 240406_052900
# C:/Windows/System32/WindowsPowerShell/v1.0/Profile_inc_powershell.ps1
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
    $out += "PS ---- $loc`r`n$('>' * ($nestedPromptLevel + 1)) ";
    return $out
}


# $PSVersionTable.PSVersion

