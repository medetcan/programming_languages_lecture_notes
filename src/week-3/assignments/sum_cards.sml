 (* function sum_cards,
  * which takes a list of cards and returns the sum of their values.
  * Use a locally defined  helper  function  that  is  tail  recursive. (Take  “calls  use  a  constant  amount  of  stack  space”  as  a requirement for this problem.) 
  * *)


use "hw2provided.sml";
use "card_value.sml";

fun sum_cards(cardList : card list)=
  let
    fun sum_cards(cardList : card list, sum : int)= 
      case cardList of
           [] => sum
         | c::cardList' => sum_cards(cardList', card_value(c) + sum)
  in
    sum_cards(cardList, 0)
  end;



sum_cards [(Clubs, Num 2), (Clubs, Num 5), (Diamonds, King), (Hearts, Ace), (Spades, Queen)];
sum_cards [(Spades, Num 1), (Clubs, Num 2), (Diamonds, Num 3), (Hearts, Num 4), (Diamonds, Jack), (Spades, Queen), (Hearts, King)];
sum_cards [(Hearts, Ace), (Diamonds, Ace), (Clubs, Ace), (Spades, Ace)];
