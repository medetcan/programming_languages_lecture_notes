  (* function card_color,  
   * which  takes  a  card  and  returns  its  color  (spades  and  clubs  are  black,diamonds and hearts are red). 
   * Note:  One case-expression is enough. 
   * *)

use "hw2provided.sml";


fun card_color(card : card)=
  case card of
    (Clubs, _) => Black
     | (Spades, _) => Black
     | (Diamonds, _) => Red
     | (Hearts, _) => Red;

Black = card_color (Clubs, Num 2);
Black = card_color (Spades, Num 2);
Red = card_color (Diamonds, Num 2);
Red = card_color (Hearts, Num 2);
Black = card_color (Clubs, Ace);
Black = card_color (Clubs, King);

