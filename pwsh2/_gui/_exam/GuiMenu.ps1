Remove-Variable * -ErrorAction SilentlyContinue
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()
$Font			= 'Microsoft Sans Serif,8'
$FontConsole	= 'Lucida Console,8'

#region Functions to create Elements 
Function Add-Button($Button,$ButtonName,$ButtonText,$ButtonLeft,$ButtonTop,$ButtonWidth175,$ButtonHeight25,$FormObject,$ButtonEnabled,$ButtonVisible)
{
	$Button				= New-Object System.Windows.Forms.Button
	$Button.Location	= New-Object System.Drawing.Size($ButtonLeft,$ButtonTop)
	$Button.Size		= New-Object System.Drawing.Size($ButtonWidth175,$ButtonHeight25)
	$Button.Text		= $ButtonText
	$Button.Font		= $Font
	$Button.Name		= $ButtonName
	$Button.Enabled		= $ButtonEnabled
	$Button.Visible		= $ButtonVisible
	$FormObject.Controls.Add($Button) 
	$Button
}

Function Add-CheckBox($CheckBox,$CheckBoxText,$CheckBoxLeft,$CheckBoxTop,$CheckBoxWidth,$CheckBoxHeight,$FormObject)
{
	$CheckBox			= New-Object System.Windows.Forms.Checkbox
	$CheckBox.Location	= New-Object System.Drawing.Size($CheckBoxLeft,$CheckBoxTop)
	$CheckBox.Size		= New-Object System.Drawing.Size($CheckBoxWidth,$CheckBoxHeight)
	$CheckBox.Text		= $CheckBoxText
	$CheckBox.Checked	= $False
	$FormObject.Controls.Add($CheckBox)
	$CheckBox
}

Function Add-DateTimePicker($DateTimePicker,$Left,$Top,$Width,$Height,$FormObject)
{
	$DateTimePicker				= New-Object System.Windows.Forms.DateTimePicker 
	$DateTimePicker.Location	= New-Object System.Drawing.Size($Left,$Top) 
	$DateTimePicker.Size		= New-Object System.Drawing.Size($Width,$Height) 
	$FormObject.Controls.Add($DateTimePicker) 
	$DateTimePicker
}

Function Add-DropdownBox($DropdownBox,$DropDownHeight,$DropdownBoxLeft,$DropdownBoxTop,$DropdownBoxWidth,$DropdownBoxHeight,$FormObject,$DropdownVisible)
{
	$DropdownBox				= New-Object System.Windows.Forms.ComboBox
	$DropdownBox.Location		= New-Object System.Drawing.point($DropdownBoxLeft,$DropdownBoxTop)
	$DropdownBox.Size			= New-Object System.Drawing.Size($DropdownBoxWidth,$DropdownBoxHeight)
	$DropDownBox.DropDownHeight = $DropDownHeight
	$DropDownBox.visible 		= $DropdownVisible
	$FormObject.Controls.Add($DropdownBox)
	$DropdownBox
}

Function Add-GroupBox($GroupBox,$GroupBoxText,$GroupBoxLeft,$GroupBoxTop,$GroupBoxWidth,$GroupBoxHeight,$FormObject,$GroupBoxVisible)
{
	$GroupBox			= New-Object System.Windows.Forms.GroupBox
	$GroupBox.Location	= New-Object System.Drawing.Size($GroupBoxLeft,$GroupBoxTop)
	$GroupBox.Size		= New-Object System.Drawing.Size($GroupBoxWidth,$GroupBoxHeight)
	$GroupBox.Text		= $GroupBoxText
	$GroupBox.Font		= $Font
	$GroupBox.Visible	= $GroupBoxVisible
	$FormObject.Controls.Add($GroupBox)
	$GroupBox
}

Function Add-Label($Label,$LabelText,$LabelLeft,$LabelTop,$LabelWidth,$LabelHeight,$LabelAnchor,$FormObject,$LabelVisible)
{
	$Label			= New-Object System.Windows.Forms.Label
	$Label.Location	= New-Object System.Drawing.Size($LabelLeft,$LabelTop)
	$Label.Size		= New-Object System.Drawing.Size($LabelWidth,$LabelHeight)
	$Label.Text		= $LabelText
	$Label.Font		= $Font
	$Label.visible	= $LabelVisible
	$FormObject.Controls.Add($Label)
	$Label
}

Function Add-ListBox($ListBox,$Left,$Top,$Width,$Height,$LBHeight,$FormObject)
{
	$ListBox			= New-Object System.Windows.Forms.ListBox
	$ListBox.Location	= New-Object System.Drawing.Size($Left,$Top) 
	$ListBox.Size		= New-Object System.Drawing.Size($Width,$Height) 
	$ListBox.Height		= $LBHeight
	$FormObject.Controls.Add($ListBox) 
	$ListBox
}

