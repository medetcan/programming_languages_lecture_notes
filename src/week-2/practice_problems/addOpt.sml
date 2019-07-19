(* Write a function addOpt  : int option * int option -> int option
 * that given two "optional" integers, adds them if they are both present 
 * returning SOME of their sum, or returns NONE if at least one of the two arguments is NONE.
*)

fun addOpt(val1 : int option, val2 : int option)=
    if isSome val1 andalso isSome val2
    then SOME (valOf val1 + valOf val2)
    else NONE;

addOpt(NONE, NONE);
addOpt(SOME 5, NONE);
addOpt(NONE, SOME 5);
addOpt(SOME 5, SOME 3);
