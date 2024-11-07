


$sc = "System.ServiceProcess.ServiceController" -as [type]

# [reflection.assembly]::GetAssembly($sc) | Get-Member


# [System.ServiceProcess.ServiceController]







# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ::  .NET Framework Class Library 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



New-Object -TypeName System.Diagnostics.EventLog
New-Object           System.Diagnostics.EventLog

# New-Object -TypeName System.Diagnostics.EventLog -ArgumentList Application


$AppLog = New-Object -TypeName System.Diagnostics.EventLog -ArgumentList Application



[DateTime]::ParseExact($germanDate,'dd.MM.yyyy',[Globalization.CultureInfo]::InvariantCulture)


$lazyList = New-Object System.Collections.ArrayList
$lazyList.Add("a")
$lazyList.Add("c")
$lazyList.Add("b")
$lazyList #returns a c b
$lazyList.Sort()


$safeList = New-Object System.Collections.Generic.List[int]
$safeList.Add(1)
$safeList.Add(3)
$safeList.Add(2)
$safeList #returns 1 3 2
$safeList.Sort()
$safeList #returns 1 2 3


$empl_dict = New-Object -TypeName 'System.Collections.Generic.Dictionary[int,string]'
$empl_dict.Add(1,'Alf, Melmug') #Adding items to the dictionary
$empl_dict.Add(2,'Berta, Banana')
$empl_dict.Add(3,'Conan, TheDetective')
$empl_dict #retrieving the whole dictionary
$empl_dict.Item(2) #Returns Berta, Banana
$empl_dict.ContainsValue('Alf, Melmug') #Returns $true


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ::  COM
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

<#

New-Object -ComObject WScript.Shell
New-Object -ComObject WScript.Network
New-Object -ComObject Scripting.Dictionary
New-Object -ComObject Scripting.FileSystemObject


$WshShell = New-Object -ComObject WScript.Shell
$lnk = $WshShell.CreateShortcut("$HOME\Desktop\PSHome.lnk")



$xl = New-Object -ComObject Excel.Application -Strict



#>
















