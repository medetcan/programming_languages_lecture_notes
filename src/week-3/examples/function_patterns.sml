datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp;


fun my_eval e =
  case e of
       Constant i => i
     | Negate i => ~(my_eval i)
     | Add(i1, i2) => my_eval(i1) + my_eval(i2)
     | Multiply(i1, i2) => my_eval(i1) * my_eval(i2);

fun eval (Constant i) = i
  | eval (Negate i1) = ~(eval i1)
  | eval (Multiply(i1 : exp, i2 : exp)) = eval i1 * eval i2
  | eval (Add(i1 : exp, i2 : exp)) = eval i1 + eval i2;


eval(Multiply(Add(Constant 5, Constant 6), Add(Constant 6, Constant 4)));

fun append ([], ys) = ys
  | append (xs, ys) = (hd xs)::append(tl xs, ys);

append([], [2,3]);
append([1,2], [3,4]);
