


function Show-ScriptScope()
{
    $x = 1
    "function x = $x"
    $global:x = 2
    
    Get-Variable -Scope local
    Get-Variable -Scope global
}

$x = 9
Show-ScriptScope
"script x = $x"











