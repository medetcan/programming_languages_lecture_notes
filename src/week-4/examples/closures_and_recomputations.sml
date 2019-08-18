
fun filter(f, xs)=
  case xs of
       [] => []
     | x::xs' => if f x then x::filter(f, xs') else filter(f, xs');

(* For every element in the list predicate function will be re-evaluted 
 * There is no need to compute the size of the s on each call to predicate function *)
fun allShorterThan1(xs, s)=
  filter(fn x => String.size x < (print "!"; String.size s), xs);

(* Better version of allShorterThan1 is the following function
 * Because closure is used in following function and String.size s only computed once *)
fun allShorterThan2(xs, s)=
  let
    val i = (print "!"; String.size s)
  in
    filter(fn x => String.size x < i, xs)
  end;

val _ = print "\nwithAllShorterThan1: ";
val _ = allShorterThan1(["1", "333", "22", "4444"], "xxx");
val _ = print "\nwithAllShorterThan2: ";
val _ = allShorterThan2(["1", "333", "22", "4444"], "xxx");
