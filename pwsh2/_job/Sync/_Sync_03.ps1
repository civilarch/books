# ---------------------------------------- 
# sf   : C:\_usr\prg\pwsh2\_job\Sync\_Sync.ps1
# Time : Thursday May 16, 2024 12:54:11
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 1






# ------------------ 2


Param (
    [string]$LeftFolder,
    [string]$RightFolder
)

function CreateFolderStructure([string]$Path)
{
    if (-not [string]::IsNullOrWhiteSpace($Path))
    {
        if (-not (Test-Path $Path))
        {
            $ParentPath = Split-Path $Path -Parent
            CreateFolderStructure -Path $ParentPath    
            New-Item -Path $Path -ItemType Directory
        }
    }
}

function SyncFolders([string]$FldrL, [string]$FldrR)
{
    Write-Host "Preparing to copy $($FldrL) to $($FldrR)"
    $items_L  = gci -r $FldrL
    $items_R = gci -r $FldrR

    $Result = Compare-Object -ReferenceObject $items_L -DifferenceObject $items_R -IncludeEqual

    foreach ($Folder in $Result) {
        $CopyFile = $false
    $CopyLeft = $false
    $CopyRight = $false
        if ($Folder.SideIndicator -eq "==")
        {
            $spL = $Folder.InputObject.FullName
            $spR = $Folder.InputObject.FullName.Replace($FldrL, $FldrR)
          
            if (Test-Path $spL)
            {
                if (Test-Path $spR)
                {

                    $LeftDate = [datetime](Get-ItemProperty -Path $spL -Name LastWriteTime).LastWriteTime
                    $RightDate = [datetime](Get-ItemProperty -Path $spR -Name LastWriteTime).LastWriteTime

                    if ((Get-Item $spL).GetType().Name -eq "FileInfo")
                    {
                        if ($LeftDate -gt $RightDate)
                        {
                            $SourcePath = $spL
                            $TargetPath = $spR
                            $CopyFile = $true
                        }
                        if ($RightDate -gt $LeftDate)
                        {
                            $SourcePath = $spR
                            $TargetPath = $spL
                            $CopyFile = $true
                        }
                    }
                } else {
                    $CopyLeft = $true
                }
            } else {
                if (Test-Path $spR)
                {
                    $CopyRight = $true
                }
           }
        }
        if ($Folder.SideIndicator -eq "<=" -or $CopyLeft) {
            $SourcePath = $Folder.InputObject.FullName
            $TargetPath = $Folder.InputObject.FullName.Replace($FldrL, $FldrR)
            $CopyFile = $true
        }
        if ($Folder.SideIndicator -eq "=>" -or $CopyRight) {
            $SourcePath = $Folder.InputObject.FullName
            $TargetPath = $Folder.InputObject.FullName.Replace($FldrR, $FldrL)
            $CopyFile = $true
        }

        if ($CopyFile -And (Test-Path $SourcePath))
        {
            Write-Host "$($Folder.SideIndicator) Copying $($SourcePath) to $($TargetPath)"
            $ParentPath = Split-Path $TargetPath -Parent
            CreateFolderStructure -Path $ParentPath
            if ((Get-Item $SourcePath).GetType().Name -eq "DirectoryInfo")
            {
                New-Item -Path $TargetPath -ItemType Directory
            }
            else
            {
                Copy-Item -Path $SourcePath -Destination $TargetPath
            }
        }
    }
}

SyncFolders -FldrL (Get-Item -Path $LeftFolder).FullName -FldrR (Get-Item -Path $RightFolder).FullName



# ------------------ 3






# ------------------ 4






# ------------------ 5





