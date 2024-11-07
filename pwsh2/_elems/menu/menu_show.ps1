
# powershell menu show

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




menu_show
    
 