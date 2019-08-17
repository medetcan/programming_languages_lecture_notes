 (* function remove_card,
  * which takes a list of cards cs, a card c, and an exceptione.  
  * It returns a list that has all the elements of cs except c.
  * If c is in the list more than once, remove only the first one.
  * If c is not in the list, raise the exceptione.  
  * You can compare cards with =. 
  * *)

use "hw2provided.sml";

exception OhMyMy;

fun remove_card(cs: card list, c : card, except : exn)=
  let
    fun remove_card(cs : card list, c : card, except : exn, acc : card list)=
      case cs of 
           [] => raise except
         | c'::cs' => if (c' = c) then (acc @ cs') else remove_card(cs', c, except, c'::acc)
  in
    remove_card(cs, c, except, [])
  end;

 
val cs = [(Spades, Num 1), (Clubs, Num 2), (Diamonds, Num 3), (Hearts, Num 4), (Diamonds, Jack), (Spades, Queen), (Hearts, King)];

remove_card(cs, (Spades, Num 1), OhMyMy);
remove_card(cs, (Clubs, Num 2), OhMyMy);
remove_card(cs, (Hearts, King), OhMyMy);
[] = (remove_card(cs, (Clubs, Num 9), OhMyMy) handle OhMyMy => []);

