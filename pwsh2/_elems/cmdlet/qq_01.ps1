function foo
{
    param(
       [Parameter(
           Position=0, 
           ValueFromPipeline=$true,
           ValueFromPipelineByPropertyName=$true)]
       [Alias('PSPath')]
       [string[]]
       $files,
       $installdir, 
       $compilemode
       )

    process {
        foreach ($file in $files) {
            "File is $file, installdir: $installdir, compilemode: $compilemode"
        }
    }
}

foo a,b,c -installdir c:\temp -compilemode x64