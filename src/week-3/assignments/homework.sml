(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

fun all_except_option(str: string, xs : string list)=
  let
    fun all_except_option(str, xs, acc)= (* Shadows outer function binding *)
      case xs of
           [] => NONE
         | x::xs' => if same_string(str, x) then SOME (acc @ xs') else all_except_option(str, xs', x::acc)
  in
    all_except_option(str,xs, [])
  end;

fun get_substitutions1(xs : (string list) list, str : string)=
  case xs of
       [] => []
     | xs'::xs'' => 
         case all_except_option(str, xs') of
              NONE => get_substitutions1(xs'', str) 
            | SOME lst => lst @ get_substitutions1(xs'', str);

fun get_substitutions2(xs : (string list) list, str : string)=
  let
    fun get_substitutions2(xs : (string list) list, str : string, acc : string list)=
      case xs of 
           [] => acc 
         | xs'::xs'' =>
             case all_except_option(str, xs') of 
                  NONE => get_substitutions2(xs'', str, acc) 
                | SOME lst => get_substitutions2(xs'', str, lst @ acc);
  in
    get_substitutions2(xs, str, [])
  end;


fun similar_names(xs : (string list) list, fullname : {first:string, middle:string, last:string})=
  case fullname of {first=fname, middle=_, last=_} => 
    let 
      fun append(fullname : {first:string, middle:string, last:string}, xs : string list)= 
        case xs of 
             [] => [] 
           | x::xs' => case fullname of {first=_, middle=y, last=z} => ({first = x, middle = y, last = z})::append(fullname, xs')
    in 
      append(fullname, fname::get_substitutions2(xs, fname))
    end;

fun card_color(card : card)=
  case card of
    (Clubs, _) => Black
     | (Spades, _) => Black
     | (Diamonds, _) => Red
     | (Hearts, _) => Red;

fun card_value(card : card)=
  case card of 
       (_, Num value) => value
     | (_, Ace) => 11
     | _ => 10;

fun remove_card(cs: card list, c : card, except : exn)=
  let
    fun remove_card(cs : card list, c : card, except : exn, acc : card list)=
      case cs of 
           [] => raise except
         | c'::cs' => if (c' = c) then (acc @ cs') else remove_card(cs', c, except, c'::acc)
  in
    remove_card(cs, c, except, [])
  end;

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

