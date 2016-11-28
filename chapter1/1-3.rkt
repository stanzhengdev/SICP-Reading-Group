#lang racket

;Cube
;functionally equivalent to (* 3 3 3) 
(define (cube x) (* x x x))

;Sums integers between two ranges
;(sum-integers 2 7) functionally equivalent to (+ 2 3 4 5 6 7) = 27
(define (sum-integers a b)
  (if (> a b) 
      0 
      (+ a (sum-integers (+ a 1) b))))

;Sums integers between two ranges
;(sum-cubes 2 3) functionally equivalent to (+ 2^3 3^3) = 35
(define (sum-cubes a b)
  (if (> a b) 
      0 
      (+ (cube a) 
         (sum-cubes (+ a 1) b))))
; Does something with pi
; (pi-sum 2 3) = 0.125
(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) 
         (pi-sum (+ a 4) b))))

; Series Summation
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;Increments 
(define (inc n) (+ n 1))

;Equivalent for summing cubes, without incrementing logic
;(sum-cubes 2 3) functionally equivalent to (+ 2^3 3^3) = 35
(define (sum-cubes2 a b)
  (sum cube a inc b))

;Returns itself
(define (identity x) x)

; sums a range using new syntax
(define (sum-integers2 a b)
  (sum identity a inc b))

;greater than conditional func
;custom test
(define (greater a b)
  (if (> a b)
      1 0))

;not real pi
;(* 8 (pi-sum 1 1000)) = 3.139592655589783
(define (pi-sum2 a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))


;integrals
; evaluates as (integral cube 0 1 0.01) == .24998750000000042
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) 
     dx))

(integral cube 0 1 0.01)