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
            $spParent = Split-Path $Path -Parent
            CreateFolderStructure -Path $spParent    
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
                    $dateL = [datetime](gp $spL).LastWriteTime
                    $dateR = [datetime](gp $spR).LastWriteTime

                    if ((Get-Item $spL).GetType().Name -eq "FileInfo")
                    {
                        if ($dateL -gt $dateR)
                        {
                            $spSrc = $spL
                            $spTgt = $spR
                            $CopyFile = $true
                        }
                        if ($dateR -gt $dateL)
                        {
                            $spSrc = $spR
                            $spTgt = $spL
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
            $spSrc = $Folder.InputObject.FullName
            $spTgt = $Folder.InputObject.FullName.Replace($FldrL, $FldrR)
            $CopyFile = $true
        }
        if ($Folder.SideIndicator -eq "=>" -or $CopyRight) {
            $spSrc = $Folder.InputObject.FullName
            $spTgt = $Folder.InputObject.FullName.Replace($FldrR, $FldrL)
            $CopyFile = $true
        }

        if ($CopyFile -And (Test-Path $spSrc))
        {
            Write-Host "$($Folder.SideIndicator) Copying $($spSrc) to $($spTgt)"
            $spParent = Split-Path $spTgt -Parent
            CreateFolderStructure -Path $spParent
            if ((Get-Item $spSrc).GetType().Name -eq "DirectoryInfo")
            {
                New-Item -Path $spTgt -ItemType Directory
            }
            else
            {
                Copy-Item -Path $spSrc -Destination $spTgt
            }
        }
    }
}

SyncFolders -FldrL (Get-Item -Path $LeftFolder).FullName -FldrR (Get-Item -Path $RightFolder).FullName



# ------------------ 3






# ------------------ 4






# ------------------ 5





