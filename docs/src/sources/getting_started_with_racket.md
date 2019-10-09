# Getting Started With Racket

* The first line of a racket file should start with following statement; `#lang racket`
* `;` is used for commenting.
    * `;` statement comments out any character it encounters till it reaches end of the line.

#### Creating Definitions
* You can create bindings using following forms;
    * `(define <id> <expr>)`
        * binds `id` to the result of the `expr`.
    ```racket
    (define x 5)
    ```
    * `(define (<id> <ids*>) <expr>)` 
        * Above syntax defines a function.
            * The first `id` is the name of the function.
            * Rest of the `ids*` are arguments to the function.
            * `expr` is the body of the function.
    ```racket
    (define (sum x y) (+ x y))
    (sum 3 4)
    ```
* When creating a binding common convention is to separate words by hyphens.
* You can call a function by using following syntax;
    * `(<id> <exprs*>)`
        * `id` is the name of the function
        * `exprs*` are arguments to the function.
        * Arguments are expressios that are eagerly evaluated.
* A function definition can include multiple expressions for the function's body. In that case, only the value of the last expression is returned when the function is called.
    ```racket
    (define (mult x y) 
        (printf "Hello World\n")
        (* x y)
    )

    (define (nobake flavor) string-append flavor "jello")
    (nobake "green"); prints: "jello" because function body can have multiple expressions.
    ```
* In Racket bindings can refer to later bindings in the file.
* You can create curried functions in racket but it is not common in Racket as ML 
```racket
(define pow (lambda (x) ( lambda (y) ( if (= y 0) 1 (* x ((pow x) (- y 1)))))))
((pow 2) 4)
```

#### List

* `list` function takes a variable number of arguments and returns a list containing the values. 
    * `(list 1 2 3 4 5 6)`
    * Racket is dynamically typed language and `lists` can contain different types of values.
        * `(list "hi" 1 (list 2 3))` 
* There are many built-in function that operates on lists.
    * `(length <expr-list>)`: Returns the size of the list.
    * `(list-ref (list "yip" "yip" "hurra") 2)`: Extracts the element at specified index(lists are zero indexed).
    * `(append <expr-list> <expr-list>)`: Combines list together.
    * `(reverse <expr-list>)`: Reverses the ordering of the list.
    * `(member <expr> <expr-list>)`: Checks if the result of the `expr` is contained in the list.
    * `(cons <expr> <expr> )`: Construct a list.
    * `(car <expr-list>)`: Get first element of the list. Function `car` can operate on pairs.
    * `(cdr <expr-lis>)`: Get tail of the list. Function `cdr` can operate on pairs.
    * `(first <expr-list>)`: Same as `car`, get first element of the list. You can't use it on pairs.
    * `(rest <expr-list>)`: Same as `tail`, get tail of the list. You can't use it on pairs.
    * `(null? <expr-list>)`: Checks if the list is empty.
    * `(list? <expr>)`: Checks if the result of the expression is a list.
    * `(pair? <expr>)`: Checks if the result of the expression is a pair. Since lists derived from pairs returns `#t` for lists.
* `null` is used for empty list.

#### Lists and Racket Syntax

* A value that prints like a quoted identifier is a symbol.
* A printed symbol should not be confused with an identifier.
* You can create a symbol by using `quote` function.
* You can also abbreviate a use of `quote` by just putting `'` in front of a form to quote.
* The syntax of Racket is not defined directly in terms of characters streams.
    * A reader layer, which turns a sequence of characters into lists, symbols, and other constants.
    * An expander layer, which processes the lists, symbols, and other constants to parse them as an expression.
* The rules for printing and reading go together.
    * For example, a list printed with parentheses, and reading a pair of parentheses produces a list.

#### Conditionals


