exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals(lst : string list)=
  List.filter(fn str => Char.isUpper (String.sub(str, 0))) lst;

fun longest_string1(lst : string list)=
  case lst of
       [] => ""
     | lst => List.foldl (fn (next,prev) => if String.size next > String.size prev then next else prev) "" lst;

fun longest_string2(lst : string list)=
  case lst of
       [] => ""
     | lst => List.foldl (fn (next, prev) => if String.size next >= String.size prev then next else prev) "" lst;

fun longest_string_helper(f)= fn lst =>
   case lst of 
        [] => "" 
      | lst => foldl(fn(next,prev) => if f(String.size next,String.size prev) then next else prev)  "" lst;

val longest_string3 = longest_string_helper (fn(size_next, size_prev) => size_next > size_prev)
val longest_string4 = longest_string_helper (fn(size_next, size_prev) => size_next >= size_prev)


val get_capitals = List.filter (fn str => Char.isUpper(String.sub(str, 0)));
val longest_capitalized = longest_string1 o get_capitals;


fun rev_string(str : string)=
  (String.implode o List.rev o String.explode) str;


fun first_answer f xs =
   case xs of
        [] => raise NoAnswer
      | x::xs' => if isSome (f x) then valOf (f x) else first_answer f xs';

fun all_answers f xs =
  case xs of
       [] => SOME []
      | x::xs' => case (f x) of 
                       SOME lst => SOME (lst @ valOf (all_answers f xs')) 
                     | _ => NONE;

fun count_wildcards(p : pattern)=
  g (fn () => 1) (fn _ => 0) p;

fun count_wild_and_variable_lengths p=
  g (fn () => 1) (fn str => String.size str) p;

fun count_some_var(str, p) =
  g (fn () => 0) (fn str2 => case String.compare(str2, str) of EQUAL => 1 | _ => 0) p;

fun check_pat p=
  let
    fun collect_all p = 
      case p of
           Variable str => [str]
         | ConstructorP(_,p') => collect_all(p')
         | TupleP ps => List.foldl (fn (p, acc) => (collect_all p) @ acc ) [] ps
         | _ => [];
    fun isNotEqual str = fn str2 => 
      case String.compare(str2, str) of 
           EQUAL => false 
         | _ => true;
    fun all_answers f xs =
      case xs of
           [] => true
         | x'::xs' => List.all (f x') xs' andalso all_answers f xs';
  in
  (all_answers isNotEqual o collect_all) p
  end;

fun match (value : valu, p : pattern)=
  case (value, p) of
       (_, Wildcard) => SOME []
     | (value', Variable str) => SOME [(str,value')]
     | (Tuple vs, TupleP ps) => 
         if List.length vs = List.length ps 
         then all_answers match (ListPair.zip(vs, ps))
         else NONE
     | (Constructor(s2, v), ConstructorP(s1, p)) => if s1 = s2 then match (v, p) else NONE
     | (_, ConstP _) => SOME []
     | (Unit, UnitP) => SOME []
     | _ => NONE;

fun first_match v ps =
  case ps of
       [] => NONE
     | ps => SOME (first_answer (fn p => match(v,p))  ps) handle NoAnswer => NONE;
