#lang racket

(provide (all-defined-out))

(define (fibonacci1 n) (
    if (or (= n 1) (= n 2))
        1
        (+ (fibonacci1 (- n 1)) (fibonacci1 (- n 2)))
    )
)

(define (fibonacci2 x) (
    letrec ([f (lambda (acc1 acc2 y) (if (= y x) (+ acc1 acc2) (f (+ acc1 acc2) acc1 (+ y 1))))])
    (if (or (= x 1) (= x 2))
        1
        (f 1 1 3)
        )
    )
)

(fibonacci1 30)
(fibonacci1 40)
(fibonacci2 40)

(define fibonacci3
  (letrec([memo null] ; list of pairs (arg . result) 
          [f (lambda (x)
               (let ([ans (assoc x memo)])
                 (if ans 
                     (cdr ans)
                     (let ([new-ans (if (or (= x 1) (= x 2))
                                        1
                                        (+ (f (- x 1))
                                           (f (- x 2))))])
                       (begin 
                         (set! memo (cons (cons x new-ans) memo))
                         new-ans)))))])
    f))

