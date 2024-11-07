

<# This form was created using POSHGUI.com a free online gui designer for PowerShell
.NAME
Untitled
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form = New-Object system.Windows.Forms.Form
$Form.ClientSize = '400,400'
$Form.text = "Form"
$Form.TopMost = $false

$Label1 = New-Object system.Windows.Forms.Label
$Label1.text = "label"
$Label1.AutoSize = $true
$Label1.width = 25
$Label1.height = 10
$Label1.location = New-Object System.Drawing.Point(5,7)
$Label1.Font = 'Microsoft Sans Serif,10'

$TextBox1 = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline = $false
$TextBox1.width = 382
$TextBox1.height = 20
$TextBox1.location = New-Object System.Drawing.Point(6,35)
$TextBox1.Font = 'Microsoft Sans Serif,10'

$Label2 = New-Object system.Windows.Forms.Label
$Label2.text = "label"
$Label2.AutoSize = $true
$Label2.width = 25
$Label2.height = 10
$Label2.location = New-Object System.Drawing.Point(9,70)
$Label2.Font = 'Microsoft Sans Serif,10'

$CheckBox1 = New-Object system.Windows.Forms.RadioButton
$CheckBox1.text = "Read"
$CheckBox1.AutoSize = $false
$CheckBox1.width = 95
$CheckBox1.height = 20
$CheckBox1.location = New-Object System.Drawing.Point(9,105)
$CheckBox1.Font = 'Microsoft Sans Serif,10'

$CheckBox2 = New-Object system.Windows.Forms.Radiobutton
$CheckBox2.text = "ReadAndExecute"
$CheckBox2.AutoSize = $false
$CheckBox2.width = 150
$CheckBox2.height = 20
$CheckBox2.location = New-Object System.Drawing.Point(9,133)
$CheckBox2.Font = 'Microsoft Sans Serif,10'

$CheckBox3 = New-Object system.Windows.Forms.Radiobutton
$CheckBox3.text = "Write"
$CheckBox3.AutoSize = $false
$CheckBox3.width = 150
$CheckBox3.height = 20
$CheckBox3.location = New-Object System.Drawing.Point(9,162)
$CheckBox3.Font = 'Microsoft Sans Serif,10'

$CheckBox4 = New-Object system.Windows.Forms.Radiobutton
$CheckBox4.text = "Modify"
$CheckBox4.AutoSize = $false
$CheckBox4.width = 150
$CheckBox4.height = 20
$CheckBox4.location = New-Object System.Drawing.Point(9,192)
$CheckBox4.Font = 'Microsoft Sans Serif,10'

$CheckBox5 = New-Object system.Windows.Forms.Radiobutton
$CheckBox5.text = "FullControl"
$CheckBox5.AutoSize = $false
$CheckBox5.width = 150
$CheckBox5.height = 20
$CheckBox5.location = New-Object System.Drawing.Point(9,222)
$CheckBox5.Font = 'Microsoft Sans Serif,10'

#$CheckBox6 = New-Object system.Windows.Forms.CheckBox
#$CheckBox6.text = "checkBox"
#$CheckBox6.AutoSize = $false
#$CheckBox6.width = 150
#$CheckBox6.height = 20
#$CheckBox6.location = New-Object System.Drawing.Point(9,253)
#$CheckBox6.Font = 'Microsoft Sans Serif,10'

$Button1 = New-Object system.Windows.Forms.Button
$Button1.text = "Create Log File"
$Button1.width = 375
$Button1.height = 30
$Button1.location = New-Object System.Drawing.Point(8,285)
$Button1.Font = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($Label1,$TextBox1,$Label 2,$CheckBox1,$CheckBox2,$CheckBox3,$CheckBox4,$Che ckBox5,$Button1))

$CheckBox1.Add_Click({ $combo = "Read" })
$CheckBox2.Add_Click({ $combo = "ReadAndExecute" })
$CheckBox3.Add_Click({ $combo = "Write" })
$CheckBox4.Add_Click({ $combo = "Modify" })
$CheckBox5.Add_Click({ $combo = "FullControl" })

Write-Host $combo

$DirPath = "d:\test"
$LogPath = "d:\test\FolderPermissions.csv"

$Button1.Add_Click({
    $DirPath = "d:\test"
    $LogPath = "d:\test\FolderPermissions.csv"
    $HomeFolders = Get-ChildItem d:\test\ -Directory
    foreach ($HomeFolder in $HomeFolders) {
        $Path = $HomeFolder.FullName
        $Acl = (Get-Item $Path).GetAccessControl('Access')
        $Username = $HomeFolder.Name
        $Ar = New-Object System.Security.AccessControl.FileSystemAccessRule ($Username,$combo,'ContainerInherit,ObjectInherit' , 'None', 'Allow')
        $Acl.SetAccessRule($Ar)
        #$acl.RemoveAccessRule($Ar)
        Set-Acl -path $Path -AclObject $Acl
    }
    $FolderPath = dir -Directory -Path $DirPath -Recurse -Force
    $Report = @()
    Foreach ($Folder in $FolderPath) {
        $Acl = Get-Acl -Path $Folder.FullName
        foreach ($Access in $acl.Access)
        {
            $Properties = [ordered]@{'FolderName'=$Folder.FullName;'AD
            Group or
            User'=$Access.IdentityReference;'Permissions'=$Acc ess.FileSystemRights;'Inherited'=$Access.IsInherit ed}
            $Report += New-Object -TypeName PSObject -Property $Properties
        }
    }
    $Report | Export-Csv -path $LogPath



    #Write your logic code here


})

[void]$Form.ShowDialog()