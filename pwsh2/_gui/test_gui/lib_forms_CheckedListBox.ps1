
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


# function get_selected($o_arr) {
#     $selected = @()
#     for ($i=0; $i -lt $o_arr.count; $i++) {
#         if($o_arr.GetSelected($i) -eq $true){ $selected += , $i }
#     }
#     $selected
# }

function CheckedListBox_mk($x, $y, $w=100, $h=200, $arrStr="") {
    $chklbox = [CheckedListBox]::new()
    [void] $chklbox.Items.AddRange($arrStr)
    $chklbox.Location = "$x, $y"; $chklbox.size = "$w, $h"
    $chklbox.CheckOnClick = $true;
    # $chklbox.text     = $text
    # $listBox.SelectionMode = 'MultiExtended'
    $chklbox.Add_Click({
        if ($this.Checked ) { $this.Parent.Tag = $this.Tag } 
    })
    $chklbox
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$sText_a = @"
chklbox_a_0
chklbox_a_1
chklbox_a_2
chklbox_a_3
"@
$arr_str_a = get_lines $sText_a  

$sText_b = @"
chklbox_b_0
chklbox_b_1
chklbox_b_2
chklbox_b_3
"@

$arr_str_b = get_lines $sText_b  

$chklbox_a = CheckedListBox_mk 20  30  120 150 $arr_str_a
$chklbox_b = CheckedListBox_mk 160 30  120 150 $arr_str_b

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ---------------------------------------- Constants
$dlg_rt = @{}

$form_w = 350; $form_h = 300
# ---------------------------------------- 

# ------------------ 
$cb_btnOK = {
    
    oooo $chklbox_a.CheckedIndices
    oooo $chklbox_a.CheckedItems
    
    # $dlg_rt.add('chklbox_a', $chklbox_a.CheckeItems); $dlg_rt.add('chklbox_b', $chklbox_b.CheckeItems)
    $dlg_rt.add('chklbox_a', $chklbox_a.CheckedIndices); $dlg_rt.add('chklbox_b', $chklbox_b.CheckedIndices)
    # $dlg_rt.add('chklbox_a', $chklbox_a.CheckeIndex); $dlg_rt.add('chklbox_b', $chklbox_a.CheckeIndex)
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
$form.Controls.AddRange(@($chklbox_a, $chklbox_b))


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# $form.Add_Shown({$Form.Activate()})
$result =$form.ShowDialog()

$result
$dlg_rt

# ---------------------------------------- 


