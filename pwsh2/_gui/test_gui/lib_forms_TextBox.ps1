
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# . C:/_etc/win/ps1/pwsh2/lib/lib_forms.ps1
. ./lib_forms.ps1
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

<#
#>

 
function TextBox_mk($x, $y, $w=120, $h=150, $arrStr="") {
    $textbox = [TextBox]::new()
    $textbox.Location = "$x, $y"; $textbox.size = "$w, $h"
    $textbox.Multiline = $True;
    $textbox.Scrollbars = "Vertical" 
    
    # $textbox.Font = [Font]::new("Noto Serif", 12)
    # $textbox.Font = [Font]::new("본명조", 12)
    $textbox.Font = [Font]::new("바탕체", 12)
    # $textbox.Font = [Font]::new("Times New Roman", 12)
    # $textbox.Font = [Font]::new("HY견명조", 12)
    
    $textbox.Lines = $arrStr
    # $textbox.text     = $text
    
    
    # $textbox.Font = [Font]::new("Noto Serif", 12, [FontStyle]::Bold)
    # [void] $textbox.Items.AddRange($arrStr)
    # $listBox.SelectionMode = 'MultiExtended'
    # $textbox.Add_Click({
    #     if ($this.Checked ) { $this.Parent.Tag = $this.Tag } 
    # })
    $textbox
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$sText_a = @"
textbox_a_0
textbox_a_1
textbox_a_2
textbox_a_3
"@
$arr_str_a = get_lines $sText_a  

$sText_b = @"
textbox_b_0
textbox_b_1
textbox_b_2
textbox_b_3
"@

$arr_str_b = get_lines $sText_b  

$textbox_a = TextBox_mk 20  30  120 150 $arr_str_a
$textbox_b = TextBox_mk 160 30  120 150 $arr_str_b

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ---------------------------------------- Constants
$dlg_rt = @{}

$form_w = 350; $form_h = 300
# ---------------------------------------- 

# ------------------ 
$cb_btnOK = {
    $dlg_rt.add('textbox_a', $textbox_a.Text ); $dlg_rt.add('textbox_b', $textbox_b.Text )
    # $dlg_rt.add('textbox_a', $textbox_a.SelectedItems); $dlg_rt.add('textbox_b', $textbox_b.SelectedItems)
    # $dlg_rt.add('textbox_a', ($textbox_a.SelectedIndices)); $dlg_rt.add('textbox_b', ($textbox_b.SelectedIndices))
    # $dlg_rt.add('textbox_a', $textbox_a.SelectedIndex); $dlg_rt.add('textbox_b', $textbox_a.SelectedIndex)
    $dlg_rt.add('text', "textBox.Text")
    $form.Close(); return 1
}

$cb_btnCancel = { $form.Close(); return 0 }

$e_w = 90; $e_h = 30
$e_x = $form_w - 20 - $e_w - 20; $e_y = $form_h - 20 - $e_h - 40
$btnOK = Button_mk $e_x $e_y  $e_w $e_h  "OK"  $cb_btnOK

$e_x = $form_w - 20 - $e_w - 20 - 100; $e_y = $form_h - 20 - $e_h - 40
$btnCancel = Button_mk $e_x $e_y  $e_w $e_h  "Cancel"  $cb_btnCancel
# ------------------ 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$form = Form_mk $form_w $form_h "Form.Text" "centerscreen"   
$form.Controls.AddRange(@($btnOK, $btnCancel))
$form.Controls.AddRange(@($textbox_a, $textbox_b))


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# $form.Add_Shown({$Form.Activate()})
$result =$form.ShowDialog()

$result
$dlg_rt

# ---------------------------------------- 


