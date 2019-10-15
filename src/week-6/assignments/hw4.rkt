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

;4. Write a function stream-for-n-steps that takes a stream s and a number n.
;It returns a list holding the first n values produced by s in order.
;Assume n is non-negative.  
;Note:You can test your streams with this function instead of the graphics code.

(define (stream-generator fn arg) (
    letrec ([f (lambda (n) (cons n (lambda () (f (fn n)))))])    
    (lambda () (f arg))
    )
)

(define (stream-for-n-steps s n) (
    letrec ([res (s)])
    (if (> n 0)
    (cons (car res) (stream-for-n-steps (cdr res) (- n 1)))
    null)
    )
)

(stream-for-n-steps (stream-generator (lambda (n) (+ n 1)) 1) 5)
(stream-for-n-steps (stream-generator (lambda (n) (+ n 1)) 1) 20)

; 5. Write a stream funny-number-stream that is like the stream of natural numbers except numbers divisible by 5 are negated.
; Remember a stream is a thunk that when called produces a pair. 
; Here the car of the pair will be a number and the cdr will be another stream


(define funny-number-stream (stream-generator 
        (
        lambda (n) (
            let ([abs-n (abs n)])
            (if(= 0 (remainder (+ abs-n 1) 5)) 
            (- (+ n 1)) 
            (+ abs-n 1))
                )
            ) 
        1
    )
)

((cdr ((cdr ((cdr ((cdr ((cdr (funny-number-stream)))))))))))
((cdr ((cdr ((cdr ((cdr ((cdr (funny-number-stream)))))))))))
(stream-for-n-steps funny-number-stream 100)

; 6. Write a stream dan-then-dog, 
; where the elements of the stream alternate between the strings "dan.jpg" and "dog.jpg" (starting with"dan.jpg").  
; More specifically, dan-then-dog should be a thunk that when called produces a pair of "dan.jpg" and a thunk that when called produces a pair of "dog.jpg" and a thunk that when called...  etc.

(define dan-then-dog (stream-generator 
        (lambda (str) (if(string=? str "dan.jpg") "dog.jpg" "dan.jpg"))
        "dan.jpg"
    )
)

((cdr (dan-then-dog)))
(stream-for-n-steps dan-then-dog 20)

; 7. Write a function stream-add-zero that takes a stream s and returns another stream.  
; If s would produce v for its ith element, then (stream-add-zero s) would produce the pair (0 .v) for its ith element.
; Hint: Use a thunk that when called uses s and recursion.
; Note: One of the provided tests in the file using graphics uses(stream-add-zero dan-then-dog) with place-repeatedly


(define (stream-add-zero s) (
    letrec ([f (lambda(s) (let ([res (s)])  (cons (cons 0 (car res)) (lambda () (f (cdr res))))))])
     (f s)
    )
)

(stream-add-zero dan-then-dog)
((cdr (stream-add-zero dan-then-dog)))


; 8. Write a function cycle-lists that takes two lists xs and ys and returns a stream.
; The lists may or may not be the same length, but assume they are both non-empty. 
; The elements produced by the stream are pairs where the first part is from xs and the second part is from ys.
; The stream cycles forever through the lists.
; For example, if xs is ’(1 2 3) and ys is ’("a" "b"), then the streamwould produce, (1 . "a"),(2 . "b"),(3 . "a"),(1 . "b"),(2 . "a"),(3 . "b"),(1 . "a"),(2 . "b"), etc.
; Sample solution is 6 lines and is more complicated than the previous stream problems.
; Hints: Use one of the functions you wrote earlier.
; Use a recursive helper function that takes a number n and calls itself with (+ n 1) inside a thunk.

(define (cycle-lists xs ys) 1)
