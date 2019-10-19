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
(define (Negate-e e) (car (cdr e)))
(define (Add-e1 e) (car (cdr e)))
(define (Add-e2 e) (car (cdr (cdr e))))
(define (Multiply-e1 e) (car (cdr e)))
(define (Multiply-e2 e) (car (cdr (cdr e))))

(define (eval-exp e) (
    cond [(Const? e) e]
         [(Negate? e) (Const (- (Const-int (eval-exp (Negate-e e)))))]
         [(Add? e) (let ([v1 (Const-int (eval-exp (Add-e1 e)))] [v2 (Const-int (eval-exp (Add-e2 e)))]) (Const (+ v1 v2)))]
         [(Multiply? e) (let ([v1 (Const-int (eval-exp (Multiply-e1 e)))] [v2 (Const-int (eval-exp (Multiply-e2 e)))]) (Const (* v1 v2)))]
         [#t (error "eval-exp expected an exp")]
    )
)

(eval-exp (list 'Add (list 'Const 2) (list 'Const 4)))
(eval-exp (list 'Multiply (list 'Const 2) (list 'Const 4)))
(eval-exp (list 'Negate (list 'Multiply (list 'Const 2) (list 'Const 4))))
