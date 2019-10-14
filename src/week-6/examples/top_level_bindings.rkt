#lang racket

(provide (all-defined-out))

(define (f x) (+ x (* x b))) ; Notice forward reference b
(define b 3)
(define c (+ b 4))
;(define d (+ e 4)) ; This will thrown an error because binding e is used before it is initialized.
(define e 5)
;(define f 17) ; This is not okay binding f is already in the environment.

