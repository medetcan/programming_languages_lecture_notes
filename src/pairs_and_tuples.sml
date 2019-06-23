(* To create a two value pairs in sml use; (e1, e2) types can differ in pairs *)

val x = (12, "2");

val (y,z) = x;

(* To access individual element of pairs use; #1 e(xpression that evaluates to a pairs) *)

#1 x;
#2 x;

fun swap (pair : int*int) = (#2 pair, #1 pair);

(* parenthesis around pairs is optional *)
swap((24,12));
swap(0,1);

(* int * int -> (int * int) *)
fun div_mod (x : int, y : int) =
  (x div y, x mod y);

div_mod(12,4);

 (* You can have tuples with more than two parts (e1, e2, e2, ..., en) *)
 (* Pairs and tuples can be nested! *)
val x1 = (12, (true, false));

 #1(#2 x1);

