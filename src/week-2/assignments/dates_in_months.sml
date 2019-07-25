(* Write a function dates_in_months 
 * that takes a list of dates and a list of months and returns a list holding the dates from the argument list of dates that are in any of the months in the list of months.
 * Assume the list of months has no number repeated.
 * Hint: Use your answer to the previous problem and SML’s list-append operator (@).
 *)

 use "dates_in_month.sml";

 fun dates_in_months(dateList : (int * int * int) list, monthList : int list)=
    [];