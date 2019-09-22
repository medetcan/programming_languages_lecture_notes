# Anonymous Functions

* There is no reason to pollute global name space, or local name space for small, single purpose helper functions. 
* Anonymous functions are useful for creating helper functions without polluting name space.
* Anonymous functions can be passed around as arguments to functions.
* Syntax of an anonymous function is as follows; `fn <parameter-list> => <function-body>`
    * `n_times(fn x => x * x, 5, 2);`
* An anonymous function can't refer to itself since it does not have a name.
    * That means you can't use them to make recursive function calls to itself.
* You can put an anonymous function anywhere you can put an expression.
