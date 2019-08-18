
fun n_times(f, n, x)= (*  (a' -> a') * int * 'a -> 'a  *)
  if n = 0
  then x
  else f(n_times(f, n - 1, x));

fun increment x = 1 + x; (* int -> int *)
fun double x = x + x; (* int -> int*)

n_times(double, 4, 7);           (* instantiates 'a with int *)
n_times(increment, 4, 7);        (* instantiates 'a with int *)
n_times(tl, 2, [4, 8, 12, 16]);  (* instantiates 'a with int list *)

(* Example of higher order function that is not polymorphic *) 
fun times_until_zero(f,x)= (* (int -> int) * int -> int *)
  if x = 0 then 0 else 1 + times_until_zero(f, f x); (* Plus sign and comparison with zero tell the story for compiler *)

fun len xs= (* a' list -> int *)
  case xs of
       [] => 0
     | x::xs' => 1 + len xs';
