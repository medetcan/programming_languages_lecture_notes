#lang racket

(provide (all-defined-out))
(define x 3) ; (define keywords expands current environment, x is a variable, 3 is an expression)
(define y (+ 2 x)) ;( + is a function, 2 and x are both arguments to the function and function call is an expression and result of that is the value of y)

; Three different version of a function definition in racket
(define cube1 (lambda (x) (* x (* x x))))
(cube1 2)

(define cube2 (lambda (x) (* x x x)))
(cube2 4)


(define (cube3 x) (* x x x))
(cube3 4)

; if expression and recursive calls
(define (pow1 x y) (if (= y 0) 1 (* x (pow1 x (- y 1)))))
(pow1 2 3)

; Currying

(define pow2
  (lambda (x)
    (lambda (y)
      (pow1 x y))))

((pow2 2) 3)

; Partial application
(define three-to-the (pow2 3))

(three-to-the 3)
(three-to-the 4)
