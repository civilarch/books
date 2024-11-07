#! pwsh
# ---------------------------------------- 
# Title         : __prophile/powershell/_ps_helper_debug.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240424_124519
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh2/__prophile/powershell/_ps_helper_debug.ps1
# ---------------------------------------- 

$global:__ns = 0; $global:__nocheck = 0
<#
if($global:__ns){return};
if($global:__nocheck){return};
#>

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ------------------ 
Set-Alias eeee Write-Output
Set-Alias oooo Write-Host
# ------------------ 

# ------------------ 
function smn_par ([int]$Stack = 2) {
    return [string]$(Get-PSCallStack)[$Stack].FunctionName
}
# ------------------ 

# ------------------ 
function eeej { if($global:__ns){return};eeee ($args -join ' ') }
# ------------------ 
function eeel { if($global:__ns){return}; $args|%{eeej "  " $_} }
# ------------------ 
function eeei { if($global:__ns){return}; eeej "    " @args; }
function eeii { if($global:__ns){return}; eeej "      "  @args; }
function eeil { if($global:__ns){return}; $args|%{eeii $_} }
# ------------------ 
function eeiim { if($global:__ns){return}; eeei "[$(smn_par)]"; eeii @args; }
function eeilm { if($global:__ns){return}; eeei "[$(smn_par)]"; eeil @args; }
# ------------------ 
function eeiie { if($global:__ns){return}; eeei (':'*50); eeii @args; eeei (':'*50); }
function eeile { if($global:__ns){return}; eeei (':'*50); eeil @args; eeei (':'*50); }
# ------------------ 
function eeiime { if($global:__ns){return}; eeei (':'*50); eeei "[$(smn_par)]"; eeii @args; eeei (':'*50); }
function eeilme { if($global:__ns){return}; eeei (':'*50); eeei "[$(smn_par)]"; eeil @args; eeei (':'*50); }
# ------------------ 


# ------------------ 
function oooj { if($global:__ns){return};oooo ($args -join ' ') }
function oool { if($global:__ns){return}; $args|%{oooj "  " $_} }
# ------------------ 
function ooon { if($global:__ns){return}; oooo -n ($args -join ' '); }
function ooin { if($global:__ns){return}; ooon "    " @args; }
function ooiin{ if($global:__ns){return}; ooon "      " @args; }
# ------------------ 
function oooi { if($global:__ns){return}; oooj "    " @args; }
function ooii { if($global:__ns){return}; oooj "      "  @args; }
function ooil { if($global:__ns){return}; $args|%{ooii $_} }
# ------------------ 
function ooiim { if($global:__ns){return}; oooi "[$(smn_par)]"; ooii @args; }
function ooilm { if($global:__ns){return}; oooi "[$(smn_par)]"; ooil @args; }
# ------------------ 
function ooie  { if($global:__ns){return}; oooi (':'*50); oooi @args; oooi (':'*50); }
function ooiie { if($global:__ns){return}; oooi (':'*50); ooii @args; oooi (':'*50); }
function ooile { if($global:__ns){return}; oooi (':'*50); ooil @args; oooi (':'*50); }
# ------------------ 
function ooiime { if($global:__ns){return}; oooi (':'*50); oooi "[$(smn_par)]"; ooii @args; oooi (':'*50); }
function ooilme { if($global:__ns){return}; oooi (':'*50); oooi "[$(smn_par)]"; ooil @args; oooi (':'*50); }
# ------------------ 




# ------------------ env
function get_env { iex "`$env:$($args[0])" }

function ee_envs { if($global:__ns){return};
    eeei (':'*50);
    for ($i=0; $i -lt $args.count; $i++) {
        $sn_env = "`$env:$($args[$i])"
        $val = iex $sn_env
        eeei "$($sn_env.PadRight(17)) : $val"
    }
    eeei (':'*50);
}

function oo_envs { if($global:__ns){return};
    oooi (':'*50);
    for ($i=0; $i -lt $args.count; $i++) {
        $sn_env = "`$env:$($args[$i])"
        $val = iex $sn_env
        oooi "$($sn_env.PadRight(17)) : $val"
    }
    oooi (':'*50);
}



# ------------------ Get-Variable -Scope 1

function ee_vars { if($global:__ns){return};
    oooi (':'*50);
    for ($i=0; $i -lt $args.count; $i++) {
        $var = Get-Variable -Scope 1 $args[$i]
        oooi "`$$($var.Name.PadRight(16)) : $($var.Value)"
    }
    oooi (':'*50);        
}



# function oo_vars {  
#     oooi (':'*50);
#     for ($i=0; $i -lt $args.count; $i++) {
#         $var = Get-Variable -Scope 1 $args[$i]
#         oooi "`$$($var.Name.PadRight(16)) : $($var.Value)"
#     }
#     oooi (':'*50);        
# }



function oo_vars { if($global:__ns){return};
    oooi (':'*50);
    for ($i=0; $i -lt $args.count; $i++) {
        $var = Get-Variable -Scope 1 $args[$i]
        if ($var -and $var.Value) { 
            $sTypeName = $var.Value.GetType().name 
            if ( 'Dictionary`2', 'HashSet`1' -contains $sTypeName) {
                oooi "`$$($var.Name.PadRight(16)) : >>>>"
                $var.Value | Format-Table | Out-String
                return
            }
        }
        
        oooi "`$$($var.Name.PadRight(16)) : $($var.Value)"
    }
    oooi (':'*50);        
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


function exit_ {
    ""; ooiie $args[0] ":"  $args[1]; "";
    Read-Host
    exit 0
}



function run_str {
    foreach ($sCommand in $args) {
        "";
        ooiie "`$sCommand :" $sCommand
        ooin ">>>> Excecute? (Y/n): ";
        $key = $host.UI.RawUI.ReadKey("IncludeKeyDown").Character; 
        "";
        if ($key -ne 'n' ) {
            Invoke-Expression $sCommand
        }
    }
}





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


