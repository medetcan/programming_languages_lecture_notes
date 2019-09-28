(* Write a function first_answer of type (’a -> ’b  option) -> ’a list -> ’b.
 * The first argument should be applied to elements of the second argument in order until the first time it returns SOME v for some v and then v is the result of the call to first_answer.
 * If the first argument returns NONE for all list elements, then first_answer should raise the exception NoAnswer. 
 * Hints:  Sample solution is 5 lines and does nothing fancy. 
 * *)

exception NoAnswer;

 fun first_answer f xs =
   case xs of
        [] => raise NoAnswer
      | x::xs' => if isSome (f x) then valOf (f x) else first_answer f xs';

val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
