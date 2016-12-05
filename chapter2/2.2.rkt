#lang racket

;;2.2 Hierarchical Dat and the Closure Property


;; Lists 
(define one-through-four (list 1 2 3 4))


;Original List Ref 
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) 
                (- n 1))))
;Squares 
(define squares 
  (list 1 4 9 16 25))

;Pulls just the square ref 
(list-ref squares 3)
; 16


;;; List Properties 

;Length recursive
(define (length_recursive items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

;Length iterative procedure 
(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) 
                     (+ 1 count))))
  (length-iter items 0))


; Appends list together forms a new one

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) 
            (append (cdr list1) 
                    list2))))
;;; Map pattern
(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))
