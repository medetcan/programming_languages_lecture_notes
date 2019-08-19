


fun compose(f,g)= fn x => f(g(x)); (* (a'-> b') * (c'->a') *)
(* ML has built in support for function composition lowercase o operator compose functions together from right to left *)
(* f o g *)
val _ = (fn x => x * 2) o (fn x => x + 2);

fun sqrt_of_abs(i)= (* int -> real *)
  Math.sqrt (Real.fromInt (abs i));

fun sqrt_of_abs i = (Math.sqrt o Real.fromInt o abs) i;
val sqrt_of_abs2 = Math.sqrt o Real.fromInt o abs;

(* |> !> these operator compose function together and compose them together from left to right *)
(* We can make our own infix operator in ML! *)
infix !>
fun x !> f = f x;

(* We defined our own infix operator in ML and tell it how to compute its operands *)
infix ?+
fun x ?+ y = x * y + 2;
3 ?+ 4;

fun sqrt_of_abs i = i !> abs !> Real.fromInt !> Math.sqrt;
fun backup1(f,g) = fn x => case f x of 
                                NONE => g x
                              | SOME y => y;

fun backup2(f,g) = fn x => f x handle _ => g x;                              
