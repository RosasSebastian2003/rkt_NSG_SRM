#lang racket

(provide principal)

(define (sum-worker start end)
  (define (fraction i)
    (/ i 3))
  
  (define (sum-fractions start end)
    (if (> start end)
        0
        (+ (fraction start) (sum-fractions (+ start 1) end))))
  
  (+ (sum-fractions start end) (sum-fractions start end)))

(define (principal channel)
    (place-channel-put channel (sum-worker (place-channel-get channel) (place-channel-get channel)))
)