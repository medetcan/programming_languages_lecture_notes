(* define a function count_wild_and_variable_lengths,
 * That takes a pattern and returns the number of Wildcard patterns it contains plus the sum of the string lengths of all the variables in the variable patterns it contains.  
 * UseString.size. We care only about variable names; theconstructor names are not relevant. 
 * *)

 use "provided.sml";


fun count_wild_and_variable_lengths p=
  g (fn () => 1) (fn str => String.size str) p;

val test9b = count_wild_and_variable_lengths (Variable("a")) = 1;
val test9b_1 = count_wild_and_variable_lengths (TupleP [Variable "Medet", Variable "Can", Wildcard, Wildcard, TupleP [Variable "Selin", ConstructorP("Medet", ConstP 2)]]) = 15;
