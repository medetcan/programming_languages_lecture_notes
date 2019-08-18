

val x = 1;
(* A function value has two part
 * The code(behaviour)
 * Environment(Closure)
 * *)
fun f y = x + y;
val x = 2;
val y = 3;
val z = f (x + y); (* scope determined by lexically so x = 2, y = 3 x + y = 5 but when function is called in function body x will be looked up lexically  *)
