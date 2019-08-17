 (* function score, 
  * which takes a card list(the held-cards) and an int(the goal) and computes the score as described above. 
  * *)
  
use "hw2provided.sml";
use "all_same_color.sml";

fun card_value(card : card)=
  case card of 
       (_, Num value) => value
     | (_, Ace) => 11
     | _ => 10;

fun sum_cards(cardList : card list)=
  let
    fun sum_cards(cardList : card list, sum : int)= 
      case cardList of
           [] => sum
         | c::cardList' => sum_cards(cardList', card_value(c) + sum)
  in
    sum_cards(cardList, 0)
  end;

fun score(cardList : (card list), goal : int)=
  let
    val sum = sum_cards(cardList)
  in
    let 
      val preliminaryScore = if sum > goal then 3 * (sum - goal) else (goal -sum)
    in 
    if all_same_color(cardList) then (preliminaryScore div 2) else preliminaryScore
    end
  end;

score([(Spades, Num 2)], 5);
val test10 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
