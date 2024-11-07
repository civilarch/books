#! pwsh
# ---------------------------------------- 
# Title         : __prophile/powershell/_ps_helper_io.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240424_125242
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh2/__prophile/powershell/_ps_helper_io.ps1
# ---------------------------------------- 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

New-Alias os Out-String

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function file_string($sStr){
    $file = file_memory($sStr.Length)
    Set-Content $file $sStr
    return $file
}



function file_memory($zLen = 100000){
    # $fm =  [IO.MemoryMappedFiles.MemoryMappedFile]::OpenExisting('dummy')
    # if ($fm) { $fm.Dispose() }
    return  [IO.MemoryMappedFiles.MemoryMappedFile]::CreateNew('dummy', $zLen)
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



Function stdin_to_file($sf){ 
    BEGIN {$sLines = @(); }
    PROCESS { $sLines += $_; }
    END {$sLines | Out-File -FilePath $sf; }
}


function of {
    param(
        [Parameter(mandatory=$true)]$sfOut,
        [parameter(ValueFromPipeline=$true)] [String] $sLine
    )
    begin { sp_sure_mkdir_parent $sfOut; ni -fo "$sfOut.__" | Out-Null }
    process { $sLine | Out-File -append -enc default  "$sfOut.__" }
    end {mi -fo "$sfOut.__" "$sfOut"}
}

function sc_sure($sf, $sText) {
    sp_sure_mkdir_parent $sf; 
    Set-Content -enc default  -Path $sf  -Value $sText
}





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



