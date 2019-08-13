(* Write a function all_except_option, 
 * which takes a string and a string list. 
 * Return NONE if the string is not in the list, else return SOME lst where lst is identical to the argument list except the string is not in it.  
 * You may assume the string is in the list at most once.  
 * Use same_string, provided to you,to compare strings. 
 * *)

 use "hw2provided.sml";

fun all_except_option(str: string, xs : string list)=
  let
    fun all_except_option(str, xs, acc)= (* Shadows outer function binding *)
      case xs of
           [] => NONE
         | x::xs' => if same_string(str, x) then SOME (acc @ xs') else all_except_option(str, xs', x::acc)
  in
    all_except_option(str,xs, [])
  end;


all_except_option("Can", ["Medet","Can", "Akus"]);
all_except_option("Selin", ["Medet","Can", "Akus"]);
