#lang racket
;Introducing Building Abstractions with Data

;Multiples and combines factors 
(define (linear-combination a b x y)
  (+ (* a x) (* b y)))

; add definition 
(define (add x y) (+ x y))

; natural integer mul definition
(define (mul x y) (* x y))
;iterate
(define (linear-combination2 a b x y)
  (add (mul a x) (mul b y)))