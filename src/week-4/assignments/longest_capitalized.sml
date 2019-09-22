(* Write a function longest_capitalized 
 * That takes a string list and returns the longest string in the list that begins with an uppercase letter,  or "" if there are no such strings.
 * Assume all strings have at least 1 character.
 * Use a val-binding and the ML library’s o operator for composing functions.
 * Resolve ties like in problem 2
 * *)




val is_capitalized = fn(str : string) => Char.isUpper (String.sub(str, 0));
val is_longest = fn(next,prev) => if String.size next > String.size prev then next else prev;
val is_longest_capitalized = is_capitalized o is_longest;

fun longest_capitalized(lst)=
  case lst of
       [] => ""
     | lst => foldl(fn(next,prev) => if is_longest_capitalized(next,prev) then next else prev) "" lst;


val stringList = ["Medet", "Can", "akus", "Linux", "linux", "Ubuntu", "i am Marry Poppins, You all", "I am Marry Poppins, You all"];
val stringList1 = ["Medet", "Can", "akus", "Linux", "linux", "Ubuntu", "i am Marry Poppins, You all", "i am Marry Poppins, You all"];
val stringlist2 = ["medet", "can", "akus", "linux", "linux", "ubuntu", "i am marry poppins, you all", "i am marry poppins, you all"];
longest_capitalized(stringList);
longest_capitalized(stringList1);
longest_capitalized(stringlist2);

 is_capitalized("Medet");
 is_capitalized("medet");

 is_longest_capitalized("Medet", "can");
 is_longest_capitalized("medet", "can");
 is_longest_capitalized("medet", "Can");
