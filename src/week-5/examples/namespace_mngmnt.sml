signature MyMathLibSig = 
sig
  val fact : int -> int
  val half_pi : real 
  val doubler : int -> int
  (* val sum : (int * int) -> int  || You can hide top level module functions by simply ignoring to declare them in the module signature *)
end
structure MyMathLib :> MyMathLibSig =
struct
  fun fact x =
    if x = 0
    then 1
    else x * fact(x - 1);

val half_pi = Math.pi / 2.0;
fun doubler y = y + y
fun sum (x,y) = x + y
end;

val pi = MyMathLib.half_pi + MyMathLib.half_pi;
val twenty_eight = MyMathLib.doubler 14;
(* MyMathLib.sum(4, 6);  Error unbound variable or constructor *)
