(* Write a function alternate: int list -> int that takes a list of numbers and adds them with alternating sign.
 * for example;
 * alternate [1] = 1;
 * alternate [1,2] = 1 -2 = -1
 * alternate [1,2,3] = 1 - 2 + 3 = 2
 * alternate [1,2,3,4] = 1 - 2 + 3 - 4 = -2. *)

fun sum_list(ls : int list)= 
  if null ls
  then 0
  else hd ls + sum_list(tl ls);

sum_list [];
sum_list [1];
sum_list [1,2];
sum_list [1, ~1];

fun get_elements_by_odd_index(ls : int list)=
  if null ls
  then []
  else
    if null (tl ls)
    then [hd ls]
    else (hd ls)::get_elements_by_odd_index(tl (tl ls));

fun get_elements_by_even_index(ls : int list)=
  if null ls
  then []
  else
    if null (tl ls)
    then tl ls
    else (hd (tl ls))::get_elements_by_even_index(tl ls);


get_elements_by_odd_index [1,2,3,4];
get_elements_by_even_index [1,2,3,4];

fun alternate(ls : int list)=
  sum_list(get_elements_by_odd_index ls);

alternate([1,2,3,4, 5]);

