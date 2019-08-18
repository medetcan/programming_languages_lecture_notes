fun n_times(f, n, x)=
  if n = 0
  then x
  else f (n_times(f, n - 1, x));

fun nth_tail_not_good(n, xs) = n_times(fn y => tl y, n, xs); (* Not a good style unnecassary function wrapping *)
fun nth_tail(n, xs) = n_times(tl, n, xs); (* Not a good style unnecassary function wrapping *)

(* Following two functions are not a good style *)
fun rev xs = List.rev xs;
val rev = fn xs => List.rev xs;
(* This is much better because you are not making unnecassary function *)
val rev = List.rev;
