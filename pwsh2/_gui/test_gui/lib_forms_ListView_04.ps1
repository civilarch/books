#region Assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#endregion

#region Appearance
[System.Windows.Forms.Application]::EnableVisualStyles()
#endregion

#region Components
$FormMain = New-Object System.Windows.Forms.Form
$ListViewMain = New-Object System.Windows.Forms.ListView
$ImageListMain = New-Object System.Windows.Forms.ImageList
$ButtonCancel = New-Object System.Windows.Forms.Button
#endregion

#region Forms
$ShowFormMain =
{
    $FormMain.Icon = [Drawing.Icon]::ExtractAssociatedIcon((Get-Process -Id $PID).Path)
    $FormMain.Text = "ListView Test"
    $FormMain.Font = New-Object System.Drawing.Font("MS Sans Serif",8)
    $FormMain.ClientSize = New-Object System.Drawing.Size(330,240)
    $FormMain.StartPosition = "CenterScreen"
    $FormMain.FormBorderStyle = "FixedSingle"
    $FormMain.MaximizeBox = $false
    $FormMain.Add_Load($FormMain_Load)

    $ListViewMain.MultiSelect = $false
    $ListViewMain.LabelWrap = $false
    $ListViewMain.LargeImageList = $ImageListMain
    $ListViewMain.Location = New-Object System.Drawing.Point(10,15)
    $ListViewMain.Size = New-Object System.Drawing.Size(310,150)
    $ListViewMain.View = "Tile"
    $FormMain.Controls.Add($ListViewMain)

    $ImageListMain.TransparentColor = [Drawing.Color]::Transparent
    $ImageListMain.ColorDepth = "Depth32Bit"
    $ImageListMain.ImageSize = New-Object System.Drawing.Size(32,32)
    $ImageListMain.Images.Add(0, [Drawing.Icon]::ExtractAssociatedIcon((Get-Process -Id $PID).Path))
    
    $ButtonCancel.Location = New-Object System.Drawing.Point(245,200)
    $ButtonCancel.Size = New-Object System.Drawing.Size(75,25)
    $ButtonCancel.Text = "Cancel"
    $ButtonCancel.TabIndex = 1
    $ButtonCancel.DialogResult = "Cancel"
    $FormMain.Controls.Add($ButtonCancel)

    [void]$FormMain.ShowDialog()
    $FormMain.Dispose()
}
#endregion

#region Handlers
$FormMain_Load =
{
    $ListViewMain.Items.Add("Test", 0)
}
#endregion

#region Main
Invoke-Command $ShowFormMain
#endregion




