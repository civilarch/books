

function print_formated ($val) {
    
    switch($val){
        {$_ -is [Collections.IDictionary]} {
            $_.getEnumerator() | % { 
                '    {0,-30} : {1}' -f  $_.key, $_.value.fullname
            }            
        }
        {$_ -is [Collections.ISet`1]} {
            $_| % { 
                '    {0,-30}'  -f  $_
            }            
        }
    }
}

[Dictionary[string, object]] $a_dof = @{}; gci -file| % { $a_dof.Add($_.name, $_) }

print_formated $a_dof

[HashSet[string]] $a_hsf = gci -file . -n 

print_formated $a_hsf

<#


if ( $a_dof  -is  [Collections.IDictionary]  ) {
    
    $a_dof.getEnumerator() |  % { 
        '    {0,-30} : {1}' -f  $_.key, $_.value.fullname
    }
}






if ( $a_dof  -is  [System.Collections.Generic.Dictionary]  ) {
    "DictionaryDictionaryDictionary"
}

GetInterfaces()


#>




