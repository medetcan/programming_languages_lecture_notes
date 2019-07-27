# Variables are Immutable

* Variables are immutable in ML.
 ```ml
 val x = 5;
 (* following binding creates a different environment where the later binding shadows the earlier one *)
 val x = 7;
 ```
* There is no "assignment statements" in ML for changing what a variable maps to.
* You can re-declare a variable and bind it to another value but it just shadows the previous binding.
