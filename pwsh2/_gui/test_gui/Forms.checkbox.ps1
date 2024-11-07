
# ---------------------------------------- 
#. ./lib_a_1.ps1
#. ./lib_a_2.ps1
#. gui_2_code_Dev.ps1
#. gui_1_code_Release.ps1
# ---------------------------------------- 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

 
 
 
$OutputBox = New-Object System.Windows.Forms.textbox
$OutputBox.Text = "Hello World"
$OutputBox.Multiline = $False
$OutputBox.Size = New-Object System.Drawing.Size(100,100)
$OutputBox.Location = new-object System.Drawing.Size(20,80)



$Form = New-Object Windows.Forms.Form
$Form.Text = "Posey's Example GUI"
$Form.Width = 300
$Form.Height = 200
$Form.BackColor="LightBlue"

$Form.Controls.add($OutputBox)
 
$Form.Add_Shown({$Form.Activate()})
$Form.ShowDialog()
 
 