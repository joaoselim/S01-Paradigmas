(defstruct criatura 
  nome
  ambiente
  periculosidade
  vida-media)

(defvar catalogo
  (list
   (make-criatura :nome "Safe Shallows Fish"
                  :ambiente "Shallows"
                  :periculosidade "Baixa"
                  :vida-media 5)

   (make-criatura :nome "Reaper Leviathan"
                  :ambiente "Ocean"
                  :periculosidade "Alta"
                  :vida-media 45)

   (make-criatura :nome "Ghost Ray"
                  :ambiente "Deep"
                  :periculosidade "Media"
                  :vida-media 20)

   (make-criatura :nome "Crab Squid"
                  :ambiente "Deep"
                  :periculosidade "Alta"
                  :vida-media 30)))

(defun filtra-por-perigo (catalogo)
  (remove-if
   (lambda (c)
     (string= (criatura-periculosidade c) "Baixa"))
   catalogo))

(defun relatorio-profundidade (catalogo)
  (let ((deep-only
         (remove-if-not
          (lambda (c)
            (string= (criatura-ambiente c) "Deep"))
          catalogo)))
    (mapcar
     (lambda (c)
       (format nil "~a: Vive em ~a"
               (criatura-nome c)
               (criatura-ambiente c)))
     deep-only)))

(let ((crit-perigo (filtra-por-perigo catalogo))
      (crit-deep (relatorio-profundidade catalogo)))


  (format t "Criaturas cuja periculosidade nao baixa:~%")
  (dolist (c crit-perigo)
    (format t "- ~a (Perigo: ~a)~%"
            (criatura-nome c)
            (criatura-periculosidade c)))

  (format t "~%Relatorio do ambiente Deep:~%")
  (dolist (linha crit-deep)
    (format t "~a~%" linha)))
