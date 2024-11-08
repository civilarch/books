






Where(), Select(), OrderBy(), GroupBy(), Sum(), Average() 같은 메서드들을 제공한다.



using System.Linq;

List, Array, IQueryable


Enumerable.Range(0, 5)는 0부터 시작하여 길이가 5인 시퀀스인 {0, 1, 2, 3, 4}를 만든다


int[] numbers =  1, 3, 5, 7, 9, 11 
var result = numbers.Where(num => num < 5);


[linq.enumerable]::Range(1, 5)
([linq.enumerable]::Range(1, 5)).ToList();


[int[]] $numbers =  1, 3, 5, 7, 9, 11

$numbers.Select(w => w.Length) 

[linq.enumerable]::Select($numbers)

$LE = [linq.enumerable]
$LE::sum($LE::Range(1, 5))
$LE::sum($LE::Range(1, 36000))
$LE::sum( [int[]] @(0..100) )


for ($i=0; $i -lt 10000; $i++) {$sum += $i}




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

https://www.red-gate.com/simple-talk/development/dotnet-development/high-performance-powershell-linq/


But since one of PowerShell’s mantras is 

“anything you can do in C# can be done in PowerShell, too!”


tedious overhead of use


deferred execution

Rather, those operators return a query (essentially an IEnumerable<T>). 

LINQ operators are static extension methods

In PowerShell plain static method calls require this syntax:

[ClassName]::MethodName(arguments...)


ObjectInstance.MethodName(arguments...)

[ClassName]::MethodName(ObjectInstance, arguments...)

numbers.Sum()
[Linq.Enumerable]::Sum($numbers)


$LE = [PowerShell].Assembly.GetType("Linq.Enumerable")





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms
$msgBox = [System.Windows.MessageBox]
$window = New-Object System.Windows.Window
$window.Topmost = $true
$msgBoxResult = $msgBox::Show($window,'Attention user, make a choice !!', 'Attention', 'YesNo', 'Question', 'Yes')

$msgBoxResult


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


var result = dates.Where(d => d.Year > 2016);

[Func[DateTime, bool]] $delegate = { param($d); return $d.Year -gt 2016 }

[Linq.Enumerable]::Where($dates, $delegate)





























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





