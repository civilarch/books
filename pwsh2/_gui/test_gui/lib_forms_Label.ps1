
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# . C:/_etc/win/ps1/pwsh2/lib/lib_forms.ps1
. ./lib_forms.ps1
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



function Label_mk($x, $y, $w, $h, $text="") {
    $label = [Label]::new()
    $label.Location = "$x, $y"; $label.size = "$w, $h"
    $label.text     = $text
    $label
}

function arr_Label_mk($sText, $def_idx=0, $item_w=100, $item_h=22, $cols=1, $rows=999) {
    $aLines = $sText -split "`n"
    $aLines  = ($aLines | ?{ ($_ -notmatch '^\s*$') -and ($_ -notmatch '^\s*#')  } )
    $sta_x = 12; $sta_y = 22; $col = 0; $row = 0;
    
    
    $arr_label = @()
    for ($i=0; $i -lt $aLines.count; $i++)
    {
        $sText = $aLines[$i]
        $col = $i % $cols; $row = $i / $cols;
        $pos_x = $sta_x + $item_w * $col; 
        $pos_y = $sta_y + $item_h * $row; 
        $obj = Label_mk  $pos_x $pos_y  $item_w $item_h  $sText 
        $obj.Tag = $i
        $arr_label += $obj
    }
    $arr_label
}





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$sText_a = @"
label_a_0
label_a_1
label_a_2
label_a_3
"@
$arr_label_a = arr_Label_mk $sText_a  

$sText_b = @"
label_b_0
label_b_1
label_b_2
label_b_3
"@

$arr_label_b = arr_Label_mk $sText_b  

$gb_a = GroupBox_mk 20  30  120 150 "gb_a.text"
$gb_b = GroupBox_mk 160 30  120 150 "gb_b.text"

$gb_a.Controls.AddRange($arr_label_a)
$gb_b.Controls.AddRange($arr_label_b)


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ---------------------------------------- Constants
$dlg_rt = @{}

$form_w = 350; $form_h = 300
# ---------------------------------------- 

# ------------------ 
$cb_btnOK = {
    # $dlg_rt.add('gb_a', $gb_a.Tag); $dlg_rt.add('gb_b', $gb_b.Tag)
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
$form.Controls.AddRange(@($gb_a, $gb_b))


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# $form.Add_Shown({$Form.Activate()})
$result =$form.ShowDialog()

$result
$dlg_rt

# ---------------------------------------- 


