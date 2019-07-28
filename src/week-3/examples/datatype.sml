(* Datatype is a ML construct to create our own one of type *)
(* We previously saw variable binding and function binding now it we will see datatype bindings *)
(* Names TwoInt, Str, and Pizza are called tagged unions and used as a constructor to create values of  one of type mytpe *)
datatype mytype = TwoInt of int * int
                | Str of string
                | Pizza;

val x = TwoInt(1,3);
val y = Str "oh, hi mark";
val z = Pizza;

 (* How to use datatype values ?  *)
 (* There are two aspects to accessing a datatype value *)
 (* 1. Check what variant is *)
 (* 2. Extract the data *)
 (*For example null and isSome variant checking functions and valOf, hd, and tl are for extracting the data *)

