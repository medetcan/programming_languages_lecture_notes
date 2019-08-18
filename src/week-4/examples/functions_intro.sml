(* When you think about functional programming two things come to mind
 *     * Lack of mutation
 *     * Functions are firt-class citizen(Higher-order function)
 *
 * In ML functions are first-class citizen rather than being code, functions are data in ML that can be passed around
 * such places function arguments, lists, tuples, pairs, records and etc.;
 * *)

fun double x = 2 * x;
fun incr x = 1 + x;

val a_tuple = (double, incr, double(incr 7));
val eighteen = (#1 a_tuple) 9;
