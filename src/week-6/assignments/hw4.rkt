
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

; 1. Write a function sequence that takes 3 argument slow,high, and stride, all assumed to be numbers.
; Further assume stride is positive.
; sequence produces a list of numbers from low to high (including low and possibly high) separated by stride and in sorted order. 
(define (sequence low high stride) (
    if(<= low high) 
    (cons low (sequence (+ low stride) high stride)) 
    null
    )
)

(sequence 1 10 1)
(sequence 3 11 2)
(sequence 3 8 3)
(sequence 3 2 1)

;2. Write a function string-append-map that takes a list of strings xs and a string suffix and returns a list of strings.
;Each element of the output should be the corresponding element of the input appended with suffix (with  no  extra  space  between  the  element  and suffix).
;You must use Racket-library functions map and string-append

(define (string-append-map xs suffix) (
    map (lambda (str) (string-append str suffix)) xs
    )
)

(string-append-map (list "Medet" "Can" "Akus" "Hello" "World") "Racket")
(string-append-map (list "Hello ") "World")

;3. Write  a  function list-nth-mod that takes a list xs and a number n.
;If the number is negative, terminate the computation with (error "list-nth-mod: negative number").
;Else if the list isempty, terminate the computation with (error "list-nth-mod: empty list").  
;Else return the  ith element of the list where we count from zero and i is the remainder produced when dividing n by the list’s length.
;Library functions length, remainder, car, and list-tail are all useful.

(define (list-nth-mod xs n) (
    cond [(< n 0) (error "list-nth-mod: negative number")]
         [(= (length xs) 0) (error "list-nth-mod: empty list")]
         [#t (car (list-tail xs (remainder (length xs) n)))]
    )
)

(list-nth-mod (list 1 2 3 4 5 6 7 8 9 10) 1)
(list-nth-mod (list 1 2 3 4 5 6 7 8 9 10) 2)
(list-nth-mod (list 1 2 3 4 5 6 7 8 9 10) 3)
(list-nth-mod (list 1 2 3 4 5 6 7 8 9 10) 5)
(list-nth-mod (list 1 2 3 4 5 6 7 8 9 10) 6)
