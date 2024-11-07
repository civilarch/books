








# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

public partial class MyForm
{
    RadioButton m_radiogroup1Checked = null;

    private void initgrpBox1()
    {
        AddRadioToGroupBox(groupBox1, radioButton1);
        AddRadioToGroupBox(groupBox1, radioButton2);
        AddRadioToGroupBox(groupBox1, radioButton3);
        AddRadioToGroupBox(groupBox1, radioButton4);
        AddRadioToGroupBox(groupBox1, radioButton5);
        AddRadioToGroupBox(groupBox1, radioButton6);
        AddRadioToGroupBox(groupBox1, radioButton7);
        Controls.Add(groupBox1);
    }

    private void AddRadioToGroupBox(GroupBox groupBox, RadioButton radioButton)
    {
        groupBox.Controls.Add(radioButton);
        radioButton.Clicked += new EventHandler(radioGroup1Checked);
    }

    private void radioGroup1_Clicked(object sender, e EventArgs)
    {
        m_radiogroup1Checked = sender as RadioButton;
    }
}


foreach (RadioButton rb in groupBox1.Controls)
           {
               MessageBox.Show(rb.Name);
           }
           
           
           
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
foreach (Control c in groupBox1.Controls)
            {
                if (c.GetType() == typeof(RadioButton))
                {
                    RadioButton rb = c as RadioButton;
                    if (rb.Checked)
                    {
                        MessageBox.Show(rb.Name); 
                    }
                }
            }
            }




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

for($i=0; $i -lt 2; $i++){
    $checkBox_Charts[$i].Add_CheckStateChanged({
    Write-Host "CP2: in Add_CheckStateChanged " + $checkBox_Charts[$i].Checked
    Write-Host $checkBox_Charts[$i]
    Write-Host $i})

}



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$checkChange = {
    # loop through all the forms checkbox controls.
    # the sender object is captured in the automatic variable '$this'
    $form.Controls | Where-Object {$_ -is [System.Windows.Forms.Checkbox]} | ForEach-Object {
        # if this checkbox is checked, disable all others, otherwise
        # set all checkbox controls to Enabled
        $_.Enabled = if ($this.Checked) { ($_ -eq $this) } else { $true }
    }
}

# add the scriptblock to the individual checkbox objects
$CheckBox1.Add_CheckStateChanged($checkChange)
$CheckBox2.Add_CheckStateChanged($checkChange)
$CheckBox3.Add_CheckStateChanged($checkChange)
$CheckBox4.Add_CheckStateChanged($checkChange)



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$objForm.Controls | 
Where-Object { $PSItem -is [System.Windows.Forms.RadioButton] } | 
ForEach-Object { 
    $PSItem.Add_Click( 
    { 
        If (-Not $OKButton.Enabled)
        {$OKButton.Enabled = $True}
    }) 
}


CheckedChanged

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





























