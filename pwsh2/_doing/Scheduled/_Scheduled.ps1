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
	Action      = (New-ScheduledTaskAction -Execute 'explorer' -Argument "O:")
	Trigger     = (New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(1))
	TaskName    = 'OpenExplorer'
	Description = 'OpenExplorer Description'
}

Register-ScheduledTask @Params
 
Unregister-ScheduledTask -TaskName 'OpenExplorer' -Confirm:$False



# ------------------ 3






# ------------------ 4






# ------------------ 5





