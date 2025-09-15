10 let numero = RND (100)
20 input "Tente adivinhar em qual numero estou pensando(0-100): "; tentativa
30 if tentativa = numero then goto 100
40 if tentativa > numero then goto 150
50 if tentativa < numero then goto 200

60 input "Em qual número estou pensando? "; tentativa
goto 30

100 print "Parabéns!!! Você acertou o número"
110 end

150 print "Muito alto, tente um número menor"
160 goto 60

200 print "Muito pequeno, tente um número maior"
210 goto 60
