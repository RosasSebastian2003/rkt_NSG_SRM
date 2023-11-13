#lang racket

(provide sum-frac-sequential sum-mult-sequential)
;;; Problema 1
;; Función que calcula la suma de fracciones de dos secuencias de números enteros, hasta un número n dado, donde:
;; - n: número entero hasta el cual se sumarán las fracciones (potencia)
;; - dn1: denominador de la primera secuencia de fracciones
;; - dn2: denominador de la segunda secuencia de fracciones
;; La forma de llamar a la funcion es la siguiente:
;; (sum-frac-sequential n dn1 dn2) donde n es el numero de iteraciones (1e9 en nuestro caso), dn1 es el denominador de la primera secuencia, y dn2 es el denominador de la segunda secuencia
(define (sum-frac-sequential n dn1 dn2)
  ;; Función auxiliar que calcula el valor de una fracción con los parametros de numerador y denominador, donde i es el numerador
  (define (fraction i dn)
    (exact->inexact (/ i dn)))

  ;; Aqui se calcula la suma de fracciones de una secuencia de números enteros, donde start el punto de partida, y end el final, acc sirve para acumular el total de las sumas
  (define (sum-fractions-iter start end dn acc)
    (if (> start end)
        acc
        (sum-fractions-iter (+ start 1) end dn (+ acc (fraction start dn)))))

  ;; Arrojamos la suma de fracciones de ambas secuencias.
  (+ (sum-fractions-iter 1 n dn1 0) (sum-fractions-iter 1 n dn2 0)))

(displayln (sum-frac-sequential 1e9 3 7))

;;; Problema 2
;; Función que calcula la suma de múltiplos de 3 hasta un número n dado
;; - n: número entero hasta el cual se sumarán los múltiplos de 3 (potencia)
;; La forma de llamar a la funcion es la siguiente:
;; (sum-mult-sequential n) donde n es el numero de iteraciones (1e9 en nuestro caso)
(define (sum-mult-sequential n)
  ;; Función auxiliar para calcular el valor de un múltiplo de 3 mediante su índice en la secuencia
  (define (multiple i)
    (exact->inexact(* i 3)))
  
  ;; Función auxiliar que calcula la suma de los múltiplos de 3, donde i corresponde a un indice, y acc es el acumulador de la suma 
  (define (loop i acc)
    (if (> i n)
        acc
        (loop (+ i 1) (+ acc (multiple i)))))
  
  ;; Arrojamos la suma de múltiplos de 3 hasta el número n.
  (loop 1 0))

(sum-mult-sequential 1e9)



