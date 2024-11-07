#! pwsh
# ---------------------------------------- 
# Title         : multi_replace/_hut/__get_files.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240607_101823
# Created by    : Swami Nirav Atasa
# powershell C:/_etc/win/ps1/pwsh2/_job/multi_replace/_hut/__get_files.ps1
# ---------------------------------------- 




# ---------------------------------------- 
# python
# ---------------------------------------- 
gci -r -n -file -i *.py,*.sublime-keymap,*.sublime-menu 



# ---------------------------------------- 
# AutoHotkey
# ---------------------------------------- 
gci -r -n -file -i  *.ahk  


# ---------------------------------------- 
# XXXXXXXXXXXXXX
# ---------------------------------------- 


gci -r  -file -i  *.ahk .\_test\  -e *_pa.* `
| %{ multi_replace_one_file  $_  $re_pairs_ahk  1   }
}





# ---------------------------------------- 
# XXXXXXXXXXXXXX
# ---------------------------------------- 



# ---------------------------------------- 
# XXXXXXXXXXXXXX
# ---------------------------------------- 




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

find * -type f -name "*.py" -o -name "*.ps1" -o -name "*.bat" > __out_ms.txt



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


gci -r -n -file -i  *.ahk  | %{
    $_.FullName
    
    # ---------------------------------------- 
    $ans = Read-Host "`n`n  -- check !!!"; exit
    
    # ---------------------------------------- 
    $sText = @'
    C:/_var/_day/_pos/py_lib
    C:/_etc/pos/_templates
    '@ 
    
    oooo ''; oooi (':'*50); $sText oooi (':'*50);
    $ans = Read-Host -Prompt '`n    -- Continue ? (Y,n)' if($ans -eq 'n'){exit}
    # ---------------------------------------- 
    
    # ---------------------------------------- 
    oooo ''; oooi (':'*50);
    Sleep -m 200; $nSec = [int]$env:PSRUNWAIT; Sleep -m 200
    __Chect_out__  $nSec
    # ---------------------------------------- 
    exit
    
    # ===================================================  
    "============="; __Chect_out__ 5  ; "==============="
    # ===================================================  
    
    
    
    
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





