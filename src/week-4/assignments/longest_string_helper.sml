(* Write functions longest_string_helper, longest_string3, and longest_string4 such that 
 * longest_string3 has  the  same  behavior as longest_string1 and longest_string4 has the same behavior as longest_string2
 * longest_string_helper has type (int * int -> bool) -> string list -> string
 * if longest_string_helper is passed a function that behaves like >
 *     (so it returns true exactly when its first argument is stricly greater than its second), then the function returned has the samea behavior as longest_string1.
 * longest_string3 and longest_string4 are defined with val-bindings and partial applications of longest_string_helper
 * *)

fun longest_string_helper(f)= fn lst =>
   case lst of 
        [] => "" 
      | lst => foldl(fn(next,prev) => if f(String.size next,String.size prev) then next else prev)  "" lst;
val longest_string3 = longest_string_helper (fn(size_next, size_prev) => size_next > size_prev)
val longest_string4 = longest_string_helper (fn(size_next, size_prev) => size_next >= size_prev)

val stringList = ["Medet", "Can", "akus", "Linux", "linux", "Ubuntu", "i am Marry Poppins, You all", "I am Marry Poppins, You all"];

longest_string3 stringList;
longest_string4 stringList;
