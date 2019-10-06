#lang racket

(provide (all-defined-out))

(define b 3)
(define g (let ([b b]) (lambda (x) (* 1 (+ x b)))))
(define f (lambda (x) (* 1 (+ x b))))
(define c (+ b 4))
(set! b 5)
(define z (f 4)); 9
z; 9
(define t (g 4)); 7
t; 7
(define w c); 7
w; 7
