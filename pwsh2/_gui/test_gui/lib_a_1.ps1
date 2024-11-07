

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing


$form = New-Object System.Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size(900,600)

$gps = get-process | select Name,ID,Description | select -f 3

$gps | Add-Member -MemberType NoteProperty -Name aaa   -Value $false


$list = New-Object System.collections.ArrayList
$list.AddRange($gps)

$dataGridView = New-Object System.Windows.Forms.DataGridView -Property @{
    Size=New-Object System.Drawing.Size(800,400)
    ColumnHeadersVisible = $true
    DataSource = $list
}

$form.Controls.Add($dataGridView)
$form.ShowDialog()






<#


$gps = get-process | select Name,ID,Description,@{n='Memory';e={$_.WorkingSet}}



private void AddOutOfOfficeColumn()
{
    DataGridViewCheckBoxColumn column = new DataGridViewCheckBoxColumn();
    {
        column.HeaderText = ColumnName.OutOfOffice.ToString();
        column.Name = ColumnName.OutOfOffice.ToString();
        column.AutoSizeMode = 
            DataGridViewAutoSizeColumnMode.DisplayedCells;
        column.FlatStyle = FlatStyle.Standard;
        column.ThreeState = true;
        column.CellTemplate = new DataGridViewCheckBoxCell();
        column.CellTemplate.Style.BackColor = Color.Beige;
    }

    DataGridView1.Columns.Insert(0, column);
}


#>








