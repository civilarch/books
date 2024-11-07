#! pwsh
# ---------------------------------------- 
# Title         : _gui/test_gui/lib_forms.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240522_225604
# Created by    : Swami Nirav Atasa
# powershell tools/pwsh2/_gui/test_gui/lib_forms.ps1
# . ./lib_forms.ps1
# . C:/_etc/win/ps1/pwsh2/lib/lib_forms.ps1
# ---------------------------------------- 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
using namespace System.Collections
using namespace System.Windows.Forms
using namespace System.Drawing

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





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


