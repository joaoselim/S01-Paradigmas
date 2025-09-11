package main

import ("fmt")

func fibonacci(n int) []int{
	vetor := make([]int, n)
	if n > 0 {vetor[0] = 0}
	if n > 1 {vetor[1] = 1}
	if n > 1 {
		for i := 2; i < n; i++ {
				vetor[i] = vetor[i-1] + vetor[i-2]
		}
	}
	return vetor
}

func main() {
	var numero int
	
	fmt.Print("Quantos números da sequência são desejados: ")
	fmt.Scan(&numero)

	fmt.Println(fibonacci(numero))
}
