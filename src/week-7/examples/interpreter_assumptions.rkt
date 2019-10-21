#lang racket

(provide (all-defined-out))

(struct const (int) #:transparent)
(struct negate (e1) #:transparent)
(struct add (e1 e2) #:transparent)
(struct multiply (e1 e2) #:transparent)
(struct bool (b) #:transparent)
(struct eq-num (e1 e2) #:transparent)
(struct if-then-else (e1 e2 e3) #:transparent)

(define test1 (multiply (negate (add (const 2) (const 4))) (const 7)))
test1
(define test2 (multiply (negate (add (const 2) (const 4))) (if-then-else (bool #f) (const 7) (bool #t))))