Function Add-PictureBox($PictureBox,$Left,$Top,$Location,$FormObject)
{
	$File					= (Get-Item $Location)
	$Image					= [System.Drawing.Image]::Fromfile($File)
	$PictureBox				= New-Object System.Windows.Forms.PictureBox
	$PictureBox.width		= $Image.Size.Width
	$PictureBox.height		= $Image.Size.Height
	$PictureBox.Location	= New-Object System.Drawing.Point($Left,$Top) 
	$PictureBox.Image		= $Image
	$PictureBox.SizeMode	= [System.Windows.Forms.PictureBoxSizeMode]::zoom
	$FormObject.Controls.Add($PictureBox)
	$PictureBox
}

Function Add-RadioButton($RadioButton,$RadioButtonName,$RadioButtonText,$RadioButtonLeft,$RadioButtonTop,$RadioButtonWidth,$RadioButtonHeight,$FormObject)
{
	$RadioButton			= New-Object System.Windows.Forms.RadioButton
	$RadioButton.Location	= new-object System.Drawing.Point($RadioButtonLeft,$RadioButtonTop)
	$RadioButton.size		= New-Object System.Drawing.Size($RadioButtonWidth,$RadioButtonHeight)
	$RadioButton.Checked	= $False
	$RadioButton.Font		= $Font
	$RadioButton.Text		= RadioButtonText
	$RadioButton.Name		= "$RadioButtonName"
	$FormObject.Controls.Add($RadioButton)
}

Function Add-RichTextBox($RichTextBox,$RichTextBoxName,$RichTextBoxText,$RichTextBoxLeft,$RichTextBoxTop,$RichTextBoxWidth,$RichTextBoxHeight,$FormObject,$Multiline,$Font,$RichTextBoxVisible)
{
	$RichTextBox			= New-Object System.Windows.Forms.RichTextBox
	$RichTextBox.Location	= New-Object System.Drawing.Size($RichTextBoxLeft,$RichTextBoxTop)
	$RichTextBox.Size		= New-Object System.Drawing.Size($RichTextBoxWidth,$RichTextBoxHeight)
	$RichTextBox.Text		= $TextBoxText
	$RichTextBox.Font		= $Font
	$RichTextBox.Name		= "$RichTextBoxName"
	$RichTextBox.MultiLine	= $Multiline
	$RichTextBox.Visible	= $RichTextBoxVisible
	$FormObject.Controls.Add($RichTextBox) 
	$RichTextBox
}

Function Add-TextBox($TextBox,$TextBoxName,$TextBoxText,$TextBoxLeft,$TextBoxTop,$TextBoxWidth,$TextBoxHeight,$FormObject,$TextBoxVisible)
{
	$TextBox			= New-Object System.Windows.Forms.TextBox
	$TextBox.Location	= New-Object System.Drawing.Size($TextBoxLeft,$TextBoxTop)
	$TextBox.Size		= New-Object System.Drawing.Size($TextBoxWidth,$TextBoxHeight)
	$TextBox.Text		= $TextBoxText
	$TextBox.Font		= $Font
	$TextBox.Name		= "$TextBoxName"
	$TextBox.Visible	= $TextBoxVisible
	$FormObject.Controls.Add($TextBox) 
	$TextBox
}

Function Add-TreeView($TreeView,$Left,$Top,$Width,$Height,$FormObject)
{
	$TreeView			= New-Object System.Windows.Forms.TreeView
	$TreeView.Location	= New-Object System.Drawing.Size($Left,$Top) 
	$TreeView.Size		= New-Object System.Drawing.Size($Width,$Height) 
	$TreeView.Anchor	= "top, left, right" 
	$FormObject.Controls.Add($TreeView)
	$TreeView
}
#endregion Functions to create Elements 

#region Functions To make actions 
### Functions ###
Function Disable-GroupBoxes {
	#$GetUsrInfoBox.Visible = $False
	$DisableUSRBox.Visible = $False
	$SharedFldrAccessBox.Visible = $False
	$SharedMBXSendAsBox.Visible = $False
	$CreateSharedMBXBox.Visible = $False
	$CreateDisGrpBox.Visible = $False
	$CreateSUPAcctBox.Visible = $False
	$CreateADMAcctBox.Visible = $False
	$CreateVendorAcctBox.Visible = $False
	$AddUsrToDistGrpBox.Visible = $False
}

