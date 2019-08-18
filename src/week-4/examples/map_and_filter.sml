

(* Badly implemented map function *)
fun my_map(f, xs)=
  let
    fun map(f, xs, acc)= 
      case xs of 
           [] => List.rev acc 
         | x::xs' => map(f, xs', (f x)::acc)
  in
    map(f, xs, [])
  end;

fun map(f, xs)=
  case xs of 
       [] => []
     | x::xs' => (f x)::map(f, xs');

my_map(fn x => x * 2, [1,2,3,4,5,6,7,8,9,10]);
map(fn x => x * 2, [1,2,3,4,5,6,7,8,9,10]);
map(hd, [[1,2,3,4],[5,6,7,8,9,10],[5,10,15]]);

fun filter(f, xs)=
  case xs of
       [] => []
     | x::xs' => if (f x) then x::filter(f, xs') else filter(f, xs');

filter(fn x => x mod 2 = 0, [1,2,3,4,5,6,7,8,9,10]);

fun is_even v = (v mod 2 = 0);
fun all_even xs = filter(is_even, xs);
fun all_even_snd xs = filter((fn (_, v) => is_even v), xs);
all_even([2,4,6,8]);
all_even_snd([(1,2),(4,6),(8,11)]);
