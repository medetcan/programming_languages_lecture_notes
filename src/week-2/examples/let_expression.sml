(* To introduce a local variable to your code use; let b1 b2 ... bn in e end *)
(* Each bi is any binding and e is any expression *)
(* Each let expression creates its own scope you can have nested scopes *)

val x = 3;

val y = let
  val y = 5;
  val z = 4;
  val t = 2;
  val p = 1;
in 
  x * y * z * t * p
end;


fun silly (z : int) =
  let
    val x = if z > 0 then z else 34;
    val y = x + z + 9; 
  in
    if x > y then x * 2 else y * y
  end;

silly(12);

