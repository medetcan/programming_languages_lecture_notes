#lang racket

(provide (all-defined-out))

; Define stream that generates 1 1 1 1 1
(define ones (lambda () (cons 1 ones)))
(car (ones))
(car ((cdr (ones))))

; Define stream that generates 1 2 3 4 5
(define (f x) ( cons x (lambda () (f (+ x 1)))))
(car (f 1))
(car ((cdr (f 1))))
(car ((cdr ((cdr (f 1))))))

; Better version
(define increment (
    letrec ([f (lambda (x) (cons x (lambda () (f (+ x 1)))))])
    (lambda () (f 1))
))

(car (increment))
(car ((cdr ((cdr ((cdr (increment))))))))
