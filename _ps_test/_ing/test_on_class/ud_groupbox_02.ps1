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

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

function Form_mk($w, $h, $text="", $startposition="centerscreen") {
    $form = [form]::new(); $Form.width, $Form.height = $w, $h
    $form.text = $text;  $Form.startposition = $startposition
    $form
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
        if ($i -eq $def_idx) { $obj.Checked = $true }
        $arr_radio += $obj
    }
    $arr_radio
}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$arr_Radio_a = arr_RadioButton_mk @"
rb_a_0
rb_a_1
rb_a_2
rb_a_3
"@

$arr_Radio_b = arr_RadioButton_mk  @"
rb_b_0
rb_b_1
rb_b_2
rb_b_3
"@

$gb_a = GroupBox_mk 40  30  100 150 "gb_a.text"
$gb_b = GroupBox_mk 160 30  100 150 "gb_b.text"

$gb_a.Controls.AddRange($arr_Radio_a)
$gb_b.Controls.AddRange($arr_Radio_b)

# ---------------------------------------- 
# ------------------ 
$form_w = 800; $form_h = 600
$Form = Form_mk $form_w $form_h "Form.Text" "centerscreen"   

$form.Controls.AddRange(@($gb_a, $gb_b))

# ------------------ 
# ------------------ 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$Form.Add_Shown({$Form.Activate()})
$result =$Form.ShowDialog()

$result


<#

function GroupBox_set_radio($gb, $arr_radio, $idx_def = 0) {
    $gb = [GroupBox]::new()
    $gb.Location = "$x, $y"; $gb.size = "$w, $h"
    $gb.text     = $text
    $gb
}


#>