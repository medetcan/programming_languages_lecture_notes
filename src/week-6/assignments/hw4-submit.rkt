#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file


; 1
(define (sequence low high stride) (
    if(<= low high) 
    (cons low (sequence (+ low stride) high stride)) 
    null
    )
)

; 2

(define (string-append-map xs suffix) (
    map (lambda (str) (string-append str suffix)) xs
    )
)

; 3

(define (list-nth-mod xs n) (
    cond [(< n 0) (error "list-nth-mod: negative number")]
         [(= (length xs) 0) (error "list-nth-mod: empty list")]
         [#t (car (list-tail xs (remainder n (length xs))))]
    )
)

; 4

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

; 5

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

; 6

(define dan-then-dog (stream-generator 
        (lambda (str) (if(string=? str "dan.jpg") "dog.jpg" "dan.jpg"))
        "dan.jpg"
    )
)

; 7

(define (stream-add-zero s) (
    letrec ([f (lambda(s) (let ([res (s)])  (cons (cons 0 (car res)) (lambda () (f (cdr res))))))])
     (lambda () (f s))
    )
)

; 8

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

; 9

(define (vector-assoc v vec) 
    (letrec (
          [len (vector-length vec)] 
          [f (lambda(pos) ( if (= pos len) #f (let ([v-ref (vector-ref vec pos)]) (if (and (pair? v-ref) (equal? v (car v-ref))) v-ref (f (+ pos 1))) )))])
      (f 0)
    )
)

; 10

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

; 11

(define-syntax while-less (
    syntax-rules (do)
    [(while-less e1 do e2) (
            letrec ([x e1] [f (lambda() (if (< e2 x) (f) #t))])
            (f)
            )
        ]
    )
)
