(* Write a function get_substitutions1, 
 * which takes a string list list (a list of list of strings, the substitutions) and a string s and returns a string list.  
 * The result has all the strings that are in some list in substitutions that also has s, but s itself should not be in the result. *)


use "all_except_option.sml";

fun get_substitutions1(xs : (string list) list, str : string)=
  case xs of
       [] => []
     | xs'::xs'' => 
         case all_except_option(str, xs') of
              NONE => get_substitutions1(xs'', str) 
            | SOME lst => lst @ get_substitutions1(xs'', str);

get_substitutions1([["Medet","M"],["Medetinho", "Mederico", "Medet"], ["Can", "C"]], "Medet");
get_substitutions1([["Medet","M"],["Medetinho", "Mederico"], ["Can", "C", "Caninho"]], "Can");
