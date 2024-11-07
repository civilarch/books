
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

function ListView_mk($x, $y, $w=100, $h=200, $arrStr="") {
    $listview = [ListView]::new()
    [void] $listview.Items.AddRange($arrStr)
    $listview.Location = "$x, $y"; $listview.size = "$w, $h"
    # $listview.text     = $text
    $listBox.SelectionMode = 'MultiExtended'
    $listview.Add_Click({
        if ($this.Checked ) { $this.Parent.Tag = $this.Tag } 
    })
    $listview
}

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$sText_a = @"
listview_a_0
listview_a_1
listview_a_2
listview_a_3
"@
$arr_str_a = get_lines $sText_a  

$sText_b = @"
listview_b_0
listview_b_1
listview_b_2
listview_b_3
"@

$arr_str_b = get_lines $sText_b  

$listview_a = ListView_mk 20  30  120 150 $arr_str_a
$listview_b = ListView_mk 160 30  120 150 $arr_str_b

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ---------------------------------------- Constants
$dlg_rt = @{}

$form_w = 350; $form_h = 300
# ---------------------------------------- 

# ------------------ 
$cb_btnOK = {
    # $dlg_rt.add('listview_a', $listview_a.SelectedItem); $dlg_rt.add('listview_b', $listview_b.SelectedItem)
    # $dlg_rt.add('listview_a', $listview_a.SelectedItems); $dlg_rt.add('listview_b', $listview_b.SelectedItems)
    $dlg_rt.add('listview_a', ($listview_a.SelectedIndices)); $dlg_rt.add('listview_b', ($listview_b.SelectedIndices))
    # $dlg_rt.add('listview_a', $listview_a.SelectedIndex); $dlg_rt.add('listview_b', $listview_a.SelectedIndex)
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
$form.Controls.AddRange(@($listview_a, $listview_b))


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# $form.Add_Shown({$Form.Activate()})
$result =$form.ShowDialog()

$result
$dlg_rt

# ---------------------------------------- 


