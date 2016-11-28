#lang racket

;; Alonzo Church  λ-calculus.
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))


;; Define one and two directly (not in terms of zero and add-1).
;;; (Hint: Use substitution to evaluate (add-1 zero)).
;;; Give a direct definition of the addition procedure + (not in terms of repeated application of add-1).

