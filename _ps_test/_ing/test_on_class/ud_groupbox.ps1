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

. C:/_etc/win/ps1/pwsh2/lib/lib_forms.ps1

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$sText_a = @"
rb_a_0
rb_a_1
rb_a_2
rb_a_3
"@
$arr_Radio_a = arr_RadioButton_mk $sText_a  

$sText_b = @"
rb_b_0
rb_b_1
rb_b_2
rb_b_3
"@

$arr_Radio_b = arr_RadioButton_mk $sText_b  

$gb_a = GroupBox_mk 40  30  100 150 "gb_a.text"
$gb_b = GroupBox_mk 160 30  100 150 "gb_b.text"

$gb_a.Controls.AddRange($arr_Radio_a)
$gb_b.Controls.AddRange($arr_Radio_b)

# ------------------ 
$form_w = 300; $form_h = 300

$dlg_rt = @{}

$cb_btnOK = {
    $dlg_rt.add('gb_a', $gb_a.Tag); $dlg_rt.add('gb_b', $gb_b.Tag)
    $dlg_rt.add('text', "textBox.Text")
    $form.Close(); return 1
}

$cb_btnCancel = { $form.Close(); return 0 }

$e_w = 90; $e_h = 30
$e_x = $form_w - 20 - $e_w - 20; $e_y = $form_h - 20 - $e_h - 40
$btnOK = Button_mk $e_x $e_y  $e_w $e_h  "OK"  $cb_btnOK

$e_x = $form_w - 20 - $e_w - 20 - 100; $e_y = $form_h - 20 - $e_h - 40
$btnCancel = Button_mk $e_x $e_y  $e_w $e_h  "Cancel"  $cb_btnCancel

$form = Form_mk $form_w $form_h "Form.Text" "centerscreen"   
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$form.Controls.AddRange(@($gb_a, $gb_b, $btnOK, $btnCancel))
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# $form.Add_Shown({$Form.Activate()})
$result =$form.ShowDialog()

$result
$dlg_rt

