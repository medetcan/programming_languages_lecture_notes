#lang racket

(provide (all-defined-out))

(define (funny-sum xs) (
    cond [(null? xs) 0]
         [(number? (car xs)) (+ (car xs) (funny-sum (cdr xs)))]
         [(string? (car xs)) (+ (string-length (car xs)) (funny-sum (cdr xs)))]
    )
)

(funny-sum (list 2 4 6 8 10))
(funny-sum (list "Hello " "World " "Medet " "Can " "Akus"))


; datatype exp = Const of int | Negate of exp | Add of exp * exp | Multiply of exp * exp

; Helper functions that make lists where first element is a symbol
(define (Const i) (list 'Const i))
(define (Negate e) (list 'Negate e))
(define (Add e1 e2) (list 'Add e1 e2))
(define (Multiply e1 e2) (list 'Multiply e1 e2))

; Helper functions that determine kind of exp

(define (Const? x) (eq? (car x) 'Const))
(define (Negate? x) (eq? (car x) 'Negate))
(define (Add? x) (eq? (car x) 'Add))
(define (Multiply? x) (eq? (car x) 'Multiply))

; Helper functions that get the pieces for one kind of exp

(define (Const-int e) (car (cdr e)))
