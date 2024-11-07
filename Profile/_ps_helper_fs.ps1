#! pwsh
# ---------------------------------------- 
# Title         : __prophile/powershell/_ps_helper_fs.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240424_130918
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh2/__prophile/powershell/_ps_helper_fs.ps1
# ---------------------------------------- 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
Function nif($sf){ mkdir -fo (Split-Path $sf); ni $sf }
Function nid($sd){ mkdir -fo $sd }

# ---------------------------------------- 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# ---------------------------------------- 
function sf_copy($sf_src, $sf_dst, $sOpts="") {
    oooi "sf_copy  $sf_src  $sf_dst"
    sp_sure_mkdir_parent $sf_dst
    if ($sOpts) { Copy-Item  $sf_src  $sf_dst  $sOpts.split() } 
    else        { Copy-Item  $sf_src  $sf_dst  }
}

function sd_copy($sd_src, $sd_dst, $sOpts="") {
    sp_sure_mkdir_parent $sd_dst
    if ($sOpts) { Copy-Item -r $sd_src  $sd_dst  $sOpts.split() } 
    else        { Copy-Item -r $sd_src  $sd_dst }
}

# ---------------------------------------- 
function can_update($sf_src, $sf_dst) {
    $e_src = Test-Path $sf_src; $e_Dst = Test-Path $sf_Dst
    if (!$e_src) { return 0 }
    if ($e_Dst) { 
        $t_src = (gi $sf_src).LastWriteTime; $t_dst = (gi $sf_dst).LastWriteTime
        if ($t_src -le $t_dst) { return 0 }
    }
    return 1
}

function sf_update($sf_src, $sf_dst, $sOpts="") {
    if (can_update $sf_src $sf_dst) { sf_copy  $sf_src  $sf_dst  $sOpts }
}



function can_sync_o($of_src, $of_dst) {
    $of_src.LastWriteTime - $of_dst.LastWriteTime
}

function of_sync($of_src, $of_dst, $sOpts="") {
    $can_sync = $of_src.LastWriteTime - $of_dst.LastWriteTime
    # if ($can_sync -eq 0) { return 0 }
    if ($can_sync -gt 0) { Copy-Item  $of_src $of_dst  }
    if ($can_sync -lt 0) { Copy-Item  $of_dst $of_src  }
}


function of_pairs_sync($of_pairs, $sOpts="") {
    $f_pairs_ee | % { of_sync $_[0] $_[1] }
}




function can_sync($sf_src, $sf_dst) {
    $e_src = Test-Path $sf_src; $e_Dst = Test-Path $sf_Dst
    if (!$e_src -and !$e_Dst) { return 0 }
    $t_src = iif  $e_src (gi $sf_src).LastWriteTime  0
    $t_dst = iif  $e_dst (gi $sf_dst).LastWriteTime  0 
    if ($t_src -eq $t_dst) { return 0 }
    return $t_src - $t_dst
}


function sf_sync($sf_src, $sf_dst, $sOpts="") {
    $can_sync = can_sync $sf_src $sf_dst
    if ($can_sync -eq 0) { return 0 }
    if ($can_sync -gt 0) { sf_copy $sf_src $sf_dst $sOpts }
    if ($can_sync -lt 0) { sf_copy $sf_dst $sf_src $sOpts }
    return 1 
}




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function sure_delete {
    if ( 1 -eq $args.count) {$args=,$args}
    for ($i=0; $i -lt $args.count; $i++) {
        if ( Test-Path $args[$i] ) { ri -r -fo  $args[$i] }
    }
}
            # $args[$i]


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# ------------------ 
function Shortcut_make ($sf_scut, $TargetPath, $Arguments){
    sure_delete $sf_scut
    # ---------------------------------------- 
    $WScriptShell = New-Object -ComObject WScript.Shell;
    # ---------------------------------------- 
    $Shortcut = $WScriptShell.CreateShortcut($sf_scut);
    $Shortcut.TargetPath = $TargetPath ; $Shortcut.Arguments = $Arguments ;
    $Shortcut.Save()
    # ---------------------------------------- 
    $null = [System.Runtime.Interopservices.Marshal]::ReleaseComObject($WScriptShell);
}
# $sf         = [Environment]::GetFolderPath("Desktop") + "\" + "bbb.lnk"
# $TargetPath = """C:\Program Files\Google\Chrome\Application\chrome.exe""";
# $Arguments  = "--new-window  ""http://localhost"" " ;

