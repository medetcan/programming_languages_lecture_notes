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

* While racket encourages a functional programming style, The truth is racket has assignment statement.
    * You can change the value of a binding using;
        * `set! <binding-name> <expr>`
* Mutating top level bindings not recommended because it is very hard to determine and track which code uses that top level binding.
* A top-level binding is not mutable unless the module that defined it contains a set! for it.

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

* There are two ways to test a condition and branch accordingly. 
    * `if and cond` are those two things.
* `(if <test-expr> <then-expr> <else-expr>)`
    * if is an expression result of the whole expression is a value.
    * `<test-expr>` evaluates to `true` for `#t` and for any result different than `0`
    * `<test-expr>` evaluates to `false` for `#f` and `0`.
    * If `<test-expr>` is `true` then `<then-expr>` is evaluated and result of the `<then-expr>` becomes the result of the if expression.
    * If `<test-expr>` is `false` then `<else-expr>` is evaluated and result of the `<else-expr>` becomes the result of the if expression.
    * If expression is not eagerly evaluated.
    ```racket
    (if (positive? 5) (error "doesn't get here") 2)
    (if "Hello World" "yes" "no")
    ```
* `(cond <cond-clause>)`
    * `cond-clause = [<test-expr> <expr>] [<text-expr> <expr>] ...`
    * `cond-clause = [<test-expr> <expr>] [<else> <then-expr> ...+]`
        * A `cond-clause` that starts with `else` must be the last `cond-clause`
        * If `<else> <then-expr> ...+` is present, then the `then-expr` are evaluated.
        * The result of the last `<then-expr>` becomes the result of the whole clause.
    * Each `<test-expr>` evaluated in order until one of the expression evaluates to `#t`.
    * If none of the `<test-expr>` evaluates to `true` then result of the `cond` is `#<void>`
        * As a fallback you should provide a `<cond-clause>` such as following `[#t <expr>]`.
```racket
(define (isCollection xs) (
    cond [(list? xs) => (lambda(l) (map (lambda (x) (* x 2)) xs))]
         [(pair? xs) "It is a pair"]
         [else 1 2 3 4 5 6]
    )
  )
```

#### Local Bindings

* Racket provides three forms of local bindings.
    * `let`
        * General syntax as follows; `(let ([id expr] ...) body ...+)`
            * `[id expr] ...` expressions are evaluated in paralell. 
            * The `ids` are bound in parallel, That is, no `id` is bound in the right-hand side `expr` for any id, but all are available in the body.
                * There can never be forward references or recursive calls in `let` binding.
                * That means any `<id>`'s expression can not see its binding or any other `<id>`'s expression.
        * The characterization of let bindings as “parallel” is not meant to imply concurrent evaluation.
            * The exprs are evaluated in order and the bindings are delayed until all exprs are evaluated.
    ```racket
    (let ([x 2]) x)
    (let ([x 2]) x 2)
    (let ([me "Bob"] [myself "Bobby"] [I "Bobby"]) (list me myself I))
    (let ([+ (lambda (x y)
             (if (string? x)
                 (string-append x y)
                 (+ x y)))]); Uses original + operator. 
    (list (+ 1 2)
          (+ "see" "saw")))
    ```
    * `let*`
        * General syntax as follows; `(let* ([id expr] ...) body ...+)`
        * The difference is that each `id` is available for use in later `expr`, as well as in the body.
        * `ids` not needed to be distinct, most recent binding is the visible one.
    ```racket
    (let* ([name "Medet"] [name (string-append name " Can")] [name (string-append name " Akus")]) name)
    ; "Medet Can Akus"
    (let* ([x (list "Salad")] [y (cons "Shroom" x)] [z (cons "Apple" y)]) (list x y z))
    ; (("Salad") ("Shroom" "Salad") ("Apple" "Shroom" "Salad"))
    ```
    * `letrec`
        * General syntax as follows; `(letrec ([id expr] ...) body ...+)`
        * While `let` makes its bindings available only in the bodys, and `let*` makes its bindings available to any later binding `expr`,
        `letrec` makes its binding available to all other `expr`s even the earlier ones.
        * In other word `letrec` bindings are recursive.
        * `letrec` is useful for writing mutually recursive functions.
    ```racket
    (letrec ([fact (lambda (n) (if (= n 0) 1 (* n (fact (- n 1)))))]) (fact 4))
    ```


#### Thunk

* Most of the languages eagerly evaluates its arguments to a function.
    * Sometimes this is not the intended behavior.
    * To delay the evaluation of some expression you can wrap the expression with a zero argument lambda function.
* When we use a zero argument function to delay evaluation we call the function a thunk.
* Thunks are primarily used to delay a calculation until its result is needed, or to insert operations at the beginning or end of the other subroutine.
* By using thunks we can achieve lazy evaluation.
    * If a code is lazily evaluated we can calculate its result when needed.
        * We can avoid repeatedly calculating the result of a function.
        * We can save the result of the computation and use the result instead of calling computation again and again to get the same result.
```racket
(define (my-delay f) (mcons #f f))
(define (my-force th) ( ;Force evaluation of the the function if result is already calculated return result.
    if (mcar th)
       (mcdr th)
       (begin (set-mcar! th #t) (set-mcdr! th ((mcdr th))) (mcdr th))
    )
)
```

#### Stream

* A stream is an infinite sequences of values.
* We obviously can't create a such sequence explicitly but we can create code that knows how to produce the infinite sequence and other code that knows how to ask for however much of the sequence it needs.
