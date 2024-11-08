

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ---------------------------------------- Constants
$Encoding = "utf8"

$hive = @{
    "HKEY_CLASSES_ROOT"   = "HKCR:"
    "HKEY_CURRENT_USER"   = "HKCU:"
    "HKEY_LOCAL_MACHINE"  = "HKLM:"
    "HKEY_USERS"          = "HKU:"
    "HKEY_CURRENT_CONFIG" = "HKCC:"
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function reg_to_ps ($text_reg) {

    $Commands = @()

    [string]$text = $nul

    $FileContent = $text_reg | Where-Object {![string]::IsNullOrWhiteSpace($_)} | ForEach-Object { $_.Trim() }
    
    
    $joinedlines = @()
    for ($i=0; $i -lt $FileContent.count; $i++){
        if ($FileContent[$i].EndsWith("\")) {
            $text = $text + ($FileContent[$i] -replace "\\").trim()
        } else {
            $joinedlines += $text + $FileContent[$i]
            [string]$text = $nul
        }
    }

    foreach ($joinedline in $joinedlines) {
        if ($joinedline -match '\[' -and $joinedline -match '\]' -and $joinedline -match 'HKEY') {
            $key = $joinedline -replace '\[|\]'
            switch ($key.StartsWith("-HKEY"))
            {
                $true {
                    $key=$key.substring(1,$key.length-1)
                    $hivename = $key.split('\')[0]
                    $key = "`"" + ($key -replace $hivename,$hive.$hivename) + "`""
                    $Commands  +=  'Remove-Item -Path {0} -Force -Recurse' -f $key
                }
                $false {
                    $hivename = $key.split('\')[0]
                    $key = "`"" + ($key -replace $hivename,$hive.$hivename) + "`""
                    if ($addedpath -notcontains $key) {
                        $Commands  +=  'New-Item -Path {0} -ErrorAction SilentlyContinue | Out-Null'-f $key
                        $addedpath += $key
                    }
                }
            }
        }
        elseif ($joinedline -match "`"([^`"=]+)`"=") {
            [System.Boolean]$delete=$false
            $name = ($joinedline | select-string -pattern "`"([^`"=]+)`"").matches.value | select-object -first 1
            switch ($joinedline)
            {
                {$joinedline -match "=-"} {$commands += $Commands  +=  'Remove-ItemProperty -Path {0} -Name {1} -Force' -f $key, $Name; $delete=$true}
                {$joinedline -match '"="'} {
                    $type="string"
                    $value=$joinedline -replace "`"([^`"=]+)`"="
                }
                {$joinedline -match "dword"} {
                    $type="dword"
                    $value=$joinedline -replace "`"([^`"=]+)`"=dword:"
                    $value="0x"+$value
                }
                {$joinedline -match "qword"} {
                    $type="qword"
                    $value=$joinedline -replace "`"([^`"=]+)`"=qword:"
                    $value="0x"+$value
                }
                {$joinedline -match "hex(\([2,7,b]\))?:"} {
                    $value=($joinedline -replace "`"[^`"=]+`"=hex(\([2,7,b]\))?:").split(",")
                    $hextype=($joinedline | select-string -pattern "hex(\([2,7,b]\))?").matches.value
                    switch ($hextype)
                    {
                        {$hextype -eq 'hex(2)' -or $hextype -eq 'hex(7)'} {
                            $value=for ($i=0; $i -lt $value.count; $i += 2) {
                                switch ($hextype)
                                {
                                    'hex(2)' {if ($value[$i] -ne '00') {[string][char][int]('0x'+$value[$i])}}
                                    'hex(7)' {if ($value[$i] -ne '00') {[string][char][int]('0x'+$value[$i])} else {"\0"}}
                                }
                            }
                            $value=$value -join ""
                            switch ($hextype)
                            {
                                'hex(2)' {$type="expandstring"}
                                'hex(7)' {$type="multistring"}
                            }
                        }
                        'hex(b)' {
                            $type="qword"
                            $value=for ($i=$value.count-1; $i -ge 0; $i--) {$value[$i]}
                            $value='0x'+($value -join "").trimstart('0')
                        }
                        'hex' {
                            $type="binary"
                            $value='0x'+($value -join "")
                        }
                    }
                }
            }
            if ($delete -eq $false) {$commands += 'Set-ItemProperty -Path {0} -Name {1} -Type {2} -Value {3}' -f $key, $name, $type, $value}
        }
        elseif ($joinedline -match "@=") {
            $name='"(Default)"'; $type='string'; $value=$joinedline -replace '@='
            $commands  +=  'Set-ItemProperty -Path {0} -Name {1} -Type {2} -Value {3}' -f $key, $name, $type, $value
        }
    }
    
    $commands  | Out-String
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


