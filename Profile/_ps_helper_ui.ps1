#! pwsh
# ---------------------------------------- 
# Title         : WindowsPowerShell/v1.0/_ps_helper_ui.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240526_051012
# Created by    : Swami Nirav Atasa
# powershell C:/Windows/System32/WindowsPowerShell/v1.0/_ps_helper_ui.ps1
# ---------------------------------------- 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function oole($cnt=0) { oooi ("`n"*$cnt); }
function ooln { oooi (':'*50); }

function do_check_exit($sMsg){
    $sAdd = iif $sMsg "$sMsg :" ""
    '';ooin "-- $sAdd check !!!";Read-Host; exit;
}

function do_check_Continue($sMsg){ if($global:__nocheck){return};
    $sAdd = iif $sMsg "$sMsg :" ""
    ooin "-- $sAdd Continue ? (Y,n)";$ans=Read-Host;if($ans -eq 'n'){exit}
}


function do_check_Continue_iex($sCmd) {
    ''; oooi (':'*50); iex $sCmd; oooi (':'*50);
    do_check_Continue
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# $vvnn = var_change vvnn

function ask_($val, $prompt="") {
    $prompt = ifd $prompt "New value: "
    ooin $prompt; $ans = Read-Host;
    if ($ans) { $val = $ans }
    $val
}

function ask_input($prompt="") {
    $prompt = ifd $prompt "New value: "
    oooi ('-'*50); oooi $prompt; oooi ('-'*50);
    ooin "Select: "; $ans = Read-Host;
    if ($ans) { $val = $ans }
    $val
}


function ask_change($snVar, $prompt="") {
    $prompt = ifd $prompt "New value: "
    $value = get_var $snVar 2
    ooiie "`$$snVar : $value"
    ooin $prompt; $ans = Read-Host;
    if ($ans) { $value = $ans }
    $value
}

function var_change($snVar) {
    $value = get_var $snVar 2
    ooiie "`$$snVar : $value"
    ooin "New value: "; $ans = Read-Host;
    if ($ans) { $value = $ans }
    $value
}


function vol_ask_change($snVar) {
    $value = get_var $snVar 2
    ooiie "$snVar : $value"
    ooin "New value: "; $ans = Read-Host;
    if ($ans) { $value = sure_colon $ans }
    $value
}


function oo_ask{
    oooi ('-'*50);
    ooin "$($args -join ' '): "; $ans = Read-Host; if($ans -eq 'n'){exit}
    oooi ('-'*50);   
}




function __ask_contine__()
{
    # ---------------------------------------- Continue?
    ooon "`n  >>>> Continue? (y/N): ";
    $key = $host.UI.RawUI.ReadKey("NoEcho, IncludeKeyDown").Character; 
    if( $Host.UI.RawUI.KeyAvailable ) {$_ = $host.UI.RawUI.ReadKey("NoEcho, IncludeKeyUp, IncludeKeyDown") }
    # ---------------------------------------- 
    oooo "`n"
    $key
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function readkey_clear {
    sleep -m 99; $host.ui.RawUI.FlushInputBuffer(); sleep -m 9;
    while( $Host.UI.RawUI.KeyAvailable ) {
        oooo "  >> -- readkey_clear --------------"
        sleep -m 99; $host.ui.RawUI.FlushInputBuffer(); 
        sleep -m 222;
    }    
}

function do_readkey {
    $host.UI.RawUI.ReadKey("IncludeKeyUp").Character; 
}

function readkey_prompt($sPrompt, $nSec=0) {
    ooon "`n  ---- $sPrompt";
    do_readkey
}
 

function __wait_sec__($nSec=5) {
    sleep -m 99; $host.ui.RawUI.FlushInputBuffer(); sleep -m 9;
    $key = ''
    if($nSec -eq 0){$key = do_readkey; return $key; }
    for ($y=$nSec*10; $y; $y--) {
        if(!($y % 10)){ooon ("{0} "-f($y/10)) }
        if( $Host.UI.RawUI.KeyAvailable ) {$key = do_readkey; break; }
        [Threading.Thread]::Sleep( 990/10 )
    }
    $key
}


function __Chect_continue__($nSec=5) {
    ooon "`n  ---- Chect continue?(Y/n)""`n";
    $key = __wait_sec__ $nSec
    if ($key -eq 'y' ) { exit; }
}


function __Chect_out__($nSec=5) {
    ooon "`n  ---- Chect out!!! Stay?(y/N)""`n";
    $key = __wait_sec__ $nSec
    if ($key -ne 'y' ) { exit; }
    ooon "`n  ---- Staying !!! Press any key.""`n";
    $key = do_readkey
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function menu_show_of_list($arr_, $title, $defIdx, $head="") {
    oooo ''; oooo ''; ooiie $title;
    0..($arr_.length-1) | % { 
        $sMark = iif ($_ -eq $defIdx) "*" " "
        ooii ("$head $sMark{0}: {1}" -f $_, $arr_[$_]) 
    }
    ooii "$head  q: exit";
    oooi ('-'*30);        
}

function do_menu_select_of_arr($arr, $title, $defIdx, $head="") {
    menu_show_of_list $arr  $title $defIdx  $head
    ooiin "Select : "; $ans = Read-Host
    if ($ans -eq 'q') { exit }
    if ($ans -eq '') { $ans = $defIdx }
    $ans
}

function do_menu_select_of_sLines($sText, $title, $defIdx) {
    do_menu_select_of_arr  (get_lines_stripped $sText)  $title  $defIdx
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

