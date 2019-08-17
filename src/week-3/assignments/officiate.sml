 (* function officiate, 
  * which “runs a game.”  It takes a card list(the card-list) a move list (what the player “does” at each point), 
  * and an int(the goal) and returns the score at the end of the game after processing (some or all of) the moves in the move list in order.  
  * Use a locally defined recursive helper function that takes several arguments that together represent the current state of the game.  
  * As described above: 
  *     The game starts with the held-cards being the empty list.
  *     The game ends if there are no more moves.  (The player chose to stop since the move list is empty.)
  *     If the player discards some card c, play continues (i.e., make a recursive call) with the held-cards not having c and the card-list unchanged.
  *     If c is not in the held-cards,  raise  the IllegalMove exception.
  *     If the player draws and the card-list is (already) empty, the game is over. 
  *     Else if drawing causes the sum of the held-cards to exceed the goal, 
  *             the game is over (after drawing).  
  *     Else play continues with a larger held-cards and a smaller card-list. 
  *     Sample solution for (g) is under 20 lines. 
  *     *)


use "hw2provided.sml"; 

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

fun card_color(card : card)=
  case card of
    (Clubs, _) => Black
     | (Spades, _) => Black
     | (Diamonds, _) => Red
     | (Hearts, _) => Red;

fun all_same_color(cardList : card list)=
  case cardList of 
       [] => false 
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

fun score(cardList : card list, goal : int)=
  let
    val sum = sum_cards(cardList)
  in
    let 
      val preliminaryScore = if sum > goal then 3 * (sum - goal) else (goal -sum)
    in 
    if all_same_color(cardList) then preliminaryScore div 2 else preliminaryScore
    end
  end;

fun remove_card(cs: card list, c : card, except : exn)=
  let
    fun remove_card(cs : card list, c : card, except : exn, acc : card list)=
      case cs of 
           [] => raise except
         | c'::cs' => if (c' = c) then (acc @ cs') else remove_card(cs', c, except, c'::acc)
  in
    remove_card(cs, c, except, [])
  end;


fun officiate(cardList : card list, moveList : move list, goal : int)=
  let
    fun officiate(cardList, moveList, goal, heldCards)=
      case moveList of
           [] => score(heldCards, goal)
         | Draw::moveList' => (case cardList of
                                   [] => score(heldCards, goal)
                                 | card::cardList' => if sum_cards(card::heldCards) > goal
                                                      then score(card::heldCards, goal) 
                                                      else officiate(cardList', moveList', goal, card::heldCards))
         | Discard(card)::moveList' =>  officiate(cardList, moveList', goal, remove_card(heldCards, card, IllegalMove))
  in
    officiate(cardList, moveList, goal, [])
  end;


val cardList = [(Diamonds, Ace), (Spades, King), (Hearts, Num 4), (Diamonds, Num 5), (Diamonds, Num 8)];
val moveList = [Discard(Diamonds, Ace), Draw, Draw, Draw];

val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6;
val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)], [Draw,Draw,Draw,Draw,Draw], 42) = 3;
val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))], [Draw,Discard(Hearts,Jack)], 42); false) handle IllegalMove => true);
