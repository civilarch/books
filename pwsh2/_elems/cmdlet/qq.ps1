

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
    
    Process {
        Write-Host ("Hello " + $pipe_each + "!")
    }
}




function pipe_d { 
    Param(
        [Parameter(Position=0, Mandatory=$True, ValueFromPipeline=$True)] 
        [string] $pipe_each,
        
        [Parameter(Position=1, ValueFromPipeline=$False)] 
        [string] $sStr
    )
    
    Process { Write-Host ("Hello " + $pipe_each + "!") }
}


function pipe_d { 
    Param(
        [Parameter(Position=0, Mandatory=$True, ValueFromPipeline=$True)] 
        [string] $pipe_each
    )
    
    Process { Write-Host ("Hello " + $pipe_each + "! ::: " + $sStr) }
}

'aaa' | pipe_d 'xxx'



