package main

import ("fmt")

func verificarLogin(usuario, senha string) bool{
	if usuario == "senha" && senha == "admin" {
		return true
	}
	return false
}

func main() {
	var nome string
	var senha string
	
	for i := 0; i >= 0; i++ {
		fmt.Println("Digite o nome de usuário e senha: ")
		fmt.Scan(&nome, &senha)
		if verificarLogin(nome, senha){
			fmt.Println("Login bem-sucedido!")
			break
		}
	}
}
