

fun fold(f,acc, xs)=
  case xs of
       [] => acc
     | x::xs' => fold(f, f(acc, x), xs');

(* Sum all the elements in the list *)
fun f1(xs)= fold(fn(x,y) => x + y, 0, xs);
f1([1,2,3,4]);

(* are all elements in the list non-negative *)
fun f2(xs)= fold(fn(x,y) => x andalso y > 0, true, xs);
f2([2,4,6,8]);
f2([2,4,6,~9]);

fun f3(xs, s)=
  let
    val i = String.size s
  in
    fold(fn(x,y) => x andalso String.size y < i, true, xs)
  end;
f3(["a", "bb", "ccc"], "cc");
f3(["bb", "ccc"], "cc");
f3(["a", "b", "c"], "cc");

fun f4(xs, lo, hi)= fold(fn(x,y) => x + (if y >= lo andalso y <= hi then 1 else 0), 0, xs);
f4([1,2,3,4], 1, 10);

fun f5(g, xs)= fold(fn(x,y) => x andalso g y, true, xs);
f5(fn x => x mod 2 = 0, [1,2,3,4,5]);
f5(fn x => x mod 2 = 0, [2,4,6,8]);

fun f3Again(xs, s)=
  let
    val i = String.size s
  in
    f5(fn(y) => String.size y < i, xs)
  end;
f3Again(["a", "bb", "ccc"], "cc");
f3Again(["a", "b", "c"], "cc");

