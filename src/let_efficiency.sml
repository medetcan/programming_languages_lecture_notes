

(* Helper functions *)

fun countup(from : int, to : int) =
  if from = to
  then to::[]
  else from::countup(from + 1, to);

countup(1,10);

fun countdown(from : int, to : int) =
  if to = from
  then to::[]
  else from::countdown(from - 1,  to);

countdown(10, 1);


fun bad_max(xs : int list) =
  if null xs
  then 0
  else if null (tl xs)
  then hd xs
  else if hd xs > bad_max(tl xs)
  then hd xs
  else bad_max(tl xs);

bad_max(countdown(30, 1));
bad_max(countdown(3000, 1));
bad_max(countup(1,2));


fun good_max(xs : int list) =
  if null xs
  then 0
  else if null (tl xs)
  then hd xs
  else
    let 
      val tl_ans = good_max(tl xs)
    in
      if hd xs > tl_ans
      then hd xs
      else tl_ans
    end;

good_max(countdown(30, 1));
good_max(countdown(3000, 1));
good_max(countup(1,2000));

