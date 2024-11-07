


# $re_pairs = @(
#     ,('global','gggg')
#     ,('sublime','ssss')
#     ,('vscode','vvvvv')
# )


# foreach ($pair in $re_pairs)
# {
#     $pair[0] + ' : ' + $pair[1] 
#     "$($pair[0]) :  $($pair[1]) :  "
# }




$arrA = @(1,2,3)

function change_array($arr) {
    $arr[0] = 999
}

change_array $arrA

$arrA

<#


$x = @(
    ,@(1,2,3)
)



$x = ,(1,2,3)


$array1 = "11","12","13"
$array2 = "21","22","23"
$array3 = "31","32","33"

$arrayAll = $array1, $array2, $array3
$arrayAll.Count # returns 3

$arrayAll = @()
$arrayAll += , $array1
$arrayAll += , $array2
$arrayAll += , $array3

$arrayAll.count # returns 3

$arrayAll[1] # gets "21","22","23", i.e. $array2



$x = @()
$x += ,(1,2)
$x += ,(2,3)
$x[1]
$x[1][1]

$x += ,@(4,5),@(6,7)

$x = ,(1,2),(2,3),(4,5),(6,7)


$pixels = @(@(1,2,3),@(4,5,6),@(7,8,9))







#>








