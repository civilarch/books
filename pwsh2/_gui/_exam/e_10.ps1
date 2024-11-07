<# 
.NAME
    Untitled
.SYNOPSIS
    RadioButtons
#>

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$form_w = 500; $form_h = 600;   $margin_x = 20; $margin_y = 20;
# ------------------ 
$row_num = 0;    $row_h = 30;   $row_intv = 10;
# ------------------ 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size($form_w, $form_h)
$form.StartPosition = 'CenterScreen'
$form.Font = New-Object System.Drawing.Font($form.Font.FontFamily, 12)
$form.TopMost                    = $false


# *********************************************************  $row_num = 1
$row_num = 1;  $o_y = $margin_y + ($row_h + $row_intv) * $row_num ;
# *********************************************************  
$o_x = $margin_x + 0;  $o_w = 400;  $o_h = 80;  

$grpBox1 = New-Object System.Windows.Forms.GroupBox
$grpBox1.Location = New-Object System.Drawing.Point($o_x, $o_y)
$grpBox1.Size     = New-Object System.Drawing.Size($o_w, $o_h)
# $grpBox1.height                = 78
# $grpBox1.width                 = 535
$grpBox1.text                  = "Group Box"


function gui_make_radio( $o_x, $o_y, $text, $val = 0 ){
    $radio = New-Object System.Windows.Forms.RadioButton
    $radio.Text = $text
    $radio.Location = New-Object System.Drawing.Point($o_x, $o_y)
    # $radio.Size     = New-Object System.Drawing.Size($o_w, $o_h)
    $radio.Checked = $val
    $radio
}


# ---------------------------------------- l_
$o_y += 10 
$o_x = $margin_x + 10;  $o_w = 110;  $o_h = 30;

$rad_0 = gui_make_radio ($o_x + $o_w * 0)  34  'rad_0'  1 
$rad_1 = gui_make_radio ($o_x + $o_w * 1)  34  'rad_1'  0 
$rad_2 = gui_make_radio ($o_x + $o_w * 2)  34  'rad_2'  0 


# $rad_0                    = New-Object system.Windows.Forms.RadioButton
# $rad_0.text               = "radioButton"
# $rad_0.AutoSize           = $true
# $rad_0.width              = 104
# $rad_0.height             = 20
# $rad_0.location           = New-Object System.Drawing.Point(25,34)
# $rad_0.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

# $rad_1                    = New-Object system.Windows.Forms.RadioButton
# $rad_1.text               = "radioButton"
# $rad_1.AutoSize           = $true
# $rad_1.width              = 104
# $rad_1.height             = 20
# $rad_1.location           = New-Object System.Drawing.Point(149,36)
# $rad_1.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

# $rad_2                    = New-Object system.Windows.Forms.RadioButton
# $rad_2.text               = "radioButton"
# $rad_2.AutoSize           = $true
# $rad_2.width              = 104
# $rad_2.height             = 20
# $rad_2.location           = New-Object System.Drawing.Point(306,37)
# $rad_2.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$form.controls.AddRange(@($grpBox1))
$grpBox1.controls.AddRange(@($rad_0, $rad_1, $rad_2))


#region Logic 

#endregion

[void]$form.ShowDialog()