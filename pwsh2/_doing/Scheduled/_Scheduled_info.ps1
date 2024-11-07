# ---------------------------------------- 
# sf   : C:\_usr\prg\pwsh2\Scheduled\_Scheduled.ps1
# Time : Thursday May 16, 2024 22:35:38
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 1






# ------------------ 2


$Params = @{
	Action   = (New-ScheduledTaskAction -Execute 'powershell' -Argument '-NoProfile -WindowStyle Hidden -Command "Stop-Process -Name notepad*"')
	Trigger  = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(3))
	TaskName = 'My Task'
	Description = 'Task to disable service'
}
Register-ScheduledTask @Params
 



$Params = @{
	Action   = (New-ScheduledTaskAction -Execute 'explorer' -Argument "O:")
	Trigger  = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(1))
	TaskName = 'Reopen  vol'
}
Register-ScheduledTask @Params
 



# ------------------ 3



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


 
$Act1 = New-ScheduledTaskAction -Execute 'explorer' -Argument "O:"
$Act2 = New-ScheduledTaskAction -Execute 'Unregister-ScheduledTask' -Argument "-TaskName 'OpenExplorer' -Confirm:$False"
 
$Params = @{
	Action      = $Act1, $Act2
	Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(1))
	TaskName    = 'OpenExplorer'
	Description = 'OpenExplorer Description'
}

Register-ScheduledTask @Params
 
Unregister-ScheduledTask -TaskName 'OpenExplorer' -Confirm:$False
 

-At ([DateTime]::Now.AddMinutes(1)) `


-RepetitionInterval (New-TimeSpan -Hours 1) `
-RepetitionDuration (New-TimeSpan -Days 1)




$RestServer = "SERVER"

$RESTARTDATE=Get-Date
$RESTARTDATE=$RESTARTDATE.AddDays(1)
$RESTARTDATE=$RESTARTDATE.tostring("MM/dd/yyyy")

$OSVersion = Get-WmiObject Win32_OperatingSystem -ComputerName $RestServer
$User= "NT AUTHORITY\SYSTEM"
$TASKNAME = "Restart_Server"
$Action = New-ScheduledTaskAction -Execute 'shutdown.exe' -Argument '-r -t 0'
$Trigger =  New-ScheduledTaskTrigger -Once -At "$RESTARTDATE 4:00:00 AM"

IF ($OSVersion.version -like "6.1.*"){
Invoke-Command -ComputerName $RestServer -ScriptBlock{param($RestServer,$User,$TASKNAME,$RESTARTDATE) schtasks.exe  /create /s $RestServer /f /RU $User /tn $TASKNAME /ST 03:00:00 /SD $RESTARTDATE /SC Once /TR "C:\windows\System32\shutdown.exe -r -t 0 " /RL Highest /V1 /Z} -argumentlist $RestServer,$User,$TASKNAME, $RESTARTDATE}
IF ($OSVersion.version -like "6.3.*"){
Invoke-Command -ComputerName $RestServer -ScriptBlock{param($RestServer, $User, $TASKNAME, $Trigger, $Action) Register-ScheduledTask -TaskName $TASKNAME -Trigger $Trigger -User $User -Action $Action -Description 'Restart Server at 3am after Disk Cleanup' -RunLevel Highest –Force} -argumentlist $RestServer, $User, $TASKNAME, $Trigger, $Action}
IF ($OSVersion.version -notlike "6.3.*" -and $OSVersion.version -notlike "6.1.*"){
Write-Host "Unexpected OS Version:$OSVersion.version"}



	Action      = (New-ScheduledTaskAction -Execute 'explorer' -Argument "/n O:")

# -ArgumentList "/c dir `"%SystemDrive%\Program Files`""


