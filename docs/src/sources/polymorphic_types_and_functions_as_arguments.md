# Polymorphic Types and Functions as Arguments

* To make our code reusable for higher order functions we must utilize polymorphic types. 
    * Polymorphic means many form.

* Imagine a scenario where the helper function is in the form of `int -> int`
    * The helper function above takes an `int` and returns an `int`. 
    * That means no other concrete types can be used for the helper function above.
    * `n_times => ((int -> int) * int * int)` We can't use `strings`, `floating point numbers`, `lists` or any other type except `int`

* With polymorphic types or generic types, the helper function is in the form of `'a -> 'a`
    * The helper function above can take `any type` and return `any type` as a result.  
    * This generalization allows us to use any concrete type for our helper function as long as type of the argument and type of the result are same.
    * `'a` denotes Greek letter `alpha`
    * Type of the argument and type of the result can be different for parametric types such as;
        * `'a -> b'` type signature of the function tells us that function can take any type and return any type as a result but result and argument types are different from each other.
	* `'a -> b'` -> `string -> int`, `int -> string`, `real -> string`
