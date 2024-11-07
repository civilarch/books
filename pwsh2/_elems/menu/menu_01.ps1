
function menu_show {
    param (
        [string]$Title = 'My Menu'
    )
    Clear-Host
    
    Write-Host ""
    Write-Host "----------------------------------------------"
    Write-Host "  " "$Title" 
    Write-Host "----------------------------------------------"
    
    Write-Host "  " "1: item_01"
    Write-Host "  " "2: item_02"
    Write-Host "  " "3: item_03"
    Write-Host "  " "Q: quit."
    Write-Host ""
}



do {
    menu_show
    $key = Read-Host "Please make a selection"
    switch ($key)
    {
        '1' {
            'You chose option #1'
        } 
        '2' {
            'You chose option #2'
        } 
        '3' {
            'You chose option #3'
        }
    }
    pause
 } until ($key -eq 'q')



