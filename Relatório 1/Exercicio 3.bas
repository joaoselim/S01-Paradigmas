10 input "Insira a temperatura(em Celsius): "; cel$
20 let kelvin = val(cel$) + 273
30 let aux$ = val(cel$)*1.8
40 let fahr = val(aux$) + 32
50 print "Temperatura em Celsius: " + cel$
60 print "Temperatura em Kelvin: " + kelvin
70 print "Temperatura em Fahrenheit: " + fahr
80 end
