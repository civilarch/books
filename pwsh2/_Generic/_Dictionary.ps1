# ---------------------------------------- 
# sf   : C:\_usr\prg\pwsh2\_Generic\Dictionary.ps1
# Time : Sunday May 19, 2024 21:10:03
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 1



 [System.Collections.Dictionary]




# ------------------ 5



-is [Collections.IDictionary]


$dict = [Dictionary[string,string]]@{}

$dict = [Dictionary[string,string]]::new()

$dict.Add("txt", "notepad.exe");
$dict.Add("kkkkkkkkkkkkkkkkkkkkk", "vvvvvvvvvvvvvvvvvvvvvvvvvvvvv");


gci -file | % { $dict.Add($_.name, $_)  }
gci -file | % { ,@($_.name, $_.length)  }



function get_set_dict_gci($sd) {
    $hset = [HashSet[string]]@(); $dict = [Dictionary[string, object]]@{}
    gci -file $sd | % { $hset.Add($_.name); $dict.Add($_.name, $_) }
    $hset,  $dict
}

$hset,  $dict = get_set_dict_gci .

$hset  
$dict


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



 $dict.GetEnumerator().Where({ -not $localHashSet.Contains($_.Key) })


$dictionary.Keys 
$dictionary.Values 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 




function dict_new($pairs) {
    
}





foreach ($key in $dictionary.Keys) { 
    Write-Host "Key: $key    Value: $($dictionary[$key])" 
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






