
fun range(i, j) = if i > j then [] else i::range(i + 1, j);

(* val countup = range 1  Won't work range function is not curried *)
fun curry f x y = f(x,y); 
fun uncurry f(x,y) = f x y;
fun change_argument_order f x y = f y x
val countup = (curry range) 1;
val xs = countup 7;
