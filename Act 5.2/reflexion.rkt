#lang racket

(require "vMasterThread.rkt")
(require "vSecuencial.rkt")

(define (measure-execution-time func)
  (define tiempo-inicial (current-seconds))
  (func)
  (define tiempo-final (current-seconds))
  (- tiempo-final tiempo-inicial))


;;; (displayln "Problema 1")

;;; (define sequential-time-frac (measure-execution-time (lambda () (sum-frac-sequential 1e9 3 7))))
;;; (display "Tiempo de ejecucion secuencial: ")
;;; (displayln sequential-time-frac)

;;; (define parallel-time-frac (measure-execution-time (lambda () (sum-frac-parallel 1e9 3 7))))
;;; (display "Tiempo de ejecucion paralelo: ")
;;; (displayln parallel-time-frac)

;;; (define speedup-frac (/ sequential-time-frac parallel-time-frac))
;;; (display "Speedup: ")
;;; (displayln speedup-frac)

(displayln "Problema 2")

(define sequential-time (measure-execution-time (lambda () (sum-mult-sequential 1e9))))
(display "Tiempo de ejecucion secuencial: ")
(displayln sequential-time)

(define parallel-time (measure-execution-time (lambda () (sum-mult-parallel 1e9))))
(display "Tiempo de ejecucion paralelo: ")
(displayln parallel-time)

(define speedup (/ sequential-time parallel-time))
(display "Speedup: ")
(displayln speedup)

;;; El speedup del primer problema fue de 131/83 mientras que del segundo problema fue de 16/15. 
;;; Generalmente se ve que el speedup es mayor a 1, debido a que, al usar programación paralela, 
;;; las tareas se dividen y se realizan simultáneamente al estarse trabajando en varios procesadores, 
;;; en lugar de realizarse una después de la otra, por lo que la velocidad de ejecución aumenta significativamente.