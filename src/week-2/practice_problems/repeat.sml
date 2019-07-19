(* Write a function repeat : int list * int list -> int list
 * that given a list of integers and another list of nonnegative integers, 
 * repeats the integers in the first list according to the numbers indicated by the second list. 
 * For example: repeat ([1,2,3], [4,0,3]) = [1,1,1,1,3,3,3]
 *)

fun repeatbyone(nmbr : int, rpt : int)=
    if rpt = 0
    then []
    else nmbr::repeatbyone(nmbr, rpt -1);

fun repeat(lst1 : int list, lst2 : int list)=
    if null lst1 orelse null lst2
    then []
    else repeatbyone(hd lst1, hd lst2)@repeat(tl lst1, tl lst2);


repeat([], []);
repeat([1], []);
repeat([1], [2]);
repeat([1,2], [2]);
repeat([1,2], [2,3]);
repeat([1,2,5], [2,3,10]);
