(* Write a function number_before_reaching_sum. 
 * That takes an int called sum, which you can assume is positive, and an int list, which you can assume contains all positive numbers, and returns an int.
 * You should return an int n such that the first n elements of the list add to less than sum, but the first n + 1 elements of the list add to sum or more.  
 * Assume the entire list sums to more than the passed in value; 
 * it is okay for an exception to occur if this is not the case.
 *)

fun number_before_reaching_sum(sum : int, lst : int list)=
  if sum >= 3
  then 3
  else hd lst + number_before_reaching_sum(sum, tl lst);
