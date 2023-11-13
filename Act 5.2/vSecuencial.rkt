#lang racket

(define (sum-sequential n dn)
  (define (fraction i)
    (/ i dn))
  
  (define (sum-fractions start end)
    (if (> start end)
        0
        (+ (fraction start) (sum-fractions (+ start 1) end))))
  
  (+ (sum-fractions 1 n) (sum-fractions 1 n))) 


(sum-sequential 1e7 3)


