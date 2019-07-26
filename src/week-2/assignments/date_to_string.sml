(* Write a function date_to_string 
 * That takes a date and returns a string of the form January 20, 2013. 
 * Use the operator ^ for concatenating strings and the library function Int.toString for converting an int to a string.
 * For producing the month part, do not use a bunch of conditionals.
 * Instead, use a list holding 12 strings and your answer to the previous problem.  
 * For consistency, put a comma following the day and use capitalized English month names;
 *  such as  January, February, March, April,May, June, July, August, September, October, November, December.
 *
 *)

use "get_nth.sml";

val monthList = [
    "January", "February", "March", 
    "April", "May", "June", 
    "July", "August", "September", 
    "October", "November", "December"
];

fun date_to_string(date : (int * int * int))=
    get_nth(monthList, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date);

date_to_string((1992,01,07));
date_to_string((1992,02,07));
date_to_string((1992,03,07));
date_to_string((1992,04,07));
date_to_string((1992,05,07));
date_to_string((1992,06,07));
date_to_string((1992,07,07));
date_to_string((1992,08,07));
date_to_string((1992,09,07));
date_to_string((1992,10,07));
date_to_string((1992,11,07));
date_to_string((1992,12,07));
