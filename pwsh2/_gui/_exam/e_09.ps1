<# 
.NAME
    Untitled
.SYNOPSIS
    RadioButtons
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(582,318)
$Form.text                       = "Form"
$Form.TopMost                    = $false

$Groupbox1                       = New-Object system.Windows.Forms.Groupbox
$Groupbox1.height                = 78
$Groupbox1.width                 = 535
$Groupbox1.text                  = "Group Box"
$Groupbox1.location              = New-Object System.Drawing.Point(13,57)

$RadioButton1                    = New-Object system.Windows.Forms.RadioButton
$RadioButton1.text               = "radioButton"
$RadioButton1.AutoSize           = $true
$RadioButton1.width              = 104
$RadioButton1.height             = 20
$RadioButton1.location           = New-Object System.Drawing.Point(25,34)
$RadioButton1.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$RadioButton2                    = New-Object system.Windows.Forms.RadioButton
$RadioButton2.text               = "radioButton"
$RadioButton2.AutoSize           = $true
$RadioButton2.width              = 104
$RadioButton2.height             = 20
$RadioButton2.location           = New-Object System.Drawing.Point(149,36)
$RadioButton2.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$RadioButton3                    = New-Object system.Windows.Forms.RadioButton
$RadioButton3.text               = "radioButton"
$RadioButton3.AutoSize           = $true
$RadioButton3.width              = 104
$RadioButton3.height             = 20
$RadioButton3.location           = New-Object System.Drawing.Point(306,37)
$RadioButton3.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Form.controls.AddRange(@($Groupbox1))
$Groupbox1.controls.AddRange(@($RadioButton1,$RadioButton2,$RadioButton3))


#region Logic 

#endregion

[void]$Form.ShowDialog()