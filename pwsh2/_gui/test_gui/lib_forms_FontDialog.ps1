###########################################################
# FontDialog.ps1
#
# Wayne Lindimore
# wlindimore@gmail.com
# AdminsCache.Wordpress.com
#
# 7-12-13
# Demo of WinForms FontDialog Class
###########################################################

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
using namespace System.Collections
using namespace System.Windows.Forms
using namespace System.Drawing

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


$base_Font__ = "Times New Roman,12"
$base_Font__ = "∫ª∏Ì¡∂,12"

# Main Form 
$mainForm           = New-Object System.Windows.Forms.Form
# $mainForm.Font      = "Comic Sans MS,8.25"
$mainForm.Font      = $base_Font__
$mainForm.Text      = " FontDialog Demo"
$mainForm.ForeColor = "White"
$mainForm.BackColor = "DarkSlateBlue"
$mainForm.Width     = 400
$mainForm.Height    = 500

# Labels
$fontName_lbl                     = [Label]::new()
$fontName_lbl.Location            = "20,20"
$fontName_lbl.Size                = "120,20"
$fontName_lbl.Text                = "Font Family"
$mainForm.Controls.Add($fontName_lbl)

$fontSize_lbl                     = [Label]::new()
$fontSize_lbl.Location            = "20,50"
$fontSize_lbl.Size                = "120,20"
$fontSize_lbl.Text                = "Size"
$mainForm.Controls.Add($fontSize_lbl)

$fontHeight_lbl                   = [Label]::new()
$fontHeight_lbl.Location          = "20,80"
$fontHeight_lbl.Size              = "120,20"
$fontHeight_lbl.Text              = "Height"
$mainForm.Controls.Add($fontHeight_lbl)

$fontUnit_lbl                     = [Label]::new()
$fontUnit_lbl.Location            = "20,110"
$fontUnit_lbl.Size                = "120,20"
$fontUnit_lbl.Text                = "Unit"
$mainForm.Controls.Add($fontUnit_lbl)

$fontBold_lbl                     = [Label]::new()
$fontBold_lbl.Location            = "20,140"
$fontBold_lbl.Size                = "120,20"
$fontBold_lbl.Text                = "Bold"
$mainForm.Controls.Add($fontBold_lbl)

$fontItalic_lbl                   = [Label]::new()
$fontItalic_lbl.Location          = "20,170"
$fontItalic_lbl.Size              = "120,20"
$fontItalic_lbl.Text              = "Italic"
$mainForm.Controls.Add($fontItalic_lbl)

$fontStyle_lbl                    = [Label]::new()
$fontStyle_lbl.Location           = "20,200"
$fontStyle_lbl.Size               = "120,20"
$fontStyle_lbl.Text               = "Style"
$mainForm.Controls.Add($fontStyle_lbl)

$fontStrikeout_lbl                = [Label]::new()
$fontStrikeout_lbl.Location       = "20,230"
$fontStrikeout_lbl.Size           = "120,20"
$fontStrikeout_lbl.Text           = "Strikeout"
$mainForm.Controls.Add($fontStrikeout_lbl)

$fontUnderline_lbl                = [Label]::new()
$fontUnderline_lbl.Location       = "20,260"
$fontUnderline_lbl.Size           = "120,20"
$fontUnderline_lbl.Text           = "Underline"
$mainForm.Controls.Add($fontUnderline_lbl)

$fontIsSystemFont_lbl             = [Label]::new()
$fontIsSystemFont_lbl.Location    = "20,290"
$fontIsSystemFont_lbl.Size        = "120,20"
$fontIsSystemFont_lbl.Text        = "Is System Font"
$mainForm.Controls.Add($fontIsSystemFont_lbl)

$fontGdiCharSet_lbl               = [Label]::new()
$fontGdiCharSet_lbl.Location      = "20,320"
$fontGdiCharSet_lbl.Size          = "120,20"
$fontGdiCharSet_lbl.Text          = "Character Set"
$mainForm.Controls.Add($fontGdiCharSet_lbl)

$fontGdiVerticalFont_lbl          = [Label]::new()
$fontGdiVerticalFont_lbl.Location = "20,350"
$fontGdiVerticalFont_lbl.Size     = "120,20"
$fontGdiVerticalFont_lbl.Text     = "Vertical Font"
$mainForm.Controls.Add($fontGdiVerticalFont_lbl)


# Title Label
$title_lbl            = [Label]::new()
$title_lbl.Font       = "Comic Sans MS,15"
$title_lbl.ForeColor  = "Yellow"
$title_lbl.BackColor  = "DarkSlateBlue"
$title_lbl.Location   = "190,410"
$title_lbl.Size       = "200,40"
$title_lbl.Text       = "Font Info"
$mainForm.Controls.Add($title_lbl)


# TextBoxes
$fontNameTextBox                     = [TextBox]::new()
$fontNameTextBox.Location            = "140,20"
$fontNameTextBox.Size                = "200,20"
$fontNameTextBox.Text                = ""
$mainForm.Controls.Add($fontNameTextBox)

