


function Remove-ItemNotFileLocked
{
    [cmdletbinding(SupportsShouldProcess)]
    [Alias('rinf')]

    param 
    (
        [parameter(Mandatory = $true)][string]$FullFilePath
    )

    $TargetFile = New-Object System.IO.FileInfo $FullFilePath

    if ((Test-Path -Path $FullFilePath) -eq $false) {return $false}

    try 
    {
        $TargetFileStream = $TargetFile.Open([System.IO.FileMode]::Open, [System.IO.FileAccess]::ReadWrite, [System.IO.FileShare]::None)

        if ($TargetFileStream) 
        {
            $TargetFileStream.Close()
            Remove-Item -Path $FullFilePath
        }
        $false
    } 
    catch 
    {
        $true
    }
}

'D:\temp\abc.txt', 'D:\Documents\Return To Sender.docx','D:\Temp\nonexistent.txt.' | 
ForEach {Remove-ItemNotFileLocked -FullFilePath $PSItem -WhatIf}
