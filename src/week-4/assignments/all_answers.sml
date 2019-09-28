(* Write  a  function all_answers of  type (’a -> ’b list option) -> ’a list -> ’b list option.
 * The first argument should be applied to elements of the second argument.   
 * If  it  returns NONE for  any  element,  then  the  result  for all_answers is NONE.  
 * Else  the calls to the first argument will have produced SOME lst1, SOME lst2, ...SOME lstn and the result of all_answers is SOME lst where lst is lst1,lst2, ...,lstn appended together.
 * The sample solution is 8 lines.  It uses a helper function with an accumulator and uses @. 
 * Note all_answers f [] should evaluate to SOME []. 
 * *)



fun all_answers f xs =
  case xs of
       [] => SOME []
      | x::xs' => case (f x) of 
                       SOME lst => SOME (lst @ valOf (all_answers f xs')) 
                     | _ => NONE;

val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
