
# ---------------------------------------- 
. ./lib_b_1.ps1
# ---------------------------------------- 




$a = (1,2,3,4)
$b = (1,3,4,5)
$a + $b | select -uniq    #union
$a | ?{$b -contains $_}   #intersection



$a = (1,2,3,4)
$b = (1,3,4,5)
Compare-Object $a $b -PassThru -IncludeEqual                   # union
Compare-Object $a $b -PassThru -IncludeEqual -ExcludeDifferent # intersection


[system.linq.enumerable]::union([object[]](1,2,3),[object[]](2,3,4))
[system.linq.enumerable]::Intersect([object[]](1,2,3),[object[]](2,3,4))
[system.linq.enumerable]::except([object[]](1,2,3),[object[]](2,3,4))

[linq.enumerable]::union([object[]](1,2,3),[object[]](2,3,4))
[linq.enumerable]::Intersect([object[]](1,2,3),[object[]](2,3,4))
[linq.enumerable]::except([object[]](1,2,3),[object[]](2,3,4))

[linq.enumerable]::except([int[]](1,2,3),[int[]](2,3,4))
















































