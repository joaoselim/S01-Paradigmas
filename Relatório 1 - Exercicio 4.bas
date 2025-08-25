10 input "Insira a sua altura(metros): "; altura$
20 input "Insira o seu peso(kg): "; peso$
30 let aux = val(altura$) * val(altura$)
40 let imc = val(peso$) / aux
50 print "Seu IMC é: " + imc
60 end
