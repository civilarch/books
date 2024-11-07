# ---------------------------------------- 
# sf   : C:\_usr\prg\pwsh2\_job\Sync\robocopy\_robocopy.ps1
# Time : Thursday May 16, 2024 20:04:13
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 1






# ------------------ 2

robocopy




# ------------------ 3

robocopy [Source] [Destination] [(File)( ...)] [(Options)]




# ------------------ 4

/s: Copies subdirectories. Note that this option excludes empty directories.

/e: Copies subdirectories. Note that this option includes empty directories.

/lev: Copies only the top N levels of the source directory tree.


# ------------------ 5

/b: Copies files in Backup mode.

/copyall: Copies all file information, including 

D (Data)
A (Attributes)
T (Time stamps)
S (Security: NTFS access control list (ACL))
O (Owner information)
U (Auditing information)



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

cd D:\cur

sc a.txt "aaa"
sc b.txt "bbb"

$ofa = gi a.txt
$ofb = gi b.txt

$dta = $ofa.LastWriteTime
$dtb = $ofb.LastWriteTime




Set-ScheduledTask   
Modifies a scheduled task.

Start-ScheduledTask 
Starts one or more instances of a scheduled task.

Stop-ScheduledTask  
Stops all running instances of a task.


$Time = New-ScheduledTaskTrigger -At 12:00 -Once

Set-ScheduledTask -TaskName "SoftwareScan" -Trigger $Time

$Act1 = New-ScheduledTaskAction -Execute Notepad.exe
$Act2 = New-ScheduledTaskAction -Execute Calc.exe

 Set-ScheduledTask "DeployTools" -Action $A1,$A2
 
 
 New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 3)
 
 
 
 
 $action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-NoProfile -WindowStyle Hidden -command "& {stop-process -processname "notepad*"}"' 
$trigger =  New-ScheduledTaskTrigger -Once -At $time -RandomDelay (New-TimeSpan -Seconds 7)
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "My Task" -Description "Task to disable service" 
 
 
 
 
 $Params = @{
  Action = (New-ScheduledTaskAction -Execute 'powershell' -Argument '-NoProfile -WindowStyle Hidden -Command "Stop-Process -Name notepad*"')
  Trigger = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(7))
  TaskName = 'OpenExplorer'
  Description = 'Task to disable service'
}
Register-ScheduledTask @Params
 
 
 
 $trigger.EndBoundary = (Get-Date).AddDays(30).ToString("s")
 
 
 Unregister-ScheduledTask -TaskName 'OpenExplorer' -Confirm:$False
 
 
 
 
 
 
 
 
 
 
 
 
 Action = New-ScheduledTaskAction -Execute "powershell.exe" "-Command Get-Service -Name Tssdis 
 | Where-Object Status -eq Stopped | Restart-Service"
 
 
 New-ScheduledTaskTrigger -Once -At 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


Compare-Object -ReferenceObject $dta -DifferenceObject $dtb

sc a.txt "aaa"
sc b.txt "bbb"
$dta = $ofa.LastWriteTime
$dtb = $ofb.LastWriteTime
$dta
Compare-Object -ReferenceObject $dta -DifferenceObject $dtb
ll




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





