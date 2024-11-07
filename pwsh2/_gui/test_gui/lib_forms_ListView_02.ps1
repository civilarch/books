Add-Type -AssemblyName "System.Windows.Forms"
Add-Type -AssemblyName "System.Drawing"
Add-Type -AssemblyName PresentationFramework

Clear-Host

#   Create a New Form
    $form=New-Object System.Windows.Forms.Form
    $form.topmost=$true
    $form.Text="Add/Remove AD User to And From Groups"
    $form.Location.x=400
    $form.Location.Y=400
    $form.Size=New-Object System.Drawing.Size(665,330)
#   Now Lock the form so it cannot be re-sized.
    $Form.MaximumSize=New-Object System.Drawing.Size(665,330)
    $Form.MinimumSize=New-Object System.Drawing.Size(665,330)
#   Group Text Label
    $Grouplbl1=New-Object System.Windows.Forms.label
    $Grouplbl1.Location=New-Object System.Drawing.Size(5,2)
    $FontFace = New-Object System.Drawing.Font("Comic Sans MS",10,[System.Drawing.FontStyle]::Regular)
    $Grouplbl1.Font=$FontFace
    $Grouplbl1.text="AD User List"
    
    
# AN INSTANCE OF THE LISTVIEW CLASS IS CREATED (THIS IS THE LISTVIEW CONTROL)       
    $Listview = New-Object System.Windows.Forms.ListView 
    $Listview.Location = New-Object System.Drawing.Size(3,25)
    $Listview.Size = New-Object System.Drawing.Size(300,256)
    $Font = New-Object System.Drawing.Font("Tahoma",8,[System.Drawing.FontStyle]::regular)
    $Listview.Font=$Font
    $Listview.CheckBoxes=$true
    $Listview.Name="XXXXXXXXXXXXXX"
    $Listview.AutoArrange=$true
    $Listview.GridLines=$true
    $Listview.MultiSelect=$true
    $listView.View = "Details"
    # $Listview.backcolor = "Black"
    # $Listview.forecolor = "LightGreen"

    # Populate the User CheckboxList
    #$listview.columns.AddRange('AD User List','AD Group List')
    $listView.Columns.Add("AD User list")
    $listView.Columns[0].Width = -2
    
    $listView.Columns.Add("AD GroupList")
    $listView.Columns[1].Width = -2
    
    $gci_file = gci    C:\_var\_day | select -f 15 
    $gci_file.Name | ForEach-Object{[void]$Listview.items.Add($_).SubItems.Add($_)}
    
    # $AllADGroups=Get-ADGroup -Filter * | select name | Sort Name
    # $gci_file.Name | ForEach-Object{[void]$Listview.items.Add("wwwwwwwww").SubItems.Add($_)}
    # $AllADGroups.name | ForEach-Object{[void]$Listview.items.Add("wwwwwwwww").SubItems.Add($_)}
    
    
    $form.Controls.add($Listview)

$form.ShowDialog()








