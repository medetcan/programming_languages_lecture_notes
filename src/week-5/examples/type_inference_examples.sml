

(* function f is => T1 -> T4 = (T2,T3) -> T4 which (int * int) -> int  *)
fun f x = (* function f => x = T1*)
  let val (y,z) = x in (* (y = T2, z = T3) = T1 *)
    (abs y) + z (* T2 = int, T3 = int *)
  end; (* let  expression T4 = int*)

(* function sum is => T1 -> T2 = T3 list -> T2 = T3 list -> int = int list -> int *)
fun sum xs = (* function f: T1 -> T2 *)
  case xs of (* xs : T1  is matched against list constructor pattern so T1 = T3 list*)
       [] => 0 (* pattern with emplty list returns a type int and by definition all branches has to return same type *)
     | x::xs' => x + (sum xs'); (* x : T4 and it is used with addition operator so T4 must be of type int*)
     (* x : T4 = int is a member of T1 = T3 list and all list elements must be of same type so T1 = T3 list = int list *)
