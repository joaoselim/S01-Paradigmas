(defun calcula-dosagem (peso-kg idade-anos)
  (cond
    ((or (< idade-anos 5) (< peso-kg 20)) 10)
    ((and (>= idade-anos 5) (<= idade-anos 12) (>= peso-kg 20)) 25)
    (t 50)))

(defun ajusta-preco (preco-base nome)
  (cond
    ((string= nome "Ginseng") (* preco-base 3.0))
    ((string= nome "Lotus")   (* preco-base 1.5))
    (t preco-base)))


(let* ((idade 14)
       (peso 60)
       (erva "Lotus")
       (preco-base 10)
       (dosagem (calcula-dosagem peso idade))
       (preco-final (ajusta-preco preco-base erva)))

  (format t "Paciente: ~a anos, ~a kg~%" idade peso)
  (format t "Erva: ~a~%" erva)
  (format t "Dosagem: ~a ml~%" dosagem)
  (format t "Preco final: ~a moedas~%" preco-final))