# Shortcut_make $sf $TargetPath $Arguments

function Shortcut_get_info ($sf){
    # ---------------------------------------- 
    $WScriptShell = New-Object -ComObject WScript.Shell;
    # ---------------------------------------- 
    $Shortcut = $WScriptShell.CreateShortcut($sf);
    
    $TargetPath_old = [string]$Shortcut.TargetPath
    $Arguments_old  = [string]$Shortcut.Arguments
    # ---------------------------------------- 
    $null = [System.Runtime.Interopservices.Marshal]::ReleaseComObject($WScriptShell);
    $TargetPath_old, $Arguments_old
}

# $TargetPath, $Arguments = Shortcut_get_info  "C:\Users\user\Desktop\naver.lnk"
# C:\Program Files\Google\Chrome\Application\chrome.exe
# --new-window  "http://www.naver.com/"




# ------------------ SymbolicLink
# ni_i_SymbolicLink  "Roaming_JetBrains"  "$env:APPDATA\JetBrains"

function ni_i_SymbolicLink($sd_tgt, $sd_link) {
    sure_ni_d  $sd_tgt
    oo_vars  sd_tgt  sd_link
    '';ooin '-- Continue ? (Y,n)';$ans=Read-Host;if($ans -eq 'n'){exit}

    while ( Test-Path $sd_link ) {
       ooiie "$sd_link is already Exist !!!"
       ooin '-- delete and Continue ? (Y,n)';$ans=Read-Host;if($ans -eq 'n'){exit}
       ri -r -fo $sd_link
    }
    
    oo_vars  sd_tgt  sd_link
    ooin '-- Continue ? (Y,n)';$ans=Read-Host;if($ans -eq 'n'){exit}

    ni -i SymbolicLink   $sd_link  -v $sd_tgt
    
    if ( !(Test-Path $sd_link) ) {
       ooiie "    $sd_link is NOT created !!!"; {exit}
    }
    ooiie "$sd_link is created !!!"; 
}


function fs_ri_any ($sp) {if(!(Test-Path $sp)){return}
    if((gi $sp).LinkType){ (gi $sp).Delete() } else { ri -r -fo $sp } 
}

function fs_link_make($spOrg, $spDst, $ItemType="SymbolicLink" ) {
    fs_ri_any "$spDst" 
    if (Test-Path "$spDst") { "Failed ::: Not Deleted !!!"; exit }

    New-Item -Path  $spDst  -ItemType $ItemType -Value  $spOrg 
}

function fs_make_link_soft     { fs_link_make  $args[0]  $args[1] }
function fs_make_link_junction { fs_link_make  $args[0]  $args[1]  "Junction"}


# File  Directory  SymbolicLink  Junction  HardLink










# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# function safe_copy($sf_src, $sf_dst) {
#     sure_exist $sf_src
#     sure_delete $sf_dst
#     sp_sure_mkdir_parent $sf_dst

#     Copy-Item  $sf_src  $sf_dst
#     sure_exist $sf_dst
# }

# function safe_copy($sf_src, $sf_dst) {
#     if ($sf_src -is [object]) { $sf_src = $sf_src.fullname }
#     sure_exist  $sf_src
#     # sure_delete $sf_dst
#     sp_sure_mkdir_parent $sf_dst
#     try {Copy-Item  $sf_src  $sf_dst} catch { exit }
#     # sure_exist $sf_dst
# }


function safe_copy($sp_src, $sp_dst) {
    if ($sp_src -is [IO.FileSystemInfo]) { $sp_src = $sp_src.fullname }
    sure_exist  $sp_src
    sure_delete $sp_dst
    sp_sure_mkdir_parent $sp_dst
    try {Copy-Item  -r $sp_src  $sp_dst} catch { exit }
    # sure_exist $sp_dst
}


function copy_to_repl_vol($spSrc, $vol) {
    $spDst = $vol + $spSrc.substring(1)
    sure_delete $spDst
    sp_sure_mkdir_parent $spDst
    Copy-Item  -r  $spSrc  $spDst
    $spDst
}


