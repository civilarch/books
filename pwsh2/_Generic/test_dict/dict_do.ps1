
# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. dict_2_code_Dev.ps1
#. dict_1_code_Release.ps1
# ---------------------------------------- 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# System.Collections.Generic.Dictionary


# function oo_vars {  
#     oooi (':'*50);
#     for ($i=0; $i -lt $args.count; $i++) {
#         $var = Get-Variable -Scope 1 $args[$i]
#         if ($var) { 
#             $sTypeName = $var.Value.GetType().name 
#             if ( 'Dictionary`2', 'HashSet`1' -contains $sTypeName) {
#                 oooi "`$$($var.Name.PadRight(16)) : >>>>"
#                 $var.Value | Format-Table | Out-String
#                 return
#             }
#         }
        
#         oooi "`$$($var.Name.PadRight(16)) : $($var.Value)"
#     }
#     oooi (':'*50);        
# }



function dict_intersect {
    
    
    $dict_a = [Dictionary[string,string]]@{}
    $dict_b = [Dictionary[string,string]]@{}
    
    $dict_a.Add("dd_0", "dd_val_0") 
    $dict_a.Add("dd_1", "dd_val_1") 
    $dict_a.Add("dd_2", "dd_val_2") 
    $dict_a.Add("dd_3", "dd_val_3") 
    
    $dict_b.Add("dd_1", "dd_val_1") 
    $dict_b.Add("dd_2", "dd_val_2") 
    $dict_b.Add("dd_3", "dd_val_3") 
    $dict_b.Add("dd_4", "dd_val_4") 
    
    oo_vars dict_a
    oo_vars dict_b
    
    [linq.enumerable]::except($dict_a.Keys, $dict_b.Keys)
    [linq.enumerable]::union($dict_a.Keys, $dict_b.Keys)
    [linq.enumerable]::Intersect($dict_a.Keys, $dict_b.Keys)
    
    
    [linq.enumerable]::except($dict_a, $dict_b)
    [linq.enumerable]::union($dict_a, $dict_b)
    [linq.enumerable]::Intersect($dict_a, $dict_b)
    
    
    
#     $dict_a.Keys.Intersect($dict_b.Keys).Select(x => new MyMappingClass
# {
#     dictAValue= dictA[x], dictBValue= dictB[x]
# })

    
    
    
    
}














# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# __prepare

function test_dict {
    dict_intersect
}

test_dict

