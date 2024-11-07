



[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true,Position=0)][string]$Left,
    [Parameter(Mandatory=$True,Position=1)][string]$Right
    )

# throw errors on undefined variables
Set-StrictMode -Version 1

# stop immediately on error
$ErrorActionPreference = [System.Management.Automation.ActionPreference]::Stop

# init counters
$Items = $MissingRight = $MissingLeft = $Contentdiff = 0

# make sure the given parameters are valid paths
$left  = Resolve-Path $left
$right = Resolve-Path $right

# make sure the given parameters are directories
if (-Not (Test-Path -Type Container $left))  { throw "not a container: $left"  }
if (-Not (Test-Path -Type Container $right)) { throw "not a container: $right" }

# Starting from $left as relative root, walk the tree and compare to $right.
Push-Location $left

try {
    Get-ChildItem -Recurse | Resolve-Path -Relative | ForEach-Object {
        $rel = $_
        
        $Items++
        
        # make sure counterpart exists on the other side
        if (-not (Test-Path $right\$rel)) {
            Write-Output "missing from right: $rel"
            $MissingRight++
            return
            }
    
        # compare contents for files (directories just have to exist)
        if (Test-Path -Type Leaf $rel) {
            if ( Compare-Object (Get-Content $left\$rel) (Get-Content $right\$rel) ) {
                Write-Output "content differs   : $rel"
                $ContentDiff++
                }
            }
        }
    }
finally {
    Pop-Location
    }

# Check items in $right for counterparts in $left.
# Something missing from $left of course won't be found when walking $left.
# Don't need to check content again here.

Push-Location $right

try {
    Get-ChildItem -Recurse | Resolve-Path -Relative | ForEach-Object {
        $rel = $_
        
        if (-not (Test-Path $left\$rel)) {
            Write-Output "missing from left : $rel"
            $MissingLeft++
            return
            }
        }
    }
finally {
    Pop-Location
    }

Write-Verbose "$Items items, $ContentDiff differed, $MissingLeft missing from left, $MissingRight from right"






