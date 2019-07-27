# Let Expressions

* To create a local scope you can use let expressions.
* Let expressions allow us to create local bindings of any ort, including function bindings.
* General syntax for a let expression is;
```ml

let
 (* binding *)
 b1 b2 b3 ... bn
in
 e(xpression)
end; (* ending of a let expression. *)

```
* What is between `in` and `end` is evaluated to a value and returned from that expressions.
* Each binding that is declared in the let expression can only be used at in between `in` and `end`.
* Let expresssions are expressions and thus can be part of larger expressions.
* Local variables are often good style for keeping code readable.
