(* Write a function number_before_reaching_sum. 
 * That takes an int called sum, which you can assume is positive, and an int list, which you can assume contains all positive numbers, and returns an int.
 * You should return an int n such that the first n elements of the list add to less than sum, but the first n + 1 elements of the list add to sum or more.  
 * Assume the entire list sums to more than the passed in value; 
 * it is okay for an exception to occur if this is not the case.
 *)

 
fun number_before_reaching_sum(upperBound : int, lst : int list)=
  if null lst
  then 0
  else 
    if  upperBound - hd lst <= 0
    then 0
    else 1 + number_before_reaching_sum(upperBound - hd lst, tl lst);

number_before_reaching_sum(2,  [1,1]);
number_before_reaching_sum(1,  [1,2,3,4,5]);
number_before_reaching_sum(1,  [11,2,3,4,5]);
number_before_reaching_sum(2,  [1,2,3,4,5]);
number_before_reaching_sum(3,  [1,2,3,4,5]);
number_before_reaching_sum(4,  [1,2,3,4,5]);
number_before_reaching_sum(5,  [1,2,3,4,5]);
number_before_reaching_sum(6,  [1,2,3,4,5]);
number_before_reaching_sum(7,  [1,2,3,4,5]);
number_before_reaching_sum(8,  [1,2,3,4,5]);
number_before_reaching_sum(9,  [1,2,3,4,5]);
number_before_reaching_sum(10, [1,2,3,4,5]);
number_before_reaching_sum(11, [1,2,3,4,5]);
number_before_reaching_sum(31, [29,2,3,4,5]);
