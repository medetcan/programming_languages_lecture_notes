(* This is a comment. *)
(* In ML we comment our code with starting parenthesis and followed by an
 * asteriks and our comment followed by a asteriks and a closing parenthesis *)
 (* Comments can span multiple lines! *)

val x = 5;
 (* static enviroment: x : int *)
 (* dynamic enviroment: x --> 5 *)
val y = 6;
 (* static enviroment: x : int, y : int*)
 (* dynamic enviroment: x --> 5, y --> 6 *)
val z = (x + y) + (y + 2);
 (* static enviroment: x : int, y : int, z : int *)
 (* dynamic enviroment: x --> 5, y --> 6, z --> 19 *)

val abs_of_z = if z < 0 then 0 -z else z;
 (* static enviroment: x : int, y : int, z : int, abs_of_z : int *)
 (* dynamic enviroment: x --> 5, y --> 6, z --> 19, abs_of_z --> 19 *)
