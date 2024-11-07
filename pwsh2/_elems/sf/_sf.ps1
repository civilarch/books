# ---------------------------------------- 
# sf   : C:\_win\pwsh\_elems\sf\_sf.ps1
# Time : Wednesday May 31, 2023 13:15:07
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 1






# ------------------ 2

# This internally checks for directory existence, and creates one, 
# if there is no directory.
[System.IO.Directory]::CreateDirectory(sd)
[IO.Directory]::CreateDirectory('y:/xxxx')

New-Item -ItemType Directory -Force -Path 

ni -i d -f 'y:/xxxx'



# ------------------ 3
gci -r  -name  -i package.json

gci -r -filter package.json -name

dir .\* -include ('*.xsl', '*.xslt') -recurse

dir .\ -recurse | where {$_.extension -in ".xsl",".xslt"}


Set-Location c:\topLevel
gci *.xsl, *.xslt -Recurse



# ------------------ 4

Get-ChildItem -path <yourpath> -recurse -Include *.pdb




# ------------------ 5





