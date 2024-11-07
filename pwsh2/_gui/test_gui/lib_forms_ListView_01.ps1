Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Basic form setup

$form = New-Object System.Windows.Forms.Form
$form.Text = 'NSS New User Setup'
$form.Size = New-Object System.Drawing.Size(600,600)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'Fixed3D'
$form.MaximizeBox = $false

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(200,530)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(325,530)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$label1 = New-Object System.Windows.Forms.Label
$label1.Location = New-Object System.Drawing.Point(310,20)
$label1.Size = New-Object System.Drawing.Size(280,20)
$label1.Text = 'Select user GPO group for drives and settings'
$form.Controls.Add($label1)

$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(10,250)
$label2.Size = New-Object System.Drawing.Size(280,20)
$label2.Text = 'Select user Home Drive location:'
$form.Controls.Add($label2)

$label3 = New-Object System.Windows.Forms.Label
$label3.Location = New-Object System.Drawing.Point(10,20)
$label3.Size = New-Object System.Drawing.Size(210,20)
$label3.Text = 'Enter user name/UID and click "Search"'
$form.Controls.Add($label3)

$label4 = New-Object System.Windows.Forms.Label
$label4.Location = New-Object System.Drawing.Point(10,65)
$label4.Size = New-Object System.Drawing.Size(210,20)
$label4.Text = 'Select User'
$form.Controls.Add($label4)

$label5 = New-Object System.Windows.Forms.Label
$label5.Location = New-Object System.Drawing.Point(10,480)
$label5.Size = New-Object System.Drawing.Size(210,20)
$label5.Text = 'Current Settings:'
$form.Controls.Add($label5)

# List of GPOs

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(310,40)
$listBox.Size = New-Object System.Drawing.Size(260,20)
$listBox.Height = 200

$sText_a = @"
listbox_a_0
listbox_a_1
listbox_a_2
listbox_a_3
"@
$arr_str_a = get_lines $sText_a  

[void] $listbox.Items.AddRange($arr_str_a)

$form.Controls.Add($listBox)

# List of User/UIDs

$UIDlist = New-Object System.Windows.Forms.ListView
$UIDlist.View = 'Details'
$UIDlist.Location = New-Object System.Drawing.Point(10,85)
$UIDlist.Size = New-Object System.Drawing.Size(285,20)
$UIDlist.Height = 155
$UIDlist.Columns.Add('SamAccountName') | Out-Null
$UIDlist.Columns.Add('Name') | Out-Null
$UIDlist.FullRowSelect = $true
$UIDlist.AutoResizeColumns([System.Windows.Forms.ColumnHeaderAutoResizeStyle]::HeaderSize)

$form.Controls.Add($UIDlist)

# List of Home Drive locations

$listView = New-Object System.Windows.Forms.ListView
$listView.View = 'Details'
$listView.Location = New-Object System.Drawing.Point(10,270)
$listView.Size = New-Object System.Drawing.Size(560,15)
$listView.Height = 200
$listView.Columns.Add('HomePath') | Out-Null
$listView.Columns.Add('Usage') | Out-Null
$listView.Columns.Add('Description') | Out-Null

$ValidNewHomes | ForEach {
    $Entry = New-Object System.Windows.Forms.ListViewItem($_.HomePath)
    $Entry.SubItems.Add("Usage") | Out-Null
    $Entry.SubItems.Add("Description") | Out-Null
    $listView.Items.Add($Entry) | Out-Null
}


$listView.AutoResizeColumns([System.Windows.Forms.ColumnHeaderAutoResizeStyle]::ColumnContent)

$form.Controls.Add($listView)

# Add Entry field for userID search

$UIDentry = New-Object System.Windows.Forms.Textbox
$UIDEntry.Location='10,40'
$UIDentry.Size = '200,1000'
$form.Controls.Add($UIDEntry)


$SearchButton = New-Object System.Windows.Forms.Button
$SearchButton.Location = '220,38'
$SearchButton.Size = '75,23'
$SearchButton.Text = 'Search'
# Event handler to handle the button being clicked
$SearchButton.Add_Click({
    $UIDlist.Items.Clear()
    $RequestedUID = $UIDentry.Text
    $PossibleUserList = Validate-User $RequestedUID
    $PossibleUserList | ForEach {
        $UIDresult = New-Object System.Windows.Forms.ListViewItem($_.SamAccountName)
        $UIDresult.SubItems.Add($_.Name) | Out-Null
        $UIDlist.Items.Add($UIDresult) | Out-Null
        $UIDlist.Columns[1].([System.Windows.Forms.ColumnHeaderAutoResizeStyle]::ColumnContent)
    }
})
# $form.Button = $SearchButton
$form.Controls.Add($SearchButton)


$form.Topmost = $true

$result = $form.ShowDialog()


