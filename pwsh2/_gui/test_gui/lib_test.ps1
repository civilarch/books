
# ---------------------------------------- 
# . ./lib_a_1.ps1
# ---------------------------------------- 



$mainForm = New-Object System.Windows.Forms.Form
$mainForm.StartPosition = 'CenterScreen'
$mainForm.FormBorderStyle = 'Fixed3D'
$mainForm.Text = 'Test'
$mainForm.WindowState = 'Maximized'

$bounds = ($mainForm.CreateGraphics()).VisibleClipBounds.Size

$dataGrid = New-Object System.Windows.Forms.DataGridView
$dataGrid.Size = New-Object System.Drawing.Size(($bounds.Width-20),($bounds.Height-140))
$dataGrid.Location = New-Object System.Drawing.Size(10,60)
$dataGrid.AllowUserToAddRows = $true
$dataGrid.SelectionMode = 0
$dataGrid.MultiSelect = $true
$dataGrid.ReadOnly = $false
$dataGrid.RowHeadersVisible = $false
$dataGrid.ColumnHeadersBorderStyle = 2
$dataGrid.EnableHeadersVisualStyles = $true

$col1 = New-Object System.Windows.Forms.DataGridViewComboBoxColumn
$col1.Name = 'Status'
$col1.HeaderText = 'Status'
$col1.Items.AddRange('Active','Withdraw')

$dataGrid.Columns.Add([System.Windows.Forms.DataGridViewColumn],'Employee')
$dataGrid.Columns.Add($col1)

$dataGrid.Add_EditingControlShowing({
    
    $box = $_.Control -as [System.Windows.Forms.ComboBox]
    
    if($box)
    {
        $dataGrid.EditingControl.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDown
        $dataGrid.EditingControl.AutoCompleteMode = [System.Windows.Forms.AutoCompleteMode]::SuggestAppend
    }
})

$dataGrid.AutoSizeColumnsMode = [System.Windows.Forms.DataGridViewAutoSizeColumnMode]::Fill
#$dataGrid.Columns[-1].AutoSizeMode = [System.Windows.Forms.DataGridViewAutoSizeColumnMode]::Fill

$mainForm.Controls.Add($dataGrid)

#### Begin of DataTable as Source here

$source = @'
Employee,Status
user.example1,Active
user.example2,Withdraw
user.example3,Withdraw
user.example4,Active
'@ | ConvertFrom-Csv

$columns = $source[0].PSobject.Properties.Name

$table = New-Object System.Data.DataTable

foreach($column in $columns)
{
    $i = New-Object System.Data.DataColumn
    $i.DataType = [string]
    $i.ColumnName = $column
    $table.Columns.Add($i)
}

foreach($line in $source)
{
    $row = $table.NewRow()   
    foreach($column in $columns)
    {
        $row.$column = $line.$column
    }
    $table.Rows.Add($row)
}

$dataGrid.DataSource = $table

$mainForm.Add_Shown({ $mainForm.Activate() })
$mainForm.ShowDialog()










