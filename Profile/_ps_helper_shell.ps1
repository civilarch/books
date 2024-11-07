# ---------------------------------------- 
# Title         : __prophile/powershell/_ps_helper_shell.ps1
# Date          : 240424_125558
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh2/__prophile/powershell/_ps_helper_shell.ps1
# ---------------------------------------- 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function remove_alias($snAlias){
    if ($PSVersionTable.PSVersion.Major -gt 5 ) {
        Remove-Alias $snAlias  -Force  2>$null;
    } else {
        If (Test-Path Alias:$snAlias) {Remove-Item Alias:$snAlias}
        If (Test-Path Alias:$snAlias) {Remove-Item Alias:$snAlias}
    }    
}


# ---------------------------------------- 
'ls', 'll', 'lla', 'dir', 'rm', 'md', 'mv', 'find', 'wget', 'mkdir', 'rmdir' | % {
    remove_alias $_  
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

'ls',  'rm', 'mv', 'find' | % {
    New-Alias -Name $_ -Value "$gsd_msys64/usr/bin/$_.exe"  
}


Function ll {
    param([string]$sPath = '.')
    . "$gsd_msys64/usr/bin/ls.exe" -l "$sPath"
}

Function lla {
    param([string]$sPath = '.')
    . "$gsd_msys64/usr/bin/ls.exe" -l -a  "$sPath"
}

# New-Alias -Name we -Value "explorer.exe"  


Function we{
    foreach ($arg in $args) {
        $sd = $arg -replace '/', '\'; explorer.exe  $sd
    }
}


Function wtt{
    foreach ($arg in $args) {
        $sd = $arg -replace '/', '\'; wt.exe -d $sd
    }
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function ls_ {
    $switches = $args.where{$_ -match     '^\-'}
    $rargs    = $args.where{$_ -notmatch  '^\-'}
    
    # if ($rargs.count -eq 0) {
    if (!$rargs) {$rargs.Add('.') }

    # foreach ( $e in $switches ) {$e}
    # foreach ( $e in $rargs )    {$e}
    
    if($switches.Contains('-l')){
        foreach ($e in $rargs) {
            Get-ChildItem $opts $e
        }     
    } else {
        foreach ($e in $rargs) {
            Get-ChildItem  | Format-Wide -Property Name -Column 5
        }  
    }
}





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

New-Alias -Name wm -Value "C:/_usr/util/WinMerge/WinMergeU.exe"  



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# Association already exists: override it
# Name doesn't exist: create it
# ".log.1" becomes "log1file"

Function Create-Association($ext, $exe) {
    $name = cmd /c "assoc $ext 2>NUL"
    if ($name) {            
        $name = $name.Split('=')[1]
    } else {                
        $name = "$($ext.Replace('.',''))file" 
        cmd /c "assoc $ext=$name"
    }
    cmd /c "ftype $name=`"$exe`" `"%1`""
}







# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


