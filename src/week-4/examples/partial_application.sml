

fun sorted3 x y z = z>=y andalso y>=x;

fun fold f acc xs =
  case xs of
       [] => acc
     | x::xs' => fold f (f(acc, x)) xs';

val is_nonnegative = sorted3 0 0;
val sum = fold (fn(x,y) => x + y) 0;

(* Unnecassary function wrapping *)
fun is_nonnegative_inferior x = sorted3 0 0 x;
fun sum_inferior xs = fold (fn(x,y) => x + y) 0 xs; 



fun range i j = if i > j then [] else i::range(i + 1) j;
val countup = range 1;

fun countup_inferior x = range 1 x; 

fun exists predicate xs =
  case xs of
       [] => false
     | x::xs' => predicate x orelse exists predicate xs';

exists (fn x => x mod 2 = 0) [1,3,5,7,9];
exists (fn x => x mod 2 = 0) [1,3,5,7,9,2];

val hasZero = exists (fn x => x=0);

(* Built-in List.map, List.filter, List.fold functions are curried functions *)
val removeZeros = List.filter (fn x => x <> 0);
