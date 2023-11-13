#lang racket

(define (sum-sequential n dn)
  (define (fraction i) (exact->inexact (/ i dn)))

  (define (sum-fractions-iter start end acc)
    (if (> start end)
        acc
        (sum-fractions-iter (+ start 1) end (+ acc (fraction start)))))

  (sum-fractions-iter 1 n 0))

(sum-sequential 1e9 3)


(define (sum-multiples-sequential n)
  (define (multiple i)
    (* i 3))
  (define (loop i acc)
    (if (> i n)
        acc
        (loop (+ i 1) (+ acc (multiple i)))))
  (loop 1 0))


(sum-multiples-sequential 1e9)



