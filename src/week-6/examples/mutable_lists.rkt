#lang racket

(provide (all-defined-out))

(define lst (cons 1 (cons 2 null)))
lst
(list? lst)
(pair? lst)

(define pairs (cons 1 (cons 2 "hi")))
pairs
(list? pairs)
(pair? pairs)

(define mlst (mcons 1 (mcons 2 null)))
mlst
(mpair? mlst)
(list? mlst)
(set-mcar! mlst 3)
mlst
(set-mcdr! (mcdr mlst) 3)
mlst


