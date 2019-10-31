;; Programming Languages, Homework 5

#lang racket
(provide (all-defined-out)) ;; so we can put tests in a second file

;; definition of structures for MUPL programs - Do NOT change
(struct var  (string) #:transparent)  ;; a variable, e.g., (var "foo")
(struct int  (num)    #:transparent)  ;; a constant number, e.g., (int 17)
(struct add  (e1 e2)  #:transparent)  ;; add two expressions
(struct ifgreater (e1 e2 e3 e4)    #:transparent) ;; if e1 > e2 then e3 else e4
(struct fun  (nameopt formal body) #:transparent) ;; a recursive(?) 1-argument function
(struct call (funexp actual)       #:transparent) ;; function call
(struct mlet (var e body) #:transparent) ;; a local binding (let var = e in body) 
(struct apair (e1 e2)     #:transparent) ;; make a new pair
(struct fst  (e)    #:transparent) ;; get first part of a pair
(struct snd  (e)    #:transparent) ;; get second part of a pair
(struct aunit ()    #:transparent) ;; unit value -- good for ending a list
(struct isaunit (e) #:transparent) ;; evaluate to 1 if e is unit else 0
(struct closure (env fun) #:transparent) ;; a closure is not in "source" programs but /is/ a MUPL value; it is what functions evaluate to

;; Problem 1
(define (racketlist->mupllist lst) (foldr apair (aunit) lst))

(define (mupllist->racketlist mupl-list) (
    if (aunit? mupl-list) '() (cons (apair-e1 mupl-list) (mupllist->racketlist (apair-e2 mupl-list)))
   )
)
;; Problem 2
;; lookup a variable in an environment
(define (envlookup env str) ;; Do NOT change this function 
  (cond [(null? env) (error "unbound variable during evaluation" str)]
        [(equal? (car (car env)) str) (cdr (car env))]
        [#t (envlookup (cdr env) str)]))

;; Do NOT change the two cases given to you. Do add more cases for other kinds of MUPL expressions.
;; We will test eval-under-env by calling it directly even though "in real life" it would be a helper function of eval-exp.
(define (eval-under-env e env)
  (cond 
        [(var? e) (envlookup env (var-string e))]
        [(int? e) e]
        [(add? e) 
         (let ([v1 (eval-under-env (add-e1 e) env)]
               [v2 (eval-under-env (add-e2 e) env)])
           (if (and (int? v1)
                    (int? v2))
               (int (+ (int-num v1) 
                       (int-num v2)))
               (error "MUPL addition applied to non-number")))
            ]
        [(ifgreater? e) (
                let ([v1 (eval-under-env (ifgreater-e1 e) env)] 
                     [v2 (eval-under-env (ifgreater-e2 e) env)])
                (cond [(not (and (int? v1) (int? v2))) (error "MUPL ifgreater applied to non-number")]
                      [(> (int-num v1) (int-num v2)) (eval-under-env (ifgreater-e3 e) env)]
                      [else (eval-under-env (ifgreater-e4 e) env)])
                )
            ]
        [(mlet? e) (eval-under-env (mlet-body e) (cons (cons (mlet-var e) (eval-under-env (mlet-e e) env)) env))]
        [(closure? e) (closure (cons (closure-env e) env) (closure-fun e))]
        [(fun? e) (closure env e)]
        [(call? e) (
                letrec (
                        [funexp-value (call-funexp e)] 
                        [actual-value (call-actual e)]
                        [env-value (closure-env funexp-value)]
                        [fun-value (closure-fun funexp-value)]
                        [formal-value (fun-formal fun-value)]
                        [nameopt-value (fun-nameopt fun-value)]
                        [body-value (fun-body fun-value)]
                    )
                 (eval-under-env body-value (cons (cons formal-value actual-value) env-value))
                )
            ]
        [(apair? e) (apair (eval-under-env (apair-e1 e)) (eval-under-env (apair-e2 e)))]
        [(fst? e) (apair-e1 (fst-e e))]
        [(snd? e) (apair-e2 (snd-e e))]
        [(isaunit? e) (if (aunit? (eval-under-env (isaunit-e e) env)) (int 1) (int 0))]
        [#t (error (format "bad MUPL expression: ~v" e))]))


;; Do NOT change
(define (eval-exp e)
  (eval-under-env e null))

        
;; Problem 3

(define (ifaunit e1 e2 e3) (
    if (eq? (int-num (eval-exp (isaunit (eval-exp e1)))) 1) e2 e3
    )
)


(define (mlet* lstlst e2) (
    letrec (
         [compute-env (lambda(lst env) (if(null? lst) env (compute-env (cdr lst) (cons (cons (car (car lst)) (eval-under-env (cdr (car lst)) env)) env))))]
         [env (compute-env lstlst null)]
         )
    (eval-under-env e2 env)
    )
)

(define (ifeq e1 e2 e3 e4) (
    mlet* (list (cons "_x" e1) (cons "_y" e2)) (ifgreater (var "_y") (var "_x") e4 (ifgreater (var "_x") (var "_y") e4 e3))
    )
)

;; Problem 4

(define mupl-map "CHANGE")

(define mupl-mapAddN 
  (mlet "map" mupl-map
        "CHANGE (notice map is now in MUPL scope)"))

;; Challenge Problem

(struct fun-challenge (nameopt formal body freevars) #:transparent) ;; a recursive(?) 1-argument function

;; We will test this function directly, so it must do
;; as described in the assignment
(define (compute-free-vars e) "CHANGE")

;; Do NOT share code with eval-under-env because that will make
;; auto-grading and peer assessment more difficult, so
;; copy most of your interpreter here and make minor changes
(define (eval-under-env-c e env) "CHANGE")

;; Do NOT change this
(define (eval-exp-c e)
  (eval-under-env-c (compute-free-vars e) null))
