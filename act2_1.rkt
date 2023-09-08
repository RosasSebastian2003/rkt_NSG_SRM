#lang racket

;;Problema 1, factorial 
(define (factorial n)
    (cond 
        ((or (= n 0) (= n 1)) 1) ;Caso base, el menor valor que puede tomar n es 0
        (else (* n(factorial (- n 1)))) 
    )
)
(displayln "Ejercicio 1, función factorial")
(display "Ej. 1, factorial de 0: ")
(display (factorial 0))
(newline)

(display "Ej. 2, factorial de 7: ")
(display (factorial 7))
(newline)

(display "Ej. 3, factorial de 19: ")
(display (factorial 19))
(newline)

;;Problema 2, eliminar un elemento en especifico de una lista
(define (remueve n ls)
    (cond
        ((null? ls) '()) ;Caso base, la lista esta vacia
        ((= (car ls) n) (remueve n (cdr ls))) ;Revisamos si el numero es el primer elemento de la lista, de serlo, regresamos la lista sin el primer elemento mediante cdr
        ((cons (car ls) (remueve n (cdr ls)))) ; Se crea una lista con el primer elemento, esto se repite recursivamente hasta llegar al caso base
    )
)

(displayln "Ejercicio 2, eliminar un elemento en especifico de una lista")
(displayln "Ej. 1, 7 '(7)")
(display (remueve 7 '(7)))
(newline)

(displayln "Ej. 2, 4 '(4 7)")
(display (remueve 4 '(4 7)))
(newline)

(displayln "Ej. 3, 15 '(4 7)")
(display (remueve 15 '(4 7)))
(newline)

(displayln "Ej. 4,  8 '(4 8 28 431 4 8 7)")
(display (remueve  8 '(4 8 28 431 4 8 7)))
(newline)

;;Problema 3, suma de consecutivos 
(define (suma-consecutivos ls)
    (cond 
        ((or (null? ls) (null? (cdr ls))) '()) ;Caso base, la lista esta vacia o tiene un solo elemento, se devuelve la lista vacia
        ((cons (+ (car ls) (cadr ls)) (suma-consecutivos (cdr ls)))) ;Se suman los primeros dos elementos, el paso se repite recursivamente usando la lista sin el primer elemento
    )
)

(displayln "Ejercicio 1, suma de consecutivos")
(displayln "Ej. 1, '(4 7)")
(display (suma-consecutivos '(4 7)))
(newline)

(displayln "Ej. 2, '(4 8 2 31 7)")
(display (suma-consecutivos '(4 8 2 31 7)))
(newline)

;;Problema 4, filtrar divisible
(define (filtrar-divisible n ls)
    (cond 
        ((null? ls) '()) ;Caso base, la lista esta vacia
        ((= (remainder (car ls) n) 0) (cons (car ls) (filtrar-divisible n (cdr ls)))) ;Si el primer elemento es divisible entre n, se agrega a una lista, y se ejecuta la funcion con otra lists sin el primer elemento
        ((filtrar-divisible n (cdr ls))) ;Si el elemento no es divisible entre n, se ejecuta la funcion con una lista sin el primer elemento
    )
)

(displayln "Ejercicio 1, filtrar divisibles")
(displayln "Ej. 1, 7 '(14)")
(display (filtrar-divisible 7 '(14)))
(newline)

(displayln "Ej. 2, 4 '(8 7)")
(display (filtrar-divisible 4 '(8 7)))
(newline)

(displayln "Ej. 3, 15 '(4 7)")
(display (filtrar-divisible 15 '(4 7)))
(newline)

(displayln "Ej. 4, 4 '(4 8 28 431 42 84 7)")
(display (filtrar-divisible 4 '(4 8 28 431 42 84 7)))
(newline)

;;Problema 5, invertir pares, como el bubble sort???
(define (invierte-pares ls)
    (cond 
        ((or (null? ls) (null? (cdr ls))) '()) ; Caso base, la lista está vacía o contiene un solo elemento
        (else (cons (cadr ls) (cons (car ls) (invierte-pares (cddr ls))))) ;Invertimos la lista, tenemos que usar una segunda lista con el fin de poder concatenar el resto de los segmentos junto con el elemento invertido
    )
)

(displayln "Ejercicio 1, invertir pares")
(displayln "Ej. 1, '(7 14)")
(display (invierte-pares '(7 14)))
(newline)

(displayln "Ej. 2, '(8 7 21 99)")
(display (invierte-pares '(8 7 21 99)))
(newline)

(displayln "Ej. 3, '(4 8 28 431 42 84 71 22)")
(display (invierte-pares '(4 8 28 431 42 84 71 22)))
(newline)

;;Problema 6, decimal a octal
(define (decimal->octal n)
    (cond 
        ((= n 0) '()) ;Caso base, n = 0
        (else (append (decimal->octal (quotient n 8)) (list (remainder n 8))))
    )
)

(displayln "Ejercicio 1, decimal a octal")
(displayln "Ej. 1, 14")
(display (decimal->octal 14))
(newline)

(displayln "Ej. 2, 99")
(display (decimal->octal 99))
(newline)

(displayln "Ej. 3, 43175")
(display (decimal->octal 43175))
(newline)