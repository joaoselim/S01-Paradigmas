package main

import ("fmt")

func classificando_numero(numero int) string{
	if numero > 0 {return "Positivo"
	} else if numero < 0 {return "Negativo"
	} else {return "Zero"}
}

func main() {
	var numero int
	
	fmt.Print("Insira um número: ")
	fmt.Scan(&numero)

	resp := classificando_numero(numero)
	fmt.Println("O número inserido é:",resp)
}
