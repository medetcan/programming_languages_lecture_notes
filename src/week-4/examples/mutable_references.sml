(* t ref where t is a type *)
(* ref e to create a reference where e is an expression that evaluates to a value *)
(* e1 := e2 is an assignment operator that mutates the left hand side expression e1 *)
(* !e to retrive contents ! is not negation(~) *)
val myref = ref (12,24);
 myref:= (24,22); (* e1 := e2 -> t ref := t, where e1 is a ref t and e2 is an expression with type t *)
val unwrapped_value = !myref; (* Retrive the contents of the reference *)


val x = ref 42;
val y = ref 42;
val z = x;
val _ = x:=43;
val w = (!y) + (!z); (* 85 *)
