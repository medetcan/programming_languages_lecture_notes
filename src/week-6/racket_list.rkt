#lang racket

(provide (all-defined-out))

; list processing: null, cons, null?, car, cdr

; summ all the number in a list

(define (sum xs)
  (if (null? xs)
    0
    (+ (car xs) (sum (cdr xs)))
    )
  )


(sum (list 1 2 3 4 5))
(sum (list 1 2 3 4 5 6))

; append
(define (my-append xs ys) (if (null? xs) ys (cons (car xs) (my-append (cdr xs) ys))))

(my-append (list 1 2 3) (list 4 5 6))

; map
(define (my-map f xs) (if (null? xs) null (cons (f (car xs)) (my-map f (cdr xs)))))

(my-map (lambda (x) (* x 2)) (list 1 2 3 4))
