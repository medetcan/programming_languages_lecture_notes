

fun length xs = (* function length = xs : T1 -> T2 = T3 list -> T2 = a' list -> int*)
  case xs of
       [] => 0 (* a case branch returns an int T2 must be of type int*)
     | x::xs' => 1 + length xs'; (* list constructor pattern is used T1 = T3 list, T3 is never used so it can be any type *)


fun f (x,y,z) = (* function f = (T1 * T2 * T3) -> T4 = (T1 * T2 * T3) -> (T1 * T2 * T3) = (T1 * T2 * T3) -> (T2 * T1 * T3) = (a', a', b') -> (a', a', b') *)
  if true (* if expression and each branch is returning triples *)
  then (x,y,z) (* (T1 * T2 * T3) *)
  else (y,x,z); (* (T2 * T1 * T3) *)



(*
 * function compose = T1 * T2 -> T3;
 * T2 : T4 -> T5
 * T1 : T5 -> T3
 * T3 : T4 -> T3
 * (T5 -> T3) * (T4 -> T5) -> T4 -> T3
 * (a' -> 'b) * ('c -> a') -> c' -> 'b
 *)
fun compose (f, g) = fn x => f (g x);
