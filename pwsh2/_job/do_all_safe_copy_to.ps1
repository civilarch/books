
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


$sps_for_copy  = get_lines  @"
\Users\user\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
\_usr\util\PowerGREP\_Roaming_pg\PowerGREP4.ini
\_usr\util\PowerGREP\_action
"@

function all_safe_copy_to($sArgs){
    # ---------------------------------------- volSrc  volDst  mid
    $volSrc, $volDst, $mid  =  $sArgs.Trim() -split '\s+'
    oo_vars  volSrc  volDst  mid ; do_check_Continue
    # ---------------------------------------- list_for_copy
    # $sf_list = set_sfn $PSCommandPath 'list_for_copy.txt'
    # $aLines = Get-Content $sf_list
    $aLines  = ($sps_for_copy | ?{ ($_ -notmatch '^\s*$') -and ($_ -notmatch '^\s*#')  } )
    ForEach ($spLine in $aLines) {
        $spSrc = "$volSrc" + ':' + "$spLine" 
        $spDst = "$volDst" + ':' + "$mid$spLine" 
        # safe_copy  $spSrc  $spDst
        $spDst
    }
}


function get_arg_string() {
    # ---------------------------------------- sArgs
    $sdate = Get-Date -Format "yyMMdd_HH"
    # ---------------------------------------- sArgs
    $arr_args  = get_lines  @"
        C  V  /S_modified
        C  Y  /S_modified
        C  V  /S_modified/$sdate
        C  Y  /S_modified/$sdate
        C  D
"@
    $idx = do_menu_select_of_arr $arr_args "t_str  volSrc  volDst  mid"  4  "my_daily_copy_to_drive :::   "
    $arr_args[$idx]
}

$sArgs = get_arg_string

all_safe_copy_to  $sArgs

do_check_exit


