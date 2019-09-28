(* Write a function rev_string.
 * That takes a string and returns the string,
 * That is the same characters in reverse order. 
 * Use ML’s o operator, the library function rev for reversing lists, and two library functions in the String module.  
 * *)

fun rev_string(str : string)=
  (String.implode o List.rev o String.explode) str;


rev_string "Medet";
rev_string "kabak";
rev_string "tabak";
rev_string "";
