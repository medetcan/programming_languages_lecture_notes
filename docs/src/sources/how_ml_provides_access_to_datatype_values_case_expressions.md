# How ML Provides Access to Datatype Values: Case Expressions

* ML provides case expressions for unwrapping the value of a each variant of the datatype binding.
```ml
fun f x =
    case x of
      Pizza => 3
    | TwoInts(i1,i2) => i1 + i2
    | Str s => String.size s
```
* case expressions are similar to if-then expressions except case expressions have multiple branches. 
* Evaluation of case expressions as follows;
    * first the expression between the case and of keywords.
    * second the expression in the first branch that matches.
* We can have one branch for each variant of our type.
    * Actually case branches must be exthaustive.
* Each branch must evaluate to the same type. Because type checker cannot know which branch will be used.
* Each branch has the form `p => e` where `p` is a pattern and `e` is an expression.
    * Patterns do look like expressions, but do not think of them as expressions.
    * Instead they are used to match against the result of evaluating the case's first expressions.
* Matched branch can extract the underlying data of the variant by using pattern matching.
    * Mathces TwoInts and extracts the values and binds them to i1, and i2 `TwoInts(i1,i2) => i1 + i2`
