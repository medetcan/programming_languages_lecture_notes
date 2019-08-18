(* Write a function
 * get_substitutions2, which is like get_substitutions1 except it uses a tail-recursive local helper function 
 *)



 use "all_except_option.sml";

fun get_substitutions2(xs : (string list) list, str : string)=
  let
    fun get_substitutions2(xs : (string list) list, str : string, acc : string list)=
      case xs of 
           [] => acc 
         | xs'::xs'' =>
             case all_except_option(str, xs') of 
                  NONE => get_substitutions2(xs'', str, acc) 
                | SOME lst => get_substitutions2(xs'', str, acc @ lst);
  in
    get_substitutions2(xs, str, [])
  end;

get_substitutions2([["Medet","M"],["Medetinho", "Mederico", "Medet"], ["Can", "C"]], "Medet");
get_substitutions2([["Medet","M"],["Medetinho", "Mederico"], ["Can", "C", "Caninho"]], "Can");
