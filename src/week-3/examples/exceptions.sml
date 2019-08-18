fun hd xs =
  case xs of
       [] => raise List.Empty
     | x::_ => x;


(*  *)
exception MyException;