Unregister-ScheduledTask -TaskName 'OpenExplorer' -Confirm:$False
$Params = @{
	Action      = New-ScheduledTaskAction -Execute 'powershell.exe'  -Argument "-ScriptBlock { 
		Start-Process  explorer.exe   -ArgumentList  '/n','O:' ;
	 }"
	Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMilliseconds(1000))
	TaskName    = 'OpenExplorer'
	Description = 'OpenExplorer Description'
}
Register-ScheduledTask @Params


Unregister-ScheduledTask -TaskName 'OpenExplorer' -Confirm:$False
$Params = @{
	Action      = New-ScheduledTaskAction -Execute 'powershell.exe' `
	    -Argument "C:/_etc/win/ps1/pwsh2/_doing/Scheduled/open_explorer_vol.ps1"
	Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMilliseconds(1000))
	TaskName    = 'OpenExplorer'
	Description = 'OpenExplorer Description'
}
Register-ScheduledTask @Params




Unregister-ScheduledTask -TaskName 'OpenExplorer' -Confirm:$False
$Params = @{
	Action      = New-ScheduledTaskAction -Execute 'Start-Process powershell.exe' `
	    -Argument "C:/_etc/win/ps1/pwsh2/_doing/Scheduled/open_explorer_vol.ps1  -PassThru"
	Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMilliseconds(1000))
	TaskName    = 'OpenExplorer'
	Description = 'OpenExplorer Description'
}
Register-ScheduledTask @Params


