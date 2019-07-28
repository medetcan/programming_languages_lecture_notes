datatype myexp = CONSTANT of int
               | NEGATE of myexp
               | ADD of myexp * myexp
               | MULTIPLY of myexp * myexp
               | SUBSTRACT of myexp * myexp;

fun eval(e : myexp)=
  case e of 
       CONSTANT (i)      => i
     | NEGATE (i)        => ~ (eval i)
     | ADD(i1, i2)       => (eval i1) + (eval i2)
     | MULTIPLY(i1, i2)  => (eval i1) * (eval i2)
     | SUBSTRACT(i1, i2) => (eval i1) - (eval i2);


eval( ADD(CONSTANT 1, CONSTANT 2));
eval ( MULTIPLY ( ADD( CONSTANT 2, CONSTANT 5 ), CONSTANT 5 ))
