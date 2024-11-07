

function pipe_a { 
    [CmdletBinding()] 
    Param(
        [Parameter(Mandatory=$True, ValueFromPipeline=$True)] 
        [string] $pipe_each,
        
    )
    
    Process {
        Write-Host ("Hello " + $pipe_each + "!")
    }
}


function pipe_b { 
    [CmdletBinding()] 
    Param(
        [Parameter(Position=0, Mandatory=$True, ValueFromPipeline=$True)] 
        [string] $pipe_each
    )
    
    Process {
        Write-Host ("Hello " + $pipe_each + "!")
    }
}




function pipe_c { 
    [CmdletBinding()] 
    Param(
        [Parameter(Position=0, Mandatory=$True, ValueFromPipeline=$True)] 
        [string] $pipe_each,
        
        [Parameter] 
        [string] $sStr
    )
    
    Process { Write-Host ("pipe_each : " + $pipe_each + "  ::: sStr : " + $sStr) }
}




function pipe_d { 
    Param(
        [string] $sStr,
        [Parameter(Mandatory=$True, ValueFromPipeline)] 
        [string] $pipe_each
    )
    
    Process { Write-Host ("    --pipe_each:" + $pipe_each + "    --sStr:" + $sStr) }
}


function pipe_d { 
    Param(
        [string] $sStr,
        [Parameter(ValueFromPipeline)] 
        [string] $pipe_each
    )
    
    Process { Write-Host ("    --pipe_each:" + $pipe_each + "    --sStr:" + $sStr) }
}


function pipe_d { 
    Param(
        $arg0_,
        [Parameter(Mandatory=$false)] $arg1_,
        [Parameter(ValueFromPipeline, ValueFromRemainingArguments=$true)] $pipe_each_
    )
    
    Begin { 
    }
    Process { 
        $args
        if ($pipe_each_) {$pipe_each = $pipe_each_; $arg0 = $arg0_; }
        else             {$pipe_each = $args[0];    $arg0 = $arg1_; }
        Write-Host ("    --pipe_each:" + $pipe_each + "    --arg0:" + $arg0) 
    }
}




function pipe_d { 
    Param(
        $arg0_,
        [Parameter(Mandatory=$false)] $arg1_,
        [Parameter(ValueFromPipeline)] $pipe_each_
    )
    
    Begin { 
    }
    Process { 
        Write-Host $args[0]
        if ($pipe_each_) {$pipe_each = $pipe_each_; $arg0 = $arg0_; }
        else             {$pipe_each = $args[0];    $arg0 = $arg1_; }
        Write-Host ("    --pipe_each:" + $pipe_each + "    --arg0:" + $arg0) 
    }
}





        [string[]] $args,







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



    [parameter(Mandatory=$true,ValueFromPipeline=$true,Position=0)]
    [ValidateNotNullOrEmpty()]
    [ValidateScript({Test-Path $_ -PathType Container})]
    [String[]]$Folder,

    [parameter(Mandatory=$true,Position=1,ParameterSetName='SetPermissions')]
    [parameter(Mandatory=$false,ParameterSetName='SetInheritance')]
    [ValidateNotNullOrEmpty()]
    [String]$SAMaccountName,

    [parameter(Mandatory=$true,Position=2,ParameterSetName='SetPermissions')]
    [parameter(Mandatory=$false,ParameterSetName='SetInheritance')]
    [ValidateNotNullOrEmpty()]
    [ValidateSet('ReadAndExecute','Modify','FullControl','ListFolderContents')]
    [String]$Grant,

    [parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [String]$Domain = 'MyDomain',

    [parameter(Mandatory=$false,Position=3,ParameterSetName='SetPermissions')]
    [parameter(Mandatory=$true,Position=1,ParameterSetName='SetInheritance')]
    [ValidateNotNullOrEmpty()]
    [ValidateSet('On','Off')]
    [String]$Inheritance,

    [Switch]$Recurse







function pipe_d { 
    [CmdletBinding()]
    Param(
        [Parameter(Position=0, Mandatory=$True, ValueFromPipeline=$True, ValueFromRemainingArguments=$True)]
        [string] $pipe_each,
        $sStr
    )
    
    Process { Write-Host ("Hello " + $pipe_each + "! ::: " + $sStr) }
}




Function tttt {
    [CmdletBinding()]
    Param(
        [Parameter(Position=0, Mandatory=$True, ValueFromPipeline=$True, ValueFromPipelineByPropertyName=$True )]
        [String]$Identity,
        [Switch]$MemberCount
    )
    Process {
        Write-Host $Identity $MemberCount
    }
}



  [Parameter(Mandatory, Position=0, ValueFromPipeline)]
  
  
  
  
  
  
  
  
  
  
  
  


    [Parameter(ParameterSetName='set1',Position=0,Mandatory=$true,ValueFromPipeline=$true)]
    [ValidatePattern("regex1")][string]$param1,
    [Parameter(ParameterSetName='set1',Position=1,Mandatory=$true,ValueFromPipeline=$true)]
    [ValidatePattern("regex2")][string]$param2

















Filter Convert-ToUpperCase {
  Write-Output "Input in uppercase: $($_.ToUpper())"
}




















 [Parameter(Mandatory,ValueFromPipeline)]

[Parameter(Mandatory,ValueFromPipeline,ValueFromPipelineByPropertyName)]

 [Alias('DisplayName','Name')]




    [Parameter(Mandatory,ValueFromPipeline)]
    [Object]
    $InputData














function global:new-user {
param(  
    [Parameter(ValueFromPipelineByPropertyName = $true, mandatory = $true)][validateset('DEV', 'QA', 'PT', 'PLT', 'SIT', 'APIS', 'PD', 'Sandbox')][STRING]$env,
    [Parameter( mandatory = $True, ValueFromPipelineByPropertyName = $true)][ValidateScript({ValidateEmail($_)})][String]$Email,
    [String]$userKey="xyz",
    [String]$secret="abc"
) 











function bbbb { 
    [CmdletBinding()] Param( [Parameter(Mandatory=$True, ValueFromPipeline=$True)]  [string] $sLine )
    Process {
        Write-Host ("Hello " + $sLine + "!")
    }
}

function ssss
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $Name
    )

    Process
    {
        Write-Host ("Hello " + $Name + "!")
    }
}


function New-BusinessProfileSite {
   param(
        [parameter(Mandatory=$true)]$SiteFullUrl,
        [parameter(Mandatory=$true)]$Creds,
        $Owners,
        [switch]$SkipUploadPackages
    )

   Write-Host "$PSScriptRoot\MyScript.psm1 has started"

   # YOUR CODE HERE
   # YOU CAN INVOKE FUNCTIONS FROM THE COMMON.PSM1 THAT WAS IMPORTED AS WELL

    Write-Host "DONE"
}





















