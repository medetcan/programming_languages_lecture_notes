(* Write a function first_match,
 * That takes a value and a list of patterns and returns a (string * valu) list option, 
 * Namely NONE if no pattern in the list matches or SOME lst where lst is the list of bindings for the first pattern in the list that matches.   
 * Use first_answer and a handle-expression.
 * *)


use "provided.sml";
use "first_answer.sml";
use "match.sml";

fun first_match v ps =
  case ps of
       [] => NONE
     | ps => SOME (first_answer (fn p => match(v,p))  ps) handle NoAnswer => NONE;

val test12 = first_match Unit [UnitP] = SOME [];
