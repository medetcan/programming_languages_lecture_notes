(* e1 andalso e2 is a boolean and operator *)
(* e1 and e2 has a type boolean *)
(*if e1 is false entire expression is false and then e2 is not evaluated*)
(* e1 orelse e2 is a boolean or operator and it short circuits like andalso operator *)
(* not e1 negation function it is not an operator*)
(* orelse and andalso are boolean operator and not function. Functions evaluates all of its arguments before invocation *)


true andalso false;
not false;
not; (* not is a function that has a type bool -> bool *)

false orelse true;

(* equality operator = *)
(* not equal to operator <> *)
(* greater than operator > *)
(* less than operator < *)
(* greater than or equal to operator >= *)
(* less than or equal to operator <= *)
(* > < >= <= can be used with real type but cannot be mixed with type int *)
(* 2.0 > 2; error! *)
Real.fromInt 2 > 1.0;
(* = <> operators can not be used with real type *)
(* floating point numbers or real types in ml is not subject to equality and not equal to operations because floating point numbers not fixed *)
(* equality of two floating point numbers should always be determined by comparing them against a some epsilon value that determines how close they are to each other *)

