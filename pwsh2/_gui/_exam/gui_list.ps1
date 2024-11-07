#! pwsh
# ---------------------------------------- 
# Title         : _gui/_exam/gui_get_text.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240419_180417
# Created by    : Swami Nirav Atasa
# powershell tools/powershell2/_gui/_exam/gui_get_text.ps1
# ---------------------------------------- 
$env:PSRUNWAIT = 3


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function gui_make_checkbox( $o_x, $o_y, $text, $val = 0 ){
    $oo = New-Object System.Windows.Forms.CheckBox
    $oo.Location = New-Object System.Drawing.Point($o_x, $o_y)
    # $oo.Size     = New-Object System.Drawing.Size($o_w, $o_h)
    $oo.Text     = $text
    $oo.Checked  = $val
    $oo.AutoSize = $true
    $oo
}


function gui_make_radio( $o_x, $o_y, $text, $val = 0 ){
    $oo = New-Object System.Windows.Forms.RadioButton
    $oo.Location = New-Object System.Drawing.Point($o_x, $o_y)
    # $oo.Size     = New-Object System.Drawing.Size($o_w, $o_h)
    $oo.Text     = $text
    $oo.Checked  = $val
    $oo.AutoSize = $true
    $oo
}


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

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


# *********************************************************  $row_num = 0
$row_num = 0;  $o_y = $margin_y + ($row_h + $row_intv) * $row_num ;
# *********************************************************  
# ---------------------------------------- l_
$o_x = $margin_x + 10;  
$o_w = 99;  # $o_h = 30;  

$check_0 = gui_make_checkbox ($o_x + $o_w * 0)  $o_y  'check_0'  1 
$check_1 = gui_make_checkbox ($o_x + $o_w * 1)  $o_y  'check_1'  0 
$check_2 = gui_make_checkbox ($o_x + $o_w * 2)  $o_y  'check_2'  1 
$check_3 = gui_make_checkbox ($o_x + $o_w * 3)  $o_y  'check_3'  0 

$form.Controls.AddRange(@($check_0, $check_1, $check_2, $check_3 ))


# *********************************************************  $row_num = 1
$row_num = 1;  $o_y = $margin_y + ($row_h + $row_intv) * $row_num ;
# *********************************************************  
$o_x = $margin_x + 0;  $o_w = 400;  $o_h = 60;  

$grpBox = New-Object System.Windows.Forms.GroupBox
$grpBox.Location = New-Object System.Drawing.Point($o_x, $o_y)
$grpBox.Size     = New-Object System.Drawing.Size($o_w, $o_h)
$grpBox.text = "Group of radios"
$grpBox.UseCompatibleTextRendering = $True

$form.controls.add($grpBox)

# ---------------------------------------- l_
$e_y = 22
$e_x = 10;  $o_w = 99;  $o_h = 30;

$rad_0 = gui_make_radio ($e_x + $o_w * 0)  $e_y  'rad_0'  1 
$rad_1 = gui_make_radio ($e_x + $o_w * 1)  $e_y  'rad_1'  0 
$rad_2 = gui_make_radio ($e_x + $o_w * 2)  $e_y  'rad_2'  0 
$rad_3 = gui_make_radio ($e_x + $o_w * 3)  $e_y  'rad_3'  0 

$grpBox.Controls.AddRange(@($rad_0, $rad_1, $rad_2, $rad_3 ))

# *********************************************************  $row_num = 3
$row_num = 3;  $o_y = $margin_y + ($row_h + $row_intv) * $row_num ;
# *********************************************************  
# ---------------------------------------- l_
$o_x = $margin_x + 0;  
$o_w = 400;  $o_h = 30;  

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point($o_x, $o_y)
$label.Size     = New-Object System.Drawing.Size($o_w, $o_h)
$label.Text = 'Please enter the information in the space below:'
$form.Controls.Add($label)

