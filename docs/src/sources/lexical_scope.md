# Lexical Scope

* Lexical scope is an important concept in programming languages.
* Lexical scope means that any bindings and visibility of those bindings are determined at author time. 
    * Scope of a function is determined at where the function is defined so it can see previously defined outer scope declarations.
* A function additionally to its local scope, can see and use outer scope bindings. 
* In lexical scope outer scope bindings determined by where the function is defined.
* The body of a function is evaluated in the environment where the function is defined, not the environment where the function is called.
```ml
val x = 1;
fun f y = x + y; (* Lexically scoped function any binding is determined at where the function is defined.*)
val x = 2;
val y = 3;
val z = f (x + y) (* x + y = 2 + 3 = 5, f 5 = 1 + 5 = 6*)
```
