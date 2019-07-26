(* Write  a  function oldest that  takes  a  list  of  dates  and  evaluates  to  an (int*int*int) option.   
 * It evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list.
 *)

use "is_older.sml";

fun oldest(dateList : (int * int * int) list)=
    if null dateList
    then NONE
    else
        let 
            val tmp = oldest(tl dateList)
        in 
            if isSome tmp andalso is_older(valOf tmp, (hd dateList))
            then tmp 
            else SOME (hd dateList)
        end;

val dateList = [
  (1877,1,1),(1993,1,1),(1993,2,1),(1992,1,3),
  (1995,1,1),(1992,5,1),(1992,1,5),(1992,5,1),
  (1988,5,3),(1977,5,2),(1992,1,4),(1996,1,1),
  (1988,3,6),(1977,10,2),(1992,9,4),(1996,9,31),
  (1989,6,3),(1977,11,2),(1992,11,4),(1996,6,31),
  (2188,12,18),(1977,8,2),(1992,8,4),(1996,8,1),
  (2088,12,3),(1977,12,22),(1992,1,4),(1996,7,11),(1, 1, 2),(1,2,1)
  ];


oldest(dateList);

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
    
