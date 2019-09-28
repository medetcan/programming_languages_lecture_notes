(* Write a function longest_capitalized 
 * That takes a string list and returns the longest string in the list that begins with an uppercase letter,  or "" if there are no such strings.
 * Assume all strings have at least 1 character.
 * Use a val-binding and the ML library’s o operator for composing functions.
 * Resolve ties like in problem 2
 * *)

use "longest_string1.sml";


val get_capitals = List.filter (fn str => Char.isUpper(String.sub(str, 0)));
val longest_capitalized = longest_string1 o get_capitals;



val stringList = ["Medet", "Can", "akus", "Linux", "linux", "Ubuntu", "i am Marry Poppins, You all", "I am Marry Poppins, You all"];
val stringList1 = ["Medet", "Can", "akus", "Linux", "linux", "Ubuntu", "i am Marry Poppins, You all", "i am Marry Poppins, You all"];
val stringlist2 = ["medet", "can", "akus", "linux", "linux", "ubuntu", "i am marry poppins, you all", "i am marry poppins, you all"];
longest_capitalized(stringList);
longest_capitalized(stringList1);
longest_capitalized(stringlist2);


val test5 = longest_capitalized ["A","bc","C"] = "A";
val test6 = longest_capitalized ["A","bc","C"];
