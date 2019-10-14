#lang racket

(provide (all-defined-out))

(define-syntax my-if (syntax-rules (then else) [(my-if e1 then e2 else e3) (if e1 e2 e3)]))

(my-if #t then (* 3 4) else (+ 3 4))
(my-if #f then (* 3 4) else (+ 3 4))

(define-syntax comment-out 
  (syntax-rules ()
    [(comment-out ignore instead) instead]
   ))

(comment-out (* 3 4) (define x 4))
x

(define-syntax my-delay 
  (syntax-rules ()
    [(my-delay e) (mcons #f (lambda () e))]
))

(my-delay car)

(define-syntax db1 
  (syntax-rules ()
    [(db1 x) (* x 2)]
   ))

(db1 2)

(let ([* +]) (db1 3))
