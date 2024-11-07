#! pwsh
# ---------------------------------------- 
# Title         : module/file/file.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 231231_063042
# Created by    : Swami Nirav Atasa
# D:\_d\powershell\7\pwsh.exe C:/_var/_win/powershell/module/file/file.ps1
# ---------------------------------------- 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :: Module Variables
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :: Libraries
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function file_copy_newer{
    Param($arg1, $arg2, [switch]$whatif)
    # ------------------ 
    $sfn       = Split-Path $arg1 -Leaf
    $arg1_sd   = Split-Path $arg1
    $arg1_date = (get-Item $arg1).LastWriteTimeUtc
    # ------------------ 
    if (Test-Path $arg2  -PathType Leaf) { 
        $arg2_date = (get-Item $arg2).LastWriteTimeUtc
        if($arg1_date -le $arg2_date) { 
            # echo "  -- date not newer : $arg1 "
            return 
        }
        echo "  -- date newer : $arg1 "
    }
    else {
        echo "  -- file not exist : $arg1 "
        $arg2_sd   = Split-Path $arg2
        if (!(Test-Path $arg2_sd)) { mkdir -Force "$arg2_sd" > $null}
    }
    # ------------------ 
    Copy-Item $arg1 $arg2
}


function file_copy_newer_versitile{
    Param($arg1, $arg2, [switch]$whatif)
    # ------------------ 
    $sfn       = Split-Path $arg1 -Leaf
    $arg1_sd   = Split-Path $arg1
    $arg1_date = (get-Item $arg1).LastWriteTimeUtc
    # ------------------ 
    if (Test-Path $arg2) { 
        if( (Get-Item $arg2).PSIsContainer ) {
            $arg2_date = 0
        }
        else{
            if($arg1_date -le $arg2_date) { return }
            $arg2_date = (get-Item $arg2).LastWriteTimeUtc
        }
    }
    else {
        if ( $arg2.Substring($arg2.Length - 2) -eq '\' ) {
            $arg2_sd  = $arg2
        } else {
            if ($arg2.EndsWith($sfn)) {
                $arg2_sd  = Split-Path $arg2
            }
            else {
                $arg2_sd  = $arg2
            }
        }
        mkdir -Force "$arg2_sd"
    }
    # ------------------ 
    Copy-Item $arg1 $arg2

}


function file_copy_sync{
    Param($arg1, $arg2, [switch]$whatif)
    # ------------------ 
    $arg1_date = (get-Item $arg1).LastWriteTimeUtc
    $arg2_date = (get-Item $arg2).LastWriteTimeUtc
    # ------------------ 
    
    if($arg1_date -gt $arg2_date)
    {
        Write-Host "$arg1 is Newer... Copying..."
        if($whatif){Copy-Item -path $arg1 -dest $arg2 -force -whatif}
        else       {Copy-Item -path $arg1 -dest $arg2 -force}
    }
    else
    {
        #Don't want to copy this in my case..but good to know
        #Write-Host "$arg2 is Newer... Copying..."
        #if($whatif){Copy-Item -path $arg2 -dest $arg1 -force -whatif}
        #else{Copy-Item -path $arg2 -dest $arg1 -force}
    }
    Write-Host
}

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :: Libraries
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function do_Container_recursive{
    Param($arg1, $arg2, [switch]$whatif)
    
    $SrcFiles = gci -file $arg1
    $SrcDirs  = gci -dir  $arg1
    
    $posBeg = $arg1.Length
            
    foreach($arg1_ in $SrcFiles) {
        echo "File : $arg1_"
        $arg2_ = $arg2 + $arg1_.Substring($posBeg)
        file_copy_newer $arg1_  $arg2_
    } 
    
    foreach($arg1_ in $SrcDirs) {
        echo "Dir : $arg1_"
        $arg2_ = $arg2 + $arg1_.Substring($posBeg)
        do_Container_recursive $arg1_  $arg2_
    } 
}



function do_Container{
    Param($arg1, $arg2, [switch]$whatif)
    
    # echo  " -- `$arg1       :$arg1 ";
    # echo  " -- `$arg2       :$arg2 ";
    
    $SrcFiles = (gci -r -file $arg1 | Select-Object -expand FullName)
    
    $posBeg = $arg1.Length
    
    # Read-Host -Prompt "    Check it :: Pres 'Enter'"; return; 
            
    foreach($arg1_ in $SrcFiles) {
        
        $arg2_ = $arg2 + $arg1_.Substring($posBeg)
        
        # echo "File arg1_: $arg1_"
        # echo "File arg2_: $arg2_"
        # continue
        
        file_copy_newer $arg1_  $arg2_
        # Read-Host -Prompt "    Check it :: Pres 'Enter'"; return; 
    } 
}

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Export-ModuleMember -variable * 
Export-ModuleMember -Alias *
Export-ModuleMember -Function *

# Export-ModuleMember -Function * -Alias *
# Export-ModuleMember -Function Get-Test, New-Test, Start-Test -Alias gtt, ntt, stt

# FunctionsToExport = 'Get-Widget', 'Set-Widget'
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::





