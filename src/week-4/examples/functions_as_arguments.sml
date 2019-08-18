
(* Following functions are similar in terms of structure.
 * They can be generalized to just single function and how it computes the result can be passed as an argument to that function
 * First class functions are extensible new computations can easily be passed as an argument to that function
 * *)
fun increment_n_times_lame(n,x)=
  if n = 0
  then x
  else 1 + increment_n_times_lame(n - 1, x);

fun double_n_times_lame(n,x)=
  if n = 0
  then x
  else 2 * double_n_times_lame(n - 1, x);

fun nth_tail_lame(n, xs)=
  if n = 0
  then xs
  else tl (nth_tail_lame(n - 1, xs));


fun n_times(f, n, x)=
  if n = 0
  then x
  else f(n_times(f, n - 1, x));

fun double x = x + x;
fun increment x = 1 + x;

(n_times(double, 4,2) = 32);
(n_times(double, 4,7) = 112);
(n_times(increment, 4,2) = 6);
(n_times(tl, 4, [1,2,3,4,5]) = [5]);

(* We generalized the code and implemented different computations *)
fun addition(n, x) = n_times(increment, n, x);
fun double_n_times(n, x) = n_times(double, n, x);
fun nth_tail(n, x) = n_times(tl, n, x);
