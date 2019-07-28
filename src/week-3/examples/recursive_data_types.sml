
(* [] and :: are also constructors and can be used in pattern matching *)

fun sum_list lst=
  case lst of
       [] => 0
     | first::rest => first + sum_list rest;


sum_list([1,2,3,4,5]);


fun append(xs, ys)=
  case xs of
       [] => ys
     | x::xs' => append(xs', x::ys);

append([1,2,3],[4,5,6]);


