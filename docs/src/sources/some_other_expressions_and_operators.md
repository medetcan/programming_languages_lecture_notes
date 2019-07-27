# Some Other Expressions and Operators

* `e1 andalso e2` is logical and operator.
    * It evaluates `e2` only if `e1` evaluates to `true`.
    * Result is `true` if and only if both `e1` and `e2` is `true`.

* `e1 orelse e2` is logical or operator. 
    * It evaluates `e2` only if `e1` evaluates to `false`
    * Result is `true` if and only if any of the expression is `true`

* All of the preceding expressions(operand) for logical operators must be of type bool or exception will be raised.

* `not e` is logical negation operator.
    * `not` is just a provided function of type `bool -> bool`.

* `e1 = e2` is used for equality check.
   * Real types can not be used with equality operator.
* `e1 <> e2` less than or greater than operator which means not equal to each other.
* The other arithmetic comparisons have the same syntax as in most languages:
    * `>`, `<`, `>=`, `<=`
* `~e` tilde is a negation operator.
