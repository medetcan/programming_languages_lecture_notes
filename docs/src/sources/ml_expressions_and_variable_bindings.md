# ML Expressions and Variable Bindings

* An ML program is a sequence of bindings. Each binding gets type-checked and then evaluated.
* Type of binding depends on the static environment
* Evaluation of binding is happens on the dynamic environment.
* Static environment lays the ground for rules of the evaluation.
* There are several kind of bindings, for now lets conside variables binding, which in ML has this syntax 
    * `val x = e(pression);`
    * val is a reserved keyword.
    * x is a name of the binding.
    * e can be any expression that evaluates to a value.
* Syntax not enough to produce well defined programs. Semantics of the used constructs must be well known by the user. 
* Semantic meaning of a construct decided by how it is type-checks and evaluates.
* To type check a variable binding, we use the "current static environment" (the types of preceding environment).
* To evaluate a variable binding, we use the "current dynamic environment" (the value of preceding bindings).
* A value is an expression that, "has no more computation to do", there is no way to simplify it.
    * `17` is a value which it is itself an expression but `8 + 9` is just an expresssion. All values are expressions but not all expressions are values.
    * A value can not be divided into sub-expressions.

* Integer constants:
    * Syntax : Sequence of digits.
    * Type-Checking : type int in any static environment.
    * Evaluation : to itself in any dynamic environment.

* Addition operation:
    * Syntax: e1 + e2
    * Type-checking: type int but only if e1 and e2 have type int in the same static environments otherwise  do not type-check.
    * Evaluation: evluate e1 to v1 and e2 to v2 in the same dynamic environment from left to right and then produce the sum of v1 and v2.

* Whenever you learn a new construct in a programming language, you should ask these three questions:
    * What is the syntax ? 
    * What are the type-checking rules ?
    * What are the evaluation rules ? 

