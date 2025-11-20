
(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados)


(defvar lista-ocorrencias nil)

(setq lista-ocorrencias
      (list
       (make-ocorrencia :nome "Despertar" :ritual "Invocacao" :nivel-medo 50 :agentes-enviados 2)
       (make-ocorrencia :nome "Repelir" :ritual "Bloqueio" :nivel-medo 90 :agentes-enviados 5)
       (make-ocorrencia :nome "Encontro do fim" :ritual "Selamento" :nivel-medo 30 :agentes-enviados 1)
       (make-ocorrencia :nome "Desaparecimento" :ritual "Exilio" :nivel-medo 120 :agentes-enviados 4)
       ))

(defun soma-medo-recursiva (lista)
  (if (null lista)
      0
      (+ (ocorrencia-nivel-medo (car lista))
         (soma-medo-recursiva (cdr lista)))))


(defun analise-final (lista)

  (let* (
         (total (soma-medo-recursiva lista))
         (qtde (length lista))
         (media (/ total qtde))

         (criticas
          (remove-if-not
           #'(lambda (oc)
               (and (> (ocorrencia-agentes-enviados oc) 3)
                    (> (ocorrencia-nivel-medo oc) media)))
           lista))

         (nomes-criticos
          (mapcar #'(lambda (oc)
                      (ocorrencia-nome oc))
                  criticas))
         )

    nomes-criticos))


(let ((saida (analise-final lista-ocorrencias)))
  (dolist (n saida)
    (format t "~A~%" n)))
