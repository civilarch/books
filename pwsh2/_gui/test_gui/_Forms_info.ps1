# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
using namespace System.Collections
using namespace System.Windows.Forms
using namespace System.Drawing

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

System.Drawing.Font



$sText = @"
# Form

Panel

GroupBox

Label
# Button
RadioButton
CheckBox
ComboBox
TextBox
ListBox
CheckedListBox

ListView
TreeView
DataGridView


ImageList

MessageBox
PictureBox
Splitter

CommonDialog

Clipboard
"@
$aLines = get_lines $sText
$aLines | %{sc  "lib_forms_${_}.ps1" $sContent}

$aLines | %{ni  "lib_forms_${_}.ps1"  }

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


DataGridView


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms?view=windowsdesktop-8.0


System.Windows.Forms
powershell  System.Windows.Forms.Label
powershell  System.Windows.Forms.ListBox  SelectedItem index
powershell  System.Windows.Forms.ListBox  SelectedIndices
powershell  System.Windows.Forms.ListView
powershell  System.Windows.Forms.TextBox
powershell  System.Windows.Forms.FontDialog 

powershell  System.Drawing.Font



Form

Panel

GroupBox


Label
Button
RadioButton
CheckBox
ComboBox
TextBox
ListBox
CheckedListBox

ListView
TreeView
DataGridView


ImageList

MessageBox
PictureBox
Splitter

CommonDialog

Clipboard







ContainerControl

Control

Application

ColorDialog

DataGridViewCell

DataGridViewButtonColumn

DataGridViewButtonCell

DataGridViewColumn

DataGridViewColumnCollection


FontDialog

FileDialog

GridItem


HtmlDocument

HScrollBar

HtmlElement

HtmlWindow

ListControl

ProgressBar

ScrollBar

SendKeys

TabControl

Timer

TreeNode


WebBrowser






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





