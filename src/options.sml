(* Options are useful for safely wrapping return value of a function by wrapping value with option we can further examine the returned value for error and
 * decide about moving forward or not*)

 (* t option is a type for any type t *)
 (* NONE has a type 'a option *)
 (* SOME has a type t option if e has a type t *)

 (* You can examine optional by using isSome and valOf functions isSome for
  * checking validity of the wrapped value and valOf is for accessing the value *)

fun old_max (xs : int list) =
  if null xs
  then 0
  else
    let val tl_ans = old_max(tl xs)
    in
      if hd xs > tl_ans
      then hd xs
      else tl_ans
    end;

old_max [1,2,3, 51, 160, 10];
old_max [];

fun max1 (xs : int list) = 
  if null xs
  then NONE
  else 
    let val tl_ans = max1(tl xs)
    in if isSome tl_ans andalso valOf tl_ans > hd xs
       then tl_ans
       else SOME (hd xs)
    end;

max1([2,3,4,51,2]);

