#lang racket

(require "resaltadorMasterThread.rkt")
(require "resaltadorSecuencial.rkt")

(define (measure-execution-time func)
  (define tiempo-inicial (current-seconds))
  (func)
  (define tiempo-final (current-seconds))
  (- tiempo-final tiempo-inicial))

(define folder1 "carpeta1")
(define folder2 "carpeta2")
(define output "output")

(define parallel-time (measure-execution-time (lambda () (highlight-parallel folder1 folder2 output))))
(define sequential-time (measure-execution-time (lambda () (sequential_resaltador folder1 folder2 "output2"))))

(printf "Parallel execution time: ~a seconds~n" parallel-time)
(printf "Sequential execution time: ~a seconds~n" sequential-time)