

using namespace System.Windows.Forms 
Add-Type -Assembly System.Windows.Forms

$TA = [PSObject].Assembly.GetType('System.Management.Automation.TypeAccelerators')
$TA::Add('MB', 'Messagebox')
# $mmbb = [MB]
# $mmbb = [System.Windows.Forms.MessageBox]

# [MB]::show('body','title','YesNo')



# $TA::Add('FMS', 'System.Windows.Forms')
# $FMS = 'System.Windows.Forms'
# $mmbb = [FMS.MessageBox]
[MB]::Show('Hello')



# using namespace System.Windows.Forms
# Add-Type -Assembly System.Windows.Forms

# [windows.forms.messagebox]::show('body','title','YesNo')





# $pxList = [System.Collections.Generic.List[string]]

# $pxList::new()


# $pxList = System.Collections.Generic.List

# [$pxList[string]]::new()


# Add-Type -AssemblyName PresentationFramework


# $buttons=[system.windows.forms.messageboxbuttons]::yesno;
# [system.windows.forms.messagebox]::Show("Are you sure?", "", $buttons);


# [System.windows.forms.messagebox]::show("Welcome");



# $forms = [System.Windows.Forms.MessageBox]


# $forms::Show('Hello')




# Add-Type -ReferencedAssemblies 'System.Windows.Forms' -TypeDefinition @"
# using System.Windows.Forms;
# "@

# [windows.forms.messagebox]::show('body','title','YesNo')




$TA = [PSObject].Assembly.GetType('System.Management.Automation.TypeAccelerators')

# Add-Type -AssemblyName System.Windows.Forms

# using namespace  System.Windows



# $TA::Add('wForms', 'System.Windows.Forms')



# using namespace System.Windows

# [Forms.messagebox]::show('body','title','YesNo')


# Using Namespace  System.Windows.Forms

# Add-Type -AssemblyName System.Windows.Forms