# *********************************************************  $row_num = 4
$row_num = 4;  $o_y = $margin_y + ($row_h + $row_intv) * $row_num ;
# *********************************************************  
# ---------------------------------------- t_
$o_x = $margin_x + 0; 
$o_w = 400;  $o_h = 180;  

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point($o_x, $o_y)
$textBox.Size     = New-Object System.Drawing.Size($o_w, $o_h)
$textBox.AutoSize = $false
$textBox.Multiline = $True;
$textBox.AcceptsReturn = $True;
$textBox.Scrollbars = "Vertical" 

$textBox.Font = New-Object System.Drawing.Font($textBox.Font.FontFamily, 15)

$form.Controls.Add($textBox)



# *********************************************************  $row_num = 8
$row_num = 9;  $o_y = $margin_y + ($row_h + $row_intv) * $row_num ;
# *********************************************************  
# ---------------------------------------- lst_
$o_x = $margin_x + 0;  
$o_w = 160;  $o_h = 120;  

$lstBox = New-Object System.Windows.Forms.ListBox
$lstBox.Location = New-Object System.Drawing.Point($o_x, $o_y)
$lstBox.Size     = New-Object System.Drawing.Size($o_w, $o_h)
$lstBox.AutoSize = $false
$lstBox.SelectionMode = 'MultiExtended'

$lstBox.Items.AddRange((1..7|%{'xxx_{0:d2}' -f $_}))

# $(1..3|%{'xxx_{0:d2}' -f $_})
# $lstBox.Controls.AddRange(@($rad_0, $rad_1, $rad_2, $rad_3 ))

$form.Controls.Add($lstBox)



$o_x = $margin_x + 200;  
$o_w = 160;  $o_h = 120;  

$cbBox = New-Object System.Windows.Forms.Combobox 
$cbBox.Location = New-Object System.Drawing.Point($o_x, $o_y)
$cbBox.Size     = New-Object System.Drawing.Size($o_w, $o_h)
$cbBox.AutoSize = $false
# $cbBox.SelectionMode = 'MultiExtended'

$cbBox.Items.AddRange((1..7|%{'xxx_{0:d2}' -f $_}))

# $(1..3|%{'xxx_{0:d2}' -f $_})
# $cbBox.Controls.AddRange(@($rad_0, $rad_1, $rad_2, $rad_3 ))

$form.Controls.Add($cbBox)





# *********************************************************  bottom
$o_y = $form_h - 40 - $margin_y - $row_h;
# *********************************************************  bottom
# ---------------------------------------- b_ok
$row_num = 6; $o_x = $margin_x + 0;  
$o_w = 75;  $o_h = 30;  

$btnOK = New-Object System.Windows.Forms.Button
$btnOK.Location = New-Object System.Drawing.Point($o_x, $o_y)
$btnOK.Size     = New-Object System.Drawing.Size($o_w, $o_h)
$btnOK.Text = 'OK'
$btnOK.DialogResult = [System.Windows.Forms.DialogResult]::OK
# ------------------ 
$form.AcceptButton = $btnOK
$form.Controls.Add($btnOK)
# ------------------ 
# $Button.Add_Click({$Button_Click})

# ---------------------------------------- b_cancel
$row_num = 6; $o_x = $margin_x + 100; 
$o_w = 75;  $o_h = 30;  

$btnCancel = New-Object System.Windows.Forms.Button
$btnCancel.Location = New-Object System.Drawing.Point($o_x, $o_y)
$btnCancel.Size     = New-Object System.Drawing.Size($o_w, $o_h)
$btnCancel.Text = 'Cancel'
$btnCancel.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
# ------------------ 
$form.CancelButton = $btnCancel
$form.Controls.Add($btnCancel)

# ------------------ 
$form.Topmost = $true
$form.Add_Shown({$textBox.Select()})
# ------------------ 

$textBox.Text = $global:gg_gui_t_a

# ---------------------------------------- run
# ------------------ 
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $global:gg_gui_t_a = $textBox.Text
}




