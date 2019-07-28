(* To access underlying values of a datatype binding, we can use case expressions *)
(* ML combines the two aspects of accessing a one-of value with a case expression and pattern matching. *)

datatype mytype = TwoInts of int * int
                | Str of string
                | Pizza;
fun f x=
  case x of
       Pizza => 3
     | TwoInts(i1, i2) => i1 + i2
     | Str s => String.size s

  val a = TwoInts (2,5);
  f a;

(* Syntax of case expressions;  
    case e0 of
       p1 => e1
     | p2 => e2
     | p3 => e3
          .
          .
          .
     | pn => en
*)
