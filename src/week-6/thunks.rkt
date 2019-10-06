#lang racket

(provide (all-defined-out))

(define (factorial-normal x) (if(= x 0) 1 (* x (factorial-normal (- x 1)))))
(factorial-normal 5)

(define (my-if-bad e1 e2 e3) (if e1 e2 e3))
(define (factorial-bad x) (my-if-bad (= x 0) 1 (* x (factorial-bad (- x 1)))))
;(factorial-bad 1); Never Returns!

(define (my-strange-if e1 e2 e3) (if e1 (e2) (e3)))
(define (factorial-strange x) (my-strange-if (= x 0) (lambda () 1) (lambda () (* x (factorial-strange (- x 1))))))
(factorial-strange 50)
