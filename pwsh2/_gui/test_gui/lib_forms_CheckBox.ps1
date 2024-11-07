
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# . C:/_etc/win/ps1/pwsh2/lib/lib_forms.ps1
. ./lib_forms.ps1
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



function CheckBox_mk($x, $y, $w, $h, $text="") {
    $chkbox = [CheckBox]::new()
    $chkbox.Location = "$x, $y"; $chkbox.size = "$w, $h"
    $chkbox.text     = $text
    $chkbox
}

function arr_CheckBox_mk($sText, $def_idx=0, $item_w=100, $item_h=22, $cols=1, $rows=999) {
    $aLines = $sText -split "`n"
    $aLines  = ($aLines | ?{ ($_ -notmatch '^\s*$') -and ($_ -notmatch '^\s*#')  } )
    $sta_x = 12; $sta_y = 22; $col = 0; $row = 0;
    
    
    $arr_chkbox = @()
    for ($i=0; $i -lt $aLines.count; $i++)
    {
        $sText = $aLines[$i]
        $col = $i % $cols; $row = $i / $cols;
        $pos_x = $sta_x + $item_w * $col; 
        $pos_y = $sta_y + $item_h * $row; 
        $obj = CheckBox_mk  $pos_x $pos_y  $item_w $item_h  $sText 
        $obj.Tag = $i
        $obj.Add_Click({
            if ($this.Checked ) { $this.Parent.Tag = $this.Tag } 
        })
        if ($i -eq $def_idx) { $obj.Checked = $true }
        $arr_chkbox += $obj
    }
    $arr_chkbox
}





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$sText_a = @"
chkbok_a_0
chkbok_a_1
chkbok_a_2
chkbok_a_3
"@
$arr_chkbox_a = arr_CheckBox_mk $sText_a  

$sText_b = @"
chkbok_b_0
chkbok_b_1
chkbok_b_2
chkbok_b_3
"@

$arr_chkbox_b = arr_CheckBox_mk $sText_b  

$gb_a = GroupBox_mk 20  30  120 150 "gb_a.text"
$gb_b = GroupBox_mk 160 30  120 150 "gb_b.text"

$gb_a.Controls.AddRange($arr_chkbox_a)
$gb_b.Controls.AddRange($arr_chkbox_b)


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# ---------------------------------------- Constants
$dlg_rt = @{}

$form_w = 350; $form_h = 300
# ---------------------------------------- 

# ------------------ 
$cb_btnOK = {
    $gb_a.Tag = [int[]]($gb_a.Controls | ? Checked | % Tag)
    $gb_b.Tag = [int[]]($gb_b.Controls | ? Checked | % Tag)
    
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


