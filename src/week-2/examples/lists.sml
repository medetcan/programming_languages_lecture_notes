(* lists in sml can not have arbitrary number of types all of them must of the same type *)
(* lists can be built with any number of elements *)

(* empty element list *)
val x = [];

(*syntax: [e1 : t0, e2 : t0, e3 : to, ..., en : t0]*)
val numbers = [1,2,3];

(* colon colon operation allows to add elements to a list new elements are added to beginning of the list *)
val numbers = 11::12::numbers;

 (* null operator is a list operator and it evaluates to true if the operand is empty otherwise it returns false *)
 null [];
 null numbers;

 (* hd built-in function returns the first element in the list *)
 hd numbers;
 (* tl built-in function returns the all of the elements of the list except the first element *)
 tl numbers;

hd (tl (tl (tl (tl numbers))));

val x = [5, 1, 6, 8];

hd (tl (tl x));

(* 'a type is called alpha and it allows us to write polymorphic code it can be target of any type*)
fun my_fun x : 'a = x;
my_fun "12";
my_fun 2;
