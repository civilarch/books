#! pwsh
# ---------------------------------------- 
# Title         : _ing/test_on_class/ud_groupbox.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240521_210333
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh_test/_ing/test_on_class/ud_groupbox.ps1
# ---------------------------------------- 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
using namespace System.Windows.Forms

Add-Type -AssemblyName  System.Windows.Forms

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$form_w = 800; $form_h = 600

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$Form = [form]::new()
$Form.width, $Form.height = $form_w, $form_h
$Form.FormBorderStyle = [FormBorderStyle]::Fixed3D
$Form.Text            = "Form.Text"
$Form.startposition   = "centerscreen"
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function mk_GroupBox($x, $y, $w, $h, $text="") {
    $gb = [GroupBox]::new()
    $gb.Location = '{0},{1}' -f $x, $y
    $gb.size     = '{0},{1}' -f $w, $h
    $gb.text     = $text
    $gb
}

$gb_a = mk_GroupBox 40  30  100 150 "gb_a.text"
$gb_b = mk_GroupBox 160 30  100 150 "gb_b.text"


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


$form.Controls.AddRange(@($gb_a))
# $gb_a.Controls.AddRange(@($rb_a_1, $rb_a_2))

$form.Controls.AddRange(@($gb_b))
# $gb_b.Controls.AddRange(@($rb_b_1, $rb_b_2))



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$Form.Add_Shown({$Form.Activate()})
$dialogResult =$Form.ShowDialog()


