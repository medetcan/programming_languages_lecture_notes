val value = [(1,2), (3,4), (4,5)];

val x = case value of 
             [] => 1
           | (a,b)::(c,d)::(e,f)::g => 2
           | _ => 3


fun mystery f xs =
    let
        fun g xs =
           case xs of
               [] => NONE
             | x::xs' => if f x then SOME x else g xs'
    in
        case xs of
            [] => NONE
          | x::xs' => if f x then g xs' else mystery f xs'
    end;

mystery (fn x => true) [1];


hd [] handle List.Empty => 0;
