10 input "Insira a primeira nota: "; p1$
20 input "Insira a segunda nota: "; p2$
30 let soma = val(p1$) + val(p2$)
40 let media = (soma/2)
50 if media > 60 then print "Aprovado direto"
60 if media < 30 then print "Reprovado direto"
70 if media >=30 and media <= 60 then goto 100
80 end

100 input "Insira a nota de NP3: "; p3$
110 soma_NP3 = media + val(p3$)
120 let media_NP3 = val(soma_NP3)/2
130 if media_NP3 > 50 then print "Aprovado pela NP3" else print "Reprovado na NP3"
140 end
