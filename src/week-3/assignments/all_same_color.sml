 (* function all_same_color,
  * which takes a list of cards and returns true if all the cards in the list are the same color.  
  * *)


use "hw2provided.sml";
use "card_color.sml";

fun all_same_color(cardList : card list)=
  case cardList of 
       [] => true 
     | c::cardList' => 
         let 
           val color = card_color(c) 
           fun all_same_color(cardList : card list)= 
             case cardList of 
                  [] => true 
                | c::cardList' => card_color(c) = color andalso all_same_color(cardList') 
         in
           all_same_color(cardList')
         end;

all_same_color [(Spades, Ace), (Spades, King), (Spades, Queen), (Spades, Jack)];
all_same_color [(Spades, Ace), (Hearts, Num 3), (Spades, King)];
all_same_color [(Spades, Ace), (Spades, Num 2), (Hearts, Num 3), (Hearts, King)];
all_same_color [(Diamonds, Ace), (Hearts, Num 3)];
all_same_color [(Hearts, Ace), (Hearts, Num 3), (Spades, Num 4)];
all_same_color [(Hearts, Ace), (Hearts, Num 3), (Hearts, Num 4)];
all_same_color [];
