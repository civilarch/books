 



# $LE = [linq.enumerable]

# $LE::sum($LE::Range(1, 5))


Using Namespace System.Windows.Forms

Add-Type  -AssemblyName  System.Windows.Forms


# $WFXX = [System.Windows.Forms]



# $net = New-Object -ComObject Wscript.Network
# Add-Type -AssemblyName System.Windows.Forms


$Form = New-Object Windows.Forms.Form
$Form.width           = 800
$Form.height          = 600
$Form.FormBorderStyle = [Windows.Forms.FormBorderStyle]::Fixed3D
$Form.Text            = "Form.Text"
$Form.maximumsize     = New-Object Drawing.Size(525,350)
$Form.startposition   = "centerscreen"
 

$gb_a = New-Object Windows.Forms.GroupBox
$gb_a.Location = '40,30'
$gb_a.size     = '100,150'
$gb_a.text     = "gb_a.text"

$rb_a_1 = New-Object Windows.Forms.RadioButton 
$rb_a_1.Location = '20,40'
$rb_a_1.size     = '60,20'
$rb_a_1.Text     = "rb_a_1"

$rb_a_2 = New-Object Windows.Forms.RadioButton 
$rb_a_2.Location = '20,70'
$rb_a_2.size     = '60,20'
$rb_a_2.Text     = "rb_a_2"



$gb_b = New-Object Windows.Forms.GroupBox
$gb_b.Location = '160,30'
$gb_b.size     = '100,150'
$gb_b.text     = "gb_b.text"

$rb_b_1 = New-Object Windows.Forms.RadioButton 
$rb_b_1.Location = '20,40'
$rb_b_1.size     = '60,20'
$rb_b_1.Text     = "rb_b_1"

$rb_b_2 = New-Object Windows.Forms.RadioButton 
$rb_b_2.Location = '20,70'
$rb_b_2.size     = '60,20'
$rb_b_2.Text     = "rb_b_2"





$form.Controls.AddRange(@($gb_a))
$gb_a.Controls.AddRange(@($rb_a_1, $rb_a_2))

$form.Controls.AddRange(@($gb_b))
$gb_b.Controls.AddRange(@($rb_b_1, $rb_b_2))

$Form.Add_Shown({$Form.Activate()})
$dialogResult =$Form.ShowDialog()




 


