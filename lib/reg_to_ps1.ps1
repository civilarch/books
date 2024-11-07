

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ---------------------------------------- Constants
$Encoding = "utf8"

$hive = @{
    "HKEY_CLASSES_ROOT"   = "Registry::HKCR"
    "HKEY_CURRENT_USER"   = "Registry::HKCU"
    "HKEY_LOCAL_MACHINE"  = "Registry::HKLM"
    "HKEY_USERS"          = "Registry::HKU"
    "HKEY_CURRENT_CONFIG" = "Registry::HKCC"
    
    "HKCR"                = "Registry::HKCR"
    "HKCU"                = "Registry::HKCU"
    "HKLM"                = "Registry::HKLM"
    "HKU"                 = "Registry::HKU"
    "HKCC"                = "Registry::HKCC"
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function reg_adjust_path($sp) {
    # $sp | out-host;  do_check_Continue
    # ------------------ 
    # "\"C:\\_usr\\prg\\AutoHotkey\\AutoHotkey.exe\" \"%1\""
    if ($sp -imatch  '\\"') {
        $sp = $sp -replace  '\\"', '`"'
    }

    if ($sp -imatch  '[C-Z]:(\\\\w+)*') {
        $sp = $sp -replace  '\\\\', '\'
    }
    # ---------------------------------------- 
    $sp 
}




function reg_to_ps ($text_reg) {
    
    $Commands = @()

    [string]$text = $nul

    $FileContent = $text_reg | Where-Object {![string]::IsNullOrWhiteSpace($_)} | ForEach-Object { $_.Trim() }
    
    # $FileContent | Out-Host
    
    $joinedlines = @()
    for ($i=0; $i -lt $FileContent.count; $i++){
        if ($FileContent[$i].EndsWith("\")) {
            $text = $text + ($FileContent[$i] -replace "\\").trim()
        } else {
            $joinedlines += $text + $FileContent[$i]
            [string]$text = $nul
        }
    }
    
    # oooi "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    # $joinedlines | out-host
    # oooi "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    $joinedlines  = $joinedlines | ? { $_ -notmatch '^\s*;'}
    # $joinedlines | out-host
    # oooi "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    # ooln
    

    foreach ($joinedline in $joinedlines) {
        
        if ($joinedline -match '\[-(HK.+)\]') {
            $key = $Matches[1]
            # $key=$key.substring(1,$key.length-1)
            $hivename = $key.split('\')[0]
            $key = "`"" + ($key -replace $hivename, $hive.$hivename) + "`""
            
            oo_vars  key  hivename  # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            
            $Commands  +=  'Remove-Item -Path {0} -Force -Recurse' -f $key
        }
        elseif ($joinedline -match '\[(HK.+)\]') {
            $key = $Matches[1]
            $hivename = $key.split('\')[0]
            $key = "`"" + ($key -replace $hivename,$hive.$hivename) + "`""
            if ($addedpath -notcontains $key) {
                $Commands  +=  'New-Item -Path {0} -ErrorAction SilentlyContinue | Out-Null'-f $key
                $addedpath += $key
            }
        }
        elseif ($joinedline -match "`"([^`"=]+)`"=") {
            [System.Boolean]$delete=$false
            $name = ($joinedline | select-string -pattern "`"([^`"=]+)`"").matches.value | select-object -first 1
            switch ($joinedline)
            {
                {$joinedline -match "=-"} {$commands += $Commands  +=  'Remove-ItemProperty -Path {0} -Name {1} -Force' -f $key, $Name; $delete=$true}
                {$joinedline -match '"="'} {
                    $type  = "string"
                    $value = $joinedline -replace "`"([^`"=]+)`"="
                }
                {$joinedline -match "dword"} {
                    $type  = "dword"
                    $value = $joinedline -replace "`"([^`"=]+)`"=dword:"
                    $value = "0x"+$value
                }
                {$joinedline -match "qword"} {
                    $type  = "qword"
                    $value = $joinedline -replace "`"([^`"=]+)`"=qword:"
                    $value = "0x"+$value
                }
                {$joinedline -match "hex(\([2,7,b]\))?:"} {
                    $value = ($joinedline -replace "`"[^`"=]+`"=hex(\([2,7,b]\))?:").split(",")
                    $hextype=($joinedline | select-string -pattern "hex(\([2,7,b]\))?").matches.value
                    switch ($hextype)
                    {
                        {$hextype -eq 'hex(2)' -or $hextype -eq 'hex(7)'} {
                            $value = for ($i=0; $i -lt $value.count; $i += 2) {
                                switch ($hextype)
                                {
                                    'hex(2)' {if ($value[$i] -ne '00') {[string][char][int]('0x'+$value[$i])}}
                                    'hex(7)' {if ($value[$i] -ne '00') {[string][char][int]('0x'+$value[$i])} else {"\0"}}
                                }
                            }
                            $value = "'"+($value -join "")+"'"
                            switch ($hextype)
                            {
                                'hex(2)' {$type  = "expandstring"}
                                'hex(7)' {$type  = "multistring"}
                            }
                        }
                        'hex(b)' {
                            $type  = "qword"
                            $value = for ($i=$value.count-1; $i -ge 0; $i--) {$value[$i]}
                            $value = '0x'+($value -join "").trimstart('0')
                        }
                        'hex' {
                            $type  = "binary"
                            
                            $value = $value.ForEach({"0x$_"})
                            $value = $value -join ","
                            $value = '([byte[]](' + $value + '))'
                        }
                    }
                }
            }
            
            $value = reg_adjust_path $value
            
            # oo_vars  key  name  type  value  # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            
            if ($delete -eq $false) {$commands += 'Set-ItemProperty -Path {0} -Name {1} -Type {2} -Value {3}' -f $key, $name, $type, $value}
        }
        elseif ($joinedline -match "@=") {
            $name = '"(Default)"'; $type = 'string'; $value = $joinedline -replace '@='
            $value = reg_adjust_path $value
            # oo_vars  key  name  type  value  # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            $commands  +=  'Set-ItemProperty -Path {0} -Name {1} -Type {2} -Value {3}' -f $key, $name, $type, $value
        }
    }
    
    $commands  | Out-String
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


