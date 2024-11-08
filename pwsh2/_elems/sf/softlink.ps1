# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function fs_link_soft_delete {
    # if (Test-Path $args[0]) { Get-Item $sp_dst | %{$_.Delete()} }   
    if (Test-Path "$($args[0])") { Get-Item "$($args[0])" | %{$_.Delete()} }   
}

function fs_link_soft_make {
    $sp_org = $args[0] -replace '\\\\?', '/'
    $sp_dst = $args[1] -replace '\\\\?', '/'

    if (Test-Path "$sp_dst") { Get-Item $sp_dst | %{$_.Delete()} }
    if (Test-Path "$sp_dst") { exit }

    $sCommand = "New-Item -Path `"$sp_dst`" -ItemType SymbolicLink -Value `"$sp_org`" "

    run_str $sCommand
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: lib job
function mk_link {
    for ($i=0; $i -lt $args.count; $i++) {
        $sp_org = $args[0] -replace '\\\\?', '/'
        $sn_leaf  = Split-Path -Path $sp_org -Leaf
                
        $sdPar_dst = $PSScriptRoot -replace '\\\\?', '/'
        $sp_dst    = "$sdPar_dst/$sn_leaf"
        oooo  " -- `$sp_dst     :$sp_dst ";

        # if (Test-Path "$sp_dst") { rm -fo "$sp_dst" }
        if (Test-Path "$sp_dst") { Get-Item $sp_dst | %{$_.Delete()} }
        sure_exist_not $sp_dst

        $sCommand = "New-Item -Path `"$sp_dst`" -ItemType SymbolicLink -Value `"$sp_org`" "

        run_str $sCommand
    }    
}

function do_args {
    
    for ($i=0; $i -lt $args.count; $i++) {
       $i, $args[$i]
    }    
}




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: lib lang
function oooj { oooo ($args -join '') }

function exit_ {
    oooj '    ' 
    oooj '    ::::::::::::::::::::::::::::::::::::::::::::::::' 
    oooj '    ' $args[0] ' : ' $args[1] 
    oooj '    ::::::::::::::::::::::::::::::::::::::::::::::::' 
    oooj '    ' 
    Read-Host
    exit 0
}

function sure_exist {
    for ($i=0; $i -lt $args.count; $i++) {
        if ( -not (Test-Path $args[$i]) ) {
            exit_  "Error :: Not Exist : " $args[$i]
        }    
    }
}

function sure_exist_not {
    for ($i=0; $i -lt $args.count; $i++) {
        if ( (Test-Path $args[$i]) ) {
            exit_  "Error :: Already Exist : " $args[$i]
        }    
    }
}

function oooo_var {
    oooi (':'*50);
    for ($i=0; $i -lt $args.count; $i++) {
        $var = Get-Variable $args[$i]
        oooi "`$$($var.Name.PadRight(12)) : $($var.Value)"
    }
    oooi (':'*50);        
}


function run_str {
    foreach ($sCommand in $args)
    {
        oooo "";
        oooi (':'*50);
        oooi "`$sCommand : $sCommand"
        oooi (':'*50);  
        Write-Host -NoNewline "    >>>> Excecute? (Y/n): ";
        $key = $host.UI.RawUI.ReadKey("IncludeKeyDown").Character; 
        oooo "";
        if ($key -ne 'n' ) {
            Invoke-Expression $sCommand
        }
    }
}


function get_var {
    Get-Variable $args[0]
}

function fs_replce_path {
    $sPath = $sf -replace '\\?', '/'
    
    
    $sdn  = Split-Path -Path $args[0] -Leaf
    
    $sp_new = "$args[1]\"
}





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function do_args {
    for ($i=0; $i -lt $args.count; $i++) {
       $i, $args[$i]
    }    
}




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 









