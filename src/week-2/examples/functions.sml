(* In Standart Meta Language you can declare a variable using fun keyword *)
(* SML is a expression oriented language you can simply return from a function by inserting an expression*)

(* If number of parameters exceed one parenthesis around parameters are mandatory *)
fun pow  (x : int, y : int) =
  if y = 0
  then 1
  else x * pow(x, y - 1);
(* static environment: fun : int * int -> int return type is inferred from the expression *)

fun cube x =
  pow(x, 3);

pow(2,3);
 cube(4);
 
 (* formally function definition syntax in sml is; fun x0 (x1 : t1, x2 : t2, ..., xn : tn) = e *)
 (* function  call syntax is; myfunc(x0, x1) parenthesis are optional when you have one argument *)
 pow(2,2);