function copy_to_vol($sp_src, $vol) {
    $sp_dst = sp_repl_vol $sp_src $vol
    sp_sure_mkdir_parent $sp_dst
    # ------------------ 
    cpi -r  $sp_src  $sp_dst 
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe each
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe each
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe each
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe each

function sp_rear_copy_to( $sp_rear, $sd_head_dst ){
    $sp_rear = $sp_rear  -replace '\\\\?', '/'
    $sp_dst = "$sd_head_dst/$sp_rear" 
    oooi $sp_dst
    if (! $global:dryrun) { 
        ni -i d -fo (Split-Path $sp_dst)
        sure_delete $sp_dst
        cpi -r $sp_rear $sp_dst
    }
}


function sp_rear_copy_to( $sp_rear, $sd_head_dst ){
    $sp_rear = sp_posix(sp_rel $sp_rear).substring(2)
    $sp_dst = "$sd_head_dst/$sp_rear" 
    oooi $sp_dst
    if (! $global:dryrun) { 
        ni -i d -fo (Split-Path $sp_dst) | Out-Null
        sure_delete $sp_dst
        cpi -r -fo $sp_rear $sp_dst 
    }
}




function sf_rear_copy_to( $spSrc, $sdDst ){
    if ($spSrc  -is [IO.FileInfo]) { $spSrc = Resolve-Path -Relative $spSrc.fullname }
    
    $spSrc
    
    sure_exist  $spSrc
    $sf_rear = $spSrc.substring(2)  -replace '\\\\?', '/'
    $sf_b    = "$sdDst/$sf_rear"
    $sf_b

    if (! $global:dryrun) { 
        sp_sure_mkdir_parent  $sf_b; 
        try {Copy-Item  (gi $sf_rear)  $sf_b} catch { exit_ $sf_b}
    }
}


function of_copy_to( $of, $sdDst ){
    $sf_rear  = Resolve-Path -Relative $of.fullname
    sf_rear_copy_to  $sf_rear  $sdDst
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe 


function pipe_copy_to( $sd_head_dst, $mid="" ){
    begin { 
        $sd_dest = "$sd_head_dst$mid" 
    } 
    process { sp_rear_copy_to  $_  $sd_dest }
    # end { ooiie 'Done : pipe_copy_to' } 
}


function pipe_copy_to_under_sdn( $dest, $mid="" ){
    begin { 
        $sdn_cur = ((Get-Location) -split '[\\/]')[-1]
        # $sDate   = Get-Date -Format "yyMMdd"
        $sd_dest = "$dest$mid/$sdn_cur" 
    } 
    process { sp_rear_copy_to  $_  $sd_dest }
    end { ooiie 'Done : pipe_copy_to' } 
}


function pipe_copy_to_date( $dest, $mid="" ){
    begin { 
        $sDate   = Get-Date -Format "yyMMdd"
        $sd_dest = "$dest$mid/$sDate" 
    } 
    process { sp_rear_copy_to  $_  $sd_dest }
    end { ooiie 'Done : pipe_copy_to' } 
}


function pipe_copy_to_date_under_sdn( $dest, $mid="" ){
    begin { 
        $sdn_cur = ((Get-Location) -split '[\\/]')[-1]
        $sDate   = Get-Date -Format "yyMMdd"
        $sd_dest = "$dest$mid/$sDate/$sdn_cur" 
    } 
    process { sp_rear_copy_to  $_  $sd_dest }
    end { ooiie 'Done : pipe_copy_to' } 
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: for pipe



# sd_copy_to_dated 1500

function sd_copy_to_dated( $t_str="60m", $from=".", $dest="T:/_xvar/backup/modified", $mid="" ){
    $sDate   = Get-Date -Format "yyMMdd"
    $sdn_cur = (gi $from).name
    $sd_dest = "$dest$mid/$sDate/$sdn_cur" 
    
    oo_vars sdn_cur  sd_dest
    
    gci_r_date_n  $t_str |  pipe_copy_to_date  $sd_dest  $mid
}




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function copy_all_to($sdSrc, $sdDst) {
    $od_old = Get-Location; Set-Location $sdSrc
    if ($sdDst -match '^[a-zA-Z]$') { $sdDst = $sdDst + ':' }
    gci -r -file $sdSrc | pipe_copy_to $sdDst
    Set-Location $od_old
}



function do_copy_all_to ($sdSrc) {
    # ---------------------------------------- sArgs
    $sArgs_ = "$sdSrc  y"
    oooi (':'*50);
    oooi "copy_all_to  `$sdSrc `$sdDst "
    oooi "copy_all_to   $sArgs_"
    "    $('-'*30) Enter arguments : "; 
    ooin 'copy_all_to  '; $sArgs = Read-Host;
    if (! $sArgs) { $sArgs = $sArgs_ }
    # if ($sArgs -match '^\S+$') { $sArgs = $sArgs_ }
    ''
    # ---------------------------------------- sdDst
    $sdSrc, $sdDst =  $sArgs.Trim() -split '\s+'
    if ($sdDst -match '^[a-zA-Z]$') { $sdDst = $sdDst + ':' }
    oo_vars  sdSrc  sdDst  
    sure_exist ($sdDst)
    do_check_Continue
    # ---------------------------------------- sdDst
    copy_all_to  $sdSrc  $sdDst
}


function do_copy_all_restore ($sdSrc=".") {
    # ---------------------------------------- sdSrc
    $sdSrc = sp_full_x $sdSrc
    # ---------------------------------------- $sd_root_origin
    $sd_root_origin = "C:"
    $sf_root_origin = "$sdSrc/sd_root_origin.txt"
    if (Test-Path $sf_root_origin) {
        $sd_root_origin = Get-Content -Path $sf_root_origin
        $sd_root_origin = $sd_root_origin -replace '\\\\?', '/'
    }
    # ---------------------------------------- volDst
    $volDst = $sd_root_origin[0]
    oooi (':'*50);
    oooi "sd_root_origin : $sd_root_origin "
    oooi "`$volDst : $volDst "
    "    $('-'*30) Enter new volDst : "; 
    ooin "`$volDst : "; $sArgs = Read-Host;
    if ($sArgs) { $volDst = $sArgs }
    ''
    # ---------------------------------------- sdDst
    # $sdDst = "$volDst" + $sd_root_origin.Substring(1) 
    $sdDst = "$volDst" 
    
    oo_vars  sdSrc  volDst  sdDst
    
    # return
    # ---------------------------------------- 
    oooi (':'*50);
    oooi "sdSrc : $sdSrc "
    oooi "sdDst : $sdDst "
    "    $('-'*30)"; 
    do_check_Continue
    # ---------------------------------------- sdDst
    copy_all_to  $sdSrc  $sdDst
    # ---------------------------------------- 
    do_check_exit
}



# $sf_self   = sp_posix $PSCommandPath
# $sdSrc   = sp_par $sf_self

# do_copy_all_to  $sdSrc





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function robo_sd_update($sdSrc, $sdDst, $sOpts="") {
    robocopy  $sdSrc  $sdDst  /e /xo /xx /r:0 /w:0 /xd $arr_XD  $sOpts.split()
}

function robo_sd_update_purge($sdSrc, $sdDst, $sOpts="") {
    robocopy  $sdSrc  $sdDst  /e /xo /purge /r:0 /w:0 /xd $arr_XD  $sOpts.split()
}

function robo_sd_sync($sdSrc, $sdDst) {
    robocopy  $sdDst  $sdSrc  /e /xo  /r:0 /w:0 /xd $arr_XD  $sOpts.split()
    robocopy  $sdSrc  $sdDst  /e /xo  /r:0 /w:0 /xd $arr_XD  $sOpts.split()
}


function robo_sd_mir($sdSrc, $sdDst, $sOpts="") {
    robocopy  $sdSrc  $sdDst  /mir /r:0 /w:0 /xd $arr_XD  $sOpts.split()
}

# ---------------------------------------- 
# ------------------ 


function ps_sf_update($sfSrc, $sfDst, $sOpts="") {
    $dateSrc = (gi $sfSrc).LastWriteTime 
    $dateDst = (gi $sfDst).LastWriteTime 
    if ($dateDst -lt $dateSrc) {Copy-Item  $sfSrc  $sfDst  $sOpts.split()}
    # if ($dateSrc -lt $dateDst) {Copy-Item  $sfDst  $sfSrc  $sOpts.split()}
}

function ps_sf_sync($sfSrc, $sfDst, $sOpts="") {
    $dateSrc = (gi $sfSrc).LastWriteTime 
    $dateDst = (gi $sfDst).LastWriteTime 
    if ($dateDst -lt $dateSrc) {Copy-Item  $sfSrc  $sfDst  $sOpts.split()}
    if ($dateSrc -lt $dateDst) {Copy-Item  $sfDst  $sfSrc  $sOpts.split()}
}




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# $robo_options = "/fp /ns /nc /njh /njs /l"
$robo_options = "/mt:32 /fp /ns /nc /njh /njs /sl"

function robo_mir( $t_str="60m", $spSrc=".", $spDst="D", $mid="" ){
    $opSrc = (gi $spSrc)
    if ($opSrc.PSIsContainer) {
        # ---------------------------------------- 
        $sOpts = $robo_options + (  iif  $global:dryrun  " /l"  "")
        oooo "robo_sd_mir  $spSrc  $spDst  $sOpts" 
        robo_sd_mir  $spSrc  $spDst  $sOpts
        # ---------------------------------------- 
    }
    else {
        $sdDst = sp_par $spDst
        oooo "ps_sf_sync  $spSrc  $spDst"
        ps_sf_sync  $spSrc  $spDst
    }
}


function robo_update_date( $t_str="60m", $spSrc=".", $spDst="D", $mid="" ){
    $opSrc = (gi $spSrc)
    if ($opSrc.PSIsContainer) {
        # ---------------------------------------- 
        $sOpts = $robo_options + (  iif  $global:dryrun  " /l"  "")
        oooo "robo_sd_update  $spSrc  $spDst  $sOpts" 
        robo_sd_update  $spSrc  $spDst  $sOpts
        # ---------------------------------------- 
    }
    else {
        $sdDst = sp_par $spDst
        oooo "gci_day_date  $spSrc $t_str | pipe_copy_to  $sdDst"
        gci_day_date  $spSrc $t_str  | pipe_copy_to  $sdDst
    }
}


function robo_update( $spSrc, $spDst ){
    $opSrc = (gi $spSrc)
    if ($opSrc.PSIsContainer) {
        # ---------------------------------------- 
        $sOpts = $robo_options + (  iif  $global:dryrun  " /l"  "")
        oooo "robo_sd_update  $spSrc  $spDst  $sOpts" 
        robo_sd_update  $spSrc  $spDst  $sOpts
        # ---------------------------------------- 
    }
    else {
        ps_sf_update $spSrc $spDst
    }
}




function all_safe_copy_to($a_line, $sArgs) {
    # ---------------------------------------- $t_str, $volSrc, $volDst, $mid
    $t_str, $sdSrcRoot, $sdDstRoot, $mid  =  $sArgs.Trim() -split '\s+'
    $sdSrcRoot = sure_colon $sdSrcRoot; $sdDstRoot = sure_colon $sdDstRoot;
    # $arr_XD = set_arr_XD $arr_XD  $sdSrcRoot
    # oo_vars  sdSrcRoot  sdDstRoot  mid ; do_check_Continue  XXXXXXXXX
    # ---------------------------------------- list_for_copy
    $a_line  = ($a_line | ? { ($_ -notmatch '^\s*$') -and ($_ -notmatch '^\s*#')  } )
    ForEach ($sp_rear in $a_line) {
        $spSrc = $sdSrcRoot +        "$sp_rear"
        $spDst = $sdDstRoot + $mid + "$sp_rear"
        # oo_vars  spSrc  spDst ; do_check_Continue
        if (Test-path $spSrc) {
            # oooo "safe_copy  $spSrc  $spDst"
            safe_copy  $spSrc  $spDst
            # $spDst
        }
        $spDst
    }
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function update_to_repl_vol($spSrc, $vol) {
    $spDst = $vol + $spSrc.substring(1)
    sp_sure_mkdir_parent $spDst
    robo_update  $spSrc  $spDst
    $spDst
}


function update_to_vol_ask() {
    $vol_src = $args[0][0]
    $vol_dst = get_vol_dst_ask $args[0]
    # ------------------ 
    foreach ($sp_src in $args) {
        update_to_repl_vol  ( sp_posix $sp_src)  $vol_dst
    }
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function robo_mir($sd_a, $sd_b, $opt="") {
    Robocopy /mir  $sd_a  $sd_b  /ndl /njh /njs $opt
}

New-Alias rbm robo_mir



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


