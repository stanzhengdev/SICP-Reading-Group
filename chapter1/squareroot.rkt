#lang racket

;;;;{ ‹Defines Square Root›* }

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.000000001))

(define (average x y) 
  (/ (+ x y) 2))

(define (square x) 
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)