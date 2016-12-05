#lang racket
(define x 2)

;; Symbolic Data
(* (+ 23 45) (+ x 9))
(define (fact n) 
  (if (= n 1) 
      1 
      (* n (fact (- n 1)))))

;; Quoting DataStructures

(define a 1)
(define b 2)
(define c 3)

(list a b)
; (1 2)

(list 'a 'b)
; (a b)

(list 'a b)
; (a 2)

;; Popping with CAR and CDR
(car '(a b c))
; a
(cdr '(a b c))
; (b c)


;; memq - useful procedure to tell if symbol contains in thhe list, checks each list item
(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(memq 'apple '(pear banana prune))
; #f
(memq 'apple '(x (apple sauce) y apple pear))
; (apple pear)
(memq 'apple '(x (apple sauce) '(y apple pear) (z cake apple)))
; #f

;; 2.53
;; Each one of the below is a symbol
(list 'a 'b 'c)
; '(a b c)
(list (list 'george))
; '((george))
(cdr '((x1 x2) (y1 y2)))
; '((y1 y2 ))
(cadr '((x1 x2) (y1 y2)))
; '(y1 y2)
(pair? (car '(a short list)))
; #f
(memq 'red '((red shoes) (blue socks)))
; #f
(memq 'red '(red shoes blue socks))
; '(red shoes blue socks)


