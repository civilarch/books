#! pwsh
# ---------------------------------------- 
# Title         : _elems/cmdlet/ValueFromPipeline_with_args.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240513_060903
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh2/_elems/cmdlet/ValueFromPipeline_with_args.ps1
# ---------------------------------------- 

function Get-FunctionName ([int]$StackNumber = 1) {
    return [string]$(Get-PSCallStack)[$StackNumber].FunctionName
}


function pipe_and_additional_args { 
    Param( $arg0, $arg1, $dummy2, [Parameter(ValueFromPipeline)] $each_ )

    Process { 
        $data_each = ifd $each_ $arg1
        "    --arg0:$arg0    --each_data:$data_each"
    }
}



'pipe_each_data' | pipe_and_additional_args  'cmd_opt'
pipe_and_additional_args  'cmd_opt'  'pipe_each_data'



        # if ($pipe_each_) {$pipe_each_; }
        # else             {$data_each = $arg1;}

    
    # Begin{oooo $MyInvocation.MyCommand.name}
    # Begin{oooo (Get-PSCallStack)[1].Command}
    # Begin{ Get-FunctionName }
    


