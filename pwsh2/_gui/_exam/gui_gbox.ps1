#! pwsh
# ---------------------------------------- 
$env:PSRUNWAIT = 3


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
# ---------------------------------------- form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size($form_w, $form_h)
$form.StartPosition = 'CenterScreen'
$form.Font = New-Object System.Drawing.Font($form.Font.FontFamily, 12)
$form.TopMost                    = $false


# *********************************************************  $row_num = 1
$row_num = 1;  $o_y = $margin_y + ($row_h + $row_intv) * $row_num ;
# *********************************************************  
$o_x = $margin_x + 0;  $o_w = 400;  $o_h = 60;  

$grpBox = New-Object System.Windows.Forms.GroupBox
$grpBox.Location = New-Object System.Drawing.Point($o_x, $o_y)
$grpBox.Size     = New-Object System.Drawing.Size($o_w, $o_h)
$grpBox.text = "Group of radios"
# $grpBox.UseCompatibleTextRendering = $True
$form.controls.add($grpBox)


function gui_make_radio( $o_x, $o_y, $text, $val = 0 ){
    $radio = New-Object System.Windows.Forms.RadioButton
    $radio.Location = New-Object System.Drawing.Point($o_x, $o_y)
    # $radio.Size     = New-Object System.Drawing.Size($o_w, $o_h)
    $radio.Text = $text
    $radio.Checked = $val
    $radio
}



# ---------------------------------------- l_
$o_y += 10 
$o_x = $margin_x + 10;  $o_w = 110;  $o_h = 30;

$rad_0 = gui_make_radio ($o_x + $o_w * 0)  $o_y  'rad_0'  1 
# $form.Controls.Add($rad_0)

$rad_1 = gui_make_radio ($o_x + $o_w * 1)  $o_y  'rad_1'  0 
# $form.Controls.Add($rad_1)

# $rad_2 = gui_make_radio ($o_x + $o_w * 2)  $o_y  'rad_2'  0 
# $form.Controls.Add($rad_2)

# $rad_3 = gui_make_radio ($o_x + $o_w * 3)  $o_y  'rad_3'  0 y
# $form.Controls.Add($rad_3)

# $form.controls.add($grpBox)

$grpBox.Controls.AddRange(@($rad_0, $rad_1 ))


# ---------------------------------------- run
# ------------------ 
[void]$form.ShowDialog()




