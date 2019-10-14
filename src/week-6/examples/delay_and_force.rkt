#lang racket

(provide (all-defined-out))

(define (slow-add x y) (
  letrec ([slow-id (lambda (y z) (if (= z 0) y (slow-id y (- z 1))))])
  (+ (slow-id x 50000000) y)))

(slow-add 1 2)

(define (my-mult x y-thunk)
  (cond [(= x 0) 0]
	[(= x 1) (y-thunk)]
	[#t (+ (y-thunk) (my-mult (- x 1) y-thunk))]
   )
  )

(my-mult 0 (lambda () (slow-add 3 4))); Performance great in the first case because it does not have to evaluate y-thunk
(my-mult 1 (lambda () (slow-add 3 4))); Performance slowing down in this case because slow-add function is have to be evaluated.
(my-mult 2 (lambda () (slow-add 3 4))); Performance slowing down in this case because slow-add function is have to be evaluated.

(define (my-delay th) (mcons #f th)) 

(define (my-force p) (if (mcar p) (mcdr p) (begin (set-mcar! p #t) (set-mcdr! p ((mcdr p))) (mcdr p))))
(define x (my-delay (lambda () (slow-add 3 4))))
x
(my-force x)
x
(my-force x)

(my-mult 100 (let ([p (my-delay (lambda () (slow-add 3 4)))]) (lambda () (my-force p))))
