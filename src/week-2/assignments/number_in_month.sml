 (* Write a function number_in_month that takes a list of dates and a month
  * and returns how many dates in the list are in the given month. *)


fun number_in_month(dtList : (int * int * int) list, mnth : int)=
  if null dtList
  then 0
  else 
    let 
      fun is_equal(mnth1 : int)=
        if mnth1 = mnth then 1 else 0
    in
      is_equal(#2 (hd dtList)) + number_in_month(tl dtList, mnth)
    end



(* Months Occurence
 *  1       7
 *  2       1       
 *  3       1
 *  4       0
 *  5       4
 *  6       0
 *  7       0
 *  8       0
 *  9       2
 *  10      1
 *  11      0
 *  12      0
*)
val dtList = [
  (1992,1,1),(1993,1,1),(1993,2,1),(1992,1,3),
  (1995,1,1),(1992,5,1),(1992,1,5),(1992,5,1),
  (1988,5,3),(1977,5,2),(1992,1,4),(1996,1,1),
  (1988,3,6),(1977,10,2),(1992,9,4),(1996,9,31)
  ];

number_in_month(dtList, 1);
number_in_month(dtList, 2);
number_in_month(dtList, 3);
number_in_month(dtList, 4);
number_in_month(dtList, 5);
number_in_month(dtList, 6);
number_in_month(dtList, 7);
number_in_month(dtList, 8);
number_in_month(dtList, 9);
number_in_month(dtList, 10);
number_in_month(dtList, 11);
number_in_month(dtList, 12);