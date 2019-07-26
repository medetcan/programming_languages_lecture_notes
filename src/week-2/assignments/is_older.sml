(* Write a function is_older that takes two dates and evaluates to true or false.
 * It evaluates to true if the first argument is a date that comes before the second argument.
 * If the two dates are the same, the result is false.
 * *)


fun is_older(dt1 : int * int * int, dt2 : int * int * int)=
 #1 dt1 < #1 dt2 orelse 
     #1 dt1 = #1 dt2
        andalso #2 dt1 < #2 dt2
            orelse #2 dt1 = #2 dt2 andalso #3 dt1 < #3 dt2;
 

val test1 = is_older((1970,1,1), (1970,1,1)) = false;
val test2 = is_older((1970,1,1), (1970,1,2)) = true;
val test3 = is_older((1970,1,1), (1970,2,1)) = true;
val test4 = is_older((1970,1,1), (1971,1,1)) = true;

val test5 = is_older((1971,1,1), (1970,1,1)) = false;
val test6 = is_older((1970,2,1), (1970,1,1)) = false;
val test7 = is_older((1970,1,2), (1970,1,1)) = false;
val test8 = is_older((2011,4,28), (2011,3,31)) = false;
val test9 = is_older((2011,3,31), (2011,4,28)) = true;
