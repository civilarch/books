
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


 
[System.Windows.Forms.Application]::EnableVisualStyles()  

$form = New-Object System.Windows.Forms.Form  
$form.Size = New-Object System.Drawing.Size(650,300)  
$form.StartPosition = 'CenterScreen'  


Function File ($InitialDirectory)  
{  
Add-Type -AssemblyName System.Windows.Forms  
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog  
$OpenFileDialog.Title = "Please Select File"  
$OpenFileDialog.InitialDirectory = $InitialDirectory  
$OpenFileDialog.filter = "All files (*.*)|*.*"  
$openFileDialog.ShowHelp = $true  
If ($OpenFileDialog.ShowDialog() -eq "Cancel")  
{  
[System.Windows.Forms.MessageBox]::Show("No File Selected. Please select a file !", "Error", 0,  
[System.Windows.Forms.MessageBoxIcon]::Exclamation)  
}  
$Global:SelectedFile = $OpenFileDialog.FileName  
Return $SelectedFile #add this return  

}  

$H2textBox2 = New-Object System.Windows.Forms.TextBox  
$H2textBox3 = New-Object System.Windows.Forms.TextBox  

$H1label1 = New-Object System.Windows.Forms.Label  
$H1label1.Location = New-Object System.Drawing.Point(10,40)  
$H1label1.Size = New-Object System.Drawing.Size(100,23)  
$H1label1.Text = 'Kind:'  
$form.Controls.Add($H1label1)  


$H1DropDown = new-object System.Windows.Forms.combobox  
$H1DropDown.Location = new-object System.Drawing.Size(140,40)  
$H1DropDown.Size = new-object System.Drawing.Size(335,30)  
[void] $H1DropDown.Items.Add('File')  
[void] $H1DropDown.Items.Add('Registry')  
$H1DropDown.tabIndex = '0'  
$H1DropDown.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList;  
$H1DropDown.add_SelectedValueChanged(  
{  

if($H1DropDown.SelectedItem -eq 'File')  
{  

$H2label2 = New-Object System.Windows.Forms.Label  
$H2label2.Location = New-Object System.Drawing.Point(10,150)  
$H2label2.Size = New-Object System.Drawing.Size(100,23)  
$H2label2.Text = 'Path:'  
$form.Controls.Add($H2label2)  


$H2textBox2.Location = New-Object System.Drawing.Point(140,149)  
$H2textBox2.Size = New-Object System.Drawing.Size(335,23)  
$form.Controls.Add($H2textBox2)  

$H2label3 = New-Object System.Windows.Forms.Label  
$H2label3.Location = New-Object System.Drawing.Point(10,100)  
$H2label3.Size = New-Object System.Drawing.Size(120,23)  
$H2label3.Text = 'Name:'  
$form.Controls.Add($H2label3)  


$H2textBox3.Location = New-Object System.Drawing.Point(140,100)  
$H2textBox3.Size = New-Object System.Drawing.Size(335,23)  
$H2textBox3.Text = ''  
$H2textBox3.AcceptsReturn = $true  
$form.Controls.Add($H2textBox3)  



$Browse = New-Object System.Windows.Forms.Button  
$Browse.Location = New-Object System.Drawing.Point(500,145)  
$Browse.Size = New-Object System.Drawing.Size(100,23)  
$Browse.Text = 'Browse...'  
$Browse.add_click({$x = File; $H2textBox2.Text = $x|Split-Path; $H2textBox3.Text=$x|Split-Path -leaf})  
$form.Controls.Add($Browse)  


}  
}  
)  

$form.Controls.Add($H1DropDown)  




$cancelButton = New-Object System.Windows.Forms.Button  
$cancelButton.Location = New-Object System.Drawing.Point(490,200)  
$cancelButton.Size = New-Object System.Drawing.Size(75,23)  
$cancelButton.Text = 'Cancel'  
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel  
$form.CancelButton = $cancelButton  
$form.Controls.Add($cancelButton)  


$form.Topmost = $true  

$form.Add_Shown({$form.Activate()})  

$form.ShowDialog()














