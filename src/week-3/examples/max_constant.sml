datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp;


fun max_constant e =
  let fun max_of_two(i1, i2)=
          Int.max(max_constant i1, max_constant i2)
  in
  case e of
       Constant i => i
     | Negate i => max_constant i
     | Add(i1, i2) => max_of_two(i1,i2)
     | Multiply(i1,i2) => max_of_two(i1,i2)
  end;


max_constant(Multiply (Add( Constant 1, Constant 5 ), Constant 6));
