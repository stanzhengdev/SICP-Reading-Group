#lang racket
;2.1 Data Abstraction

; Wishful thinking? 
;(make-rat ⟨n⟩ ⟨d⟩)
;(numer ⟨x⟩)
;(denom ⟨x⟩)


; Basis
;;(define x (cons 1 2))
;(car x) = 1
;(cdr x) = 2
; For real
(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))
;;;
(define x (cons 1 2))
(define y (cons 3 4))
(define z (cons x y))

;; think of cons  == pair
;; think of car as LEFT and cdr as RIGHT
(car (car z))
;returns 1
(car (cdr z))
; returns 3


(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))



;; Repping Rational Numbers
; Rational Number = 1/4 etc 
;;;(define (make-rat n d) (cons n d))
;;;(define (numer x) (car x))
;;;(define (denom x) (cdr x))

;; makes rational numbers 
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


(define one-half (make-rat 1 2))
;(print-rat one-half) = 1/2
(define one-third (make-rat 1 3))
;; 1/3

(define (make-rat2 n d)
  (let ((g (gcd n d)))
    (cons (/ n g) 
          (/ d g))))