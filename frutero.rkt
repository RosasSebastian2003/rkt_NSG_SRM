#lang racket
(require racklog)

(define %fruta (%rel()[('sandia)][('papaya)][('manzana)][('mango)][('pera)]))

(%which(f) (%fruta f))

'((f sandia))
(%more)

(%which () (%fruta(_)))