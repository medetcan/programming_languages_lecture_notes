val x = 1;

fun f y =
  let (* let creates its own scope x will be looked up first within the let expression *)
    val x = y + 1
  in
    fn z => x + y + z
  end;

val x = 3;
val g = f 4;
val y = 5;
val z = g 6;


fun f g=
  let
    val x = 3
  in
    g 2 (*if function g has x where it is defined x in the let expression won't be used *)
  end;

val x = 4;
fun h y = x + y;
val z = f h;
