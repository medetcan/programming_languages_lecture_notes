(* Define a function count_wildcards, 
 * That takes a pattern and returns how many Wildcardpatterns it contains. 
 * *)

use "provided.sml";


fun count_wildcards(p : pattern)=
  g (fn () => 1) (fn _ => 0) p;

val test9a = count_wildcards Wildcard = 1;
count_wildcards(TupleP [Wildcard, UnitP, ConstP 1, ConstructorP("Medet", TupleP [ConstP 1, Variable "Can", Wildcard])]);
