(* Write a function dates_in_month that takes a list of dates and a month and returns a list holding the dates from the argument list of dates that are in the month.  
 * The returned list should contain dates in the order they were originally given.
 *)


 fun dates_in_month(dateList : (int * int * int) list, month : int)=
    if null dateList
    then []
    else 
        let 
            val date = dates_in_month(tl dateList, month)
        in
        if #2 (hd dateList) = month then (hd dateList)::date else date 
        end;

(* Months Occurence
 *  1       8
 *  2       1       
 *  3       1
 *  4       0
 *  5       4
 *  6       2
 *  7       1
 *  8       3
 *  9       2
 *  10      1
 *  11      2
 *  12      3
 *  Total   28
*)

val dateList = [
  (1992,1,1),(1993,1,1),(1993,2,1),(1992,1,3),
  (1995,1,1),(1992,5,1),(1992,1,5),(1992,5,1),
  (1988,5,3),(1977,5,2),(1992,1,4),(1996,1,1),
  (1988,3,6),(1977,10,2),(1992,9,4),(1996,9,31),
  (1989,6,3),(1977,11,2),(1992,11,4),(1996,6,31),
  (2188,12,18),(1977,8,2),(1992,8,4),(1996,8,1),
  (2088,12,3),(1977,12,22),(1992,1,4),(1996,7,11)
  ];

dates_in_month(dateList, 1);
dates_in_month(dateList, 2);
dates_in_month(dateList, 3);
dates_in_month(dateList, 4);
dates_in_month(dateList, 5);
dates_in_month(dateList, 6);
dates_in_month(dateList, 7);
dates_in_month(dateList, 8);
dates_in_month(dateList, 9);
dates_in_month(dateList, 10);
dates_in_month(dateList, 11);
dates_in_month(dateList, 12);
