#lang racket
(require racklog)

(define %padre (%rel () [('Pablo 'Marquez)][('Silvia 'Valeria)][('Mateo 'Valeria)][('Pablo 'Hugo)][('Lucas 'Daniel)][('Emma 'Manuel)][('Juan 'Alejandro)][('Alejandro 'Antonio)]
                     [('Paula 'Emma)][('Lucas 'Julia)][('Pedro 'Lucas)][('Leo 'Emma)][('Manuel 'Carmen)][('Pablo 'Luisa)]))

(%which (h) (%padre 'Pablo h))

(%which (n) (abuelo 'Pedro n))