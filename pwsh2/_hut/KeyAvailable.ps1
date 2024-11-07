



start-sleep -milliseconds 100; 

$host.ui.RawUI.FlushInputBuffer(); 

$i=0; while(-not $host.UI.RawUI.KeyAvailable) { 
    
    Write-Host -NoNewline ("`r{0}" -f '|/-\|/-\'[($i++ % 8)]); 
    
    start-sleep -Milliseconds 200 
}





# $Host.UI.RawUI.FlushInputBuffer()

# $SPVOICE.Speak('press any key to continue') | Out-Null

# while (-not $host.ui.RawUI.KeyAvailable) {
#     $Host.UI.RawUI.FlushInputBuffer()
#     sleep -m 200;
# }
