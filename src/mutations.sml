(* In ML most of the built-in data structures and bindings such as lists, tuples, pairs, variables are immutable *)

(* Following two implementations of sort_pair function indistinguishable from each other but one of them is a better style because of the lack of no-mutation feature in ML *)

fun sort_pair(pr : int * int) =
  if #1 pr > #2 pr
  then pr
  else (#2 pr, #1 pr);

sort_pair(2,4);
sort_pair(3,2);

fun sort_pair(pr : int * int) =
  if #1 pr > #2 pr
  then (#1 pr, #2 pr) 
  (* Both function similar to each other but lack of mutation in ml makes it unecassary to create another pair above since any other code can not mutate the original pair *)
  else (#2 pr, #1 pr);

sort_pair(2,4);
sort_pair(3,2);
