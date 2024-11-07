


powershell gui checkbox



powershell gui  system.windows.forms.textbox  shift enter  new line
powershell gui  System.Windows.Forms.Form  3d look





$textBox..Font = New-Object System.Drawing.Font("Lucida Console", 12, [System.Drawing.FontStyle]::Regular)



var textBox = (TextBox)client.Controls[0];
textBox.Font = new Font(textBox.Font.FontFamily, 16);



$textbox.Add_KeyDown({
  if (($_.Control) -and ($_.KeyCode -eq 'A')) {
     $textbox.SelectAll()
  }
})





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

    private void button1_Click(object sender, EventArgs e)
    {
        string sent = chatBox.Text;

        displayBox.AppendText(sent);
        displayBox.AppendText(Environment.NewLine);

    }
    
    


1..3|%{ 'xxx_{0:d2}' -f $_}
xxx_01
xxx_02
xxx_03






# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 



<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '361,169'
$Form.text                       = "Form"
$Form.TopMost                    = $false

$grpRadio                        = New-Object system.Windows.Forms.Groupbox
$grpRadio.height                 = 94
$grpRadio.width                  = 112
$grpRadio.text                   = "Employee Type"
$grpRadio.location               = New-Object System.Drawing.Point(12,17)

$radiobuttonEmployee             = New-Object system.Windows.Forms.RadioButton
$radiobuttonEmployee.text        = "Employee"
$radiobuttonEmployee.AutoSize    = $true
$radiobuttonEmployee.width       = 104
$radiobuttonEmployee.height      = 20
$radiobuttonEmployee.location    = New-Object System.Drawing.Point(14,21)
$radiobuttonEmployee.Font        = 'Microsoft Sans Serif,10'

$radiobuttonContractor           = New-Object system.Windows.Forms.RadioButton
$radiobuttonContractor.text      = "Contractor"
$radiobuttonContractor.AutoSize  = $true
$radiobuttonContractor.width     = 104
$radiobuttonContractor.height    = 20
$radiobuttonContractor.location  = New-Object System.Drawing.Point(13,56)
$radiobuttonContractor.Font      = 'Microsoft Sans Serif,10'

$usertype                        = New-Object system.Windows.Forms.ComboBox
$usertype.width                  = 100
$usertype.height                 = 20
@('Employee','Contractor') | ForEach-Object {[void] $usertype.Items.Add($_)}
$usertype.location               = New-Object System.Drawing.Point(249,18)
$usertype.Font                   = 'Microsoft Sans Serif,10'
$usertype.DropDownStyle          = 2

$SubmitRadio                     = New-Object system.Windows.Forms.Button
$SubmitRadio.text                = "Submit"
$SubmitRadio.width               = 60
$SubmitRadio.height              = 30
$SubmitRadio.location            = New-Object System.Drawing.Point(26,119)
$SubmitRadio.Font                = 'Microsoft Sans Serif,10'

$SubmitCombo                     = New-Object system.Windows.Forms.Button
$SubmitCombo.text                = "Submit"
$SubmitCombo.width               = 60
$SubmitCombo.height              = 30
$SubmitCombo.location            = New-Object System.Drawing.Point(268,55)
$SubmitCombo.Font                = 'Microsoft Sans Serif,10'

$lblCombo                        = New-Object system.Windows.Forms.Label
$lblCombo.text                   = "Employee Type:"
$lblCombo.AutoSize               = $true
$lblCombo.width                  = 25
$lblCombo.height                 = 10
$lblCombo.location               = New-Object System.Drawing.Point(143,21)
$lblCombo.Font                   = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($grpRadio,$usertype,$SubmitRadio,$SubmitCombo,$lblCombo))
$grpRadio.controls.AddRange(@($radiobuttonEmployee,$radiobuttonContractor))

$SubmitCombo.add_click({
    # Check if combobox has a selected value
    if (-not $usertype.SelectedItem) {
        # No item selected, set font color red and stop processing
        $lblCombo.ForeColor = [System.Drawing.Color]::Red
        return

    } else {
        # Value selected, set font back to black and continue processing
        $lblCombo.ForeColor = [System.Drawing.Color]::Black

        switch ($usertype.SelectedItem.ToString()) {
            "Employee"   { $extAttrib = 'EMP' }
            "Contractor" { $extAttrib = 'CNT' }
        }

        AddLog -Message "Writing extensionAttribute1 attribute for '$($User.SamAccountName)'"
        Set-ADUser -Identity $User -Add @{ extensionAttribute1 = $extAttrib } -Server $ConnectedDomainController

    }
})

$SubmitRadio.add_click({
    # Check if any radio button is selected
    $radioSelection = $grpRadio.Controls.Where({$_.Checked}).Text
    if (-not $radioSelection) {
        # Not selected,  turn font color red and stop processing
        $grpRadio.ForeColor = [System.Drawing.Color]::Red
        return
    } else {
        # Something selected, check font to black and continue processing
        $grpRadio.ForeColor = [System.Drawing.Color]::Black

        switch ($radioSelection) {
            "Employee"   { $extAttrib = 'EMP' }
            "Contractor" { $extAttrib = 'CNT' }
        }

        AddLog -Message "Writing extensionAttribute1 attribute for '$($User.SamAccountName)'"
        Set-ADUser -Identity $User -Add @{ extensionAttribute1 = $extAttrib } -Server $ConnectedDomainController

    }
})

$Form.ShowDialog()

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

    
$apps = @(
"TRADE",
"Schedule Z ReadOnly",
"Schedule Z Update"
)
    
[void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    
$form = New-Object Windows.Forms.Form
$form.text = "Oracle Role Assignments"
$form.top = 10
$form.left = 10
$form.height = (($apps.count+1) * 50) + 20 
$form.width = 450
    
$GBypos = 20
    
foreach ($app in $apps)
{ 
        $Gbox=new-object System.Windows.Forms.GroupBox 
        $Gbox.Name=$app
        $Gbox.Location = New-Object System.Drawing.Point( 10, $GBypos )  
        $Gbox.Size = new-object System.Drawing.Size(350,40)  
        $Gbox.text = $app
        $form.Controls.Add($Gbox) 
        
        #button 1
        $rb=New-Object Windows.Forms.radiobutton
        $rb.Name='Grant'
        $rb.Text='Grant'
        $rb.Location = New-Object System.Drawing.Point(5,15)  
        $rb.Size = new-object System.Drawing.Size(50,15) 
        $Gbox.Controls.Add($rb)
        
        #button2
        $rb2=New-Object Windows.Forms.radiobutton
        $rb2.Name='Revoke'
        $rb2.Text='Revoke'
        $rb2.Location = new-object System.Drawing.Point(85,15)  
        $rb2.Size = new-object System.Drawing.Size(70,15) 
        $Gbox.Controls.Add($rb2)
        #button3
        $rb3=New-Object Windows.Forms.radiobutton
        $rb3.Name='Skip'
        $rb3.Text='Skip'
        $rb3.Location = new-object System.Drawing.Point(155,15)  
        $rb3.Size = new-object System.Drawing.Size(70,15) 
        $Gbox.Controls.Add($rb3)
        
        $GBypos+=50
    
}
$form.showdialog()
    
$form.Controls | select -expand controls | select name,checked
    
#OR
$form.Controls | %{write-host $_.name;$_.controls -fore green}|select checked
    
#OR
    
$form.Controls | %{write-host $_.name -fore green;$_.controls}| %{write-host "`t$($_.Name)->$($_.checked)" -for
e white}
    



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





