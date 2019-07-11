(* Write a function min_max : int list -> int * int
* takes a non-empty list of numbers, and returns a pair (min, max) of the minimum and maximum of the numbers in the list.
*)

fun min(ls : int list)=
    if null (tl ls)
    then hd ls
    else
        let val tmp = min(tl ls)
        in if (hd ls) > tmp then tmp else (hd ls)
        end;

fun max(ls : int list)=
    if null (tl ls)
    then hd ls
    else 
        let val tmp = max(tl ls)
        in if (hd ls) < tmp then tmp else (hd ls)
        end;

fun min_max (ls : int list)=
    (min(ls), max(ls));

min_max([]);
min_max([1,2,3,4]);
min_max([1,12,1,4]);
min_max([0,12,1,4]);