Unregister-ScheduledTask -TaskName 'OpenExplorer' -Confirm:$False
$Params = @{
	Action      = New-ScheduledTaskAction -Execute 'Start-Process' `
	    -Argument "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "
	Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMilliseconds(1000))
	TaskName    = 'OpenExplorer'
	Description = 'OpenExplorer Description'
}
Register-ScheduledTask @Params















Unregister-ScheduledTask -TaskName 'OpenExplorer' -Confirm:$False
$Params = @{
	Action      = New-ScheduledTaskAction -Execute 'Start-Process' `
	    -Argument "powershell  `"C:\_usr\prg\pwsh2\_doing\Scheduled\open_explorer_vol.ps1`" "
	Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMilliseconds(1000))
	TaskName    = 'OpenExplorer'
	Description = 'OpenExplorer Description'
}
Register-ScheduledTask @Params



-NoNewWindow











Unregister-ScheduledTask -TaskName 'OpenExplorer' -Confirm:$False
$Params = @{
	Action      = New-ScheduledTaskAction -Execute 'explorer.exe' -Argument "/n  O: " ;
	Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMilliseconds(1000))
	TaskName    = 'OpenExplorer'
	Description = 'OpenExplorer Description'
}
Register-ScheduledTask @Params




powershell -Command {
	Start-Process  explorer.exe   -ArgumentList  '/n','O:'
}


powershell -Command {
	Start-Process  explorer.exe   -ArgumentList  '/n','O:'
}





		Unregister-ScheduledTask -TaskName 'OpenExplorer' -Confirm:$False;
















Unregister-ScheduledTask -TaskName 'OpenExplorer' -Confirm:$False


	Settings    = (New-ScheduledTaskSettingsSet -DeleteExpiredTaskAfter "PT0S" )


	Settings    = (New-ScheduledTaskSettingsSet -DeleteExpiredTaskAfter 00:00:02 )


	Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(0.1))


	Settings    = New-ScheduledTaskSettingsSet -Compatibility Win8 -DeleteExpiredTaskAfter 00:00:03

$STa = New-ScheduledTaskAction -Execute 'explorer' -Argument "/n O:"
$STt = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMilliseconds(1000)
$STs = New-ScheduledTaskSettingsSet -Compatibility Win8  
$STName = "OpenExplorer"

Register-ScheduledTask -Action $STa -Trigger $STt -Settings $STs -TaskName $STName `
   -Description 'OpenExplorer Description' 

$TT = Get-ScheduledTask -TaskName $STName
$TT.Author = "DOMAIN\$env:username"
$TT.Triggers[0].StartBoundary = ($schedstart).ToString("yyy-MM-dd'T'HH:mm:ss")
$TT.Triggers[0].EndBoundary = ($schedstart).AddHours(1).ToString("yyyy-MM-dd'T'HH:mm:ss")
$TT.Settings.AllowHardTerminate = $True
$TT.Settings.DeleteExpiredTaskAfter = 'PT0S'
$TT.Settings.ExecutionTimeLimit = 'PT1H'
$TT.Settings.volatile = $False
# $STa = New-ScheduledTaskAction -Execute 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe' -Argument "-ExecutionPolicy Bypass -File C:\scripts\TESTSCRIPT.ps1"

$TT | Set-ScheduledTask -User $schedusername -Password $schedpassword	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



Get-Scheduledtask  'OpenExplorer' | Unregister-ScheduledTask

powershell  Scheduled Task  how to  auto Unregister  


	Settings    = (New-ScheduledTaskSettingsSet -DeleteExpiredTaskAfter (Get-Date).AddSeconds(3) )
	Settings    = New-ScheduledTaskSettingsSet -Compatibility Win8 -DeleteExpiredTaskAfter 00:00:01


TimeSpan.FromSeconds(15);
<#
	Create self-deleting task that reboots the computer at midnight.
#>
$midnight = (Get-date -Hour 0 -Minute 0 -Second 0).AddDays(1)

$taskname = 'Reboot at midnight'
$taskdescription = 'Reboots computer at midnight.'

if (Get-ScheduledTask -TaskName $taskname -ErrorAction SilentlyContinue) {
	Unregister-ScheduledTask -TaskName $taskname -Confirm:$false
}

Register-ScheduledTask -TaskName $taskname -InputObject (
	(
		New-ScheduledTask -Action (
			New-ScheduledTaskAction -Execute 'shutdown.exe' -Argument '/r /f /t 120'
		) -Trigger (
			New-ScheduledTaskTrigger -Once -At $midnight
		) -Settings (
			New-ScheduledTaskSettingsSet -ExecutionTimeLimit (New-TimeSpan -Minutes 20) -DeleteExpiredTaskAfter (New-TimeSpan -Minutes 2) -AllowStartIfOnBatteries
		) -Principal (
			New-ScheduledTaskPrincipal -UserId 'System' -RunLevel Highest
		)
	) | % { $_.Triggers[0].EndBoundary = $midnight.AddMinutes(2).ToString('s') ; $_ } 
)


	# Run through a pipe to set the end boundary of the trigger





 
 
 $trigger.EndBoundary = (Get-Date).AddDays(30).ToString("s")
 
 
 Unregister-ScheduledTask -TaskName 'OpenExplorer' -Confirm:$False
 
 
 



# ------------------ 4



 
 Action = New-ScheduledTaskAction -Execute "powershell.exe" "-Command Get-Service -Name Tssdis 
 | Where-Object Status -eq Stopped | Restart-Service"
 
 
 New-ScheduledTaskTrigger -Once -At 
 
 
 
 


# ------------------ 5





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

// Create a new task definition and assign properties
TaskDefinition td = TaskService.Instance.NewTask();
td.RegistrationInfo.Description = "Test DeleteExpiredTaskAfter";
td.Principal.LogonType = TaskLogonType.InteractiveToken;
td.Settings.DeleteExpiredTaskAfter = TimeSpan.FromSeconds(1);
td.Settings.ExecutionTimeLimit = TimeSpan.FromSeconds(15);

// Add a TimeTrigger 
td.Triggers.Add(new TimeTrigger
{
	StartBoundary = DateTime.Now + TimeSpan.FromSeconds(10),
	EndBoundary = DateTime.Now + TimeSpan.FromSeconds(15)
});

// Add an action that will display a message whenever the trigger fires
td.Actions.Add(new ShowMessageAction("Test DeleteExpiredTaskAfter", "Info"));

// Register the task in the root folder
const string taskName = "Test DeleteExpiredTaskAfter";
TaskService.Instance.RootFolder.RegisterTaskDefinition(taskName, td);



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





