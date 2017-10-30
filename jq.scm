(load "io.scm")

(define (jq json-string path)
  (let* ((port (open-io-pipe "jq" "-jr" path))
         (input-port (cdr port))
         (output-port (car port)))
    (display json-string input-port)
    (close-port input-port)
    (let ((output (get-string-all output-port)))
      (close-port output-port)
      output)))
