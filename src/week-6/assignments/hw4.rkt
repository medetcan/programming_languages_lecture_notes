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

; (sequence 1 10 1)
; (sequence 3 11 2)
; (sequence 3 8 3)
; (sequence 3 2 1)

;2. Write a function string-append-map that takes a list of strings xs and a string suffix and returns a list of strings.
;Each element of the output should be the corresponding element of the input appended with suffix (with  no  extra  space  between  the  element  and suffix).
;You must use Racket-library functions map and string-append

(define (string-append-map xs suffix) (
    map (lambda (str) (string-append str suffix)) xs
    )
)

; (string-append-map (list "Medet" "Can" "Akus" "Hello" "World") "Racket")
; (string-append-map (list "Hello ") "World")

;3. Write  a  function list-nth-mod that takes a list xs and a number n.
;If the number is negative, terminate the computation with (error "list-nth-mod: negative number").
;Else if the list isempty, terminate the computation with (error "list-nth-mod: empty list").  
;Else return the  ith element of the list where we count from zero and i is the remainder produced when dividing n by the list’s length.
;Library functions length, remainder, car, and list-tail are all useful.

(define (list-nth-mod xs n) (
    cond [(< n 0) (error "list-nth-mod: negative number")]
         [(= (length xs) 0) (error "list-nth-mod: empty list")]
         [#t (car (list-tail xs (remainder n (length xs))))]
    )
)

; (list-nth-mod (list 0 1 2 3 4) 2)
; (list-nth-mod (list 1 2 3 4 5 6 7 8 9 10) 1)
; (list-nth-mod (list 1 2 3 4 5 6 7 8 9 10) 2)
; (list-nth-mod (list 1 2 3 4 5 6 7 8 9 10) 3)
; (list-nth-mod (list 1 2 3 4 5 6 7 8 9 10) 5)
; (list-nth-mod (list 1 2 3 4 5 6 7 8 9 10) 6)

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

; (stream-for-n-steps (stream-generator (lambda (n) (+ n 1)) 1) 5)
; (stream-for-n-steps (stream-generator (lambda (n) (+ n 1)) 1) 20)

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

; ((cdr ((cdr ((cdr ((cdr ((cdr (funny-number-stream)))))))))))
; ((cdr ((cdr ((cdr ((cdr ((cdr (funny-number-stream)))))))))))
; (stream-for-n-steps funny-number-stream 100)

; 6. Write a stream dan-then-dog, 
; where the elements of the stream alternate between the strings "dan.jpg" and "dog.jpg" (starting with"dan.jpg").  
; More specifically, dan-then-dog should be a thunk that when called produces a pair of "dan.jpg" and a thunk that when called produces a pair of "dog.jpg" and a thunk that when called...  etc.

(define dan-then-dog (stream-generator 
        (lambda (str) (if(string=? str "dan.jpg") "dog.jpg" "dan.jpg"))
        "dan.jpg"
    )
)

; ((cdr (dan-then-dog)))
; (stream-for-n-steps dan-then-dog 20)

; 7. Write a function stream-add-zero that takes a stream s and returns another stream.  
; If s would produce v for its ith element, then (stream-add-zero s) would produce the pair (0 .v) for its ith element.
; Hint: Use a thunk that when called uses s and recursion.
; Note: One of the provided tests in the file using graphics uses(stream-add-zero dan-then-dog) with place-repeatedly


(define (stream-add-zero s) (
    letrec ([f (lambda(s) (let ([res (s)])  (cons (cons 0 (car res)) (lambda () (f (cdr res))))))])
     (lambda () (f s))
    )
)

; (cdr ((stream-add-zero dan-then-dog)))


; 8. Write a function cycle-lists that takes two lists xs and ys and returns a stream.
; The lists may or may not be the same length, but assume they are both non-empty. 
; The elements produced by the stream are pairs where the first part is from xs and the second part is from ys.
; The stream cycles forever through the lists.
; For example, if xs is ’(1 2 3) and ys is ’("a" "b"), then the streamwould produce, (1 . "a"),(2 . "b"),(3 . "a"),(1 . "b"),(2 . "a"),(3 . "b"),(1 . "a"),(2 . "b"), etc.
; Sample solution is 6 lines and is more complicated than the previous stream problems.
; Hints: Use one of the functions you wrote earlier.
; Use a recursive helper function that takes a number n and calls itself with (+ n 1) inside a thunk.

(define (cycle-lists xs ys) ( 
    letrec (
         [generate-stream (lambda(fn arg) (letrec ([f (lambda (n) (cons (fn n) (lambda () (f (+ n 1)))))]) (lambda () (f arg))))]
         [get-nth-element (lambda (xs i) (if (= i 0) (car xs) (get-nth-element (cdr xs) (- i 1))))]
         [fx (generate-stream (lambda (n) (get-nth-element xs (remainder n (length xs)))) 0)]
         [gx (generate-stream (lambda (n) (get-nth-element ys (remainder n (length ys)))) 0)]
         [f (lambda(fx gx) (let ([res-fx (fx)] [res-gx (gx)])  (cons (cons (car res-fx) (car res-gx)) (lambda () (f (cdr res-fx) (cdr res-gx))))))]
         ) 
    (lambda () (f fx gx))
    )
)

; (cycle-lists (list 1 3 5 7 9) (list "Medet" "Can" "Akus"))
; ((cdr (cycle-lists (list 1 3 5 7 9) (list "Medet" "Can" "Akus"))))
; ((cdr ((cdr (cycle-lists (list 1 3 5 7 9) (list "Medet" "Can" "Akus"))))))
; ((cdr ((cdr ((cdr (cycle-lists (list 1 3 5 7 9) (list "Medet" "Can" "Akus"))))))))
; ((cdr ((cdr ((cdr ((cdr (cycle-lists (list 1 3 5 7 9) (list "Medet" "Can" "Akus"))))))))))
; ((cdr ((cdr ((cdr ((cdr ((cdr (cycle-lists (list 1 3 5 7 9) (list "Medet" "Can" "Akus"))))))))))))

; 9. Write a function vector-assoc that takes a value v and a vector vec.
; It should behave like Racket’s assoc library function except;
;   * It processes a vector (Racket’s name for an array) instead of a list.
;   * It allows vector elements not to be pairs in which case it skips them
;   * It always takes exactly two arguments.  
; Process the vector elements in order starting from 0.  
; You must use library functions vector-length, vector-ref, and equal?. 
; Return #f if no vector element is a pair with a car field equal to v, else return the first pair with an equal car field.
; Sample solution is 9 lines, using one local recursive helper function.

(define (vector-assoc v vec) 
    (letrec (
          [len (vector-length vec)] 
          [f (lambda(pos) ( if (= pos len) #f (let ([v-ref (vector-ref vec pos)]) (if (and (pair? v-ref) (equal? v (car v-ref))) v-ref (f (+ pos 1))) )))])
      (f 0)
    )
)

; (vector-assoc 4 (vector (cons 2 1) (cons 3 1) (cons 4 1) (cons 5 1)))

; 10. Write a function cached-assoc that takes a list xs and a number n and returns a function that takes one argument v and returns the same thing that(assoc v xs)would return.
; However, you should use an n-element cache of recent results to possibly make this function faster than just calling assoc (if xs is long and a few elements are returned often). 
; The cache must be a Racket vector of length n that is created by the call to cached-assoc (use Racket library function vector or make-vector) and 
; used-and-possibly-mutated each time the function returned by cached-assoc is called.
; Assume n is positive.
; The cache starts empty (all elements #f).
; When the function returned by cached-assoc is called, it first checks the cache for the answer.
; If it is not there, it uses assoc and xs to get the answer and if the result is not #f,
; it adds the pair to the cache before returning (using vector-set!).
; The cache slots are used in a round-robin fashion: the first time a pair is added to the cache it is put in position 0, the next pair is put in position 1, etc.  
; up to positionn − 1 and then back to position 0 (replacing the pair already there), then position 1, etc
; Hints:
; * In addition to a variable for holding the vector whose contents you mutate with vector-set!,use a second variable to keep track of which cache slot will be replaced next. 
;   After modifying the cache, increment this variable (with set!) or set it back to 0.
; * To test your cache, it can be useful to add print expressions so you know when you are using the cache and when you are not.
;   But remove these print expressions before submitting your code.•Sample solution is 15 lines.

(define (cached-assoc xs n) (
    letrec (
         [cache-vec (make-vector n (cons #f #f))]
         [cache-len (vector-length cache-vec)] 
         [cache-pos 0]
         [find (lambda(pos v) ( if (= pos cache-len) #f (let ([v-ref (vector-ref cache-vec pos)]) (if (equal? v (car v-ref)) v-ref (find (+ pos 1) v)) )))]
         [push (lambda(pos v) (vector-set! cache-vec pos v) (update-pos))]
         [update-pos (lambda() (set! cache-pos (remainder (+ cache-pos 1) cache-len)))])
    (lambda(v) (
             cond [(find 0 v) => (lambda (v) v)]
                  [(assoc v xs) => (lambda(v) (push cache-pos v) v)]
                  [else #f]
            )
        )
    )
)

; (define my-assoc (cached-assoc (list (list 1 2) (list 3 4) (list 5 6) (list 7 8) (list 9 10) (list 11 12)) 10))
; (my-assoc 11)
; (my-assoc 1)
; (my-assoc 3)

; 11. Define a macro that is used like (while-less e1 do e2) where e1 and e2 are expressions and while-less and do are syntax (keywords).
; The macro should do the following:
;   * It evaluates e1 exactly once.
;   * It evaluates e2 at least once.
;   * It keeps evaluating e2 until and only until the result is not a number less than the result of the evaluation of e1.
;   * Assuming evaluation terminates, the result is #t.
;   * Assume e1 and e2 produce numbers; your macro can do anything or fail mysteriously otherwise.
;   Hint:  Define and use a recursive thunk.  Sample solution is 9 lines.

(define-syntax while-less (
    syntax-rules (do)
    [(while-less e1 do e2) (
            letrec ([x e1] [f (lambda() (if (< e2 x) (f) #t))])
            (f)
            )
        ]
    )
)

; (define a 1)
; (while-less 7 do (begin (set! a (+ a 1)) (print "x") a)) 
; (while-less 7 do (begin (set! a (+ a 1)) (print "x") a))
