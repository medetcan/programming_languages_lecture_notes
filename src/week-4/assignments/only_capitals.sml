 (* function only_capitals,
  * that takes a string list and returns a string list
  * that has only the strings in the argument that start with an uppercase letter.  
  * Assume all strings have at least 1 character.  
  * Use List.filter, Char.isUpper, and String.sub to make a 1-2 line solution. 
  * *)


fun only_capitals(lst : string list)=
  List.filter(fn str => Char.isUpper (String.sub(str, 0))) lst;


val stringList = ["Medet", "Can", "akus", "Linux", "linux", "Ubuntu"];

 only_capitals stringList;