$fontSizeTextBox                     = [TextBox]::new()
$fontSizeTextBox.Location            = "140,50"
$fontSizeTextBox.Size                = "200,20"
$fontSizeTextBox.Text                = ""
$mainForm.Controls.Add($fontSizeTextBox)

$fontHeightTextBox                   = [TextBox]::new()
$fontHeightTextBox.Location          = "140,80"
$fontHeightTextBox.Size              = "200,20"
$fontHeightTextBox.Text              = ""
$mainForm.Controls.Add($fontHeightTextBox)

$fontUnitTextBox                     = [TextBox]::new()
$fontUnitTextBox.Location            = "140,110"
$fontUnitTextBox.Size                = "200,20"
$fontUnitTextBox.Text                = ""
$mainForm.Controls.Add($fontUnitTextBox)

$fontBoldTextBox                     = [TextBox]::new()
$fontBoldTextBox.Location            = "140,140"
$fontBoldTextBox.Size                = "200,20"
$fontBoldTextBox.Text                = ""
$mainForm.Controls.Add($fontBoldTextBox)

$fontItalicTextBox                   = [TextBox]::new()
$fontItalicTextBox.Location          = "140,170"
$fontItalicTextBox.Size              = "200,20"
$fontItalicTextBox.Text              = ""
$mainForm.Controls.Add($fontItalicTextBox)

$fontStyleTextBox                    = [TextBox]::new()
$fontStyleTextBox.Location           = "140,200"
$fontStyleTextBox.Size               = "200,20"
$fontStyleTextBox.Text               = ""
$mainForm.Controls.Add($fontStyleTextBox)

$fontStrikeoutTextBox                = [TextBox]::new()
$fontStrikeoutTextBox.Location       = "140,230"
$fontStrikeoutTextBox.Size           = "200,20"
$fontStrikeoutTextBox.Text           = ""
$mainForm.Controls.Add($fontStrikeoutTextBox)

$fontUnderlineTextBox                = [TextBox]::new()
$fontUnderlineTextBox.Location       = "140,260"
$fontUnderlineTextBox.Size           = "200,20"
$fontUnderlineTextBox.Text           = ""
$mainForm.Controls.Add($fontUnderlineTextBox)

$fontIsSystemFontTextBox             = [TextBox]::new()
$fontIsSystemFontTextBox.Location    = "140,290"
$fontIsSystemFontTextBox.Size        = "200,20"
$fontIsSystemFontTextBox.Text        = ""
$mainForm.Controls.Add($fontIsSystemFontTextBox)

$fontGdiCharSetTextBox               = [TextBox]::new()
$fontGdiCharSetTextBox.Location      = "140,320"
$fontGdiCharSetTextBox.Size          = "200,20"
$fontGdiCharSetTextBox.Text          = ""
$mainForm.Controls.Add($fontGdiCharSetTextBox)

$fontGdiVerticalFontTextBox          = [TextBox]::new()
$fontGdiVerticalFontTextBox.Location = "140,350"
$fontGdiVerticalFontTextBox.Size     = "200,20"
$fontGdiVerticalFontTextBox.Text     = ""
$mainForm.Controls.Add($fontGdiVerticalFontTextBox)


# Select Button
$fontSelectButton = New-Object System.Windows.Forms.Button
$fontSelectButton.ForeColor = "DarkSlateBlue"
$fontSelectButton.BackColor = "White"
$fontSelectButton.Location  = "20, 400"
$fontSelectButton.Size      = "75, 23"
$fontSelectButton.Text      = "Select Font"
$fontSelectButton.add_Click({
    $fontDialog = New-Object System.Windows.Forms.FontDialog
    [void] $fontDialog.ShowDialog()
    $font = $fontDialog.Font
    $fontNameTextBox.Text            = $font.Name
    $fontSizeTextBox.Text            = $font.Size
    $fontHeightTextBox.Text          = $font.Height
    $fontUnitTextBox.Text            = $font.Unit
    $fontBoldTextBox.Text            = $font.Bold
    $fontItalicTextBox.Text          = $font.Italic
    $fontStyleTextBox.Text           = $font.Style
    $fontStrikeoutTextBox.Text       = $font.Strikeout
    $fontUnderlineTextBox.Text       = $font.Underline
    $fontIsSystemFontTextBox.Text    = $font.IsSystemFont
    $fontGdiCharSetTextBox.Text      = $font.GDICharSet
    $fontGdiVerticalFontTextBox.Text = $font.GDIVerticalFont
    })
$mainForm.Controls.Add($fontSelectButton)


# Exit Button 
$exitButton = New-Object System.Windows.Forms.Button
$exitButton.Location  = "20,430"
$exitButton.Size      = "75,23"
$exitButton.ForeColor = "Red"
$exitButton.BackColor = "White"
$exitButton.Text      = "Exit"
$exitButton.add_Click({$mainForm.close()})
$mainForm.Controls.Add($exitButton)


[void] $mainForm.ShowDialog()