Function Disable-User {
	Disable-GroupBoxes
	$DisableUSRBox.Visible = $True
}

Function Add-SharedFolderAccess {
	Disable-GroupBoxes
	$SharedFldrAccessBox.Visible = $True
}

Function Add-SharedMailboxAccessFull {
	Disable-GroupBoxes
	$SharedMBXAccessBox.Visible = $True
}

Function Add-SharedMailboxSendAs {
	Disable-GroupBoxes
	$SharedMBXSendAsBox.Visible = $True
}

Function Get-UserInfo {
	Disable-GroupBoxes
	$GetUsrInfoBox.Visible = $True
}

Function Check-UserInfo {
[CmdletBinding()]
	Param([Parameter(Mandatory=$True)][string]$USRName)
	$UsernameTextBox.BackColor="WHITE"
	$ProgressRichTextBox.Text = "Cogitating...`n"

	$ProgressRichTextBox.Text += "Please stand by..."
	$UsernameTextBox.backcolor="WHITE"
	sleep -m 5
	IF (Get-Aduser -Filter {NAME -like $USRName})
	{
		$USR = Get-Aduser -Filter {NAME -like $USRName} -Properties *
	}
	ELSE
	{
		$USR = Get-Aduser -Filter {SamAccountName -like $USRName} -Properties *
	}
	IF (($USR|measure).Count -GT 0)
	{
		$ProgressRichTextBox.Text = "Found $(($USR|Measure).count)...`nPlease stand by while useful information is collected and displayed..."
		ForEach ($User in $USR)
		{
			$SamID = $User.SamAccountName
			$ProgressRichTextBox.Text += Get-RBUser $SamID | Out-String
			$UsernameTextBox.backcolor="LIME"
		}
	}
	ELSEIF (($USR|measure).Count -LT 1)
	{
		$ProgressRichTextBox.Text = "No such User.`nPlease Try again"
		$UsernameTextBox.backcolor="RED"
	}
}

