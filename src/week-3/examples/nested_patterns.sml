(* Full meaning of pattern-matching is to compare a pattern against a value for the "same shape" and 
 * bind variables to the "right parts".
 *
 *)

exception ListLengthMismatch
val exampleList = ([1,2,3],[4,5,6],[7,8,9]);
fun old_zip(l1, l2, l3)=
    if null l1 andalso null l2 andalso null l3
    then []
    else if null l1 orelse null l2 orelse null l3
    then raise ListLengthMismatch
    else (hd l1, hd l2, hd l3)::old_zip(tl l1, tl l2, tl l3);

fun zip list_triple =
    case list_triple of
         ([], [], []) => []
        |(hd1::tl1, hd2::tl2, hd3::tl3) => (hd1, hd2, hd3)::zip(tl1, tl2, tl3)
        | _ => raise ListLengthMismatch;

(* [(1,4,7),(2,5,8),(3,6,9)] *)
val zippedList = zip(exampleList);

fun unzip list_triple =
    case list_triple of
        ([]) => ([],[],[])
       |(h1,h2,h3)::tl => let val (l1,l2,l3) = unzip tl
                          in
                              (h1::l1,h2::l2,h3::l3)
                          end

val unzippedList = unzip(zippedList);