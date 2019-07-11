(* Write a function cumsum : int list -> int list
 * that takes a list of numbers and returns a list of the partial sums of those numbers. 
 * For example cumsum [1,4,20] = [1,5,25]
 * cumsum [1] = [1]
 * cumsum [2,4] = [2, 6]
 * cumsum [2,3,5,8] = [2,5,10,18]
 *)

fun sum_list(ls : int list)=
    if null ls
    then 0
    else (hd ls) + sum_list(tl ls);

fun cumsum(ls : int list)=
    if null ls
    then []
    else (sum_list ([hd ls]))