Function Process-SharedDrives {
[CmdletBinding()]
	Param(
		[Parameter(Mandatory=$True)][string]$USRName,
		[Parameter(Mandatory=$False)][string]$Path1,
		[Parameter(Mandatory=$False)][string]$Path2,
		[Parameter(Mandatory=$False)][string]$Path3,
		[Parameter(Mandatory=$False)][string]$Path4
	)
	$ProgressRichTextBox.Text = "Cogitating...`n`n"
	IF ($Path1 -ne "") {
		$ProgressRichTextBox.Text += "Discovering groups for $Path1 `n`n"
		$AccessGroups = Get-RBDirectoryACLs $Path1 | Sort IdentityReference | Select IdentityReference,FileSystemRights
		ForEach ($AccessGroup in $AccessGroups)
		{
			$GroupSamID = $AccessGroup.IdentityReference.tostring()
			$FSRights = $AccessGroup.FileSystemRights.tostring()
			$GroupSamID = $GroupSamID.Split('\')[1]
			$FolderShareDropdown1.Items.Add($GroupSamID+" - "+$FSRights)
		}
	}
	ELSE {}

	IF ($Path2 -ne "") {
		$ProgressRichTextBox.Text += "Discovering groups for $Path2 `n`n"
		$AccessGroups = Get-RBDirectoryACLs $Path1 | Sort IdentityReference | Select IdentityReference,FileSystemRights
		ForEach ($AccessGroup in $AccessGroups)
		{
			$GroupSamID = $AccessGroup.IdentityReference.tostring()
			$FSRights = $AccessGroup.FileSystemRights.tostring()
			$GroupSamID = $GroupSamID.Split('\')[1]
			$FolderShareDropdown2.Items.Add($GroupSamID+" - "+$FSRights)
		}
	}
	ELSE {}

	IF ($Path3 -ne "") {
		$ProgressRichTextBox.Text += "Discovering groups for $Path3 `n`n"
		$AccessGroups = Get-RBDirectoryACLs $Path1 | Sort IdentityReference | Select IdentityReference,FileSystemRights
		ForEach ($AccessGroup in $AccessGroups)
		{
			$GroupSamID = $AccessGroup.IdentityReference.tostring()
			$FSRights = $AccessGroup.FileSystemRights.tostring()
			$GroupSamID = $GroupSamID.Split('\')[1]
			$FolderShareDropdown3.Items.Add($GroupSamID+" - "+$FSRights)
		}
	}
	ELSE {}

	IF ($Path4 -ne "") {
		$ProgressRichTextBox.Text += "Discovering groups for $Path4 `n`n"
		$AccessGroups = Get-RBDirectoryACLs $Path1 | Sort IdentityReference | Select IdentityReference,FileSystemRights
		ForEach ($AccessGroup in $AccessGroups)
		{
			$GroupSamID = $AccessGroup.IdentityReference.tostring()
			$FSRights = $AccessGroup.FileSystemRights.tostring()
			$GroupSamID = $GroupSamID.Split('\')[1]
			$FolderShareDropdown4.Items.Add($GroupSamID+" - "+$FSRights)
		}
	}
	ELSE {}
}

#endregion Functions

#region Creating the actual base form
$Form				= New-Object system.Windows.Forms.Form
$Form.ClientSize	= '1750,750'
$Form.text			= "Tool Menu"
$Form.TopMost		= $False
$Form.StartPosition	= "CenterScreen"
$Form.KeyPreview	= $True
$Form.MaximizeBox	= $False
$Icon = [system.drawing.icon]::ExtractAssociatedIcon($PSHOME + "\powershell.exe")
$Form.Icon = $Icon
#endregion creating the form

#region Declares the various location variables
[int]$ButtonWidth175	= 175
[int]$ButtonWidth150	= 150
[int]$ButtonWidth100	= 100
[int]$ButtonWidth75		= 75
[int]$ButtonWidth50		= 50
[int]$ButtonHeight25	= 25
[int]$GroupBoxAlignTop 	= 5
[int]$CoreAppsLeft 		= 5
[int]$BoxAlignRow1		= 20
[int]$BoxAlignCol1		= 4
[int]$TextBoxWidth		= 125
[int]$TextboxHeight		= 25
[int]$GroupBoxWidth		= 800
[int]$GroupBoxHeight	= 700
[int]$CoreAppsWidth 	= (($ButtonWidth175*3)+15)
[int]$CoreAppsHeight	= (($ButtonHeight25*6)+$BoxAlignRow1+10)
[int]$BoxAlignCol2		= ($BoxAlignCol1+($ButtonWidth175*1)+5)
[int]$BoxAlignCol3		= ($BoxAlignCol1+($ButtonWidth175*2)+8)
[int]$BoxAlignRow2		= ($BoxAlignRow1+($ButtonHeight25*1))
[int]$BoxAlignRow3		= ($BoxAlignRow1+($ButtonHeight25*2))
[int]$BoxAlignRow4		= ($BoxAlignRow1+($ButtonHeight25*3))
[int]$BoxAlignRow5		= ($BoxAlignRow1+($ButtonHeight25*4))
[int]$BoxAlignRow6		= ($BoxAlignRow1+($ButtonHeight25*5))
[int]$BoxAlignRow7		= ($BoxAlignRow1+($ButtonHeight25*6))
[int]$BoxAlignRow8		= ($BoxAlignRow1+($ButtonHeight25*7))
[int]$GroupColumn1		= ($CoreAppsLeft+$CoreAppsWidth+5)
#endregion declaring local Variables
#Adds  Logo
#$Logo = Add-PictureBox -PictureBox $Logo -Left 1 -Top 1 -Location "\\Filer/Software\Powershell\LPanzer\Misc\_logo.jpg" -FormObject $Form

#Creates the Group Boxes
$CoreApps = Add-GroupBox -GroupBox $CoreApps -GroupBoxText "Core Applications"		-GroupBoxLeft $CoreAppsLeft -GroupBoxTop $GroupBoxAlignTop -GroupBoxWidth $CoreAppsWidth -GroupBoxHeight $CoreAppsHeight -FormObject $Form -GroupBoxVisible $True
$UserInputBox = Add-GroupBox -GroupBox $UserInputBox -GroupBoxText "User Information Input"	-GroupBoxLeft $GroupColumn1 -GroupBoxTop $GroupBoxAlignTop -GroupBoxWidth ($TextBoxWidth+5) -GroupBoxHeight $CoreAppsHeight -FormObject $Form -GroupBoxVisible $True
#$GetUsrInfoBox = Add-GroupBox -GroupBox $GetUsrInfoBox -GroupBoxText "Get User Information"	-GroupBoxLeft $GroupColumn1 -GroupBoxTop $GroupBoxAlignTop -GroupBoxWidth $GroupBoxWidth -GroupBoxHeight $GroupBoxHeight -FormObject $Form -GroupBoxVisible $False
$DisableUSRBox = Add-GroupBox -GroupBox $DisableUSRBox -GroupBoxText "Disable User"							-GroupBoxLeft $CoreAppsLeft -GroupBoxTop ($GroupBoxAlignTop+$CoreAppsHeight+5) -GroupBoxWidth $CoreAppsWidth -GroupBoxHeight $CoreAppsHeight -FormObject $Form -GroupBoxVisible $False
$SharedFldrAccessBox = Add-GroupBox -GroupBox $SharedFldrAccessBox -GroupBoxText "Add Shared Folder Access"	-GroupBoxLeft $CoreAppsLeft -GroupBoxTop ($GroupBoxAlignTop+$CoreAppsHeight+5) -GroupBoxWidth $CoreAppsWidth -GroupBoxHeight (600-$CoreAppsHeight) -FormObject $Form -GroupBoxVisible $False
$SharedMBXAccessBox = Add-GroupBox -GroupBox $SharedMBXAccessBox -GroupBoxText "Add Shared Folder Access"	-GroupBoxLeft $CoreAppsLeft -GroupBoxTop ($GroupBoxAlignTop+$CoreAppsHeight+5) -GroupBoxWidth $CoreAppsWidth -GroupBoxHeight $GroupBoxHeight -FormObject $Form -GroupBoxVisible $False
$SharedMBXSendAsBox = Add-GroupBox -GroupBox $SharedMBXSendAsBox -GroupBoxText "Add Shared Folder Access"	-GroupBoxLeft $CoreAppsLeft -GroupBoxTop ($GroupBoxAlignTop+$CoreAppsHeight+5) -GroupBoxWidth $CoreAppsWidth -GroupBoxHeight $GroupBoxHeight -FormObject $Form -GroupBoxVisible $False
$CreateSharedMBXBox = Add-GroupBox -GroupBox $CreateSharedMBXBox -GroupBoxText "Add Shared Folder Access"	-GroupBoxLeft $CoreAppsLeft -GroupBoxTop ($GroupBoxAlignTop+$CoreAppsHeight+5) -GroupBoxWidth $CoreAppsWidth -GroupBoxHeight $GroupBoxHeight -FormObject $Form -GroupBoxVisible $False
$CreateDisGrpBox = Add-GroupBox -GroupBox $CreateDisGrpBox -GroupBoxText "Add Shared Folder Access"			-GroupBoxLeft $CoreAppsLeft -GroupBoxTop ($GroupBoxAlignTop+$CoreAppsHeight+5) -GroupBoxWidth $CoreAppsWidth -GroupBoxHeight $GroupBoxHeight -FormObject $Form -GroupBoxVisible $False
$CreateSUPAcctBox = Add-GroupBox -GroupBox $CreateSUPAcctBox -GroupBoxText "Add Shared Folder Access"		-GroupBoxLeft $CoreAppsLeft -GroupBoxTop ($GroupBoxAlignTop+$CoreAppsHeight+5) -GroupBoxWidth $CoreAppsWidth -GroupBoxHeight $GroupBoxHeight -FormObject $Form -GroupBoxVisible $False
$CreateADMAcctBox = Add-GroupBox -GroupBox $CreateADMAcctBox -GroupBoxText "Add Shared Folder Access"		-GroupBoxLeft $CoreAppsLeft -GroupBoxTop ($GroupBoxAlignTop+$CoreAppsHeight+5) -GroupBoxWidth $CoreAppsWidth -GroupBoxHeight $GroupBoxHeight -FormObject $Form -GroupBoxVisible $False
$CreateVendorAcctBox = Add-GroupBox -GroupBox $CreateVendorAcctBox -GroupBoxText "Add Shared Folder Access"	-GroupBoxLeft $CoreAppsLeft -GroupBoxTop ($GroupBoxAlignTop+$CoreAppsHeight+5) -GroupBoxWidth $CoreAppsWidth -GroupBoxHeight $GroupBoxHeight -FormObject $Form -GroupBoxVisible $False
$AddUsrToDistGrpBox = Add-GroupBox -GroupBox $AddUsrToDistGrpBox -GroupBoxText "Add Shared Folder Access"	-GroupBoxLeft $CoreAppsLeft -GroupBoxTop ($GroupBoxAlignTop+$CoreAppsHeight+5) -GroupBoxWidth $CoreAppsWidth -GroupBoxHeight $GroupBoxHeight -FormObject $Form -GroupBoxVisible $False

#CoreApps
$GetUserInfo = Add-Button -Button $GetUserInfo -ButtonText "Get User Information" 				-ButtonLeft $BoxAlignCol1 -ButtonTop $BoxAlignRow1 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True
$LeaverProcess = Add-Button -Button $LeaverProcess -ButtonText "Leaver Process"					-ButtonLeft $BoxAlignCol1 -ButtonTop $BoxAlignRow2 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True
$DisableUser = Add-Button -Button $DisableUser -ButtonText "Disable User who will return"		-ButtonLeft $BoxAlignCol1 -ButtonTop $BoxAlignRow3 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True
$SharedFolderAccess = Add-Button -Button $SharedFolderAccess -ButtonText "Shared Folder Access"	-ButtonLeft $BoxAlignCol1 -ButtonTop $BoxAlignRow4 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True
$MBXAccessFull = Add-Button -Button $MBXAccessFull -ButtonText "Add Mailbox Access - Full"			-ButtonLeft $BoxAlignCol1 -ButtonTop $BoxAlignRow5 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True
$MBXAccessSendAs = Add-Button -Button $MBXAccessSendAs -ButtonText "Add Mailbox Access - Send As"	-ButtonLeft $BoxAlignCol1 -ButtonTop $BoxAlignRow6 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True

$CreateSharedMBX = Add-Button -Button $CreateSharedMBX -ButtonText "Create shared mailbox"	-ButtonLeft $BoxAlignCol2 -ButtonTop $BoxAlignRow1 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True
$CreateDistList = Add-Button -Button $CreateDistList -ButtonText "Create distribution list"	-ButtonLeft $BoxAlignCol2 -ButtonTop $BoxAlignRow2 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True
$CreateNewSup = Add-Button -Button $CreateNewSup -ButtonText "Create a new SUP account"		-ButtonLeft $BoxAlignCol2 -ButtonTop $BoxAlignRow3 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True
$CreateNewAdm = Add-Button -Button $CreateNewAdm -ButtonText "Create a new ADM account"		-ButtonLeft $BoxAlignCol2 -ButtonTop $BoxAlignRow4 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True
$NewVendorAcct = Add-Button -Button $NewVendorAcct -ButtonText "Create vendor user account"	-ButtonLeft $BoxAlignCol2 -ButtonTop $BoxAlignRow5 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True
$DOOM = Add-Button -Button $DOOM -ButtonText "Button of DOOM!"								-ButtonLeft $BoxAlignCol2 -ButtonTop $BoxAlignRow6 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True

$AddUserToDG = Add-Button -Button $AddUserToDG -ButtonText "Add user to distribution list"	-ButtonLeft $BoxAlignCol3 -ButtonTop $BoxAlignRow1 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True
$StaffTransfer = Add-Button -Button $StaffTransfer -ButtonText "Staff Transfer"				-ButtonLeft $BoxAlignCol3 -ButtonTop $BoxAlignRow2 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -Form $CoreApps -ButtonEnabled $True -ButtonVisible $True

#Text Boxes
$ProgressRichTextBox = Add-RichTextBox -RichTextBox $ProgressRichTextBox -RichTextBoxText "Progress"	-RichTextBoxLeft ($GroupColumn1+($TextBoxWidth+5)) -RichTextBoxTop ($GroupBoxAlignTop+5) -RichTextBoxWidth 750 -RichTextBoxHeight 600 -FormObject $Form -Multiline $True -Font $FontConsole -RichTextBoxVisible $True
$UsernameTextBox = Add-TextBox -TextBox $UsernameTextBox -TextBoxName "UsernameTextBox" -TextBoxText ""	-TextBoxLeft $BoxAlignCol1 -TextBoxTop $BoxAlignRow2 -TextBoxWidth $TextBoxWidth -TextBoxHeight $TextboxHeight -FormObject $UserInputBox -TextBoxVisible $True
$UsernameTextBox.BackColor="White"
#$DUUsernameTextBox = Add-TextBox -TextBox $DUUsernameTextBox -TextBoxName "UsernameTextBox" -TextBoxText ""	-TextBoxLeft $BoxAlignCol1 -TextBoxTop $BoxAlignRow2 -TextBoxWidth $TextBoxWidth -TextBoxHeight $TextboxHeight -FormObject $DisableUSRBox -TextBoxVisible $True
#$DUUsernameTextBox.BackColor="White"
#$DUProgressRichTextBox = Add-RichTextBox -RichTextBox $DUProgressRichTextBox -RichTextBoxText "Progress"	-RichTextBoxLeft (($BoxAlignCol1+$TextBoxWidth)+3) -RichTextBoxTop ($GroupBoxAlignTop+5) -RichTextBoxWidth 750 -RichTextBoxHeight 600 -FormObject $DisableUSRBox -Multiline $True -Font $FontConsole -RichTextBoxVisible $True
$FolderShareTextBox1 = Add-TextBox -TextBox $FolderShareTextBox1 -TextBoxName "FolderShare" -TextBoxText "" -TextBoxLeft $BoxAlignCol1 -TextBoxTop $BoxAlignRow1 -TextBoxWidth ($TextBoxWidth*2) -TextBoxHeight $TextboxHeight -FormObject $SharedFldrAccessBox -TextBoxVisible $True
$FolderShareTextBox1.Add_MouseHover($ShowHelp)
$FolderShareTextBox2 = Add-TextBox -TextBox $FolderShareTextBox2 -TextBoxName "FolderShare" -TextBoxText "" -TextBoxLeft $BoxAlignCol1 -TextBoxTop $BoxAlignRow2 -TextBoxWidth ($TextBoxWidth*2) -TextBoxHeight $TextboxHeight -FormObject $SharedFldrAccessBox -TextBoxVisible $False
$FolderShareTextBox2.Add_MouseHover($ShowHelp)
$FolderShareTextBox3 = Add-TextBox -TextBox $FolderShareTextBox3 -TextBoxName "FolderShare" -TextBoxText "" -TextBoxLeft $BoxAlignCol1 -TextBoxTop $BoxAlignRow3 -TextBoxWidth ($TextBoxWidth*2) -TextBoxHeight $TextboxHeight -FormObject $SharedFldrAccessBox -TextBoxVisible $False
$FolderShareTextBox3.Add_MouseHover($ShowHelp)
$FolderShareTextBox4 = Add-TextBox -TextBox $FolderShareTextBox4 -TextBoxName "FolderShare" -TextBoxText "" -TextBoxLeft $BoxAlignCol1 -TextBoxTop $BoxAlignRow4 -TextBoxWidth ($TextBoxWidth*2) -TextBoxHeight $TextboxHeight -FormObject $SharedFldrAccessBox -TextBoxVisible $False
$FolderShareTextBox4.Add_MouseHover($ShowHelp)

# Labels
$UsernameLabel = Add-Label -Label $UsernameLabel -LabelText "Enter Username" -LabelLeft $BoxAlignCol1 -LabelTop $BoxAlignRow1 -LabelWidth $TextBoxWidth -LabelHeight $TextboxHeight -FormObject $UserInputBox -LabelVisible $True
#$DUUsernameLabel = Add-Label -Label $DUUsernameLabel -LabelText "Enter Username" -LabelLeft $BoxAlignCol1 -LabelTop $BoxAlignRow1 -LabelWidth $TextBoxWidth -LabelHeight $TextboxHeight -FormObject $DisableUSRBox -LabelVisible $True

# Buttons
$FindUserButton	= Add-Button -Button $FindUserButton -ButtonName "FindButton" -ButtonText "Find" -ButtonLeft $BoxAlignCol1 -ButtonTop $BoxAlignRow3 -ButtonWidth $ButtonWidth50 -ButtonHeight $ButtonHeight25 -FormObject $UserInputBox -ButtonEnabled $False -ButtonVisible $True
$FindSharesButton = Add-Button -Button $FindSharesButton -ButtonName "FindSharesButton" -ButtonText "Find Shares" -ButtonLeft ($BoxAlignCol1+11) -ButtonTop $BoxAlignRow5 -ButtonWidth $ButtonWidth100 -ButtonHeight $ButtonHeight25 -FormObject $UserInputBox -ButtonEnabled $True -ButtonVisible $False
#$DUFindButton	= Add-Button -Button $DUFindButton	-ButtonName "FindButton" -ButtonText "Find"	-ButtonLeft $BoxAlignCol1 -ButtonTop $BoxAlignRow3 -ButtonWidth $ButtonWidth50 -ButtonHeight $ButtonHeight25 -FormObject $DisableUSRBox -ButtonEnabled $False -ButtonVisible $True
#$OKButton = Add-Button -Button $OKButton -ButtonName "OKButton" -ButtonText "OK"			-ButtonLeft (($BoxAlignCol1)+($ButtonWidth175*1)) -ButtonTop $ButtonRow1 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -FormObject $Form -ButtonEnabled $False -ButtonVisible $False
#$CloseButton= Add-Button -Button $CloseButton -ButtonName "CloseButton" -ButtonText "Close"	-ButtonLeft (($BoxAlignCol1)+($ButtonWidth175*2)) -ButtonTop $ButtonRow1 -ButtonWidth $ButtonWidth175 -ButtonHeight $ButtonHeight25 -FormObject $Form -ButtonEnabled $True -ButtonVisible $False

#DropDown
$FolderShareDropdown1 = Add-DropdownBox -DropdownBox $FolderShareDropdown1 -DropDownHeight 200 -DropdownBoxLeft ($BoxAlignCol1+($TextBoxWidth*2)+5) -DropdownBoxTop $BoxAlignRow1 -DropdownBoxWidth ($TextBoxWidth*1.95) -DropdownBoxHeight $Textboxheight -FormObject $SharedFldrAccessBox -DropdownVisible $False
$FolderShareDropdown2 = Add-DropdownBox -DropdownBox $FolderShareDropdown2 -DropDownHeight 200 -DropdownBoxLeft ($BoxAlignCol1+($TextBoxWidth*2)+5) -DropdownBoxTop $BoxAlignRow2 -DropdownBoxWidth ($TextBoxWidth*1.95) -DropdownBoxHeight $Textboxheight -FormObject $SharedFldrAccessBox -DropdownVisible $False
$FolderShareDropdown3 = Add-DropdownBox -DropdownBox $FolderShareDropdown3 -DropDownHeight 200 -DropdownBoxLeft ($BoxAlignCol1+($TextBoxWidth*2)+5) -DropdownBoxTop $BoxAlignRow3 -DropdownBoxWidth ($TextBoxWidth*1.95) -DropdownBoxHeight $Textboxheight -FormObject $SharedFldrAccessBox -DropdownVisible $False
$FolderShareDropdown4 = Add-DropdownBox -DropdownBox $FolderShareDropdown4 -DropDownHeight 200 -DropdownBoxLeft ($BoxAlignCol1+($TextBoxWidth*2)+5) -DropdownBoxTop $BoxAlignRow4 -DropdownBoxWidth ($TextBoxWidth*1.95) -DropdownBoxHeight $Textboxheight -FormObject $SharedFldrAccessBox -DropdownVisible $False

#Assigning Actions
$GetUserInfo.Add_Click({Get-UserInfo})
$FindUserButton.Add_Click({Check-UserInfo -USRName $UsernameTextBox.text})
$UsernameTextBox.add_TextChanged({if ($UsernameTextBox.Text -ne ""){$FindUserButton.Enabled=$True}else{$FindUserButton.Enabled=$False}})
$LeaverProcess.Add_Click({\\Filer/Software\Powershell\StaffLeaversForm.ps1})
$DisableUser.Add_Click({Disable-User})
#$DUFindButton.Add_Click({Check-UserInfo -USRName $DUUsernameTextBox.text})
$SharedFolderAccess.Add_Click({Add-SharedFolderAccess})
$FindSharesButton.Add_Click({Process-SharedDrives -USRName $UsernameTextBox.text -Path1 $FolderShareTextBox1.Text -Path2 $FolderShareTextBox2.Text -Path3 $FolderShareTextBox3.Text -Path4 $FolderShareTextBox4.Text})
$FolderShareTextBox1.add_TextChanged({if ($FolderShareTextBox1.Text -ne ""){$FindSharesButton.Visible=$True}else{$FindSharesButton.Visible=$False}})
$FolderShareTextBox1.add_TextChanged({if ($FolderShareTextBox1.Text -ne ""){$FolderShareTextBox2.Visible=$True}else{$FolderShareTextBox2.Visible=$False}})
$FolderShareTextBox2.add_TextChanged({if ($FolderShareTextBox2.Text -ne ""){$FolderShareTextBox3.Visible=$True}else{$FolderShareTextBox3.Visible=$False}})
$FolderShareTextBox3.add_TextChanged({if ($FolderShareTextBox3.Text -ne ""){$FolderShareTextBox4.Visible=$True}else{$FolderShareTextBox4.Visible=$False}})
$FolderShareTextBox1.add_TextChanged({if ($FolderShareTextBox1.Text -ne ""){$FolderShareDropdown1.Visible=$True}else{$FolderShareDropdown1.Visible=$False}})
$FolderShareTextBox2.add_TextChanged({if ($FolderShareTextBox2.Text -ne ""){$FolderShareDropdown2.Visible=$True}else{$FolderShareDropdown2.Visible=$False}})
$FolderShareTextBox3.add_TextChanged({if ($FolderShareTextBox3.Text -ne ""){$FolderShareDropdown3.Visible=$True}else{$FolderShareDropdown3.Visible=$False}})
$FolderShareTextBox4.add_TextChanged({if ($FolderShareTextBox4.Text -ne ""){$FolderShareDropdown4.Visible=$True}else{$FolderShareDropdown4.Visible=$False}})
$MBXAccessFull.Add_Click({Add-SharedMailboxAccessFull})
$MBXAccessSendAs.Add_Click({Add-SharedMailboxSendAs})
$DOOM.Add_Click({$Form.Close()}) 
$StaffTransfer.Add_Click({\\Filer/Software\Powershell\LPanzer\StaffTransfer\StaffTransfers.ps1})

[void]$Form.ShowDialog()
