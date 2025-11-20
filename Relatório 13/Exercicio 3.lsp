(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defvar catalogo
  (list
   (make-item :nome "Sabre de luz " :tipo "Arma" :preco 100 :forca-magica 130)
   (make-item :nome "Laminas do caos " :tipo "Arma" :preco 180 :forca-magica 150)
   (make-item :nome "Pocao de cura - fraca" :tipo "Pocao" :preco 80 :forca-magica  40)
   (make-item :nome "Tesseract" :tipo "Artefato" :preco 500 :forca-magica 200)))

(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

(defun processa-venda (catalogo)
  (let* (
         (armas (remove-if-not
                 #'(lambda (it) (string= (item-tipo it) "Arma"))
                 catalogo))

         (armas-com-imposto
          (mapcar #'(lambda (it)
                      (make-item
                       :nome (item-nome it)
                       :tipo (item-tipo it)
                       :preco (adiciona-imposto (item-preco it))
                       :forca-magica (item-forca-magica it)))
                  armas))

         (resultado
          (mapcar #'(lambda (it)
                      (format nil "~A - Nova Forca Magica: ~A"
                              (item-nome it)
                              (bonus-maldicao (item-forca-magica it))))
                  armas-com-imposto)))
    resultado))

(let ((saida (processa-venda catalogo)))
  
  (dolist (linha saida)
    (format t "~A~%" linha)))
