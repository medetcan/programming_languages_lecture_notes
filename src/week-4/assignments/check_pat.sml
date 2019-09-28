(* Write  a  function collect_all,
 * That  takes  a  pattern  and  returns  true  iff the variables appearing in the  pattern are distinct from  each  other 
 * The constructornames are not relevant.
 * *)


 use "provided.sml";



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


check_pat(ConstructorP("Medet", TupleP [Variable "Medet", Variable "Can", TupleP [Variable "Can", Wildcard]]));
check_pat(ConstructorP("Medet", TupleP [Variable "Selin", Variable "Badem", TupleP [Variable "Can", Wildcard]]));
