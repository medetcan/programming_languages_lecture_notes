(* Records are similar to tuples but unlike tuples and pairs records have named fields and elements of a record can be accessed through these named fields. *)


(* Record values have fields holding values: *)
(* {f1 = v1, f2 = v2, ... fn = vn} *)
(* Record types have fields holding types: *)
(* {f1 : t1, f2 : t2, ..., fn : tn} *)
(* To create a record: *)
(* {f1 = e1, f2 = e2, ... fn = en} *)
(* To access a record field *)
(* #f1 e(xpression -evaluates to a record value) *)

(* Example declaration of a record *)
val x = { bar=(1+2, true),  foo=3+4, baz=7 };


val my_niece = {name = "Amelia", id = 4848484 - 12};

(* To get the individual elements of a record you can use following syntax #<field_name> record_name; *)
#name my_niece;
#id my_niece;
