(* Write a function match,
 * That takes a valu * pattern and returns a (string * valu) list option 
 * namely NONE if the pattern does not match and SOME lst where lst is the list of bindings if it does.
 * Note that if the value matches but the pattern has no patterns of the form Variable s, then the result isSOME []
 * *)

use "provided.sml";
use "all_answers.sml";

fun match (value : valu, p : pattern)=
  case (value, p) of
       (_, Wildcard) => SOME []
     | (value', Variable str) => SOME [(str,value')]
     | (Tuple vs, TupleP ps) => 
         if List.length vs = List.length ps 
         then all_answers match (ListPair.zip(vs, ps))
         else NONE
     | (Constructor(s2, v), ConstructorP(s1, p)) => if s1 = s2 then match (v, p) else NONE
     | (_, ConstP _) => SOME []
     | (Unit, UnitP) => SOME []
     | _ => NONE;


val test11 = match (Const(1), UnitP) = NONE;
val test12 = match (Const(1), Wildcard) = SOME [];
