
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# . C:/_etc/win/ps1/pwsh2/lib/lib_forms.ps1
. ./lib_forms.ps1
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

<#
MultiExtended   3   
Multiple items can be selected, and the user can use the SHIFT, CTRL, and arrow keys to make selections.

MultiSimple 2   
Multiple items can be selected.

None    0   
No items can be selected.

One 1   
Only one item can be selected.


if(listBox1.GetSelected(x) == true)

#>


function get_selected($o_arr) {
    $selected = @()
    for ($i=0; $i -lt $o_arr.count; $i++) {
        if($o_arr.GetSelected($i) -eq $true){ $selected += , $i }
    }
    $selected
}

function ComboBox_mk($x, $y, $w=100, $h=200, $arrStr="", $defIdx=0) {
    $combobox = [ComboBox]::new()
    [void] $combobox.Items.AddRange($arrStr)
    $combobox.Location = "$x, $y"; $combobox.size = "$w, $h"
    $combobox.SelectedIndex = $defIdx
    # $combobox.SelectedText = "--select--"
    
    $combobox.Add_Click({
        if ($this.Checked ) { $this.Parent.Tag = $this.Tag } 
    })
    $combobox
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$sText_a = @"
combobox_a_0
combobox_a_1
combobox_a_2
combobox_a_3
"@
$arr_str_a = get_lines $sText_a  

$sText_b = @"
combobox_b_0
combobox_b_1
combobox_b_2
combobox_b_3
"@

$arr_str_b = get_lines $sText_b  

$combobox_a = ComboBox_mk 20  30  120 30 $arr_str_a
$combobox_b = ComboBox_mk 160 30  120 30 $arr_str_b

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ---------------------------------------- Constants
$dlg_rt = @{}

$form_w = 350; $form_h = 300
# ---------------------------------------- 

# ------------------ 
$cb_btnOK = {
    oooo $combobox_a.SelectedIndex
    oooo $combobox_a.SelectedItem
    oooo $combobox_a.SelectedText
    
    # $dlg_rt.add('combobox_a', $combobox_a.SelectedItem); $dlg_rt.add('combobox_b', $combobox_b.SelectedItem)
    # $dlg_rt.add('combobox_a', $combobox_a.SelectedItems); $dlg_rt.add('combobox_b', $combobox_b.SelectedItems)
    # $dlg_rt.add('combobox_a', ($combobox_a.SelectedIndices)); $dlg_rt.add('combobox_b', ($combobox_b.SelectedIndices))
    $dlg_rt.add('combobox_a', $combobox_a.SelectedIndex); $dlg_rt.add('combobox_b', $combobox_b.SelectedIndex)
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
$form.Controls.AddRange(@($combobox_a, $combobox_b))


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# $form.Add_Shown({$Form.Activate()})
$result =$form.ShowDialog()

$result
$dlg_rt

# ---------------------------------------- 


