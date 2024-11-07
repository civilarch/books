
# ---------------------------------------- 
. ./lib_b_1.ps1
# ---------------------------------------- 



$gps = get-process | select Name,ID,Description | select -f 5

$gps | Add-Member -MemberType NoteProperty -Name aaa   -Value $false

$gps

 Boolean



$gps | Add-Member -MemberType NoteProperty -Name aaa   -Value $false


$gps | Add-Member -MemberType NoteProperty -Name aaa  -TypeName  Boolean  -Value $false





