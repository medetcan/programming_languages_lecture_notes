(* Define  a  function count_some_var, 
 * That  takes  a  string  and  a  pattern  (as  a  pair)  and returns the number of times the string appears as a variable in the pattern. 
 * We care only about variable names; the constructor names are not relevant 
 * *)

use "provided.sml";

fun count_some_var(str, p) =
  g (fn () => 0) (fn str2 => case String.compare(str2, str) of EQUAL => 1 | _ => 0) p;

val test9c = count_some_var ("x", Variable("x")) = 1;
val test9c = count_some_var ("xy", Variable("x")) = 0;
