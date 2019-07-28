(* Following code samples list three version of the sum_triple function *)
(* In ML functions take exactly one argument and that is a pattern *)
(* When you specify more than one argument between parentheses you are just pattern matching against a tuple!! *)

fun sum_triple triple =
  let val (x,y,z) = triple
  in
    x + y + z 
  end;

fun sum_triple triple =
  case triple of
       (x, y, z) => x + y + z;

fun sum_triple (x,y,z) =
  x + y + z;

fun full_name(r : {fname : string, mname : string, lname : string})=
  let val {fname, mname, lname} = r
  in
    fname ^ " " ^ mname ^ " " ^ lname
  end;

fun full_name {fname : string, lname : string, mname : string} =
    fname ^ " " ^ mname ^ " " ^ lname;



full_name({fname = "Medet", mname= "Can", lname="Akus"});

