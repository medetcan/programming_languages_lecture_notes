(* You can re-declare a same variable this is totally legal*)
(* When you re-declare a variable re-declared variable shadows preceding variable *)
(* It does create a new binding for a preceding variable this important it does not mutate the original variable *)
val x = 5;
val y = 2;
val z = x+ y;

val x = 12;

val p = x + x;
val x = p + x;
