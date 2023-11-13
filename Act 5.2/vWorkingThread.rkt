#lang racket

(provide principal-div)

(define (sum-worker start end)
    (define (fraction i)
        (/ i 3))
    
    (define (sum-fractions start end)
        (define result 0)
        (for ([i (in-range start (add1 end))])
            (set! result (+ result (fraction i))))
        result)

    (sum-fractions start end))

(define (principal-div channel)
  (place-channel-put channel (sum-worker (place-channel-get channel) (place-channel-get channel))))



(provide principal-mult)

(define (sum-worker-multiples start end)
  (define (multiple i)
    (* i 3))
  (define (loop i acc)
    (if (> i end)
        acc
        (loop (+ i 1) (+ acc (multiple i)))))
  (loop start 0))

(define (principal-mult channel)
  (place-channel-put channel (sum-worker-multiples (place-channel-get channel) (place-channel-get channel))))