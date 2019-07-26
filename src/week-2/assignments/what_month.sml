(* Write a function what_month 
 * That takes a day of year (between 1 and 365) and returns what month that day is in ( for January 1, 2 for February, etc.). 
 * Use a list holding 12 integers and your answer to the previous problem.
 *)

use "number_before_reaching_sum.sml";

val monthList = [
    31,28,31,
    30,31,30,
    31,31,30,
    31,30,31
];

fun what_month(day : int)=
    number_before_reaching_sum(day, monthList) + 1;

what_month(1);
what_month(31);
what_month(32);
what_month(59);
what_month(60);
what_month(365);
what_month(334);
what_month(333);
what_month(533);