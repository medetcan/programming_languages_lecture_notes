# Function Bindings

* We previously introducted variables bindings now it is time for function bindings. 
* A function in simplest terms, takes input and produces an output.
* Functions allow us to define re-usable behaviour, that can be used throughout the source code.
* A ML function does not have a return statement.
```ml
fun pow(base : int, power : int)=
    if power = 0
    then 1
    else base * pow(base, power - 1)
```
* The syntax for a function binding looks like this;
    * fun x0 (x1 : t1, x2 : t2, ..., xn : tn) = e;
        * x0 -> name of the function.
	* x1,...xn -> arguments of the function.
	* t1,...tn -> list of types corresponds to each function argument.
	* e -> expression for function body.
* To type-check a function binding;
    * Type-check the body e in a static environment. Static enviroments includes earlier bindings and function arguments and function x0,x1,...,xn 
    * x0 is function's name so that means function body can make recursive calls to itself.
    * For the function binding to type-check, the body e must have the type t, result of function x0
    * t1 * t2 * t3 * ... * tn -> t ( t is determined by type inference )

* to evaluate a function;
    * A function is a value.
    * We simply add x0 to the environment as a function that can be called later.
* Where you declare a function is important in ML.
* Function binding is added to dynamic environment at where it is declared.

* To call a function;
    * e0 (e1, e2, e3, ..., en);
        * e0 is the name
	* e1,e2,...en are arguments.
	* Parentheses are optional if there is exactly one argument.
	* The typing rules require that e0 has a type that looks like t1 * t2 * ... * tn -> t and for arguments e1,...,en types should match with the signature of the e0.
	* When executing function body e1,e2,...,en evaluates to v1,v2,...vn.
	* Then function body is evaluated in an environment extented such that the function arguments map to v1,...,vn.
 
* Exactly which environment is it we extend with the arguments ? 
    * The environment that "was current" when the function was defined, not the one where it is being called.
    * Function definitions are lexically scoped in ML.
    * When you call a function. Static and dynamic environments are extented.
    * When executing function static and dynamic environments refer to declaration site of the called function.
