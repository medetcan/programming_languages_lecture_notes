(* In ML you can create type synonms using type keyword *)
(* synonm is a perfect word because by using type keyword on types your are not creating a new type you are just aliasing existing type. *)
(* datatype and type synonms are very different datatypes have constructors and with multiple constructors you can create one of type definition but with type synonm you can only alias an existing type definition. *)

(* following is the syntax for type synonms *)
type tname = int * int * int;

 (* type synonm is not an expression following code will throw an error! *)
(* tname  *)

datatype myexp = King | Queen | Joker;
 King;
