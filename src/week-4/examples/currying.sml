
(* Currying is a functional programming concept
 * A curried function takes one argument
 * When a curried function is evaluated, it either returns a value or a function, returned function further can be called with an argument 
 * Previously mentioned steps continue until curried function returns a value.
 * *)
fun sorted3_tupled(x,y,z)= z >= y andalso y>=x;
val t1 = sorted3_tupled(7,9,11);

val sorted3 = fn x => fn y => fn z => z>= y andalso y>=x;
val t2 = (((sorted3 7) 9) 11);

(* Notice spaces between arguments this is a built-in way to define curried functions in ML *)
fun sorted3_nicer x y z = z>= y andalso y>=x

fun powerOfN n power = Math.pow(n, power);

val powerOfTwo = powerOfN(real 2); 
powerOfTwo(real 4);
powerOfTwo(real 5);
val powerOfThree = powerOfN(real 3); 
powerOfThree(real 3);
powerOfThree(real 4);

(* means fun fold f = fn acc => fn xs => *)
fun fold f acc xs = (* 'a * b' -> a' -> a' * 'b list -> 'a *)
  case xs of
       [] => acc
     | x::xs' => fold f (f(acc, x)) xs';

fun sum xs = fold (fn(x,y) => x + y) 0 xs;
sum([1,2,3,4,5]);
