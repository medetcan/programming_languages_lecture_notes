  (* function longest_string2, 
   * that  is exactly like longest_string1
   * except in the case of ties it returns the string closest to the end of the list.
   * Your solution should be almost an exact copy of longest_string1.  
   * Still use foldl and String.size. 
   * *)

fun longest_string2(lst : string list)=
  case lst of
       [] => ""
     | lst => List.foldl (fn (next, prev) => if String.size next >= String.size prev then next else prev) "" lst;

val stringList = ["Medet", "Can", "akus", "Linux", "linux", "Ubuntu", "i am Marry Poppins, You all", "I am Marry Poppins, You all"];

longest_string2 stringList;
