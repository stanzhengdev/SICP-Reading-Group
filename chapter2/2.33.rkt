#lang racket

; 2.33
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (square x) (* x x))

;; map over and apply a function
; returns a list
(define (map p sequence)
  (accumulate (lambda (x y) (cons(p x) y)) null sequence))

;; appends one list to the other
;; order matters if we don't want to apply left to right
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))


;; increment
(define (incr x) (+ x 1))

;; count lenth
(define (length sequence)
  ;;(accumulate (lambda (x y)(incr y)) 0 sequence))
(accumulate (lambda (x y)(+ y 1)) 0 sequence))

(length '(1 2 3)) ;; evals to 3