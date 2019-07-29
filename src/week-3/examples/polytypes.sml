(* 'a list * 'a list -> 'a list *)
(* Preceding commented out type definition is more general than following type definitions *)
(* and can be the target of any less general type *)
(* string list * string list -> string list *)
(* int list * int list ->int list *)
(* But it is not more general than the type *)
(* int list * string list -> int list *)
(* 'a type must replaced consistently *)
fun append(xs, ys)=
  case xs of
       [] => ys
     | x::xs' => x::append(xs', ys);

val ok1 = append(["oh"], ["hi", "mark"]);
val ok2 = append([1,2,3], [4,5,6]);

(* You might see equality types on type definitions *)
(* Extra apostrophe chracter signify equality types *)
(* ''a list * ''a list -> bool *)
(* The rules for more general type are exactly same except you have to replace an equality-type variable with a type that can be used with = operator *)
(* The = operator works on lots of types: int,string, tuples containing all equality types *)
(* But not all types: function types, real... *)


fun same_thing(x, y)=
  if x=y then "yes" else "no";

