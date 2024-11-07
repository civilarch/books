
# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. ui_2_code_Dev.ps1
#. ui_1_code_Release.ps1
# ---------------------------------------- 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


$LE = [PowerShell].Assembly.GetType("Linq.Enumerable")

$sc = "System.ServiceProcess.ServiceController" -as [type]

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# ---------------------------------------- 
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms
# ---------------------------------------- 

# using System.Windows

# $FMS = [System.Windows.Forms]



$msgBox = [System.Windows.MessageBox]

$oWin = New-Object System.Windows.Window

$oWin.Topmost = $true

$ans = $msgBox::Show($oWin,'choice !!', 'Attention', 'YesNo', 'Question', 'Yes')

$ans








