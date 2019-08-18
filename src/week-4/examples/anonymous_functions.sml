(* In ML you can define anonymous functions 
 * Anonymous functions, sometimes called lambda expressions are small inline functions without bindings
 * this is useful for creating simple helper functions 
 * Most commons use of for anonymous functions is to give as an argument to ahigher order function
 * Cannot use an anonymous function for a recursive function
 *     Because there is no name for making recursive calls
 * *)



fun n_times(f, n, x)=
  if n = 0
  then x
  else f(n_times(f, n - 1, x));

fun triple_n_times(n, x)=
  n_times(fn x => 3 * x, n, x); (* Anonymous function expression. It does not have a binding *)


triple_n_times(4, 3);
