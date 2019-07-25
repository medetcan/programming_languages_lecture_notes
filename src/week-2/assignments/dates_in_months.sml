(* Write a function dates_in_months 
 * that takes a list of dates and a list of months and returns a list holding the dates from the argument list of dates that are in any of the months in the list of months.
 * Assume the list of months has no number repeated.
 * Hint: Use your answer to the previous problem and SML’s list-append operator (@).
 *)

 use "dates_in_month.sml";

 fun dates_in_months(dateList : (int * int * int) list, monthList : int list)=
   if null monthList
   then []
   else dates_in_month(dateList, hd monthList) @ dates_in_months(dateList, tl monthList);


val dateList = [
  (1992,1,1),(1993,1,1),(1993,2,1),(1992,1,3),
  (1995,1,1),(1992,5,1),(1992,1,5),(1992,5,1),
  (1988,5,3),(1977,5,2),(1992,1,4),(1996,1,1),
  (1988,3,6),(1977,10,2),(1992,9,4),(1996,9,31),
  (1989,6,3),(1977,11,2),(1992,11,4),(1996,6,31),
  (2188,12,18),(1977,8,2),(1992,8,4),(1996,8,1),
  (2088,12,3),(1977,12,22),(1992,1,4),(1996,7,11)
  ];

dates_in_months(dateList, [1]);
dates_in_months(dateList, [9]);
dates_in_months(dateList, [10]);
dates_in_months(dateList, [11]);
dates_in_months(dateList, [12]);
dates_in_months(dateList, [1,2]);
dates_in_months(dateList, [1,3]);
dates_in_months(dateList, [5,4]);
dates_in_months(dateList, [6,5]);
dates_in_months(dateList, [8,6]);
dates_in_months(dateList, [12,3]);
