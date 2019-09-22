# Taking Functions as Arguments

* Functions that takes functions as arguments are very powerful.
    * We can abstract away common code blocks for different computation units and different computation units can be passed around as arguments to other functions.
* Higher order functions is useful for lazy evaluation. 
```ml
    fun n_times(f, n, x)=
        if n = 0
	then x
	else f( n_times(f, n - 1, x) )
    fun double x = x + x;
    fun increment x = x + 1;
```
* As you can see from above code blocks you can create different computations and pass those computations to `n_times` function.
* This makes `n_times` function to be more flexible and reusable.
