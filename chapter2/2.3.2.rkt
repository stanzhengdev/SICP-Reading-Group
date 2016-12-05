#lang racket


;; 2.3.2 Example: Symbolic Differentiation




(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product 
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product 
           (deriv (multiplier exp) var)
           (multiplicand exp))))
        (else (error "unknown expression 
                      type: DERIV" exp))))
;; identified by ? before hand 
(define (variable? x) (symbol? x))

;; same-variable if they are the same with and
(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))
;; make a sum list 
(define (make-sum a1 a2) (list '+ a1 a2))

;; make a product list
(define (make-product m1 m2) (list '* m1 m2)

;; define sum operation 
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

;; The addend is the second item of the sum list:
(define (addend s) (cadr s))

;; The augend is the third item of the sum list:
(define (augend s) (caddr s))

;; A product is a list whose first element is the symbol *:
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

;; The multiplier is the second item of the product list
(define (multiplier p) (cadr p))

;; The multiplicand is the third item of the product list
(define (multiplicand p) (caddr p))


;; Application example
;; Expression x + 3 
(deriv '(+ x 3) 'x)
; (+ 1 0)
;; Expression x * y
(deriv '(* x y) 'x)
; (+ (* x 0) (* 1 y))

;; Expression ??? 
(deriv '(* (* x y) (+ x 3)) 'x)
;(+ (* (* x y) (+ 1 0))
;   (* (+ (* x 0) (* 1 y))
;      (+  x 3)))

