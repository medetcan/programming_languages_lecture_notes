(* Tail recursion is a powerful way to optimize recursive code *)


fun append(xs, ys) = (* This version of append function is not optimized for tail recursion *)
  case xs of
       [] => ys
     | x::xs' => x::append(xs', ys);

fun append_tail(xs, ys) = (*This version is tail recursive because recursive calls immediately returns with a new function call without having extra burden *)
  case xs of
       [] => ys
     | x::xs' => append(xs', x::ys)

fun fibonacci(n) = (* Number of stack frames exponentially would increase by these recursive calls *)
  if n = 1 orelse n = 0
  then 1
  else fibonacci(n - 2)+ fibonacci(n - 1);

fibonacci(0);
fibonacci(1);
fibonacci(2);
fibonacci(3);
fibonacci(4);
fibonacci(5);
