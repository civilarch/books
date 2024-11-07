
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# . C:/_etc/win/ps1/pwsh2/lib/lib_forms.ps1
# . ./lib_forms.ps1
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
using namespace System.Collections
using namespace System.Windows.Forms

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
function Form_mk ($w,$h,$text = "",$startposition = "centerscreen") {
	$form = [form]::new(); $Form.width,$Form.height = $w,$h
	$form.text = $text; $Form.startposition = $startposition
	$form
}


function Button_mk ($x,$y,$w,$h,$text,$cb_btn) {
	$btn = [Button]::new()
	$btn.Location = "$x, $y"; $btn.size = "$w, $h"
	$btn.text = $text
	$btn.Add_Click($cb_btn)
	$btn
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ---------------------------------------- Constants
$dlg_rt = @{}

$form_w = 300; $form_h = 300
# ---------------------------------------- 
# ------------------ 
$cb_btnOK = {
	# $dlg_rt.add('gb_a', $gb_a.Tag); $dlg_rt.add('gb_b', $gb_b.Tag)
	# $dlg_rt.add('text', "textBox.Text")
	$form.Close(); return 1
}

$cb_btnCancel = { $form.Close(); return 0 }

$e_w = 90; $e_h = 30
$e_x = $form_w - 20 - $e_w - 20; $e_y = $form_h - 20 - $e_h - 40
$btnOK = Button_mk $e_x $e_y $e_w $e_h "OK" $cb_btnOK

$e_x = $form_w - 20 - $e_w - 20 - 100; $e_y = $form_h - 20 - $e_h - 40
$btnCancel = Button_mk $e_x $e_y $e_w $e_h "Cancel" $cb_btnCancel
# ------------------ 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$form = Form_mk $form_w $form_h "Form.Text" "centerscreen"
$form.Controls.AddRange(@($btnOK,$btnCancel))
# $form.Controls.AddRange(@($gb_a, $gb_b, $btnOK, $btnCancel))


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# $form.Add_Shown({$Form.Activate()})
$result = $form.ShowDialog()

$result
$dlg_rt

# ---------------------------------------- 


