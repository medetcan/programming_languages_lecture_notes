# Pairs and Other Tuples

* You can make compound data out of simpler data.
* Pairs captures two data together.

* Syntax:
    * (e1, e2)
* Type-checking:
    * `t1 * t2`
* Evaluation:
    * `(v1, v2)`
    * values v1 and v2 could themselves be pairs.
* Accessing individual values:
    * `#1 e`, `#2 e` where `e` must be of type `t1 * t2` then `#1 e` has a type `t1` and `#2 e` has a type `t2`.

* ML supports tuples by allowing any number of parts. For example a 3-tuple of integers has type `int*int*int`

* Pairs and tuples can be nested.
