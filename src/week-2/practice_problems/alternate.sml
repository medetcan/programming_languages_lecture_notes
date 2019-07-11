(* Write a function alternate: int list -> int that takes a list of numbers and adds them with alternating sign.
 * for example;
 * alternate [1] = 1;
 * alternate [1,2] = 1 -2 = -1
 * alternate [1,2,3] = 1 - 2 + 3 = 2
 * alternate [1,2,3,4] = 1 - 2 + 3 - 4 = -2. *)

fun alternate(ls : int list)=
  if null (tl ls)
  then hd ls
  else
    let 
     val sum_val = hd ls + ~(hd (tl ls))
    in
     if null (tl (tl ls)) then sum_val else sum_val + alternate(tl (tl ls))
    end;

alternate([1]);
alternate([1,2]);
alternate([1,2,3]);
alternate([1,2,3,4]);
alternate([1,2,3,4,5]);
alternate([1,2,3,4,5,6]);

