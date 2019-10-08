#lang racket

(provide (all-defined-out))


(define-syntax for 
  (syntax-rules (to do)
    [
     (for lo to hi do body) 
     (let ([l lo] [h hi]) 
       (letrec ([loop (lambda (it) (if (> it h) #t (begin body (loop (+ it 1)))))])
       (loop l)))
     ]))


(for 1 to 4 do (print "hi"))

(define (f x) (begin (print "Medet") x))
(define (g x) (begin (print "Can") x))
(define (h) (print "Akus"))
(for (f 1) to (g 5) do (h))


(define-syntax let2 
  (syntax-rules ()
    [(let2 () body) body]
    [(let2 (var val) body) (let ([var val]) body)]
    [(let2 (var1 val1 var2 val2) body) (let ([var1 val1]) (let ([var2 val2]) body))]
   ))


(let2 () (print "Hi"))
(let2 (x 4) (* 120 x))
(let2 (x 1 y 2) (+ x y))

(define-syntax my-let* 
  (syntax-rules ()
    [(my-let* () body) body]
    [(my-let* ([var0 val0] [var-rest val-rest] ...) body) (let ([var0 val0]) (my-let* ([var-rest val-rest] ...) body))]
   ))

(my-let* ([x 2] [y (* x 2)] [z (* y 2)]) (* x y z))
