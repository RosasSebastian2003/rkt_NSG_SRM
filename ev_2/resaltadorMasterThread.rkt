#lang racket

(require racket/place)
(provide highlight-parallel)

(define (highlight-parallel folder1 folder2 output)
    (define p1 (dynamic-place "resaltadorWorkingThread.rkt" 'highlight-folder))
    (define p2 (dynamic-place "resaltadorWorkingThread.rkt" 'highlight-folder))

    (place-channel-put p1 folder1)
    (place-channel-put p1 output)
    (place-channel-put p1 "_folder1.html")

    (place-channel-put p2 folder2)
    (place-channel-put p2 output)
    (place-channel-put p2 "_folder2.html")

    (place-wait p1)
    (place-wait p2))

(highlight-parallel "carpeta1" "carpeta2" "output")