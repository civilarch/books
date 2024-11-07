

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



# ---------------------------------------- 

$button_click = {
    write-host "hi Sahar"

}



# ---------------------------------------- form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

# ---------------------------------------- b_ok
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
# ------------------ 
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)
# ------------------ 
# $Button.Add_Click({$Button_Click})

# ---------------------------------------- b_cancel
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
# ------------------ 
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

# ---------------------------------------- b_

# ---------------------------------------- t_
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

# ---------------------------------------- t_

# ---------------------------------------- t_

# ---------------------------------------- l_
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please enter the information in the space below:'
$form.Controls.Add($label)

# ---------------------------------------- l_

# ---------------------------------------- l_

# ------------------ 
$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $textBox.Text
    $x
}


# ---------------------------------------- run




