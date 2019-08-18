

(* Why Lexical scope 
 * function can easily be refactored since variable names not depends on dynamic environment, 
 *     We don't have to worry about where our function wiht what variable is called.
 * Static analysis much more easier for lexical scope than dynamic scope we can make less assumptions about code in dynamic scope.
 * Closures can easily store the data they need.
 *
 * *)
(* f1 and f2 are always the same, no matter where result is used *)
(* if we had dynamic scope, variable x at line 19 would have been used by the * function call without first looking at the let expression *)
fun f1 y =
  let
    val x = y + 1
  in
    fn z => x + y + z
  end;

fun f2 y =
  let
    val q = y + 1
  in
     fn z => q + y + z
  end;

val x = 17;
val a1 = (f1 7) 4;
val a2 = (f2 7) 4;

fun filter(f, xs)=
  case xs of
       [] => []
     | x::xs' => if f x then x::(filter(f, xs')) else filter(f, xs');

(* Higher order function, when greaterThanX is called returned function will capture whatever the argument passed to greaterThanX function *)
fun greaterThanX x = fn y => y > x; 
(* if dynamic scope was used, x would have been dynamically determined and x could have been different in filter function from call to call rather than being ~1 *) 
fun noNegatives xs = filter(greaterThanX ~1, xs);
fun allGreater(xs, n) = filter(fn x => x > n, xs);
