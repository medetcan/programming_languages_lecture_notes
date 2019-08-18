fun nondecreasing xs = (* int list -> bool *)
  case xs of
       [] => true
     | _::[] => true
     | head::(neck::rest) => head <= neck andalso nondecreasing(rest);

nondecreasing([1,2,3,4,5]);
nondecreasing([1,2,3,4,5,2]);


 datatype sgn = P | N | Z;

fun multsign(x1, x2)=
  let fun sign x = if x = 0 then Z else if x>0 then P else N;
  in
    case (sign x1, sign x2) of
         (Z, _) => Z
       | (_, Z) => Z
       | (P, P) => P
       | _ => N
  end;


  multsign(3, ~4);


fun len xs =
  case xs of
      [] => 0
    | _::xs' => 1 + (len xs');

len([2,3,4,5]);
val x::_ = [1,2,3];
val y = 5;
val z = 4;
val (y,z) = (z,y);

