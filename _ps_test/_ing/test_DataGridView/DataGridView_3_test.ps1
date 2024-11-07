
. C:/_etc/win/ps1/pwsh2/lib/lib_forms.ps1

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$dataGridView = New-Object DataGridView
$dataGridView.Size=New-Object System.Drawing.Size(800,400)


$chk_box_col = New-Object DataGridViewCheckBoxColumn
$chk_box_col.width = 60
$chk_box_col.name = "check"

$datagridview.Columns.Add($chk_box_col)

# $datagridview.ColumnCount = 4
# $datagridview.Columns[0] = $chk_box_col
# $datagridview.Columns.Add("check",       [Boolean])
$datagridview.Columns.Add("ID",          [String])
$datagridview.Columns.Add("Name",        [String])
$datagridview.Columns.Add("Description", [String])


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$gps = get-process | select Name, ID, Description | select -f 3

# $gps | Add-Member -MemberType NoteProperty -Name aaa   -Value $false

$gps



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$gps | % {
    $dataGridView.Rows.Add(  $false, $_.Name, $_.ID, $_.Description )
}

# $list = New-Object System.collections.ArrayList
# $list.AddRange($gps)

# $dataGridView.DataSource = $list



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$form = New-Object Form
$form.Size = New-Object System.Drawing.Size(900,600)

$form.Controls.Add($dataGridView)

$form.ShowDialog()







