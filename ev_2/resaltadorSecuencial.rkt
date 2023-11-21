#lang racket

(require "resaltador_regexp.rkt")
(provide sequential_resaltador)

(define (sequential_resaltador folder1 folder2 output)
    (let loop ((i 1))
        (when (<= i 100)
            (let* ((regexp-file1 (string-append folder1 "/archivoexpresiones" (number->string i) ".txt"))
                         (input-file1 (string-append folder1 "/archivofuente" (number->string i) ".txt"))
                         (output-file1 (string-append output "/output" (number->string i) "_folder1.html"))
                         (regexp-file2 (string-append folder2 "/archivoexpresiones" (number->string i) ".txt"))
                         (input-file2 (string-append folder2 "/archivofuente" (number->string i) ".txt"))
                         (output-file2 (string-append output "/output" (number->string i) "_folder2.html")))
                    
                    ;; Para debuggear
                    ;;;  (displayln regexp-file1)
                    ;;;  (displayln regexp-file2)
                    ;;;  (displayln input-file1)
                    ;;;  (displayln input-file2)
                (resaltador regexp-file1 input-file1 output-file1)
                (resaltador regexp-file2 input-file2 output-file2)

                (loop (+ i 1))))))

(sequential_resaltador "carpeta1" "carpeta2" "output")