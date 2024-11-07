# ---------------------------------------- 
# sf   : C:\_etc\win\ps1\sync\_sync_240625_034557.ps1
# Time : Tuesday June 25, 2024 03:45:57
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 1






# ------------------ 2






# ------------------ 3






# ------------------ 4


unction rsync ($source,$target) {

	$sourceFiles = Get-ChildItem -Path $source -Recurse
	$targetFiles = Get-ChildItem -Path $target -Recurse

	if ($debug -eq $true) {
		Write-Output "Source=$source, Target=$target"
		Write-Output "sourcefiles = $sourceFiles TargetFiles = $targetFiles"
	}
	<#
  1=way sync, 2=2 way sync.
  #>
	$syncMode = 1

	if ($sourceFiles -eq $null -or $targetFiles -eq $null) {
		Write-Host "Empty Directory encountered. Skipping file Copy."
	} else
	{
		$diff = Compare-Object -ReferenceObject $sourceFiles -DifferenceObject $targetFiles

		foreach ($f in $diff) {
			if ($f.SideIndicator -eq "<=") {
				$fullSourceObject = $f.InputObject.FullName
				$fullTargetObject = $f.InputObject.FullName.Replace($source,$target)

				Write-Host "Attempt to copy the following: " $fullSourceObject
				Copy-Item -Path $fullSourceObject -Destination $fullTargetObject
			}


			if ($f.SideIndicator -eq "=>" -and $syncMode -eq 2) {
				$fullSourceObject = $f.InputObject.FullName
				$fullTargetObject = $f.InputObject.FullName.Replace($target,$source)

				Write-Host "Attempt to copy the following: " $fullSourceObject
				Copy-Item -Path $fullSourceObject -Destination $fullTargetObject
			}

		}
	}
}




# ------------------ 5




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


function rsync  {
param ( $source,
        $target 
      )

$WorkDir=Get-Location
Write-Output "PATH PWD:   $WorkDir"
Write-Host "SOURCE: $source"
Write-Host "TARGET: $target"

$sourceFiles = Get-ChildItem -Path $source -Recurse
$targetFiles = Get-ChildItem -Path $target -Recurse

Write-Host "SOURCEFILES $sourceFiles"
Write-Host "TARGETFILES: $targetFiles"


if ($debug -eq $true) {
  Write-Output "Source=$source, Target=$target"
  Write-Output "sourcefiles = $sourceFiles TargetFiles = $targetFiles"
}
<#
1=1 way sync, 2=2 way sync, 3=1 way purging target files not equal with source files
#>
$syncMode = 3

#if ($sourceFiles -eq $null -or $targetFiles -eq $null) {
    if ($targetFiles -eq $null)
    {
        $targetFiles=""
    }

if ($sourceFiles -eq $null){
  Write-Host "Empty Directory encountered. Skipping file Copy."
} else
{
  $diff_command="Compare-Object -ReferenceObject $sourceFiles -DifferenceObject $targetFiles"
  Write-Host "diff command: $diff_command"

  $diff = Compare-Object -ReferenceObject $sourceFiles -DifferenceObject $targetFiles
  Write-Host "---> Different Files from SOURCE to TARGET: $diff"

  #$diff_target = Compare-Object -ReferenceObject $targetFiles  -DifferenceObject  $sourceFiles
  #Write-Host "---> Different Files from TARGET to SOURCE: $diff_target"

  foreach ($f in $diff) {
    Write-Host "--> Indicator: $f.SideIndicator "
    if ($f.SideIndicator -eq "<=") {
      $fullSourceObject = $f.InputObject.FullName
      $fullTargetObject = $f.InputObject.FullName.Replace($source,$target)

      Write-Host "Attempt to copy the following <= SourceTarget: " $fullSourceObject
      Copy-Item -Path $fullSourceObject -Destination $fullTargetObject
    }


    if ($f.SideIndicator -eq "=>" -and $syncMode -eq 2) {
      $fullSourceObject = $f.InputObject.FullName
      $fullTargetObject = $f.InputObject.FullName.Replace($target,$source)

      Write-Host "Attempt to copy the following => TargetSource: " $fullSourceObject
      Copy-Item -Path $fullSourceObject -Destination $fullTargetObject
    }

    if ($f.SideIndicator -eq "=>" -and $syncMode -eq 3 -and $targetFiles -ne "") {
        $fullSourceObject = $f.InputObject.FullName
        $fullTargetObject = $f.InputObject.FullName.Replace($target,$source)

        Write-Host "Removing files from Target that are not present in Source=> TargetSource: " $fullSourceObject
        Write-Host "FIles that are not in source: $fullSourceObject"
        Remove-Item  $fullSourceObject 
      }

  }
}


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





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 






