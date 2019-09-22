 (* function longest_string1 that takes a string list and returns the longest string in the list. 
  * If the list is empty, return "".  
  * In the case of a tie, 
  * return the string closest to the beginning of the list.  
  * Use foldl, String.size, and no recursion (other than the implementation of foldl is recursive). 
  * *)


fun longest_string1(lst : string list)=
  case lst of
       [] => ""
     | lst => List.foldl (fn (next,prev) => if String.size next > String.size prev then next else prev) "" lst;


val stringList = ["Medet", "Can", "akus", "Linux", "linux", "Ubuntu", "i am Marry Poppins, You all", "I am Marry Poppins, You all"];

longest_string1 stringList;
