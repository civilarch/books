
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$dataGridView = New-Object System.Windows.Forms.DataGridView
$dataGridView.Size=New-Object System.Drawing.Size(800,400)

$datagridview.ColumnCount = 3
$datagridview.Columns[0].Name = "ID"
$datagridview.Columns[1].Name = "Name"
$datagridview.Columns[2].Name = "Description"



$chk_box_col = New-Object System.Windows.Forms.DataGridViewCheckBoxColumn
$chk_box_col.width = 60
$chk_box_col.name = "check"

$datagridview.Columns.Add($chk_box_col)


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$gps = get-process | select Name, ID, Description | select -f 3

# $gps | Add-Member -MemberType NoteProperty -Name aaa   -Value $false

$gps



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$gps | % {
    $dataGridView.Rows.Add($_.Name, $_.ID, $_.Description, $false )
}

# $list = New-Object System.collections.ArrayList
# $list.AddRange($gps)

# $dataGridView.DataSource = $list



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$form = New-Object System.Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size(900,600)

$form.Controls.Add($dataGridView)

$form.ShowDialog()







