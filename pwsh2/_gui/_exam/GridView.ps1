#! pwsh
# ---------------------------------------- 
# Title         : _gui/_exam/gui_get_text.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240419_180417
# Created by    : Swami Nirav Atasa
# powershell tools/powershell2/_gui/_exam/gui_get_text.ps1
# ---------------------------------------- 
$env:PSRUNWAIT = 3


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 




get-process | Out-GridView -OutputMode Multiple

Get-ChildItem directory `
        | Rename-Item -NewName { $_.Name -replace '^filename_+','' -replace '_+',' ' }





function x{
    param(
        [Parameter(ValueFromPipeline=$true)]$o,
        [Parameter(ValueFromPipelineByPropertyName=$true)][string]$prefix)
    process {
        write-host $prefix $o
    }
}
gci d:\ | select -fir 10 | x -prefix { $_.LastWriteTime }

















