#lang racket

(require "resaltador_regexp.rkt")
(require racket/place)
(provide highlight-folder)

(define (highlight-folder ch)
    (define folder (place-channel-get ch))
    (define output (place-channel-get ch))
    (define suffix (place-channel-get ch))
    (let loop ((i 1))
        (when (<= i 100)
            (let* ((regexp-file (string-append folder "/archivoexpresiones" (number->string i) ".txt"))
                   (input-file (string-append folder "/archivofuente" (number->string i) ".txt"))
                   (output-file (string-append output "/output" (number->string i) suffix)))
                (resaltador regexp-file input-file output-file)
                (loop (+ i 1))))))