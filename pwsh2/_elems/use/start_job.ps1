
# ---------------------------------------- 
oooo "`n    $(':'*50)";
$sAns = Read-Host -Prompt '    Stay Open? (y|N)'
if($sAns -ne 'y'){Start-Job{Stop-Process -ID $args[0]} -args $PID}
# ---------------------------------------- 

# ---------------------------------------- 
oooo "`n    $(':'*50)";
$sAns = Read-Host -Prompt '    Stay Open? (y|N)'
if($sAns -ne 'y'){Start-Job{Stop-Process -ID $args[0]} -args $PID|Out-Null}
# ---------------------------------------- 


$pid_ = $PID.ToString()  
oooo  " -- `$pid_       :$pid_ ";
Start-Job -ScriptBlock { 
Start-Sleep -m 1000
Stop-Process -Force -ID $using:pid_
} | Out-Null

Start-Job -ScriptBlock { 
Start-Sleep -m 1000
Stop-Process -Force -ID $args[0]
} -args $PID.ToString() | Out-Null

Start-Job -ScriptBlock { 
Start-Sleep -m 1000
Stop-Process -Force -ID $args[0]
} -args $PID | Out-Null

Start-Job -ScriptBlock { Stop-Process -Force -ID $args[0] } -args $PID | Out-Null
Start-Job { Stop-Process -Force -ID $args[0] } -args $PID | Out-Null


Add-Type -AssemblyName PresentationFramework
[System.Windows.MessageBox]::Show($pid_)

$sTitle  = "Confirm Reboot"
$sImage  = 'Question'
$sBody   = "Reboot the computer now?"
$sButton = 'YesNoCancel'
Add-Type -AssemblyName PresentationFramework
$rt = [Windows.MessageBox]::Show($sBody,$sTitle,$sButton,$sImage)


$MsgBox = [Windows.MessageBox]::Show
$MsgBox = [System.Windows.MessageBox]

$MsgBox::Show("nn")




function Stop-Script
{
    Write-Host "Called Stop-Script."
    [System.Management.Automation.Runspaces.Runspace]::DefaultRunspace.CloseAsync()
}

Stop-Script

$elapsedEventHandler = {
    param ([System.Object]$sender, [System.Timers.ElapsedEventArgs]$e)

    Write-Host "Event handler invoked."
    ($sender -as [System.Timers.Timer]).Stop()
    Unregister-Event -SourceIdentifier Timer.Elapsed
    Stop-Script
}


# setup the timer to fire the elapsed event after 2 seconds
$timer = New-Object System.Timers.Timer -ArgumentList 2000 
$timer.Start()
"xxxxxx"


$pid = [System.Diagnostics.Process]::GetCurrentProcess().Id

[System.Diagnostics.Process]::GetCurrentProcess() | Select-Object -ExpandProperty ID















