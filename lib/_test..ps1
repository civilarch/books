

# Association already exists: override it
# Name doesn't exist: create it
# ".log.1" becomes "log1file"

Function Create-Association($ext, $exe) {
    $name = cmd /c "assoc $ext 2>NUL"
    if ($name) {            
        $name = $name.Split('=')[1]
    } else {                
        $name = "$($ext.Replace('.',''))file" 
        cmd /c "assoc $ext=$name"
    }
    cmd /c "ftype $name=`"$exe`" `"%1`""
}




