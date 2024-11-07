
for($i = 0; $i -lt 3; $i++) {
    $a = new-object -TypeName PSObject
    $a | Add-Member -MemberType NoteProperty -Name index -Value $i
    $a | Add-Member -MemberType NoteProperty -Name title -Value "Article $i"
    $a | Add-Member -MemberType NoteProperty -Name keywords -Value @()
    $articles += $a
}



$articles