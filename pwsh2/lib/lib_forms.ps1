#! pwsh
# ---------------------------------------- 
# Title         : pwsh2/lib/lib_forms.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240522_051622
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh2/lib/lib_forms.ps1
# . C:/_etc/win/ps1/pwsh2/lib/lib_forms.ps1
# ---------------------------------------- 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
using namespace System.Collections
using namespace System.Windows.Forms

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function Form_mk($w, $h, $text="", $startposition="centerscreen") {
    $form = [form]::new(); $Form.width, $Form.height = $w, $h
    $form.text = $text;  $Form.startposition = $startposition
    $form
}


function Button_mk($x, $y, $w, $h, $text, $cb_btn) {
    $btn = [Button]::new()
    $btn.Location = "$x, $y"; $btn.size = "$w, $h"
    $btn.text     = $text
    $btn.Add_Click( $cb_btn )
    $btn
}

function GroupBox_mk($x, $y, $w, $h, $text="", $idx_def = 0) {
    $gb = [GroupBox]::new()
    $gb.Location = "$x, $y"; $gb.size = "$w, $h"
    $gb.text     = $text
    $gb
}


function GroupBox_set_radio($gb, $arr_radio, $idx_def = 0) {
    $gb = [GroupBox]::new()
    $gb.Location = "$x, $y"; $gb.size = "$w, $h"
    $gb.text     = $text
    $gb
}



function RadioButton_mk($x, $y, $w, $h, $text="") {
    $radio = [RadioButton]::new()
    $radio.Location = "$x, $y"; $radio.size = "$w, $h"
    $radio.text     = $text
    $radio
}

function arr_RadioButton_mk($sText, $def_idx=0, $item_w=60, $item_h=22, $cols=1, $rows=999) {
    $aLines = $sText -split "`n"
    $aLines  = ($aLines | ?{ ($_ -notmatch '^\s*$') -and ($_ -notmatch '^\s*#')  } )
    $sta_x = 12; $sta_y = 22; $col = 0; $row = 0;
    
    
    $arr_radio = @()
    for ($i=0; $i -lt $aLines.count; $i++)
    {
        $sText = $aLines[$i]
        $col = $i % $cols; $row = $i / $cols;
        $pos_x = $sta_x + $item_w * $col; 
        $pos_y = $sta_y + $item_h * $row; 
        $obj = RadioButton_mk  $pos_x $pos_y  $item_w $item_h  $sText
        $obj.Tag = $i
        $obj.Add_Click({
            if ($this.Checked ) { $this.Parent.Tag = $this.Tag } 
        })
        if ($i -eq $def_idx) { $obj.Checked = $true }
        $arr_radio += $obj
    }
    $arr_radio
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

<#


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


# ---------------------------------------- 
$form_w = 300; $form_h = 300

$form = Form_mk $form_w $form_h "Form.Text" "centerscreen"   

$form.Controls.AddRange(@($gb_a, $gb_b))

# ------------------ 

$dlg_rt = @{}

$cb_btnOK = {
    $form.Close();
    
    # for ($i=0; $i -lt $arr_Radio_a.count; $i++) {
    #     if($arr_Radio_a[$i].Checked){$dlg_rt.add('gb_a', $i); break}
    # }
    # for ($i=0; $i -lt $arr_Radio_b.count; $i++) {
    #     if($arr_Radio_b[$i].Checked){$dlg_rt.add('gb_b', $i); break}
    # }
    
    $dlg_rt.add('gb_a', $gb_a.Tag)
    $dlg_rt.add('gb_b', $gb_b.Tag)
    $dlg_rt.add('text', "textBox.Text")
    return 1 
}

$cb_btnCancel = {
    $form.Close();
    return 0 
}

$e_w = 90; $e_h = 30
$e_x = $form_w - 20 - $e_w - 20; $e_y = $form_h - 20 - $e_h - 40
$btnOK = Button_mk $e_x $e_y  $e_w $e_h  "OK"  $cb_btnOK

$e_x = $form_w - 20 - $e_w - 20 - 100; $e_y = $form_h - 20 - $e_h - 40
$btnCancel = Button_mk $e_x $e_y  $e_w $e_h  "Cancel"  $cb_btnCancel

# $btnOK.Add_Click = $cb_btnOK

$form.Controls.Add($btnOK)
$form.Controls.Add($btnCancel)


# ------------------ 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$form.Add_Shown({$Form.Activate()})
$result =$form.ShowDialog()

$result
$dlg_rt


#>
