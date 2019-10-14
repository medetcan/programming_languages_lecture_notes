#lang racket

(provide (all-defined-out))

(define (count-falses xs)
  (cond [(null? xs) 0]
        [(car xs) (count-falses (cdr xs))]
        [#t (+ 1 (count-falses (cdr xs)))]
  )
)


(count-falses (list 1 2 3 #f #f #t "hi" #f ))
