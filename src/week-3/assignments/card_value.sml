  (* function card_value,
   * which  takes  a  card  and  returns  its  value,
   * numbered  cards  have  their number as the value, 
   * aces are 11, 
   * everything else is 10. 
   * Note:  One case-expression is enough. 
   * *)

use "hw2provided.sml";


fun card_value(card : card)=
  case card of 
       (_, Num value) => value
     | (_, Ace) => 11
     | _ => 10;

10 = card_value (Clubs, Jack);
10 = card_value (Clubs, Queen);
10 = card_value (Clubs, King);
11 = card_value (Clubs, Ace);
2 = card_value (Clubs, Num 2);
3 = card_value (Clubs, Num 3);
4 = card_value (Clubs, Num 4);
5 = card_value (Clubs, Num 5);
6 = card_value (Clubs, Num 6);
7 = card_value (Clubs, Num 7);
