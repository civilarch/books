#! pwsh
# ---------------------------------------- 
# Title         : WindowsPowerShell/v1.0/_ps_helper_job.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240428_105529
# Created by    : Swami Nirav Atasa
# powershell C:/Windows/System32/WindowsPowerShell/v1.0/_ps_helper_job.ps1
# ---------------------------------------- 


# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  

# --recurse-submodules 
# git_clone_branch_all   https://github.com/android/architecture-samples.git

function git_clone_branch_all($sGit) {
    # ---------------------------------------- Constants
    $sfnbGit = (sp_split $sGit)[2]
    oo_vars sGit sfnbGit; do_check_Continue
    # ---------------------------------------- Preparation
    git clone $sGit
    cd (sp_split $sGit)[2]
    git branch -r | select -Skip 1 | %{$_ -replace '.+/'}> ../branches.txt
    cd ..
    # ---------------------------------------- Check
    do_check_Continue_iex "gc branches.txt"
    # ---------------------------------------- run
    gc branches.txt | %{
        ni -i d $_
        cd $_
        ooiie "git clone --branch $_  $sGit"
        git clone --branch $_  $sGit
        cd ..
    }
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :: sd_update_ps  ::: using powershell  
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


function sd_ri_n_src_e_dst($sd_src, $sd_dst) {
    $od_old = Get-Location; Set-Location $sd_dst
    gci -file -n | % { if(!(Test-Path "$sd_src/$_")) {ri -r -fo $_ } }
    gci -dir  -n | % {
        $sd_src_ = "$sd_src/$_"; $sd_dst_ = "$sd_dst/$_"
        if (!(Test-Path "$sd_src_")) { ri -r -fo "$sd_dst_" } 
        else { sd_ri_n_src_e_dst  $sd_src_  $sd_dst_ }
    }
    Set-Location $od_old
}

function sd_update_e_src_a_dst($sd_src, $sd_dst) {
    $od_old = Get-Location; Set-Location $sd_src
    gci -file -n | % { sf_update  "$sd_src/$_"  "$sd_dst/$_" }
    gci -dir  -n | % {
        $sd_a = "$sd_src/$_"; $sd_b = "$sd_dst/$_"; 
        if(Test-Path $sd_b) {sd_update_e_src_a_dst  $sd_a  $sd_b } 
        else {sd_copy  $sd_a  $sd_b }
    }
    Set-Location $od_old
}



function sd_update_purge_ps ( ) {
    $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
    sd_ri_n_src_e_dst       (sp_full_x $sd_a)  (sp_full_x $sd_b)
    sd_update_e_src_a_dst   (sp_full_x $sd_a)  (sp_full_x $sd_b)
}


function sd_update_ps ( ) {
    $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
    # sd_ri_n_src_e_dst       (sp_full_x $sd_a)  (sp_full_x $sd_b)
    sd_update_e_src_a_dst   (sp_full_x $sd_a)  (sp_full_x $sd_b)
}


<#

function sd_sync_ps ( ) {
    $sd_a = "_mock\sd_a"; $sd_b = "_mock\sd_b"
    # sd_ri_n_src_e_dst       (sp_full_x $sd_a)  (sp_full_x $sd_b)
    sd_update_e_src_a_dst   (sp_full_x $sd_a)  (sp_full_x $sd_b)
}



#>



<#
ri  -r  -fo _mock/*
cpi -r  -fo _mock_save/*  _mock/
gci -file -r -n _mock/sd_a > _mock/org_sd_a.txt
gci -file -r -n _mock/sd_b > _mock/org_sd_b.txt
sd_update_ps
gci -file -r -n _mock/sd_a > _mock/rsl_sd_a.txt
gci -file -r -n _mock/sd_b > _mock/rsl_sd_b.txt

#>


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





# no ui ::: 
# vol_day_date_copy_to 666  .  y

function vol_day_date_copy_to( $t_str="60m", $spSrc=".", $sdDst="D", $mid="" ){
    $op_cur = (gi $spSrc)
    $sp_cur = $op_cur.fullname  -replace '\\\\?', '/'
    
    if ($op_cur.PSIsContainer) {
        # ---------------------------------------- 
        $od_old = Get-Location; Set-Location $op_cur
        # ---------------------------------------- 
        if ($sdDst -match '^[a-zA-Z]$') { $sdDst += ':' }
        $sd_dst = $sdDst + $mid + $sp_cur.Substring(2)
        # ---------------------------------------- 
        gci_r_day_date  $t_str  $sp_cur | pipe_copy_to  $sd_dst
        # ---------------------------------------- 
        Set-Location $od_old
    }
    else {
        Set-Location  $spSrc.substring(0,2)
        $sdDst = $sdDst + $mid
        gci_day_date  $t_str $sp_cur | pipe_copy_to  $sd_dst
    }
}



function vol_date_copy_to( $t_str="60m", $spSrc=".", $sdDst="D", $mid="" ){
    $op_cur = (gi $spSrc)
    $sp_cur = $op_cur.fullname  -replace '\\\\?', '/'
    
    if ($op_cur.PSIsContainer) {
        # ---------------------------------------- 
        $od_old = Get-Location; Set-Location $op_cur
        # ---------------------------------------- 
        if ($sdDst -match '^[a-zA-Z]$') { $sdDst += ':' }
        $sdDst = $sdDst + $mid + $sp_cur.Substring(2)
        # ---------------------------------------- 
        gci_r_date  $t_str  $sp_cur | pipe_copy_to  $sdDst
        # ---------------------------------------- 
        Set-Location $od_old
    }
    else {
        Set-Location  $spSrc.substring(0,2)
        ooon "Get-Location : ";  oooo (Get-Location)
        $sdDst = $sdDst + $mid
        gci_date  $sp_cur $t_str | pipe_copy_to  $sdDst
    }
}





$sds_daily  = get_lines  @"
\Program Files\WindowsPowerShell
\Windows\System32\WindowsPowerShell\v1.0
\_wvar\_win\_win_os\_win_setting
\_etc
\_usr\util\PowerGREP
\_win\util\_disk
\_win\tool\Everything
\_usr\prg\Sublime_1\_util
\_usr\prg\Sublime_1\Packages
\_usr\prg\Sublime_1\_util
\_usr\prg\Sublime_1\Data\Packages\User
\_usr\prg\Sublime_self
"@|% trim



# my_daily_copy_to_drive  555  c y  

function my_daily_copy_to_drive( $t_str=60, $volSrc="C", $volDst="D", $mid="" ){
    foreach ($sd_from_ in $sds_daily) {
        $sd_from = $volSrc + ':' + $sd_from_
        vol_day_date_copy_to   $t_str  $sd_from  $volDst  $mid
        # oooo "`n"; ooiie "done : $sd_from"
        # sleep -m 500
    }
}






# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# ui ::: 
# vol_day_date_copy_to  999m y 

function sd_cur_my_daily_copy_to_drive($sdSrc) {
    # ---------------------------------------- 
    $od_old = Get-Location; Set-Location $sdSrc
    $sdSrc   = $sdSrc -replace '\\\\?', '/'
    # ---------------------------------------- sArgs
    oooi (':'*50);
    oooi "vol_day_date_copy_to  `$t_str  `$volDst  `$mid"
    oooi "vol_day_date_copy_to  3D  y  /S_modified"
    "    $('-'*30) Enter arguments : "; 
    ooin 'vol_day_date_copy_to  '; $sArgs = Read-Host;
    if (! $sArgs) { $sArgs = "3D  y  /S_modified" }
    # ---------------------------------------- $t_str, $volDst, $mid
    $t_str, $volDst, $mid  =  $sArgs.Trim() -split '\s+'
    # $t_str, $volDst  =  '999', 'y'
    ''; oo_vars  sArgs  t_str  sdSrc  volDst; ''
    do_check_Continue
    # ---------------------------------------- 
    $global:dryrun = 1
    vol_day_date_copy_to  $t_str  $sdSrc  $volDst  $mid
    # ---------------------------------------- 
    ooiie "to run"; do_check_Continue; 
    # ---------------------------------------- 
    $global:dryrun = 0
    vol_day_date_copy_to  $t_str  $sdSrc  $volDst  $mid
    # ---------------------------------------- 
    Set-Location $od_old; do_check_exit
}







# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# no ui ::: 
# vol_day_date_copy_to 666  .  y

function gci_r_code_date_pipe_copy_to( $t_str="60m", $sdSrc=".", $sdDst="Y:/S_modified", $mid="" ){
    # ---------------------------------------- sdSrc
    $od_cur = (gi $sdSrc)
    $od_old = Get-Location; Set-Location $od_cur
    $sdSrc = $od_cur.fullname  -replace '\\\\?', '/'
    # ---------------------------------------- 
    $sdDst = "$sdDst$mid"  -replace '\\\\?', '/'
    sure_ni_d $sdDst
    # ---------------------------------------- 
    gci_r_code_date  $t_str  $sdSrc | pipe_copy_to  $sdDst
    # ---------------------------------------- 
    Set-Location $od_old
}


function gci_r_day_date_pipe_copy_to( $t_str="60m", $sdSrc=".", $sdDst="Y:/S_modified", $mid="" ){
    # ---------------------------------------- sdSrc
    $od_cur = (gi $sdSrc)
    $od_old = Get-Location; Set-Location $od_cur
    $sdSrc = $od_cur.fullname  -replace '\\\\?', '/'
    # ---------------------------------------- 
    $sdDst = "$sdDst$mid"  -replace '\\\\?', '/'
    sure_ni_d $sdDst
    # ---------------------------------------- 
    gci_r_day_date  $t_str  $sdSrc | pipe_copy_to  $sdDst
    # ---------------------------------------- 
    Set-Location $od_old
}


function do_sd_cur_my_daily_backup($sdSrc=".") {
    # ---------------------------------------- sdSrc
    $od_old = Get-Location; Set-Location $sdSrc
    $sdSrc = sp_full_x $sdSrc
    # ---------------------------------------- sdDst
    $t_str = "1D"
    $sdDst = $sdDst="Y:/S_modified"
    $mid   = ""
    # ---------------------------------------- $t_str, $sdSrc, $sdDst, $mid
    oooi (':'*50);
    oooi "sdSrc : $sdSrc"
    oooi "gci_r_day_date_pipe_copy_to  `$t_str  `$sdSrc  `$sdDst  `$mid"
    oooi "gci_r_day_date_pipe_copy_to  $t_str  $sdSrc  $sdDst  $mid"
    "    $('-'*30) Enter arguments : "; 
    ooin 'gci_r_day_date_pipe_copy_to  '; $sArgs = Read-Host;
    if ($sArgs) { $t_str, $sdSrc, $sdDst, $mid  =  $sArgs.Trim() -split '\s+' }
    # ---------------------------------------- $t_str, $volDst, $mid
    $sdDst = "$sdDst$mid"; $mid = ""
    ''; oo_vars  sArgs  t_str  sdSrc  sdDst  mid ; ''
    do_check_Continue
    # ---------------------------------------- 
    $global:dryrun = 1
    gci_r_day_date_pipe_copy_to  $t_str  $sdSrc  $sdDst  
    # ---------------------------------------- 
    ooiie "to run"; do_check_Continue; 
    # ---------------------------------------- 
    $global:dryrun = 0
    gci_r_day_date_pipe_copy_to  $t_str  $sdSrc  $sdDst  
    (gi $sdSrc).fullname | of "$sdDst/sd_root_origin.txt"
    # ---------------------------------------- 
    Set-Location $od_old; 
    # ---------------------------------------- 
    do_check_exit
}




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



function sd_sync_with_hash_cur($sd_src, $sd_dst) {
    if(1){
        $a_hsf, $a_dof = get_set_dict_gci $sd_src '-file'
        $b_hsf, $b_dof = get_set_dict_gci $sd_dst '-file' 
        
        ($f_e_a_n_b = [HashSet[string]]::new($a_hsf)).Exceptwith($b_hsf)
        ($f_n_a_e_b = [HashSet[string]]::new($b_hsf)).Exceptwith($a_hsf)
        ($f_e_a_e_b = [HashSet[string]]::new($a_hsf)).IntersectWith($b_hsf)
        
        $f_e_a_n_b | % { cpi  $a_dof[$_]  $sd_dst }
        $f_n_a_e_b | % { cpi  $b_dof[$_]  $sd_src }
        $f_e_a_e_b | % { of_sync  $a_dof[$_]  $b_dof[$_] }
    }
}


function sd_sync_with_hash($sd_src, $sd_dst) {
    $sd_old = Get-Location; Set-Location $sd_src
    
    if (1) {
        $a_hsd, $a_dod = get_set_dict_gci $sd_src '-dir'
        $b_hsd, $b_dod = get_set_dict_gci $sd_dst '-dir' 
        
        ($d_e_a_n_b = [HashSet[string]]::new($a_hsd)).Exceptwith($b_hsd)
        ($d_n_a_e_b = [HashSet[string]]::new($b_hsd)).Exceptwith($a_hsd)
        ($d_e_a_e_b = [HashSet[string]]::new($a_hsd)).IntersectWith($b_hsd)

        $d_e_a_n_b | % { cpi -r  $a_dod[$_]  $sd_dst }
        $d_n_a_e_b | % { cpi -r  $b_dod[$_]  $sd_src }
        
        $a_hsd.Clear(); $b_hsd.Clear(); $d_e_a_n_b.Clear(); $d_n_a_e_b.Clear();  
               
        $d_e_a_e_b | % { sd_sync_with_hash  $a_dod[$_]  $b_dod[$_] }
    }
    
    Set-Location $sd_old
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


$sd_msbuild_15 = "C:/_dev/prg/vs15/MSBuild/15.0/Bin"
$sd_msbuild_16 = "C:/_dev/prg/vs16/MSBuild/Current/Bin"
$sd_msbuild_17 = "C:/_dev/prg/vs17/MSBuild/Current/Bin"

function vcvar_set($ver='16') {
    $sf_vcvars  = "C:/_dev/prg/vs$ver/set_vars_vcvars.ps1"
    if (!(Test-Path $sf_vcvars)) {
        ooie "Error :: Not exist : $sf_vcvars"
        return
    }
    . $sf_vcvars
    
    $sd_msbuild = (gv "sd_msbuild_$ver").value
    $env:Path = "$sd_msbuild;$env:Path"
}




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function  import_reg($sf_reg) {
    & "W:\_etc\win\ps1\lib\import_reg_file.ps1"  $sf_reg
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



