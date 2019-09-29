




(* function foo = T1 -> T2 -> T3 -> T4
 * T1 = T4 -> T7
 * T2 = T5
 * T3 = T5
 * T4 = T6 list
 * function foo : (T6 list -> T7) -> T5 -> T5 -> T6 list -> T7
 * function foo : (a' list -> 'b) -> 'c -> c' -> a' list -> 'b
 *)
fun foo f x y z = 
	if x >= y
	then (f z)
	else foo f y x (tl z);

