# Options

* Oftentimes we need to deal with non-existence of a value.
* The ML library has "options" which are a precise description:
    * An options value has either 0 or 1 thing: `NONE` is an options value "carrying nothing" whereas `SOME e` evaluates `e` to a value `v` and becomes the option carrying the one value `v`.
    * The type  of `NONE` is `'a option` and the type `SOME e` is `t option` if `e` has a type `t'.  

* Options are useful for wrapping values and expressing non-existence of a value that is result of a computation.

* Example syntax for options is;

```ml
val x = NONE; (* 'a option *)
val x = SOME 5 (* int option *)
val x = SOME [] (* 'a list option *)
val x = SOME [1] (* int list option *)
```

* `isSome` function returns true for `SOME e` false for `NONE` and it throws an expception for any other expression.
    * Type signature of isSome: `'a option -> bool` 
    * Usage of isSome: `isSome SOME 5` or `isSome NONE`
* `valOf` unwraps the value from `SOME e` and throws an expception if the result of an expression is NONE.
    * Type signature of valOf: `'a option -> 'a`
    * Usage of valOf: `valOf (SOME 6)`


