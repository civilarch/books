#! pwsh
# ---------------------------------------- 
# Title         : __prophile/powershell/_ps_helper_appl.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240424_124024
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh2/__prophile/powershell/_ps_helper_appl.ps1
# ---------------------------------------- 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: sublime
New-Alias -Name subl -Value "$gsd_Sublime/subl.exe"  


function subl_ { Param ( [Parameter(ValueFromPipeline)] $a_ )
    begin{$aa=@()} process{$a_|%{$aa += $_} } end{subl -n  $aa -join ' '}
}


Function esub{ 
    BEGIN {$sLines = @(); }
    PROCESS { $sLines += $_; }
    END {$sLines | Out-File -FilePath $gsf_temp_out ;  
        . "$gsd_Sublime/subl" -n "$gsf_temp_out "; }
}

New-Alias eee esub

Function esub2{ 
    BEGIN {$sLines = @(); }
    PROCESS { $sLines += $_; }
    END {$sLines | Out-File -FilePath $gsf_temp_out ;  
        . "$gsd_Sublime2/subl" -n "$gsf_temp_out "; }
}

New-Alias eee2 esub2


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

    
    # archive_7z_next_name_one  $arg

function archive_7z_next_name_one($sp) {
    $sCmd    = "C:/_win/tool/7z/7z.exe"
    $sOpt7z  = "a -t7z -mx1 -bso0 -bsp0".Trim() -split ' +'
    $sOptTar = "a -ttar -snh -snl ".Trim() -split ' +'

    $sfArch =  get_next_sp  $sp
    oo_vars  sp sfArch
    
    & $sCmd   $sOpt7z   $sfArch   $sp
}


    # archive_7z_time_stamp_one  $arg

function archive_7z_time_stamp_one($sp, $sExt='.7z') {
    $sCmd    = "C:/_win/tool/7z/7z.exe"
    $sOpt7z  = "a -t7z -mx1 -bso0 -bsp0".Trim() -split ' +'
    $sOptTar = "a -ttar -snh -snl ".Trim() -split ' +'

    $sTimeStamp = Get-Date -Format "yyMMdd_HH"
    
    $sd, $sfn, $sfnb, $__ = sp_split $sp
    $sfArch = "$sd/${sfnb}_$sTimeStamp$sExt"
    oo_vars  sp sfArch
    
    pushd $sd
    sure_delete $sfArch
    & $sCmd   $sOpt7z   $sfArch   $sp
    popd
}


# archive_7z_extract_here_one  $sp_full

function archive_7z_sdn_top($sp) {
    $sCmd    = "C:/_win/tool/7z/7z.exe"
    $sdn_arch = (& $sCmd  l -x!*\*? $sp|?{$_ -match ' D\.\.\.\.'}|%{$_ -replace '.+ +'})
    return $sdn_arch
}


function archive_7z_extract_here_one($sp, $sExt='.7z') {
    $sCmd    = "C:/_win/tool/7z/7z.exe"
    $sOpt7z  = "x -bso0 -bsp0".Trim() -split ' +'
    $sOptTar = "x -ttar -snh -snl ".Trim() -split ' +'

    $sd, $sfn, $sfnb, $__ = sp_split $sp
    $sdn = $sfnb -replace '[_\d]+$', ''
    # oo_vars  sp sd  sfn  sfnb sdn
    
    pushd $sd
    sure_delete "$sdn"
    & $sCmd   $sOpt7z   $sp
    
    $sdn_arch = archive_7z_sdn_top($sp)
    
    $sdn_ = $sdn_arch
    if ($sdn_ -match '(.+)-master$') {$sdn_ = $Matches[1] }
    if ($sdn_ -match '(.+)-main$')   {$sdn_ = $Matches[1] }
    if ($sdn_ -ne $sdn_arch) {
        rni  $sdn_arch  $sdn_
    }
    popd
}

<#
$sCmd  = "C:/_win/tool/7z/7z.exe"
$sp    = "T:\_and\and_ws_exams\and_exam_a\intro_android_demo-master.zip"
archive_7z_sdn_top($sp)

archive_7z_extract_here_one $sp

#>

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


