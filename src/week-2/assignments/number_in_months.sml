(* Write a function number_in_months that takes a list of dates and a list of months and returns the number of dates in the list of dates 
 * that are in any of the months in the list of months.
 * Assume the list of months has no number repeated.
 *
 *)

 use "number_in_month.sml";


 fun number_in_months(dtList : (int * int * int) list, mnthList : int list)=
    if null mnthList
    then 0
    else number_in_month(dtList, hd mnthList) + number_in_months(dtList, tl mnthList);

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

val dtList = [
  (1992,1,1),(1993,1,1),(1993,2,1),(1992,1,3),
  (1995,1,1),(1992,5,1),(1992,1,5),(1992,5,1),
  (1988,5,3),(1977,5,2),(1992,1,4),(1996,1,1),
  (1988,3,6),(1977,10,2),(1992,9,4),(1996,9,31),
  (1989,6,3),(1977,11,2),(1992,11,4),(1996,6,31),
  (2188,12,18),(1977,8,2),(1992,8,4),(1996,8,1),
  (2088,12,3),(1977,12,22),(1992,1,4),(1996,7,11)
  ];

number_in_months(dtList, [1]);
number_in_months(dtList, [2]);
number_in_months(dtList, [3]);
number_in_months(dtList, [4]);
number_in_months(dtList, [5]);
number_in_months(dtList, [6]);
number_in_months(dtList, [7]);
number_in_months(dtList, [8]);
number_in_months(dtList, [9]);
number_in_months(dtList, [10]);
number_in_months(dtList, [11]);
number_in_months(dtList, [12]);
number_in_months(dtList, [1,2]);
number_in_months(dtList, [1,2,3]);
number_in_months(dtList, [1,2,3,4]);
number_in_months(dtList, [1,2,3,4,5]);
number_in_months(dtList, [1,2,3,4,5,6]);
number_in_months(dtList, [1,2,3,4,5,6,7]);
number_in_months(dtList, [1,2,3,4,5,6,7,8]);
number_in_months(dtList, [1,2,3,4,5,6,7,8,9]);
number_in_months(dtList, [1,2,3,4,5,6,7,8,9,10]);
number_in_months(dtList, [1,2,3,4,5,6,7,8,9,10,11]);
number_in_months(dtList, [1,2,3,4,5,6,7,8,9,10,11,12]);