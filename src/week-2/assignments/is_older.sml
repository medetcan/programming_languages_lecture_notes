(* Write a function is_older that takes two dates and evaluates to true or false.
 * It evaluates to true if the first argument is a date that comes before the second argument.
 * If the two dates are the same, the result is false.
 * *)


fun is_older(dt1 : int * int * int, dt2 : int * int * int)=
 #1 dt1 < #1 dt2 orelse #2 dt1 < #2 dt2 orelse #3 dt1 < #3 dt2;


is_older((1970,1,1), (1970,1,1));
is_older((1970,1,1), (1970,1,2));
is_older((1970,1,1), (1970,2,1));
is_older((1970,1,1), (1971,1,1));

is_older((1971,1,1), (1970,1,1));
is_older((1970,2,1), (1970,1,1));
is_older((1970,1,2), (1970,1,1));
