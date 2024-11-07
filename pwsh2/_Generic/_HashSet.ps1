
using namespace System.Collections.Generic



$set = [HashSet[string]]@()
($set | Get-Member)[0].TypeName






https://learn.microsoft.com/en-us/dotnet/api/system.collections.generic.iset-1?view=net-8.0




$set = [HashSet[string]]@()
$set = [HashSet[string]] gci -file  -n

[HashSet[string]] $a_hsf = gci -file  -n
$a_hsf.GetType().Name -eq 'HashSet`1'

$set = [HashSet[string]] (gci -file  -n)

foreach ($h in $set) { "${h}" }



[int[]]$c = 1,2,3,4,5
[HashSet[int]]::new($c)




# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


System.Collections.Generic.HashSet<T>
System.Collections.Frozen.FrozenSet<T>
System.Collections.Generic.SortedSet<T>
System.Collections.Immutable.ImmutableHashSet<T>
System.Collections.Immutable.ImmutableSortedSet<T>



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


Add(T)  
Adds an element to the current set and returns a value to indicate if the element was successfully added.

Remove(T)   
Removes the first occurrence of a specific object from the ICollection<T>.

Clear() 
Removes all items from the ICollection<T>.

(Inherited from ICollection<T>)
Contains(T) 
Determines whether the ICollection<T> contains a specific value.


UnionWith(IEnumerable<T>)   
Modifies the current set so that it contains all elements that are present in the current set, in the specified collection, or in both.

(Inherited from IEnumerable)
IntersectWith(IEnumerable<T>)   
Modifies the current set so that it contains only elements that are also in a specified collection.


(Inherited from ICollection<T>)
ExceptWith(IEnumerable<T>)  
Removes all elements in the specified collection from the current set.

SymmetricExceptWith(IEnumerable<T>) 
Modifies the current set so that it contains only elements that are present either in the current set or in the specified collection, but not both.


IsSubsetOf(IEnumerable<T>)  
Determines whether a set is a subset of a specified collection.

IsSupersetOf(IEnumerable<T>)    
Determines whether the current set is a superset of a specified collection.



(Inherited from ICollection<T>)
CopyTo(T[], Int32)  
Copies the elements of the ICollection<T> to an Array, starting at a particular Array index.


GetEnumerator() 
Returns an enumerator that iterates through a collection.







IsProperSubsetOf(IEnumerable<T>)    
Determines whether the current set is a proper (strict) subset of a specified collection.

IsProperSupersetOf(IEnumerable<T>)  
Determines whether the current set is a proper (strict) superset of a specified collection.

Overlaps(IEnumerable<T>)    
Determines whether the current set overlaps with the specified collection.


(Inherited from ICollection<T>)
SetEquals(IEnumerable<T>)   
Determines whether the current set and the specified collection contain the same elements.


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 





# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


function get_set_dict_gci($sd) {
    $hset = [HashSet[string]]@(); 
    gci -file $sd | % { 
        $null = $hset.Add($_.name); 
    }
    return  $hset 
}

$hset  = get_set_dict_gci .

$hset  



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


$array = New-Object int[] $hashset.Count
$hashset.CopyTo($array)
$arraylist = [System.Collections.ArrayList]$array

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

Another way (shorter, but slower for large hashsets):

$arraylist = [System.Collections.ArrayList]@($hashset)



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

$list = [System.Collections.Generic.List[int]]$hashset

[System.Collections.Generic.List[int]]::new($hashset)

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 


[HashSet[String]]::new([String[]]@('a', 'b', 'c', 'A', 'b'), [StringComparer]::InvariantCultureIgnoreCase)


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





