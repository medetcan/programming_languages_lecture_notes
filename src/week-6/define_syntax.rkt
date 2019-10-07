#lang racket

(provide (all-defined-out))

(define-syntax my-if (syntax-rules (then else) [(my-if e1 then e2 else e3) (if e1 e2 e3)]))

