# Datatype Bindings and Case Expressions So Far, Precisely

* We can summarize what we know about datatypes and pattern matching so far as follows:
    * `datatype t = C1 of t1 | C2 of t2 | C3 of t3 | ... | Cn of tn`
        * Introduces a new type `t` and each constructor `Ci` is a function of type `ti -> t`.
        * One omits the "of ti" for a variant that "carries nothing" and such a constructor just has type `t`
        * To extract the values we use case expressions(more generally pattern matching)
    * `case e of p1 => e1 | p2 => e2 | ... | pn => en`
        * What between of `case` and `of` is the expression that will be matched.
        * `e` will be evaluated to a value `v` and the first pattern `pi` that matches `v` and evaluates `ei` to produce the result for the whole expression. 
