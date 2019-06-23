fun sum_list (xs : int list) =
  if null xs
  then 0
  else hd xs + sum_list(tl xs);


sum_list([]);
sum_list([1,2,3,4,5,6,7,8,9,10]);
sum_list [1,2,3];

fun list_product(xs : int list) =
  if null xs
  then 1
  else hd xs * list_product(tl xs);

list_product([0]);
list_product([1]);
list_product([~5, ~4, ~1]);
list_product([1,2,3,4]);


fun countdown(x : int) =
  if x = 0
  then []
  else x::countdown(x - 1);

countdown(5);
countdown(2500);


fun append(l1 : int list, l2 : int list) =
  if null l1
  then l2
  else append((tl l1) ,(hd l1)::l2);

append([], []);
append([], [1]);
append([1], []);
append([1], [2]);


fun sum_pair_list(l : (int * int) list) =
  if null l
  then 0
  else #1(hd l) + #2(hd l) + sum_pair_list(tl l);

sum_pair_list([]);
sum_pair_list([(1,2)]);
sum_pair_list([(1,2), (3,4)]);
