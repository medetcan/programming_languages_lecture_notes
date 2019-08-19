val cbs : (int -> unit) list ref = ref [];

fun onKeyEvent f = cbs := f::(!cbs);

fun onEvent i =
  let
    fun loop fs =
      case fs of
           [] => ()
         | f::fs' => (f i; loop(fs'))
  in
    loop (!cbs)
  end;

onKeyEvent(fn i => if i = 1 then print("Key Pressed\n") else ());
onKeyEvent(fn i => if i = 2 then print("Key Pressed\n") else ());
onKeyEvent(fn i => if i = 3 then print("Key Pressed\n") else ());
onKeyEvent(fn i => if i = 4 then print("Key Pressed\n") else ());
onKeyEvent(fn i => if i = 5 then print("Key Pressed\n") else ());
onKeyEvent(fn i => if i = 6 then print("Key Pressed\n") else ());
onKeyEvent(fn i => if i = 7 then print("Key Pressed\n") else ());
onKeyEvent(fn i => if i = 8 then print("Key Pressed\n") else ());
onKeyEvent(fn i => if i = 9 then print("Key Pressed\n") else ());
val timesPressed : int ref = ref 0;
onKeyEvent(fn _ => timesPressed := !timesPressed + 1);

onEvent(1);
onEvent(2);
onEvent(3);
onEvent(4);
onEvent(5);
onEvent(6);
onEvent(7);
onEvent(8);
onEvent(9);
print("You pressed " ^ Int.toString (!timesPressed) ^ " times \n");
