
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
function Form_mk($w, $h, $text="", $startposition="centerscreen") {
    $form = [form]::new(); $Form.width, $Form.height = $w, $h
    $form.text = $text;  $Form.startposition = $startposition
    $form
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$dlg_rt = @{}

$form_w = 300; $form_h = 300

$form = Form_mk $form_w $form_h "Form.Text" "centerscreen"   
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# $form.Controls.AddRange(@($gb_a, $gb_b, $btnOK, $btnCancel))





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# $form.Add_Shown({$Form.Activate()})
$result =$form.ShowDialog()

$result
$dlg_rt





